class Event < ApplicationRecord
    belongs_to :user1, class_name: "User", foreign_key: "user1_id"
    belongs_to :user2, class_name: "User", foreign_key: "user2_id"

    validates_presence_of :user1_id, :user2_id, :name, :description, :time
end
