require_relative 'feature_helper'

feature 'User can registered' do

  scenario 'quest enter valid data' do
    sign_up
    fill_in 'Email', with: 'testuser@test.com'
    fill_passwords
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully'
    expect(current_path).to eq root_path
  end

  scenario 'user enter blank password' do
    sign_up
    fill_in 'Email', with: 'testuser@test.com'
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_on 'Sign up'

    expect(page).to have_content 'Password can\'t be blank'
    expect(current_path).to eq user_registration_path
  end
end