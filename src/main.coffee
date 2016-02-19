React = require 'react'
ReactDOM = require 'react-dom'
#Hello = require './actives/hello'
console.dir React
console.dir ReactDOM

#ReactDOM.render
#  Hello name='Nate', document.body

console.dir React

{ div, h1, p, a } = React.DOM

Jumbotron = React.createClass
  render: ->
    div { className: "jumbotron" },
      div { className: "container" },
        h1 {}, "Hello World"
          p {},
            a {
              className: "btn btn-primary btn-lg"
              href: "#"
              role: "button"
              "Learn more »" }

