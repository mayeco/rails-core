class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable, :omniauthable,
         omniauth_providers: [ :google_oauth2, :facebook, :microsoft_graph ]


  def self.from_omniauth(auth)
    raise if auth.provider.blank? || auth.uid.blank?

    # Si el usuario ya existe, no lo crea de nuevo
    # Si no existe, lo crea
    # Si el uid ya está en uso, no lo crea
    # Si el uid no está en uso, lo crea
    # Si el uid es nil, no lo crea
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.from_omniauth_email(auth)
    raise if auth.info.email.blank?

    # Si el usuario ya existe, no lo crea de nuevo
    # Si no existe, lo crea
    # Si el email ya está en uso, no lo crea
    # Si el email no está en uso, lo crea
    # Si el email es nil, no lo crea
    where(email: auth.info.email).first_or_initialize do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
