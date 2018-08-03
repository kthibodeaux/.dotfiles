encrypt_string() {
  echo "$1" | openssl rsautl -encrypt -inkey ~/.ssh/id_rsa
}

decrypt_string() {
  echo "$1" | openssl rsautl -decrypt -inkey ~/.ssh/id_rsa
}
