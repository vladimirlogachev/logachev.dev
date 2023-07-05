import { defineConfig, ServerOptions } from "vite";
import elmPlugin from "vite-plugin-elm";

const server: ServerOptions = {
  host: "0.0.0.0",
  port: 8080,
};

export default defineConfig(({ command }) => {
  if (command === "build") {
    // Production settings
    return {
      build: {
        outDir: "docs",
      },
      plugins: [elmPlugin({ debug: false, optimize: true })],
      server,
    };
  } else {
    // Dev settings
    return {
      build: {
        outDir: "docs",
      },
      plugins: [elmPlugin({ debug: false, optimize: false })],
      server,
    };
  }
});
