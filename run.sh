#!/usr/bin/env bash
set -u
echo ====== pytype ======
docker run --rm python-test/pytype
echo ====== mypy ======
docker run --rm python-test/mypy
echo ====== pyright ======
docker run --rm python-test/pyright
echo ====== pyre ======
docker run --rm python-test/pyre
