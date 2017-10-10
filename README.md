# Tinker
For creating Todos!

## Installation
1. `git clone git@github.com:erickbrower/tinker.git`
2. `bundle`

## Usage
`./bin/tinker`

#### Commands:
*  `tinker add ..ARGS`       # Add Todos with text from each ARGS
*  `tinker complete ..ARGS`  # Completes Todos by ids in ARGS
*  `tinker delete ..ARGS`     # Deletes a Todo
*  `tinker edit ..ARGS`      # Edits the text of a single todo. First ARG is the id, second is the new text
*  `tinker help [COMMAND]`   # Describe available commands or one specific command
*  `tinker list`             # Show all current Todos

## Rake Tasks
* `rake console` # Start an interactive console with Tinker loaded
* `rake test` # Run all tests in spec.rb
* `rake db:migrate` # Creates a sqlite3 db file at db/database.db and creates a Todos table
