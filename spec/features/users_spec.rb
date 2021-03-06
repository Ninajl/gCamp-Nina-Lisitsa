require 'rails_helper'

  describe 'User can CRUD new user' do

    before :each do
      user = User.create(
        first_name: "TestName",
        last_name: "TestLastName",
        email: "Test@Email.com",
        password: "P",
        password_confirmation: "P"
      )
      visit root_path

      click_on "Sign In"
      expect(page).to have_content("Sign into gCamp!")

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign In"
      expect(page).to have_content(user.email)
    end

    scenario "User can create a new User" do
      visit '/users'
      click_on "New User"
      expect(page).to have_content("New User")

      fill_in 'user[first_name]', :with => "OtherName"
      fill_in 'user[last_name]', :with => "OtherLastName"
      fill_in 'user[email]', :with => "Other@Email.com"
      fill_in 'user[password]', :with => "P"
      fill_in 'user[password_confirmation]', :with => "P"
      click_on "Create User"
      expect(page).to have_content("OtherName")

    end

    scenario "User can view user show page" do
      user = User.create!(
      first_name: "Name",
      last_name: "LastName",
      email: "Test1@Email.com",
      password: "P",
      password_confirmation: "P"
      )
      visit "/users"

        click_on user.fullname
      expect(page).to have_content("First name")

    end

    scenario "User can edit a user" do

      user = User.create!(
      first_name: "Name",
      last_name: "LastName",
      email: "Test1@Email.com",
      password: "P",
      password_confirmation: "P"
      )
      visit "/users/#{user.id}"
      #
      # click_on user.fullname
      # expect(page).to have_content(user.fullname)

      click_link "Edit"
      expect(page).to have_content("First name")

      fill_in 'user[first_name]', :with => "Do"
      fill_in 'user[last_name]', :with => "Be"
      fill_in 'user[email]', :with => "dobe@Email.com"
      fill_in 'user[password]', :with => "T"
      fill_in 'user[password_confirmation]', :with => "T"

      click_on "Update User"
      expect(page).to have_content("User was successfully updated.")

    end

    scenario "User can delete a user" do
      other_user = User.create(
        first_name: "OtherName",
        last_name: "OtherLastName",
        email: "Other@Email.com",
        password: "P",
        password_confirmation: "P"
      )
      visit "/users"
      expect(page).to have_content other_user.fullname
      click_on other_user.fullname
      click_on "Edit"
      click_on "Delete"
      expect(page).to have_content "Users"
      expect(page).to_not have_content other_user.fullname
    end

end
