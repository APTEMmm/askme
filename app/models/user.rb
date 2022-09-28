class User < ApplicationRecord
  include Gravtastic

  has_many :questions, dependent: :delete_all
  has_many :asked_questions, class_name: 'Question', foreign_key: :author_id, dependent: :nullify

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :nickname, presence: true, uniqueness: true, format: { with: /\A\w+\z/ }, length: { maximum: 40 }
  validates :navbar_color, format: { with: /\A#([a-f\d]{3}){1,2}\z/i }

  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  has_secure_password

  def to_param
    nickname
  end

  private

  def reset_color!
    self.navbar_color = navbar_color.default
  end

  def downcase_nickname
    nickname&.downcase!
  end
end
