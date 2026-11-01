#!/usr/bin/env python3
# plasma 6 runs kglobalaccel inside kwin, so it can't be stopped while
# setup.sh writes kglobalshortcutsrc, and it rewrites the file from memory,
# dropping those edits. this hands the same shortcuts to the running
# kglobalaccel over dbus, so they take effect now and stay in the file.
#
# reads lines of "component<US>action<US>kind<US>value" on stdin, where kind
# is "value" for a kglobalshortcutsrc "current,default,name" value or "keys"
# for a bare tab separated key list. actions kglobalaccel doesn't know yet
# (e.g. a kwin script that isn't loaded) are skipped, the file covers them.
import subprocess
import sys

MODIFIERS = {
    "Shift": 0x02000000,
    "Ctrl": 0x04000000,
    "Alt": 0x08000000,
    "Meta": 0x10000000,
}
NAMED = {
    "Return": 0x01000004,
    "Space": 0x20,
    "Search": 0x01000092,
    "Screensaver": 0x010000BA,
}
NAMED.update({f"F{n}": 0x01000030 + n - 1 for n in range(1, 36)})


def active_keys(kind, value):
    if kind == "keys":
        field = value
    else:
        # the current keys are everything up to the first unescaped comma
        field, escaped = "", False
        for ch in value:
            if escaped:
                field += ch
                escaped = False
            elif ch == "\\":
                escaped = True
            elif ch == ",":
                break
            else:
                field += ch
    return [k for k in field.split("\t") if k and k != "none"]


def keycode(seq):
    *mods, key = seq.split("+")
    code = sum(MODIFIERS[m] for m in mods)
    if key in NAMED:
        return code + NAMED[key]
    if len(key) == 1:
        return code + ord(key.upper())
    raise ValueError(f"unknown key {key!r} in {seq!r}")


def gdbus(method, *args):
    return subprocess.run(
        ["gdbus", "call", "--session", "--dest", "org.kde.kglobalaccel",
         "--object-path", "/kglobalaccel", "--method", f"org.kde.KGlobalAccel.{method}", *args],
        capture_output=True, text=True, check=True,
    ).stdout


def action_id(component, action):
    return "[" + ", ".join(repr(s) for s in (component, action, "", "")) + "]"


def set_keys(component, action, codes):
    keys = "[" + ", ".join(f"([{c}, 0, 0, 0],)" for c in codes) + "]" if codes else "@a(ai) []"
    gdbus("setForeignShortcutKeys", action_id(component, action), keys)


shortcuts = {}
for line in sys.stdin:
    component, action, kind, value = line.rstrip("\n").split("\x1f")
    shortcuts[(component, action)] = [keycode(k) for k in active_keys(kind, value)]

# gdbus prints each known action as ['component', 'action', ...]
known = {}
for component, _ in shortcuts:
    if component not in known:
        known[component] = gdbus("allActionsForComponent", action_id(component, ""))
shortcuts = {(c, a): codes for (c, a), codes in shortcuts.items()
             if f"[{c!r}, {a!r}," in known[c]}

# clear every action first, so a key moving from one action to another
# isn't refused for still belonging to the old one
for component, action in shortcuts:
    set_keys(component, action, [])
for (component, action), codes in shortcuts.items():
    set_keys(component, action, codes)
