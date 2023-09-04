class Message < ApplicationRecord
  belongs_to :user
  belongs_to :match

  def sender?(a_user)
    user.id == a_user.id
  end
end
