require 'rails_helper'

feature "A user adds a ukulele" do

  before(:all) do
    Rails.application.load_seed
  end

  scenario "happy path" do
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
    click_button 'Add a ukulele'
    expect(page).to have_content("Ukulele saved")
    expect(page).to have_content("Best uke ever")
    expect(page).to have_content("Banjolele")
    expect(page).to have_content("Pineapple")
    expect(page).to have_content("Tenor")
  end

  scenario "date is formatted correctly" do
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

  scenario "date must be a date" do
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

  scenario "width does not accept text" do
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

  scenario "depth does not accept text" do
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

  scenario "neck width does not accept text" do
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

  scenario "scale length does not accept text" do
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

  scenario "body length does not accept text" do
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
