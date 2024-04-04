// @ts-ignore
import { Elm } from "./src/Main.elm";
import { displayErrorMessage } from "./errors";

// @ts-ignore
if (process.env.NODE_ENV === "development") {
  const ElmDebugTransform = await import("elm-debug-transformer");

  ElmDebugTransform.register({
    simple_mode: true,
  });
}

try {
  const rootNode = document.querySelector("#app div") as HTMLDivElement;

  const app = Elm.Main.init({
    node: rootNode,
    flags: {
      windowSize: {
        height: window.innerHeight,
        width: window.innerWidth,
      },
    },
  });
} catch (e) {
  displayErrorMessage("Something went wrong", "Please try again later");
}
