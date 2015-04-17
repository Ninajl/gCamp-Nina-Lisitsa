require 'rails_helper'
require 'pry'

describe 'User can CRUD new project task' do

  before :each do

    @user = User.create(
    first_name: "TestName",
    last_name: "TestLastName",
    email: "Test@Email.com",
    password: "P",
    admin: true
    )

    visit "/signin"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    within(".action") do
      click_on "Sign In"
    end
    expect(page).to have_content(@user.email)
    click_on "New Project"
    fill_in 'project[name]', with: 'ProjectName'
    click_on "Create Project"
    expect(page).to have_content("ProjectName")

  end

  scenario "User can create a new Project Task" do
    # Membership.create(user_id: @user.id, project_id: project.id, role: :owner)

    # within "table" do
    #   click_on "ProjectName"
    # end
    # expect(page).to have_content("ProjectName")
    #
    # page.find("#task_count").click
    # expect(page).to have_content("Tasks")
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
    task = Task.create!(:description => "Nina", :project_id => project.id, :task_due_date => "1984/01/15")


    visit "/projects/#{project.id}/tasks"
    expect(page).to have_content "Project Green"

    page.click_link('', :href => "/projects/#{project.id}/tasks/#{task.id}")
    expect(page).to have_content "Tasks for Project"
  end

end
