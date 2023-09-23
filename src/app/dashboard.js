function loadScript(src) {
  let script = document.createElement('script');
  script.src = src;
  script.async = false;
  document.body.append(script);
}

// Load scripts synchronously as netcat can't handle simultaneous requests
loadScript("./components/header/header.js")
loadScript("./components/process-chart/process-chart.js")
