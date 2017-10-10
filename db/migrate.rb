require './db/connection.rb'

ActiveRecord::Schema.define do
  create_table :todos, force: true do |t|
    t.string :text
    t.boolean :completed, default: false
  end
end
