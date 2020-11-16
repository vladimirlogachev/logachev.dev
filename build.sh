# Remove old build
rm -rf "./docs"

# Copy static files
cp -r "./build" "./docs"

elm make --optimize --output="./docs/bundle.temp.js" src/Main.elm

npx uglify-js@3.7.6 "./docs/bundle.temp.js" --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | npx uglify-js@3.7.6 --mangle --output="./docs/bundle.js"
echo "Size: docs/bundle.temp.js $(du -sk docs/bundle.temp.js | cut -f1) kB"
echo "Size: docs/bundle.js $(du -sk build/bundle.js | cut -f1) kB"

mv docs/index.html docs/index.src.html
npx inline-source-cli@2.0.0 --compress false --root docs docs/index.src.html > docs/index.html
rm docs/index.src.html

rm docs/css2
rm docs/bundle.js
rm docs/bundle.temp.js