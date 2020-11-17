class User < ApplicationRecord
    has_secure_password

    has_many :interests, :dependent => :delete_all

    has_many :friendships_as_user1, foreign_key: :user1_id, class_name: "Friendship", dependent: :destroy
    has_many :user2s, through: :friendships_as_user1, source: :user2

    has_many :friendships_as_user2, foreign_key: :user2_id, class_name: "Friendship", dependent: :destroy
    has_many :user1s, through: :friendships_as_user2, source: :user1

    has_many :chats_as_user1, foreign_key: :user1_id, class_name: "Chat", dependent: :destroy
    has_many :user2s, through: :chats_as_user1, source: :user2

    has_many :chats_as_user2, foreign_key: :user2_id, class_name: "Chat", dependent: :destroy
    has_many :user1s, through: :chats_as_user2, source: :user1

    has_many :events_as_user1, foreign_key: :user1_id, class_name: "Event", dependent: :destroy
    has_many :user2s, through: :events_as_user1, source: :user2

    has_many :events_as_user2, foreign_key: :user2_id, class_name: "Event", dependent: :destroy
    has_many :user1s, through: :events_as_user2, source: :user1

    has_many :messages, :dependent => :delete_all

    validates_presence_of :username, :email, :password, :age, :gender, :zip_code, :parties, :picture
    validates_uniqueness_of :username, :case_sensitive => false
    validates :zip_code, length: { is: 5 }, numericality: { only_integer: true }
    validates :age, numericality: { only_integer: true }
    validates_format_of :zip_code,
        with: /\A\d{5}-\d{4}|\A\d{5}\z/

    def all_friendships
        self.friendships_as_user1 + self.friendships_as_user2
    end

    def all_chats
        self.chats_as_user1 + self.chats_as_user2
    end

    def all_events
        self.events_as_user1 + self.events_as_user2
    end
    
end
