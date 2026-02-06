#!/bin/bash

# Exit on error & print commands
set -ex

FLUTTER_SDK_DIR="$REPLACE_WITH_PWD/.flutter_sdk"
FLUTTER_SDK_DIR="$(pwd)/.flutter_sdk"

if [ ! -d "$FLUTTER_SDK_DIR" ]; then
  echo "Cloning Flutter SDK (Stable)..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_SDK_DIR"
fi

echo "Updating PATH..."
export PATH="$FLUTTER_SDK_DIR/bin:$PATH"

echo "Checking Flutter status..."
flutter doctor -v

echo "Fetching dependencies..."
flutter pub get

echo "Building for Web..."
flutter build web --release --no-tree-shake-icons

echo "Build Completed Successfully."

