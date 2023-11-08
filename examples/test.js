let fs = require('fs')
let process = require('process')
let Elm = require('./Example').Elm

let app = Elm.Example.init()
let exampleOutput = fs.readFileSync('example-output.txt').toString()

app.ports.output.subscribe(function(message) {
  if (exampleOutput != message) {
    console.error("Test output mismatch.")
    console.error("Expected:")
    console.error(exampleOutput)
    console.error("Got:")
    console.error(message)
    process.exit(1)
  } else {
    console.log("OK")
  }
});
