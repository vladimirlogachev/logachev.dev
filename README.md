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

1. Save new PDF to `build/cv_vladimir_logachev.pdf`
2. Run `bash build.sh`

