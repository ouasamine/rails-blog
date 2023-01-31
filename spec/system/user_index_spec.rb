require 'rails_helper'

RSpec.describe 'Users index page', type: :system do
  before do
    @user = User.create(name: 'Lilly', posts_counter: 0)
  end
  it 'should show users names' do
    visit users_path
    expect(page).to have_text('Lilly')
  end

  it 'should show users images' do
    visit users_path
    expect(page).to have_css('div.img-plch')
  end

  it 'should show users posts counters' do
    visit users_path
    expect(page).to have_content("Number Of Posts: #{@user.posts_counter}")
  end

  it 'should show users names' do
    visit users_path
    click_on @user.name.to_s
    expect(page).to have_current_path user_path(@user.id)
  end
end
