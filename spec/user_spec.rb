require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid' do
    user = User.create(name: nil)
    expect(user).to_not be_valid
  end
end
