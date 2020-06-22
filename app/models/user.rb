class User < ApplicationRecord
    VALID_EMAIl_REGEP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy
    validates :username, presence: true,
                         uniqueness: { case_sensitive:false },
                         length: { minimum:3,maximum:25 }
    validates :email,presence: true,
                         uniqueness: { case_sensitive:false },
                         format: { with: VALID_EMAIl_REGEP }
    has_secure_password
end