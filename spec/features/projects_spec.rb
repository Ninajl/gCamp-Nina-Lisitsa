require 'rails_helper'

  describe 'User can CRUD projects' do

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

  scenario "User can create a new Project" do
    visit '/projects'
    click_on "New Project"
    expect(page).to have_content("Create Project")

    fill_in 'project[name]', :with => "TestName"
    click_on "Create Project"
    expect(page).to have_content("TestName")

  end

  scenario "User can view project show page" do
    Project.create!(:name => "TestName")

    visit "/projects"

    click_on "TestName"
    expect(page).to have_content("TestName")

  end
#
  scenario "User can edit a project" do
    Project.create!(:name => "TestName")

    visit "/projects"
    click_on "TestName"
    # expect(page).to have_content("TestName")
    click_on "Edit"
    expect(page).to have_content("Edit Project")

    fill_in 'project[name]', :with => "TestEdit"
    click_on "Update Project"
    # expect(page).to have_content("Project was successfully updated.")
    expect(page).to have_content("TestEdit")
  end

  scenario "User can delete a project" do
    Project.create!(:name => "TestName")

    visit "/projects"
    click_on "TestName"
    click_on "Delete"
    expect(page).to have_content "Projects"
  end

end
