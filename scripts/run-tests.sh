#!/usr/bin/env bash
set -e

# Do some cleanup, just in case
rm -rf cra-template-universal-ts-*.tgz demo

# Try to scaffold a new project
echo "Scaffolding demo project..."
npm pack
npx create-react-app \
  --scripts-version universal-scripts \
  --template `pwd`/cra-template-universal-ts-*.tgz \
  demo

# Build the new project
echo "Building demo project..."
( cd demo && yarn run build )

# And clean up
rm -rf cra-template-universal-ts-*.tgz demo

echo "All tests OK."
