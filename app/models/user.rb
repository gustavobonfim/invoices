class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invoices

  before_validation :create_detail, on: :create
  belongs_to :detail, inverse_of: :user

  def create_detail
    detail = Detail.new(birth_date: '')
    if detail.save
      self.detail_id = detail.id
    end
  end
end
