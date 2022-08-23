# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :nickname, presence: true, uniqueness: true, format: { with: /\A\w+\z/ }, length: { maximum: 40 }

  has_many :questions, dependent: :delete_all

  private

  def downcase_nickname
    nickname.downcase!
  end

  def reset_color!
    self.navbar_color = navbar_color.default
  end
end
