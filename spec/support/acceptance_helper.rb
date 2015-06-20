module AcceptanceHelper

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'
  end

  def fill_passwords
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
  end

  def sign_up
    visit new_user_session_path
    click_on 'Sign up'
  end
end