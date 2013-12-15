class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, 
  :password, :password_confirmation, :remember_me,
  :admin, :forem_admin, :forem_state, :forem_auto_subscribe
  
  def to_s
    email
  end
end
