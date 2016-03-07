class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  # devise :omniauthable
  has_many :activities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable,:omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar,
                    storage: :s3,
                      s3_credentials: {access_key_id: "AKIAI7WOEREUHDIAOGIQ", secret_access_key: "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"}
  do_not_validate_attachment_file_type :avatar


  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_now
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end


  def role?(role)
    self.roles == role.to_s
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
