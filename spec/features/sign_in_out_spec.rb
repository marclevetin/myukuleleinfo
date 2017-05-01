require 'rails_helper'

feature 'user signs in and out' do

  context 'user signs in' do

    let!(:user) do
      User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
      )
    end

    scenario "specifying valid and required info" do
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: 'my@ukulele.com'
      fill_in 'Password', with: 'password'

      click_button 'Sign in'

      expect(page).to have_content("Signed in successfully.")
      expect(page).to have_content("Sign out")
    end

    scenario "password is not supplied" do
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: 'my@ukulele.com'

      click_button 'Sign in'

      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "password is incorrect" do
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: 'my@ukulele.com'
      fill_in 'Password', with: 'abc'

      click_button 'Sign in'

      expect(page).to have_content("Invalid Email or password.")
    end
  end

  context 'user signs out' do
    let!(:user) do
      User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
      )
    end

    scenario "specifying valid and required info" do
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: 'my@ukulele.com'
      fill_in 'Password', with: 'password'

      click_button 'Sign in'

      click_link 'Sign out'

      expect(page).to have_content("Signed out successfully.")
    end
  end
end
