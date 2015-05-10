class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # t.string :email,              :null => false, :default => ""
  # t.string :encrypted_password, :null => false, :default => ""

  # ## Recoverable
  # t.string   :reset_password_token
  # t.datetime :reset_password_sent_at

  # ## Rememberable
  # t.datetime :remember_created_at

  # ## Trackable
  # t.integer  :sign_in_count, :default => 0
  # t.datetime :current_sign_in_at
  # t.datetime :last_sign_in_at
  # t.string   :current_sign_in_ip
  # t.string   :last_sign_in_ip

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :country_users
  has_many :countries, through: :country_users

end
