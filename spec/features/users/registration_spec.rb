require 'spec_helper'

describe "Signing Up" do
  it "allows a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Clark"
    fill_in "Last Name", with: "Kent"
    fill_in "Email", with: "superman@gmail.com"
    fill_in "Password", with: "bighead1234"
    fill_in "Password (again)", with: "bighead1234"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end
end
