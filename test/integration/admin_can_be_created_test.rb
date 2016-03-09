require 'test_helper'

class AdminCanBeCreatedTest < ActionDispatch::IntegrationTest
  test "admin sees admin dashboard page" do
    admin = User.create(username: "GrumpyBaby", password: "password", role: 1)
    visit tools_path
    click_on "Login"
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("Welcome, GrumpyBaby!")
  end
end
