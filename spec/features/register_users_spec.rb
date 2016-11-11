require 'rails_helper'

RSpec.feature "RegisterUsers", type: :feature do
  context 'Successfully registering a user' do
    Steps 'to Successfully registering a user' do
      Given 'that I am on the registration page' do
        visit '/'
      end
      Then 'I can see registration form' do
        expect(page).to have_content 'Registration Form'
      end
      And 'I can fill out the registration form' do
        fill_in 'full_name', with: "Jeannette"
        fill_in 'street_address', with: "123 Learn Way"
        fill_in 'city', with: "San Diego"
        fill_in 'state', with: "CA"
        fill_in 'postal_code', with: "92123"
        fill_in 'country', with: "USA"
        fill_in 'email', with: "jd@gmail.com"
        fill_in 'cell_phone', with: "000-000-0000"
        fill_in 'home_phone', with: "111-111-1111"
        fill_in 'work_phone', with: "222-222-2222"
        fill_in 'user_id', with: "1234567"
        fill_in 'password', with: "password"
      end
      And 'I can register' do
        click_button 'Register'
      end
      Then 'I am taken to the registered user confirmation page' do
        expect(page).to have_content "Confirmation"
      end
    end #Steps
  end #context
  context 'I am asked to use a different user id if user id already exists' do
    Steps 'to use a different user id if its already taken' do
      Given 'that I am on the registration page' do
        visit '/'
      end
      And 'I can register a new user' do
        fill_in 'user_id', with: "1234567"
        fill_in 'password', with: "password"
        click_button 'Register'
      end
      Then 'I try to register an existing user id' do
        visit '/'
        fill_in 'user_id', with: "1234567"
        fill_in 'password', with: "password"
        click_button 'Register'
      end
      Then 'I see a try a different user id message' do
        expect(page).to have_content "User ID taken, try another"
      end
    end #steps
  end #context
end #RSpec
