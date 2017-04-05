function finished() {
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  CARD=${${BRANCH[(ws:/:)2]}[(ws:-:)1]}

  wf --finish-card --card $CARD
}
