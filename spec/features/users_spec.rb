require 'rails_helper'

describe 'User can CRUD new user' do

  before :each do
    visit "/"
    click_on "Users"
  end

  scenario "User can create a new User" do
    click_on "New User"
    expect(page).to have_content("New User")

    fill_in 'user[first_name]', :with => "TestName"
    fill_in 'user[last_name]', :with => "TestLastName"
    fill_in 'user[email]', :with => "Test@Email.com"
    fill_in 'user[password]', :with => "P"
    fill_in 'user[password_confirmation]', :with => "P"
    click_on "Create User"
    expect(page).to have_content("TestName")

  end

  scenario "User can view user show page" do
    @user = User.create(first_name: "TestName", last_name: "TestLastName", email: "Test@Email.com", password: "P", password_confirmation: "P")

    visit "/users"

    click_on "TestName"
    expect(page).to have_content("TestName")

  end
  # # #
  scenario "User can edit a user" do
    @user = User.create(first_name: "TestName", last_name: "TestLastName", email: "Test@Email.com", password: "P", password_confirmation: "P")

    visit "/users"
    # click_on "TestName"
    # expect(page).to have_content("TestName")
    click_on "Edit"
    expect(page).to have_content("Edit User")

    fill_in 'user[first_name]', :with => "TestEdit"
    fill_in 'user[last_name]', :with => "TestLastEdit"
    fill_in 'user[email]', :with => "Testedit@Email.com"
    fill_in 'user[password]', :with => "T"
    fill_in 'user[password_confirmation]', :with => "T"

    click_on "Update User"
    # expect(page).to have_content("Project was successfully updated.")
    expect(page).to have_content("TestEdit")
  end
  # #
  scenario "User can delete a user" do
    @user = User.create(first_name: "TestName", last_name: "TestLastName", email: "Test@Email.com", password: "P", password_confirmation: "P")

    visit "/users"
    expect(page).to have_content "TestName"
    click_on "Delete"
    expect(page).to have_content "Users"
  end

end
