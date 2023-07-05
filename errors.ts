export const displayErrorMessage = (header: string, message: string) => {
  var containerNode = document.createElement("div");
  containerNode.style.padding = "20px";
  containerNode.style.fontFamily = "sans-serif";

  var errorHeaderNode = document.createElement("h1");
  errorHeaderNode.textContent = header;
  errorHeaderNode.style.padding = "20px";
  errorHeaderNode.style.fontSize = "40px";
  errorHeaderNode.style.color = "#C70039";
  containerNode.appendChild(errorHeaderNode);

  var errorMessageNode = document.createElement("p");
  errorMessageNode.textContent = message;
  errorMessageNode.style.padding = "20px";
  errorMessageNode.style.color = "#581845";
  containerNode.appendChild(errorMessageNode);

  document.body.appendChild(containerNode);
};
