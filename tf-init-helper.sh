#!/bin/bash
set -Ceu

function ErrorMsg() {
  echo "Usage: sh ../../../tf-init-helper.sh"
  echo "Please execute this script on top of your terraform directory."
  echo "e.g. <repository>/dir1/<env>/dir2"
  echo
  echo "Available argments is below."
  echo
  echo "-init               Execute terraform init with custom tfstate key."
  echo "-migrate-state      Execute terraform init -migrate-state."
  echo "-reconfigure        Execute terraform init -reconfigure."
  echo "-key-only           Print tfstate key only. "
  exit 1
}

if [ $# != 1 ]; then
  ErrorMsg
fi

OWNER=$(git config --get remote.origin.url | awk -F'/' '{print $(NF-1)}')
REPO=$(git config --get remote.origin.url | awk -F'/' '{print $NF}' | sed -e 's/.git$//g')
TFSTATE_KEY="${OWNER}/$(pwd | grep -o ${REPO}.*)/terraform.tfstate"

case "$1" in
  -init)
    terraform init -backend-config="key=${TFSTATE_KEY}"
    ;;

  -migrate-state)
    terraform init -migrate-state -backend-config="key=${TFSTATE_KEY}"
    ;;

  -reconfigure)
    terraform init -reconfigure -backend-config="key=${TFSTATE_KEY}"
    ;;

  -key-only)
    echo ${TFSTATE_KEY}
    ;;

  *)
    ErrorMsg
    ;;
esac
