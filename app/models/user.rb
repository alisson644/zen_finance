class User < ApplicationRecord
  after_save_commit :create_source
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transactions
  has_many :sources

  validates :name, presence: true

  private

  def create_source
    Source.create(name: 'Banco', user_id: id)
    Source.create(name: 'Dinheiro', user_id: id)
  end
end
