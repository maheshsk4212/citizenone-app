#!/bin/bash

# Exit on error
set -e

FLUTTER_VERSION="3.24.5"
FLUTTER_SDK_DIR=".flutter_sdk"

if [ ! -d "$FLUTTER_SDK_DIR" ]; then
  echo "Cloning Flutter SDK (Stable)..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_SDK_DIR"
fi

echo "Adding Flutter to PATH..."
export PATH="$PATH:`pwd`/$FLUTTER_SDK_DIR/bin"

echo "Flutter Version Info:"
flutter --version

echo "Building for Web..."
flutter build web --release --no-tree-shake-icons

echo "Build Completed Successfully."
