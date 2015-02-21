require 'rails_helper'

describe 'User can CRUD new project' do

  before :each do
    visit "/"
    click_on "Projects"
  end

  scenario "User can create a new Project" do

    click_on "New Project"
    expect(page).to have_content("Create Project")
    
    fill_in 'project[name]', :with => "TestName"
    click_on "Create Project"
    expect(page).to have_content("Project was successfully created!")
    expect(page).to have_content("TestName")

  end

  scenario "User can view project show page" do
    Project.create(:name => "TestName")

    visit "projects"

    click_on "TestName"
    expect(page).to have_content("TestName")

  end

  scenario "User can edit a project" do
    Project.create(:name => "TestName")

    visit "projects"

    click_on "Edit"
    expect(page).to have_content("Edit Project")

    fill_in 'project[name]', :with => "TestEdit"
    click_on "Update Project"
    expect(page).to have_content("Project was successfully updated.")
    expect(page).to have_content("TestEdit")
  end

  scenario "User can delete a project" do
    Project.create(:name => "TestName")

    visit "projects"

    click_on "Delete"
    expect(page).to have_content("Project was successfully destroyed.")
  end

end
Team Directory
Daniel Harris
@dharris
gSchool Denver Student
in your timezone (GMT-7)
9702107931
dharri91@msudenver.edu
Send Message   More
Recent Activity
Daniel Harris uploaded a file
IMG_1047.JPG

Jan 23rd at 1:17 PM
57KB JPEG file
in #g6
Daniel Harris uploaded a file
dHarrRowbot.png

Jan 20th at 11:27 AM
30KB PNG file
in #g6
