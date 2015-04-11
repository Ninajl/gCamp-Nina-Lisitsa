require 'rails_helper'

describe 'User can register, sign in and sign out' do

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

  scenerio 'User can Sign in with valid date' do
    fill_in 'Email', :with => "test@test.com"
    fill_in 'Password', :with => '1234'
    click_button 'Sign In'
    expect(page).to have_content "gCamp!"
    expect(page).to have_content "Successfully Logged In!"
  end

  scenerio 'User can Sign Out' do
    expect(page).to have_content "test@test.com"
    click_button 'Sign Out'
    expect(page).to have_content "Not signed in!"
    expect(page).to have_content "Sign Up for gCamp!"
  end

end
