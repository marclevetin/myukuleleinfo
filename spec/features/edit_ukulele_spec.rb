require 'rails_helper'

feature "A user edits a ukulele" do

  scenario "edit page opens" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    expect(page).to have_content("Change ukulele")
  end

  scenario "edit page opens and changes are saved" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'luthier', with: 'Luthier from edit page'
    click_button 'Change ukulele'

    expect(page).to have_content("Luthier from edit page")
    expect(page).to have_content("Details")
  end

  scenario "date must be a date" do

    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'purchase_date', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  scenario "width does not accept text" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'width', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  scenario "depth does not accept text" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'depth', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  scenario "neck width does not accept text" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'neck_width', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  scenario "scale length does not accept text" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'length_scale', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  scenario "body length does not accept text" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'length_body', with: 'abc'

    expect(page).not_to have_content("abc")
  end
end
