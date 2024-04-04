# exit on error
set -e

# Make sure that dependencies are installed
npm i

echo "Removeing the old build..."
rm -rf "docs"
mkdir docs

echo "Building Elm bundle..."
npm run --silent compile

# echo "Running checks..."
npm run --silent format-validate
# npm run --silent test
npm run --silent review

echo "Copying required files to ./docs..."
cp -r "assets" "docs/assets"
cp -r "assets-root/" "docs"
cp "index.src.html" "docs"

echo "Uglifying and compressing..."
mv "docs/assets/inline/bundle.js" "docs/assets/inline/bundle.uncompressed.js"
npm run --silent uglifyjs -- "docs/assets/inline/bundle.uncompressed.js" \
  --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' \
  --output="docs/assets/inline/bundle.compressed1.js"
npm run --silent uglifyjs -- "docs/assets/inline/bundle.compressed1.js" \
  --mangle \
  --output="docs/assets/inline/bundle.js"
echo "  Size before: $(du -sk docs/assets/inline/bundle.uncompressed.js | cut -f1) kB"
echo "  Size after: $(du -sk docs/assets/inline/bundle.js | cut -f1) kB"

echo "Inlining CSS and JS into HTML..."
npm run --silent inline-source -- --compress false --root docs docs/index.src.html >docs/index.html

echo "Removing inlined files..."
rm docs/index.src.html
rm -r docs/assets/inline
# css2 appers on the fs from the inlined google fonts style (it is downloaded first, before inlining)
rm -r docs/css2

echo "Done."
