# Note: `linux/amd64` is a workaround, because elm compiler is not available for `linux/arm64` yet.
# See https://github.com/elm/compiler/issues/2283 for details
FROM --platform=linux/amd64 node:20.13-alpine as builder
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy source code and build the app
COPY . .
RUN npm run build

FROM nginx:1.25-alpine
WORKDIR /usr/share/nginx/html

# # Copy bundle and assets
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
