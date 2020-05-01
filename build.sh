#!/usr/bin/env bash
set -eu
docker build -t python-test/pytype -f Dockerfile.pytype .
docker build -t python-test/mypy -f Dockerfile.mypy .
docker build -t python-test/pyright -f Dockerfile.pyright .
docker build -t python-test/pyre -f Dockerfile.pyre .
