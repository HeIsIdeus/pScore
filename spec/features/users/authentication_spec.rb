require "spec_helper"

describe "Logging In" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "Clark", last_name: "Kent", email: "superman@gmail.com", password: "bighead1234", password_confirmation: "bighead1234")
    visit new_user_session_path
    fill_in "Email Address", with: "superman@gmail.com"
    fill_in "Password", with: "bighead1234"
    click_button "Log In"

    expect(page).to have_content("pScore Todo Lists Sign Up")
    expect(page).to have_content("Thank you for logging in! Listing todo_lists New Todo list")
  end


  it "displays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "superman@gmail.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("pScore Todo Lists Sign Up Encountered an error logging in. Please confirm your email and password. pScore Log In Email Address Password")
    expect(page).to have_field("Email Address", with: "superman@gmail.com")
  end
end
