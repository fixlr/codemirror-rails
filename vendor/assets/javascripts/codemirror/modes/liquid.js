CodeMirror.defineMode("liquid", function(config) {

  return CodeMirror.multiplexingMode(
    CodeMirror.getMode(config, "text/html"),
    {
      open: "{{", close: "}}",
      mode: CodeMirror.getMode(config, "text/x-liquid-variable"),
      delimStyle: "liquid variable variable2",
      innerStyle: "liquid variable variable2"
    },
    {
      open: "{%", close: "%}",
      mode: CodeMirror.getMode(config, "text/x-liquid-tag"),
      delimStyle: "liquid special variable2 keyword",
      innerStyle: "liquid special variable2 keyword"
    }
  );
});