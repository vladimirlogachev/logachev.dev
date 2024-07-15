# [logachev.dev](https://logachev.dev)

## Pre-requisites

```sh
npm i
```

## Development

```sh
npm start
```

- open [localhost:1234](http://localhost:1234)

### Check PDF Render

```sh
npx chrome-headless-render-pdf \
  --url http://localhost:1234/#/cv \
  --window-size 1600,1200 \
  --paper-width 8.3 \
  --paper-height 11.7 \
  --include-background \
  --pdf static/cv_vladimir_logachev.pdf
```

## Publishing

- Everything is set up to build and publish automatically
- However, you better chec the published PDF every time after changes are done and new version is online, because it's not as reliable, as webapp build.
