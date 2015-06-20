require_relative 'features_helper'

feature 'User can see list users' do

  given(:user) { create(:user) }
  given!(:user2) { create(:user) }

  scenario 'autnenticate user can see users list on root url' do

    sign_in(user)

    expect(current_path).to eq root_path
    expect(page).to have_content 'user1@test.com'
    expect(page).to have_content 'user2@test.com'
  end
end