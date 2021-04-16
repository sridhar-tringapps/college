class User < ApplicationRecord

  enum role: [:student, :teacher, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :student
    end
  end

  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates :name, presence:true
  validates :password, presence:true, format: PASSWORD_FORMAT
  validates :email, presence:true, format: { with: URI::MailTo::EMAIL_REGEXP } 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_msg
  def welcome_msg
    ActionJob.set(wait: 3.seconds).perform_later(User.last)
  end
end
