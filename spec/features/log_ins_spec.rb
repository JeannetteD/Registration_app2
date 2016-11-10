require 'rails_helper'

RSpec.feature "LogIns", type: :feature do
  context 'sucessfully logging in' do
    Steps 'to sucessfully log in' do
      Given 'that I am registered user' do
        visit '/'
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
      And 'I see a successful log in page' do
        expect(page).to have_content("You have Successfully logged in, 1234567")
        expect(page).to have_content("Name: ")
        expect(page).to have_content("Address:")
        expect(page).to have_content("City:")
        expect(page).to have_content("State:")
        expect(page).to have_content("Postal Code: ")
        expect(page).to have_content("Country:")
        expect(page).to have_content("Email: ")
      end
    end #Steps
  end #context
end #RSpec
