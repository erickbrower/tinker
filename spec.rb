require 'minitest/spec'
require 'minitest/autorun'
require './lib/tinker.rb'

describe ServiceObject do
  it 'sets instance variables on initialize' do
    obj = ServiceObject.new(something: 1, other: 2)
    assert(obj.respond_to?(:something))
    assert(obj.respond_to?(:other))
  end
end

describe Todo do
  it 'responds to completed?' do
    todo = Todo.new
    assert(todo.respond_to?(:completed?))
  end
end

describe AddTodoService do
  it 'creates a new Todo' do
    text = "This is a test todo!"
    todo = AddTodoService.perform(text: "This is a test todo!")
    assert(todo.text == text)
  end
end

describe CompleteTodoService do
  it 'completes a Todo' do
    t = CompleteTodoService.perform(id: todo.id)
    assert(t.completed?)
  end

  private
  def todo
    @todo ||= AddTodoService.perform(text: "This is a test todo!")
  end
end

describe EditTodoService do
  it "updates a Todo's text" do
    updated_text = "Updated text!"
    t = EditTodoService.perform(id: todo.id, text: updated_text)
    assert(t.persisted?)
    assert(t.text == updated_text)
  end

  private
  def todo
    @todo ||= AddTodoService.perform(text: "This is a test todo!")
  end
end

describe DeleteTodoService do
  it 'deletes a Todo' do
    t = DeleteTodoService.perform(id: todo.id)
    assert(Todo.where(id: todo.id).first == nil)
  end

  private
  def todo
    @todo ||= AddTodoService.perform(text: "This is a test todo!")
  end
end
