#!/usr/bin/env bash

# download latest tests
wget https://github.com/ranking-agent/api-watchdog-translator-tests/archive/refs/heads/main.zip -O tests.zip

# unarchive tests
unzip -o tests.zip

# run tests and send emails
api-watchdog discover --email api-watchdog-translator-tests-main


