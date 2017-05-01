require 'rails_helper'

feature "user signs up" do

  context "user signs up" do

    scenario "specifying valid and required info" do
      visit root_path
      click_link 'Create account'
      fill_in 'First name', with: 'My'
      fill_in 'Last name', with: 'Ukulele'
      fill_in 'Email', with: 'my@ukulele.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to have_content("Sign out")
    end

    scenario "required info is not supplied" do
      visit root_path
      click_link 'Create account'
      fill_in 'First name', with: 'My'
      fill_in 'Last name', with: 'Ukulele'
      fill_in 'Email', with: 'my@ukulele.com'

      click_button 'Sign up'

      expect(page).to have_content("Password can't be blank")
    end

    scenario "passwords don't match" do
      visit root_path
      click_link 'Create account'
      fill_in 'First name', with: 'My'
      fill_in 'Last name', with: 'Ukulele'
      fill_in 'Email', with: 'my@ukulele.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'abc'
      click_button 'Sign up'

      expect(page).to have_content
      ("Password confirmation doesn't match Password")
    end

    xscenario "user can upload an avatar photo" do

      visit root_path
      click_link 'Create account'
      fill_in 'First name', with: 'My'
      fill_in 'Last name', with: 'Ukulele'
      fill_in 'Email', with: 'my@ukulele.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      attach_file :avatar, "#{Rails.root}/spec/support/images/photo.png"
      click_button 'Sign up'

      expect(page).to have_content("Welcome! You have signed up successfully.")
      expect(page).to have_content("Sign out")
    end
  end
end
