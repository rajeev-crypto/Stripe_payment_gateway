class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   has_one :subscription
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   after_create :create_subscription
   def create_subscription 
     Subscription.create(user_id: id) if subscription.nil?
   end 

end
