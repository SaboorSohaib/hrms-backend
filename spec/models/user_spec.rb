require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(email: 'abid@gmail.com', password: '123456')
  end

  it 'should have many employees' do
    user = User.reflect_on_association(:employees)
    expect(user.macro).to eq(:has_many)
  end
end
