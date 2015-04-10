require 'rails_helper'

describe 'Registering a Guest' do

  scenario 'Guest must register with valid data' do
    visit '/signup'
    fill_in 'First name', :with => "Nina"
    fill_in 'Last name', :with => "Lisitsa"
    fill_in 'Email', :with => "nina@go.com"
    fill_in 'Password', :with => "test11"
    fill_in 'Password confirmation', :with => "test11"
    click_button 'Sign Up'
    expect(page).to have_content "Sign into gCamp!"

  end

  # scenario 'Guest must register with valid data and fill in all fields' do
  #   @user = User.create(user_name: "test11", password: "test11")
  #   visit '/signin'
  #   fill_in 'user_name', :with => "test11"
  #   fill_in 'password', :with => "test11"
  #   click_button 'Sign In'
  #   expect(page).to have_content "Welcome to this crazy thing called Life"
  # end
end
