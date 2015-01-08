var express = require('express');
var parser = require('body-parser');
var app = express();

var notes = [{"name":"Sample Note"}];

app.use(parser.json());

app.get('/notes', function(req, res) {
  console.log("GET request");
  console.log(notes);
  res.json(notes);
});
app.post('/notes', function(req, res) {
  var newNote = req.body;
  console.log("POST request");
  console.log(newNote)
  notes.push(newNote);
  res.status(201).json(newNote);
});

var port = process.env.PORT || 8080
app.listen(port);