# spec/features/user_authentication_spec.rb

require 'rails_helper'

RSpec.feature "Navigation", type: :feature do
  scenario "visiting root URL redirects to user sign-in page" do
    visit root_path

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content("Log in")
  end
end

RSpec.feature "User Login", type: :feature do
  let!(:existing_user) do
    User.create(email: "test@example.com", password: "password123")
  end

  scenario "user can log in with valid credentials" do
    visit new_user_session_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    click_button "Log in"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Microblog Posts")
  #  expect(page).to have_content("Signed in successfully.")
  #  expect(page).to have_content("Welcome, test@example.com!")
  end
end

RSpec.feature "User Authentication", type: :feature do
  scenario "existing user can sign in with valid credentials" do
    user = create(:user, email: "test2@gmail.com", password: "test123")

    visit new_user_session_path

    fill_in "Email", with: "test2@gmail.com"
    fill_in "Password", with: "test123"
    click_button "Log in"

   expect(page).to have_content("Microblog Posts")
    expect(current_path).to eq(root_path)
  end
end
