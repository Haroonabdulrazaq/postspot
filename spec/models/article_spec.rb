require 'rails_helper'

RSpec.describe Article, type: :model do
  before { @article = FactoryGirl.build(:article) }

  context 'should respond to all given fields' do
    it { should respond_to(:title) }
    it { should respond_to(:text) }
    it { should respond_to(:image) }
    it { should respond_to(:category_id) }
  end

  context 'Check articles association has_many' do
    it { is_expected.to have_many(:votes) }
  end

  context 'Check articles association belong_to' do
    it { is_expected.to belong_to(:creator) }
    it { is_expected.to belong_to(:category) }
  end

  context 'Validates presence of all given fields' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:category_id) }
  end
  

end