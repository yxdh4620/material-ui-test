
React = require 'react'
ReactDOM = require 'react-dom'
injectTapEventPlugin = require 'react-tap-event-plugin'
RaisedButton = require 'material-ui/lib/raised-button'
#Hello = require './actives/hello'
console.dir React
console.dir ReactDOM

#ReactDOM.render
#  Hello name='Nate', document.body

console.dir RaisedButton

{ div, h1, p, a } = React.DOM

console.dir div

#Jumbotron = React.createClass
#  render: ->
#    div { className: "jumbotron" },
#      div { className: "container" },
#        h1 {}, "Hello World"
#          p {},
#            a {
#              className: "btn btn-primary btn-lg"
#              href: "#"
#              role: "button"
#              "Learn more »" }
#
#React.renderComponent (Jumbotron {name: 'World'}), document.body


#Hello = React.createClass
#  render: ->
#    div {}, ['Hello ' + @props.name]

#module.exports = Hello
#React.renderComponent (Hello {name: 'World'}), document.body

#ReactDOM.render (Hello {name:'World'}), document.body


Main = React.createClass
  render: ->
    div { className: "jumbotron" },
      h1 {}, "Hello World",
      p {},
        a {
          className: "btn btn-primary btn-lg"
          href: "#"
          role: "button"}, "Learn more »"
      React.createElement(RaisedButton, {label:"Super Secret Password"})

injectTapEventPlugin()
ReactDOM.render React.createElement(Main), document.getElementById('app')
#ReactDOM.render Main, document.getElementById('app')

