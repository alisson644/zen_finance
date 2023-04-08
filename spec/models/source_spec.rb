require 'rails_helper'

RSpec.describe Source, type: :model do
  describe 'database' do
    context 'index' do
      it { is_expected.to have_db_index :user_id }
    end
    context 'columns' do
      it { is_expected.to have_db_column(:name) }
      it { is_expected.to have_db_column(:user_id) }
    end
  end

  describe 'relationship' do
    it { is_expected.to belong_to :user }
  end
end
