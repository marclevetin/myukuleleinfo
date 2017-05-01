require 'rails_helper'

RSpec.describe User, type: :model do

  # user = FactoryGirl.create(:user)
  user = User.create(
    first_name: 'first',
    last_name: 'last',
    email: 'user@password.com',
    password: 'password'
  )

  it "User has a first name" do
    expect(user.first_name).to eq('first')
  end

  it "User has a last name" do
    expect(user.last_name).to eq('last')
  end

  it "User has an email address" do
    expect(user.email).to eq('user@password.com')
  end

  it "Email address is unique" do
    user = User.create(
      first_name: 'first',
      last_name: 'last',
      email: 'user@password.com',
      password: 'password'
    )

    second_user = User.new(
      first_name: 'second',
      last_name: 'last',
      email: 'user@password.com',
      password: 'password'
    )

    expect(second_user.save).to eq(false)
  end

  it "first name is required" do
    no_first_name = User.new(
      first_name: '',
      last_name: 'last',
      email: 'user@password.com',
      password: 'password'
    )

    expect(no_first_name.save).to eq(false)
  end

  it "last name is required" do
    no_last_name = User.new(
      first_name: 'first',
      last_name: '',
      email: 'user@password.com',
      password: 'password'
    )
    expect(no_last_name.save).to eq(false)
  end

  it "email is required" do
    no_email = User.new(
      first_name: 'first',
      last_name: 'last',
      email: '',
      password: 'password'
    )
    expect(no_email.save).to eq(false)
  end

  it "password is required" do
    no_password = User.new(
      first_name: 'first',
      last_name: 'last',
      email: 'user@password.com',
      password: ''
    )
    expect(no_password.save).to eq(false)
  end
end
