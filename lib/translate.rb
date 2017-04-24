module Translate
  # Api URL
  API_URL_FUN = 'http://api.funtranslations.com/translate/'
  API_URL_DEGRAEVE= 'http://www.degraeve.com/cgi-bin/babel.cgi?d=binary&w='

  def self.translate_message message,dialect
    case dialect
      when "Yoda"
        yoda message
      when "Valley Girl"
        val message
      when "Binary Code"
        binary message
    end
  end

  def self.yoda message
    response = HTTParty.post(API_URL_FUN+'yoda?text='+message)
    JSON.parse(response.body)['contents']['translated']
  end

  def self.val message
    response = HTTParty.post(API_URL_FUN+'valspeak?text='+message)
    JSON.parse(response.body)['contents']['translated']
  end

  def self.binary message
    response = HTTParty.get(API_URL_DEGRAEVE+message)
    response.body.match(/<p>(.*)<\/p>/mi).captures.first.delete("\n")
  end
end
