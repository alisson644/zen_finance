require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'database' do
    context 'index' do
      it { is_expected.to have_db_index :source_id }
      it { is_expected.to have_db_index :user_id }
    end
    context 'columns' do
      it { is_expected.to have_db_column(:kind) }
      it { is_expected.to have_db_column(:description) }
      it { is_expected.to have_db_column(:value) }
      it { is_expected.to have_db_column(:user_id) }
      it { is_expected.to have_db_column(:source_id) }
      it { is_expected.to have_db_column(:date_transaction) }
    end
  end

  describe 'relationship' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :source }
  end
end
