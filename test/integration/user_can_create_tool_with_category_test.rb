require 'test_helper'

class UserCanCreateToolWithCategoryTest < ActionDispatch::IntegrationTest
  test "user sees show page for tool with correct category" do
    user = User.create(username: "Nick", password: "password")
    visit tools_path
    click_on "Login"
    fill_in "Username", with: "Nick"
    fill_in "Password", with: "password"
    click_on "Login"
    visit new_tool_path
    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "10"
    select "Power Tool", from: "Category"
    click_link_or_button "Create Tool"

  end
end
