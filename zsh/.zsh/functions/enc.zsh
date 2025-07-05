encrypt_string() {
  echo "$1" | openssl pkeyutl -inkey ~/.ssh/id_rsa -encrypt
}

decrypt_string() {
  echo "$1" | openssl pkeyutl -inkey ~/.ssh/id_rsa -decrypt
}
