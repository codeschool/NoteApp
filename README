# Code School Live - Swift

## What was it?

On November 21, 2014, Jon Friskics and Alyssa Nicoll broadcast a special live-coding edition of Code School Live.  During the 90 minute broadcast, they started building a simple Swift app called NoteApp.

## What are these folders?

Jon and Alyssa were only able to get through building part of the app during the broadcast, so they created three versions of the project that are described below:

1. `01-cs_live_version_2014-11-21` - This is the state of the code right after filming stopped.  If you're following along with the Code School Live video recording, this is the one to look at.
2. `02-cs_live_followup_version` - We're planning on filming a follow-up that picks up where part `01` left off where we walk through finishing the app.
3. `03-final_working_version` - If you're dying to see what the full final version looks like, check out this folder.

## Running the API

The final version of NoteApp uses a simple API with GET and POST endpoints for reading and "saving" notes.  The app is built with node.js and the Express.js framework.

Here's a brief rundown on how to get it running:

1. Install [Homebrew](http://brew.sh/).
2. Install Node/NPM.  This tutorial from Adam Stacoviak on [The Change Log](http://thechangelog.com/install-node-js-with-homebrew-on-os-x/) is a good quick one.
3. Go to the `noteapp_api` folder in Terminal and type `npm install`.  If it works, you should see a few NPM warnings about missing descriptions, repository fields, and a README file - that's OK.  Underneath that you'll see a list of modules being installed with names like `express` and `body-parser`.  These are installed into `noteapp_api/node_modules`
4. In the `noteapp_api` folder, type `node app.js` and hit Enter.  You won't see anything after that, but if you open a web browser and enter `http://localhost:8080/notes`, you should see `[{"name":"Sample Note"}]` if things are working.

If the whole Node/Express.js thing is exciting and baffling to you, then you should definitely head over to Code School and take [Real-time Web with Node.js](https://www.codeschool.com/courses/real-time-web-with-node-js) and the upcoming [Building Blocks of Express.js](https://www.codeschool.com/courses/building-blocks-of-express-js) to learn how you can build an API like this yourself!