require_relative 'features_helper'

feature 'User can sign In' do

  given(:user) { create(:user) }

  scenario 'registered user try to signed' do
    sign_in(user)

    expect(current_path).to eq root_path
  end

  scenario 'non registered user try to signed' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(current_path).to eq new_user_session_path
  end
end