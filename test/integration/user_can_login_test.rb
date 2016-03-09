require 'test_helper'

class UserCanLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "Nicky Bobby", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, Nicky Bobby")
  end

  test "non-registered user can not login" do

    visit login_path
    fill_in "Username", with: "Nick"
    fill_in "Password", with: "passsdfsd"
    click_button "Login"

    refute page.has_content?("Welcome, Nick")
  end

end
