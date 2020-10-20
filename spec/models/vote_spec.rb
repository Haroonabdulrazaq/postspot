require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'Check association' do
    it { is_expected.to belong_to(:article) }
    it { is_expected.to belong_to(:user) }
  end
end