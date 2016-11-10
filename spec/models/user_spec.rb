require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a user' do
    @user = User.new
    @user.save
    expect(@user.save).to eq true
  end
end
