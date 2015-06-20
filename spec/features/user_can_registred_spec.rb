require_relative 'features_helper'


feature 'User can register' do

  scenario 'user enters valid data' do
    sign_up
    fill_in 'Email', with: 'testuser@test.com'
    fill_passwords
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully'
    expect(current_path).to eq root_path
  end

  scenario 'user enters invalid email' do
    sign_up
    fill_in 'Email', with: 'wrong email'
    fill_passwords
    click_on 'Sign up'
    expect(page).to have_field 'Password', 'Password confirmation'
  end

  scenario 'user enters insufficient characters in password' do
    sign_up
    fill_in 'Email', with: 'testuser@test.com'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'
    click_on 'Sign up'
    expect(page).to have_content 'Password is too short'
  end

  scenario 'user enters another password confirmation' do
    sign_up
    fill_in 'Email', with: 'testuser@test.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345679'
    click_on 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  given(:user) { create(:user) }
  scenario 'the user has entered a an already existing email' do
    sign_up
    fill_in 'Email', with: user.email
    fill_passwords
    click_on 'Sign up'
    expect(page).to have_content 'Email has already been taken'
  end
end