require 'rails_helper'

describe "Admin can CRUD projects" do
  let (:project) { Project.create!(:name => "TestName") }

  before :each do
    user = User.create(
    first_name: "admin",
    last_name: "adminLastName",
    email: "admin@Email.com",
    password: "P",
    admin: true,
    )
    visit root_path

    expect(page).to have_link("Sign In")

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content(user.email)
    expect(page).to have_content("Successfully Logged In!")

  end

  scenario "Admin can see all Projects" do
    visit '/projects'
    expect(page).to have_content("Projects")
  end

  scenario "Admin can delete all user projects" do
  visit '/projects'
  save_and_open_page
  click_on "#{project.name}"
  expect(page).to have_content("#{project.name}")
  click_on "Delete"
  end

  scenario "Admin can edit all users" do
    visit '/users'
    click_on "#{user.fullname}"
    expect(page).to have_content("#{user.fullname}")
    click_on "Edit"
  end

  scenario "Admin can delete all users" do
    visit '/projects'
    click_on "#{user.fullname}"
    expect(page).to have_content("#{user.fullname}")
    click_on "Delete"
  end
end
