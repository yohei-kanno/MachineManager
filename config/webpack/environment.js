const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.get('vue').use[0].options.extractCSS = false
environment.loaders.prepend('vue', vue)
module.exports = environment
