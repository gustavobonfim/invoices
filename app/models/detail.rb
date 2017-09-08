class Detail < ApplicationRecord
  has_one :user, inverse_of: :detail, dependent: :destroy
end
