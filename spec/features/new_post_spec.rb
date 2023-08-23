require 'rails_helper'

RSpec.feature "Create New Post", type: :feature do
  scenario "user creates a new post, navigates back to list, and sees the post" do
    visit new_post_path

    fill_in "Title", with: "New Post Title"
    fill_in "Content", with: "New Post Content"

    expect {
      click_button "Create Post"
      expect(current_path).to eq(posts_path)
      expect(page).to have_content("Title")
      expect(page).to have_content("Body")
    }.to change(Post, :count).by(1)

    click_link "Back"

    expect(current_path).to eq(posts_path)
    expect(page).to have_content("Title")
    expect(page).to have_content("Body")
  end
end