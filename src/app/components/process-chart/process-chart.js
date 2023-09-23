class ProcessChart extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    this.innerHTML = `
<div class="flex justify-center mb-1">
  <div>
    <input type="text" id="process-search-input" placeholder=" Search process by name" class="border-black border rounded-md">
    <button class="hover:bg-green-700 border-green-500 rounded-md p-1 text-white shadow-sm font-semibold bg-green-500 " onclick="getChart(document.getElementById('process-search-input').value)">Search</button>
  </div>
</div>
<div class="flex justify-center mb-2 italic text-sm font-thin">Search returns data for the first process it finds with the specified name</div>
<div class="flex justify-center font-bold text-red-600" id="chart-container-error"></div>
<div class="flex justify-center" id="chart-container"></div>
     `
  }
}


const fetchData = async (processName) => {
  console.log(processName)
  if (!processName) {
    return null;
  }
  try {
    const response = await fetch(`/process-chart/data/${processName}`);
    return await response.json();

  } catch (error) {
    console.error('Error fetching data:', error);
  }
  return null;
}


function loadChart(chartData) {
  // Clear error message div
  document.getElementById('chart-container-error').innerHTML = "";

  if (!chartData || chartData.length === 0) {
    document.getElementById('chart-container-error').appendChild(document.createTextNode("Could not find process by that name"));
    return;
  }

  const chartConfig = {
    type: 'pie2d',
    renderAt: 'chart-container',
    width: '1200',
    height: '1200',
    dataFormat: 'json',
    dataSource: {
      "chart": {
        "caption": "Process mapping breakdown",
        "subCaption": "pmap output",
        "numberPrefix": "",
        "showPercentInTooltip": "0",
        "decimals": "4",
        //Theme
        "theme": "fusion",
        "tooltipBorderRadius": "200",
        "showToolTipShadow": false
      },
      "data": chartData
    }
  }

  FusionCharts.ready(function() {
    let fusioncharts = new FusionCharts(chartConfig);
    fusioncharts.render();
  });
}


function getChart(processName) {
  fetchData(processName).then(response => loadChart(response));
}


customElements.define('process-chart-component', ProcessChart);
document.getElementsByTagName('main')[0].appendChild(new ProcessChart);
