require 'rails_helper'

feature "ukulele show page" do

  context "user is not signed in" do
    scenario "details section appears" do
      ukulele = create(:ukulele)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Details")
      expect(page).to have_content("Type: Ukulele")
      expect(page).to have_content("Manufacture")
      expect(page).to have_content("Materials")
      expect(page).to have_content("Tuners")
      expect(page).to have_content("Finish")
      expect(page).to have_content("Dimensions")
    end

    scenario "pictures section appears" do
      ukulele = create(:ukulele)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Pictures")
      expect(page).not_to have_content("Add some.")
    end

    scenario "video section appears" do
      ukulele = create(:ukulele)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Video")
      expect(page).not_to have_content("Add one.")
    end

    scenario "share section appears" do
      ukulele = create(:ukulele)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Share")
      expect(page).to have_content("Copy code")
      expect(page).to have_content("[B]My Ukuleles[/B]")
      expect(page).to have_content("[URL=\"http://www.example.com")
    end
  end

  context "user is signed in" do
    scenario "details section appears" do
      ukulele = create(:ukulele)
      login_as (ukulele.user)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Details")
      expect(page).to have_content("Type: Ukulele")
      expect(page).to have_content("Manufacture")
      expect(page).to have_content("Materials")
      expect(page).to have_content("Tuners")
      expect(page).to have_content("Finish")
      expect(page).to have_content("Dimensions")
    end

    scenario "pictures section appears" do
      ukulele = create(:ukulele)
      login_as (ukulele.user)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Pictures")
      expect(page).to have_content("Add some.")
    end

    scenario "video section appears" do
      ukulele = create(:ukulele)
      login_as (ukulele.user)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Video")
      expect(page).to have_content("Add one.")
    end

    scenario "share section appears" do
      ukulele = create(:ukulele)
      visit user_ukulele_path(ukulele.user_id, ukulele)

      expect(page).to have_content("Share")
      expect(page).to have_content("Copy code")
      expect(page).to have_content("[B]My Ukuleles[/B]")
      expect(page).to have_content("[URL=\"http://www.example.com")
    end
  end
end
