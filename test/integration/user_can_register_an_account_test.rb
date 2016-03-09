require 'test_helper'

class UserCanRegisterAnAccountTest < ActionDispatch::IntegrationTest
  test "user sees dashboard with list of their tools" do
    visit tools_path

    click_on "Create Account"
    fill_in "Username", with: "Nicky Bobby"
    fill_in "Password", with: "password"

    click_on "Register"

    assert page.has_content?("Welcome, Nicky Bobby!")
  end
end
