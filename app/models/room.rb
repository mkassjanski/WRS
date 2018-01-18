class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  def id_to_select
  title
  end
end
