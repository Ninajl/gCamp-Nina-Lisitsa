require 'rails_helper'

describe 'User can CRUD new project task' do

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

  scenario "User can create a new Project Task" do
    project = Project.create!(:name => "ProjectName")
    visit '/projects'
    click_link "ProjectName"
    expect(page).to have_content("ProjectName")
    click_on "Task"
    expect(page).to have_content("Tasks for Project")
    click_on "New Task"


    fill_in 'task[description]', :with => "TaskName"
    click_on "Create Task"
    expect(page).to have_content("TaskName")

  end

  scenario "User can view project task show page" do
    project = Project.create!(:name => "Project Green")

    visit "/projects/#{project.id}/tasks"
    expect(page).to have_content "Project Green"

    # task = Task.create!(:description => "TaskTwo")
    click_on "New Task"


    fill_in 'task[description]', :with => "Casey"
    click_on "Create Task"
    expect(page).to have_content("Task was successfully created.")

    click_on "Project Green"

    click_on "Task"

    click_on "Show"

    expect(page).to have_content "Due on"

  end
  # #
  scenario "User can edit a task" do
    project = Project.create!(:name => "ProjectName")
    visit "/projects/#{project.id}/tasks"
    click_link "ProjectName"
    expect(page).to have_content("ProjectName")
    click_on "Task"
    expect(page).to have_content("Tasks for Project")
    click_on "New Task"


    fill_in 'task[description]', :with => "TaskName"
    click_on "Create Task"

    expect(page).to have_content("TaskName")
    click_on "Edit"

    fill_in 'task[description]', :with => "TaskEdit"
    click_on "Update Task"

    expect(page).to have_content("TaskEdit")
  end
  #
  scenario "User can delete a task" do
    project = Project.create!(:name => "Project Green")
    visit "/projects/#{project.id}/tasks"
    expect(page).to have_content "Project Green"

    click_on "New Task"


    fill_in 'task[description]', :with => "Nina"
    click_on "Create Task"

    expect(page).to have_content "Nina"

    click_on "Project Green"
    click_on "Task"
    click_on "Delete"
    expect(page).to have_content "Tasks for Project"
  end

end
