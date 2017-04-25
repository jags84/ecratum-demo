class User < ApplicationRecord
  require 'securerandom'
  has_many :messages, dependent: :destroy
  after_touch { UserStatusJob.perform_later(self,"online") }
  after_create :set_avatar

  def set_avatar
    self.update(picture: Faker::Avatar.image(SecureRandom.hex(8),"48x48"))
  end

  def dialect_icon
    case dialect
      when "Yoda"
        'yoda.png'
      when "Valley Girl"
        'tiara.png'
      when "Binary Code"
        'dexter.png'
    end
  end

  private
   def user_params
     params.require(:user).permit(:username,:dialect,:picture)
   end

end
