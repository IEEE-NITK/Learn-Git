class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:google_oauth2,:github]
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


 has_and_belongs_to_many :teams
 has_many :repos
 has_many :courses, as: :author


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"] , provider: "google").first

    unless user
        user = User.create!(name: data["name"],
         email: data["email"],
         password: Devise.friendly_token[0,20],
         provider: "google",
         uid: nil
         )
    end
    user
end


  def self.find_for_github(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"], provider: "github").first

    unless user
        user = User.create!(name: data["name"],
         email: data["email"],
         password: Devise.friendly_token[0,20],
         provider: "github",
         uid: nil
         )
    end
    user
end


end
