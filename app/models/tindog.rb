class Tindog < ApplicationRecord
  belongs_to :receiver, class_name: "Dog", foreign_key: "receiver_id"
  belongs_to :sender,   class_name: "Dog", foreign_key: "sender_id"
end
