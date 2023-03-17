# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "chartkick", to: "chartkick.js"
# pin "Chart.bundle", to: "Chart.bundle.js"
# pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.2.0/dist/chart.js"
# pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js"

# pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js/dist/chart.min.js"
# pin 'moment', to: "https://cdn.jsdelivr.net/npm/moment@^2"
# pin 'chart_moment', to: "https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@^1"
