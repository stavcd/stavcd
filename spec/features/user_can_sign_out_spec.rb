require_relative 'feature_helper'

feature 'User can sign In' do

  given(:user) { create(:user) }

  scenario 'registered user try to signed' do
    sign_in(user)

    expect(page).to have_content 'Sign Out'
    click_on 'Sign Out'

    expect(current_path).to eq new_user_session_path
  end
end