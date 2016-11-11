require 'rails_helper'

RSpec.feature "LogOuts", type: :feature do
  context 'registering a new user' do
    Steps 'to sucessfully register' do
      Given 'that I am registered user' do
        visit '/'
      end
      Then 'I can fill in the form' do
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
        click_button 'Register'
      end
      Then 'I can log in' do
        visit '/'
        fill_in 'login_user_id', with: "1234567"
        fill_in 'login_password', with: "password"
        click_button "Log In"
      end
      Then 'I can log out by clicking the log out button' do
        click_button 'Log Out'
      end
      And 'I am taken to the log in page' do
        visit '/'
      end
    end #Steps
  end #contex
end #Rspec
