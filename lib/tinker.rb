require './db/connection.rb'

class Todo < ActiveRecord::Base
  def completed?
    completed
  end
end

class ServiceObject
  def initialize(args)
    args.each do |key, val|
      self.class.send(:attr_accessor, key)
      instance_variable_set("@#{key}", val)
    end
  end

  def self.perform(args)
    self.new(args).perform
  end
end

class AddTodoService < ServiceObject
  def perform
    Todo.create(text: text)
  end
end

class CompleteTodoService < ServiceObject
  def perform
    todo = Todo.find(id)
    todo.completed = true
    todo.save
    todo
  end
end

class EditTodoService < ServiceObject
  def perform
    todo = Todo.find(id)
    todo.text = text
    todo.save
    todo
  end
end

class DeleteTodoService < ServiceObject
  def perform
    Todo.destroy(id)
  end
end
