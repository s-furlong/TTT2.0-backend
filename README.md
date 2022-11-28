# TTT2.0 Server
This application is a back-end rail  server that contains the logic to play a tic-tac-toe game.  This logic  is either connected to the front end and can be played through a graphical user interface or can be played in its original form in a console app.


## Setup
The application was created using a rails framework and ruby coding language. It also uses a PostgreSQL database. In order to get the application running properly  the packages for the rails application and the database will need to be setup with the following commands:


`bundle install`
`rake db:create`
`rake db:migrate`


## Launch From Terminal
One of the original intentions of this application was to allow for the tic tac toe game to be played in its original form in the console. To play the game in the terminal run the following command:


`ruby ./lib/ttt_version_1.rb`


To play the game in the terminal,  select a number 1 to 9 corresponding with the position on the Tic Tac Toe board.  the first player will be X and the second player will be O. 

## Launch Server
The server takes the logic from the original tic-tac-toe console game and allows it to be played user a front-end graphical user interface.


`rails server`


The server will launch on localhost 3000.  To utilize this server,  you will need to set up end run the front and graphical user interface for Tic-tac-toe 2.0.  This can be found at:

> [TTT2.0_GUI](https://github.com/s-furlong/TTT2.0-Frontend) 

## Testing
This application had testing with the rspec library. To observe the testng done on this application, please run the following:


`rake spec`
