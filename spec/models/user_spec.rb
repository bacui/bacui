require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a first name" do
    usr = User.new(first_name: nil)
    expect(usr).to_not be_valid
  end

  it "is not valid without a last name" do
    usr = User.new(last_name: nil)
    expect(usr).to_not be_valid
  end

  it "is not valid without a email" do
    usr = User.new(email: nil)
    expect(usr).to_not be_valid
  end
end
