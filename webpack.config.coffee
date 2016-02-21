'use strict'

path = require "path"
webpack = require('webpack')
merge = require 'webpack-merge'
#TransferWebpackPlugin = require('transfer-webpack-plugin')

NODE_ENV = process.env.NODE_ENV || 'development'

ROOT_PATH = path.resolve(__dirname)
BUILD_PATH = path.join ROOT_PATH, 'build'
NODE_MODULES = path.join ROOT_PATH, 'node_modules'

console.log("NODE_ENV: #{NODE_ENV} ROOT_PATH: #{ROOT_PATH}")

commonsPlugin = new webpack.optimize.CommonsChunkPlugin('common.js')

mergeCommon = merge.bind(null, {
  resolve: {
    extensions: ['', '.js', '.jsx', '.css', '.png', '.jpg'],
    modulesDirectories: ["./lib", "node_modules", "bower_components"]
  },
})


if NODE_ENV is 'development'
  module.exports = mergeCommon({
    entry:[
      'webpack/hot/dev-server',
      'webpack/hot/only-dev-server',
      './lib/main.js'
    ]
    #Server Configuration options
    devServer:
      contentBase: './',  #Relative directory for base of server
      devtool: 'eval',
      hot: true,        #Live-reload
      inline: true,
      port: 7799        #Port Number

    devtool: 'eval',

    output:
      path: BUILD_PATH
      filename: 'app.js'

    plugins: [
      new webpack.HotModuleReplacementPlugin(),
      new webpack.NoErrorsPlugin()
    ]
    module: {
      loaders: [
        {
          test: /\.coffee$/,
          loader: 'coffee-loader'
        },
        {
          test: /\.jsx?$/,
          loaders: ['react-hot', 'babel'],
          include: path.join(__dirname, 'lib')
        }
      ]
    },
 })

if NODE_ENV is 'production'
  module.exports = mergeCommon({
    entry:'./lib/main.js',
    devtool: 'source-map',
    output:
      path: "#{ROOT_PATH}/build/"
      filename: 'app.js'
    plugins: [
      new webpack.optimize.UglifyJsPlugin({
        compress: {
          #压缩编译的build.js文件
          warnings: false
        }
      }),
      new webpack.NoErrorsPlugin()
    ]
    module: {
      loaders: [
        {
          test: /\.jsx?$/,
          loaders: ['babel'],
        }
      ]
    },

  })


#module.exports = mergeCommon({
#  entry:'./lib/main.js',
#  output:
#    path: "#{ROOT_PATH}/dist/"
#    filename: 'bundle.js'
#})

