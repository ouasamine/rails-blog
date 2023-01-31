require "rails_helper"

RSpec.describe 'Post show page', type: :system do
  before do 
    @user = User.create(name: "Lilly", posts_counter: 0)
    @post = Post.create(title: "First post", text: "Another new post", author: @user, comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(author: @user, post: @post, text: "another comment!")
  end

  it "should show the user profile image" do
    visit user_posts_path(@user.id)
    expect(page).to have_css('div.img-plch')
  end

  it "should show the user name" do
    visit user_posts_path(@user.id)
    expect(page).to have_text "Lilly"
  end

  it 'should show the user posts counter' do
    visit user_posts_path(@user.id)
    expect(page).to have_content("Number Of Posts: #{@user.posts_counter}")
  end

  it 'should show posts titles' do
    visit user_posts_path(@user.id)
    expect(page).to have_content "#{@post.title}"
  end

  it 'should show posts bodies' do
    visit user_posts_path(@user.id)
    expect(page).to have_content "#{@post.text}"
  end

  it 'should show posts last comments' do
    visit user_posts_path(@user.id)
    expect(page).to have_content "#{@comment.text}"
  end

  it 'should show posts comments number' do
    visit user_posts_path(@user.id)
    expect(page).to have_content "Comments: #{@post.comments_counter}"
  end

  it 'should show posts likes number' do
    visit user_posts_path(@user.id)
    expect(page).to have_content "Likes: #{@post.likes_counter}"
  end

  it 'should show a pagination button' do
    visit user_posts_path(@user.id)
    expect(page).to have_css 'a.btn', text: 'Next page'
  end

  it 'should redirect to post show page when clicking on a post' do
    visit user_posts_path(@user.id)
    click_on "#{@post.title}"
    expect(page).to have_current_path post_path(@post.id)
  end
end