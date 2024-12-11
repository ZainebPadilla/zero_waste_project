# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "chartkick", to: "https://ga.jspm.io/npm:chartkick@5.0.1/dist/chartkick.esm.js"
pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@4.3.0/dist/chart.js"
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.4
