# logachev.dev

## Dev

```fish
elm-live "src/Main.elm" \
  --dir="./build" \
  --open \
  --port=8000 \
  --pushstate \
  --start-page "index.html" \
  -- \
  --output="./build/bundle.js"
```

## Prod

```fish
bash build.sh
```
