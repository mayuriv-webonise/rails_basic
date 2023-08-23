require 'rails_helper'

RSpec.feature "Post List Page", type: :feature do
  scenario "user can see a list of posts" do
    # Create some example posts in your test database
    post1 = create(:post, title: "First Post")
    post2 = create(:post, title: "Second Post")

    visit posts_path

    expect(page).to have_content("Posts")
    expect(page).to have_content("First Post")
    expect(page).to have_content("Second Post")
  end
end

RSpec.feature "New Post link", type: :feature do
  scenario "user can click on the 'New Post' link" do
    visit posts_path

    click_link "New Post"

    expect(current_path).to eq(new_post_path)
    expect(page).to have_field("Title")
    expect(page).to have_field("Content")
    expect(page).to have_button("Submit")
  end
end
