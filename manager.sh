#! /bin/sh

set -e

help_and_exit() {
  echo "$0 [init | renew]"
  exit 1
}

create_cert() {
  # you can change this to acme.sh or cert-bot
  openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
          -keyout .certs/private.key -out .certs/certificate.crt 
}

init() {
  mkdir -p .certs
  ln -s .certs/ certs
  create_cert
  chmod 0644 .certs/private.key
}

renew() {
  create_cert
  mv .certs/certificate.crt tmp && mv tmp .certs/certificate.crt
  mv .certs/private.key tmp && mv tmp .certs/private.key
}

if [ "$#" -lt 1 ]; then
  help_and_exit
fi

case "$1" in
  init)
    init
    ;;
  renew)
    renew
    ;;
  *)
    help_and_exit
esac
