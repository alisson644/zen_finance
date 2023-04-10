require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'database' do
    context 'columns' do
      it { is_expected.to have_db_column(:name) }
      it { is_expected.to have_db_column(:description) }
      it { is_expected.to have_db_column(:user_id) }
    end
  end

  describe 'relationship' do
    it { is_expected.to belong_to :user }
  end
end
