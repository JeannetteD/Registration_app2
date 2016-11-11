require 'rails_helper'

RSpec.describe Phone, type: :model do
  it 'has a phone' do
  @phone = Phone.new
  @phone.number = "111-111-1111"
  @phone.save
  expect(@phone.save).to eq true
  end
end
