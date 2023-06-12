// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import flatpickr from "flatpickr";
// import 'bootstrap/dist/js/bootstrap'
import 'flatpickr/dist/flatpickr.css';
import "controllers"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
