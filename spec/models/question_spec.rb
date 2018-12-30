require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is not valid without title" do
    question = Question.new(title: nil)
    expect(question).to_not be_valid
  end

  it "is valid with title" do
    question = Question.new(title: "Something")
    expect(question).to be_valid
  end
end
