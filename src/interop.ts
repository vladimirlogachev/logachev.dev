export const flags = ({ env }) => {
  return {
    windowSize: {
      height: window.innerHeight,
      width: window.innerWidth,
    },
  };
};

export const onReady = ({ app, env }) => {
  // Note: Reset scroll to page top when navigating between SPA pages (otherwise there will be some weird scroll jumps)
  app.ports.urlChanged.subscribe((val) => {
    window.scrollTo(0, 0);
  });
};
