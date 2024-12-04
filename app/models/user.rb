class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :productions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         after_create :welcome_send

         def welcome_send
           TestMailer.test_email(self).deliver_now
         end

end
