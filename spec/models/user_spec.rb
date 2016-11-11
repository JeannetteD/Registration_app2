require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a user' do
    @user = User.new
    @user.full_name = "Carlos P."
    @user.street_address = "123 fake st."
    @user.user_id = "Carlos"
    @user.password = "Carlos"
    @user.save
    expect(@user.save).to eq true
  end
end
