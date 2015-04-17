require 'rails_helper'

scenario "Admin can CRUD projects" do

  before :each do
    user = User.create(
    first_name: "admin",
    last_name: "adminLastName",
    email: "admin@Email.com",
    password: "P",
    password_confirmation: "P"
    admin: true
    )
    visit root_path

    click_on "Sign In"
    expect(page).to have_content("Sign into gCamp!")

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content(user.email)
    expect(page).to have_contentSuccessfully("Logged In!")

  end

  scenario "Admin can see all Projects" do
    visit '/projects'
    # click_on "New Project"
    # expect(page).to have_content("Create Project")
    #
    # fill_in 'project[name]', :with => "TestName"
    # click_on "Create Project"
    expect(page).to have_content("#{project.name}")
  end
end
