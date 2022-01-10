#!/usr/bin/env bash
#set -euo pipefail

#pushd bdk-ffi
echo "Confirm bdk-ffi rust library builds"
cargo build --manifest-path ./bdk-ffi/Cargo.toml --release

echo "Generate bdk-ffi Python bindings"
# clean solution once uniffi-bindgen 0.15.3 is released
#uniffi-bindgen generate ./bdk-ffi/src/bdk.udl --no-format --out-dir ./src/bdkpython/ --language python

mkdir ./src/bdkpython/linux-x86_64/
cp ./bdk-ffi/target/release/libbdkffi.so ./src/bdkpython/linux-x86_64/

python3 -m venv .venv
source .venv/bin/activate

pip3 install build
pip3 install tox

python3 -m build

pip3 install dist/bdkpython-0.0.4-py3-none-any.whl

python3 -m tox