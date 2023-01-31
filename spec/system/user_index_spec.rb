require "rails_helper"

RSpec.describe "Widget management", type: :system do
  before do 
    User.create(name: "Lilly", posts_counter: 0)
  end
  it "Visit users" do
    visit users_path

    expect(page).to have_text("Lilly")
  end
end