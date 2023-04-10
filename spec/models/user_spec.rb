require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'database' do
    context 'index' do
      it { is_expected.to have_db_index :email }
      it { is_expected.to have_db_index :reset_password_token }
    end
    context 'columns' do
      it { is_expected.to have_db_column(:name) }
      it { is_expected.to have_db_column(:email) }
      it { is_expected.to have_db_column(:encrypted_password) }
      it { is_expected.to have_db_column(:reset_password_token) }
      it { is_expected.to have_db_column(:reset_password_sent_at) }
      it { is_expected.to have_db_column(:remember_created_at) }
      it { is_expected.to have_db_column(:name) }
    end
  end

  describe 'relationship' do
    it { is_expected.to have_many :movimentations }
    it { is_expected.to have_many :sources }
  end

  describe 'create user' do
    subject { FactoryBot.build(:user) }

    it { should validate_presence_of(:name) }
  end
end
