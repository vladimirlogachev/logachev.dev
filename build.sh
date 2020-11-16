echo "Remove old build..."
rm -rf "./docs"

echo "Copy static files..."
cp -r "./build" "./docs"

echo "Build Elm bundle..."
elm make --optimize --output="./docs/bundle.temp.js" src/Main.elm

echo "Uglify and compress..."
npx uglify-js@3.7.6 "./docs/bundle.temp.js" --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | npx uglify-js@3.7.6 --mangle --output="./docs/bundle.js"
echo "Size before: $(du -sk docs/bundle.temp.js | cut -f1) kB"
echo "Size after: $(du -sk docs/bundle.js | cut -f1) kB"

echo "Inline CSS and JS into HTML..."
mv docs/index.html docs/index.src.html
npx inline-source-cli@2.0.0 --compress false --root docs docs/index.src.html > docs/index.html
rm docs/index.src.html

echo "Remove inlined files..."
rm docs/css2
rm docs/reset.css
rm docs/bundle.js
rm docs/bundle.temp.js
rm docs/yandex-metrika-init.js