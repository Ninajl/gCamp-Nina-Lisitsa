require 'rails_helper'

describe 'User can CRUD new task' do

  before :each do
    visit "/"
    click_on "Tasks"
  end

  scenario "User can create a new Task" do
    click_on "New Task"
    expect(page).to have_content("New Task")

    fill_in 'task[description]', :with => "TestName"
    click_on "Create Task"
    expect(page).to have_content("TestName")

  end

  scenario "User can view task show page" do
    Task.create(:description => "TestName")

    visit "/tasks"

    click_on "TestName"
    expect(page).to have_content("TestName")

  end
  # #
  scenario "User can edit a task" do
    Task.create(:description => "TestName")

    visit "/tasks"
    click_on "TestName"
    # expect(page).to have_content("TestName")
    click_on "Edit"
    expect(page).to have_content("Editing Task")

    fill_in 'task[description]', :with => "TestEdit"
    click_on "Update Task"
    # expect(page).to have_content("Project was successfully updated.")
    expect(page).to have_content("TestEdit")
  end
  #
  scenario "User can delete a task" do
    Task.create(:description => "TestName")

    visit "/tasks"
    expect(page).to have_content "TestName"
    click_on "Destroy"
    expect(page).to have_content "Tasks"
  end

end
