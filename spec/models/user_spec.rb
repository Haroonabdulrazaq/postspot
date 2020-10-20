require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryBot.build(:user) }

  it "has a valid factory" do
    expect(@user).to be_valid
  end

  context 'Users association' do
    it {should have_many(:articles)}
    it {should have_many(:votes)}
  end

  context 'Check presence of attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password)}
  end

  context 'User should respond to all given field' do
    it { expect(@user).to respond_to(:name) }
    it { expect(@user).to respond_to(:password) }
  end
end