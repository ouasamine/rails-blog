require "rails_helper"

RSpec.describe 'User show page', type: :system do
  before do 
    @user = User.create(name: "Lilly", posts_counter: 0)
    @post = Post.create(title: "First post", text: "Another new post", author: @user, comments_counter: 0, likes_counter: 0)
    @post_2 = Post.create(title: "Second post", text: "Another new post", author: @user, comments_counter: 0, likes_counter: 0)
    @post_3 = Post.create(title: "Third post", text: "Another new post", author: @user, comments_counter: 0, likes_counter: 0)
  end

  it "should show the user profile image" do
    visit user_path(@user.id)
    expect(page).to have_css('div.img-plch')
  end

  it "should show the user name" do
    visit user_path(@user.id)
    expect(page).to have_text "Lilly"
  end

  it 'should show the user posts counter' do
    visit user_path(@user.id)
    expect(page).to have_content("Number Of Posts: #{@user.posts_counter}")
  end

  it 'should show the user bio' do
    visit user_path(@user.id)
    expect(page).to have_text "#{@user.bio}"
  end

  it 'should show the user last 3 posts' do
    visit user_path(@user.id)
    expect(page).to have_content "#{@post.title}"
    expect(page).to have_content "#{@post_2.title}"
    expect(page).to have_content "#{@post_3.title}"
  end

  it 'should show see all posts button' do
    visit user_path(@user.id)
    expect(page).to have_css('a.btn', text: 'See all posts')
  end

  it 'should redirect to post show page when clicking on a user post should ' do
    visit user_path(@user.id)
    click_on "#{@post.title}"
    expect(page).to have_current_path post_path(@post.id)
  end

  it 'should redirect to posts index page when clicking see all posts button ' do
    visit user_path(@user.id)
    click_on 'See all posts'
    expect(page).to have_current_path user_posts_path(@user.id)
  end
end