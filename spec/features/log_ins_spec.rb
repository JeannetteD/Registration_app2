require 'rails_helper'

RSpec.feature "LogIns", type: :feature do
  context 'sucessfully logging in' do
    Steps 'to sucessfully log in' do
      Given 'that I am registered user' do
        visit '/'
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
      And 'I see a successful log in page' do
        expect(page).to have_content("You have Successfully logged in, 1234567")
        expect(page).to have_content("Jeannette")
        expect(page).to have_content("123 Learn Way")
        expect(page).to have_content("San Diego")
        expect(page).to have_content("CA")
        expect(page).to have_content("92123")
        expect(page).to have_content("USA")
        expect(page).to have_content("jd@gmail.com")
        expect(page).to have_content("000-000-0000")
        expect(page).to have_content("111-111-1111")
        expect(page).to have_content("222-222-2222")
      end
    end #Steps
  end #context
  context 'unsuccessfully logged in' do
    Steps 'to try to log in again' do
      Given 'that i am a registered user' do
        visit '/'
        fill_in 'user_id', with: "1234567"
        fill_in 'password', with: "password"
        click_button 'Register'
      end
      Then 'I unsuccessfully log in' do
        visit '/'
        fill_in 'login_user_id', with: "123"
        fill_in 'login_password', with: "password"
        click_button "Log In"
      end
      And 'I am prompted to try again due to unsuccessful log in' do
        expect(page).to have_content "Log in failed, try again!"
      end
    end #Steps
  end #context
end #RSpec
