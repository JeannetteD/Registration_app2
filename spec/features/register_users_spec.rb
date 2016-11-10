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
  end #context=
end #RSpec
