import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['myChart', 'start', 'end'];
  static chart;

  createChart(data) {
    if (this.chart) {
      this.chart.destroy();
    }
     this.chart = new Chart(this.canvasContext(), {
       type: 'line',
       data: {
         datasets: [
           {
             label: 'Heartrate',
             data: data,
             fill: false,
             borderColor: 'rgb(75, 192, 192)',
           }
         ]
       },
       options: {
         plugins: {
          zoom: {
            zoom: {
              wheel: {
                enabled: true,
              },
              pinch: {
                enabled: true
              },
              mode: 'xy',
            }
          }
        },
         scales: {
           x: {
             type: 'time'
           }
         }
       }
     });
  }

  processData(data) {
    console.log(data);
    if (!data.length) {
      return;
    }
    const first = data[0]
    const last = data[data.length - 1]
    this.startTarget.value = first.x;
    this.endTarget.value = last.x;
    this.createChart(data);
  }

  fetchMetaData() {
    const context = this;
    fetch('/data_points/')
      .then(response => response.json())
      .then(data => {
        context.startTarget.value = data.min;
        context.endTarget.value = data.max;
        context.attachHandlers();
      });
  }

  fetchData(start, end) {
    const context = this;
    fetch("/data_points?" + new URLSearchParams(
      {
        start,
        end
      }
    ))
      .then(response => response.json())
      .then(data => {
        context.processData(data)
      })
  }

  canvasContext() {
      return this.myChartTarget.getContext('2d');
  }

  onChange(evt) {
    this.fetchData(this.startTarget.value, this.endTarget.value);
  }

  attachHandlers() {
    this.startTarget.addEventListener('change', this.onChange.bind(this));
    this.endTarget.addEventListener('change', this.onChange.bind(this));
  }
  connect() {
    this.fetchMetaData();
  }
}
