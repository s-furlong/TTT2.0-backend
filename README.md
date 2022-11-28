# TTT2.0 GUI
---
This application is a graphical user interface that allows two players to play tic tac toe with each other. This interface communicates with a rails server that incorporates the original logic from the in console application.

## Setup
This application was created with reactJS  and requires several dependencies that need to be installed utilizing npm packages. Thes packages can be installed using the following command:
`npm install`

## Launch
Once help packages and dependencies have been installed, the app can be launched through a web browser.
`npm start`

If not immediately redirected,  the application launches to localhost:4000 via the following link:
[APP location](http://localhost:4000/)

When the game is launched,  simply click a tile on the Tic Tac Toe board to start a game.  the first player to make a move will be X. The following player will make it their turn  and will be the O token. 

## Testing
Testing for this application was done utilizing the react-testing-library. The test suites can be observed at any time by running the following command in the terminal.
`npm run test`
Each component was tested individually for functionality. 
