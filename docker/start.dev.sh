#!/usr/bin/env bash
set -e -x

cd /app
node /app/server & npm run watch
