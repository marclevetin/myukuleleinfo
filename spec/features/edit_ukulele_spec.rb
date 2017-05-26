require 'rails_helper'

feature "A user edits a ukulele" do

  scenario "edit page opens" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    expect(page).to have_content("Change a ukulele")
  end

  scenario "edit page opens and changes are saved" do
    ukulele = FactoryGirl.create(:ukulele)

    login_as(ukulele.user)
    visit edit_user_ukulele_path(ukulele.user, ukulele)
    fill_in 'luthier', with: 'Luthier from edit page'
    click_button 'Update'

    expect(page).to have_content("Luthier from edit page")
    expect(page).to have_content("Details")
  end

  xscenario "date is formatted correctly" do
    user = User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
    )

    login_as(user)
    visit user_ukuleles_path(user)
    click_link 'Add a ukulele'
    fill_in 'nickname', with: 'Best uke ever'
    select('banjolele', from: 'ukulele_instrument_type')
    select('pineapple', from: 'ukulele_ukulele_shape')
    select('tenor', from: 'ukulele_ukulele_size')
    fill_in 'purchase_date', with: '01/01/2017'

    click_button 'Add a ukulele'

    expect(page).to have_content("01/01/2017")
  end

  xscenario "date must be a date" do
    user = User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
    )

    login_as(user)
    visit user_ukuleles_path(user)
    click_link 'Add a ukulele'
    fill_in 'purchase_date', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  xscenario "width does not accept text" do
    user = User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
    )

    login_as(user)
    visit user_ukuleles_path(user)
    click_link 'Add a ukulele'
    fill_in 'width', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  xscenario "depth does not accept text" do
    user = User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
    )

    login_as(user)
    visit user_ukuleles_path(user)
    click_link 'Add a ukulele'
    fill_in 'depth', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  xscenario "neck width does not accept text" do
    user = User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
    )

    login_as(user)
    visit user_ukuleles_path(user)
    click_link 'Add a ukulele'
    fill_in 'neck_width', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  xscenario "scale length does not accept text" do
    user = User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
    )

    login_as(user)
    visit user_ukuleles_path(user)
    click_link 'Add a ukulele'
    fill_in 'length_scale', with: 'abc'

    expect(page).not_to have_content("abc")
  end

  xscenario "body length does not accept text" do
    user = User.create(
      first_name: 'My',
      last_name: 'Ukulele',
      email: 'my@ukulele.com',
      password: 'password'
    )

    login_as(user)
    visit user_ukuleles_path(user)
    click_link 'Add a ukulele'
    fill_in 'length_body', with: 'abc'

    expect(page).not_to have_content("abc")
  end
end
