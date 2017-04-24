class User < ApplicationRecord
  require 'securerandom'
  has_many :messages, dependent: :destroy

  def avatar
    Faker::Avatar.image(SecureRandom.hex(8),"48x48")
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
end
