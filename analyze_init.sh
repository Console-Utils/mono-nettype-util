#!/usr/bin/env bash

function installMdLinter()
{
  if markdownlint --version &> /dev/null
  then
    return
  fi

  npm install -g markdownlint-cli
}

function installShLinter()
{
  if shellcheck --version &> /dev/null
  then
    return
  fi

  case "$OSTYPE" in
    linux-gnu*)
      sudo apt-get install shellcheck
      ;;
    darwin*)
      brew install shellcheck
      ;;
    msys)
      choco install shellcheck -y
      ;;
  esac
}

installMdLinter
installShLinter
