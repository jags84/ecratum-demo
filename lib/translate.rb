module Translate
  # Api URL
  API_URL_FUN = 'http://api.funtranslations.com/translate/'
  API_URL_DEGRAEVE= 'http://www.degraeve.com/cgi-bin/babel.cgi?'

  def self.translate_message message,dialect=nil
    return nil if (message.nil? || message == '')
    case dialect
      when "Yoda"
        yoda message
      when "Valley Girl"
        val message
      when "Binary Code"
        binary message
      else
        nil
    end
  end

  def self.yoda message
    response = HTTParty.post(API_URL_FUN+'yoda?text='+message)
    if response['error']['code'] == 200
      return JSON.parse(response.body)['contents']['translated']
    else
      response = HTTParty.get(API_URL_DEGRAEVE+'d=yoda&w='+message)
      response.body.match(/<p>(.*)<\/p>/mi).captures.first.delete("\n")
    end
  end

  def self.val message
    response = HTTParty.post(API_URL_FUN+'valspeak?text='+message)
    if response['error']['code'] == 200
      JSON.parse(response.body)['contents']['translated']
    else
      response = HTTParty.get(API_URL_DEGRAEVE+'d=valley&w='+message)
      response.body.match(/<p>(.*)<\/p>/mi).captures.first.delete("\n")
    end
  end

  def self.binary message
    response = HTTParty.get(API_URL_DEGRAEVE+'d=binary&w='+message)
    response.body.match(/<p>(.*)<\/p>/mi).captures.first.delete("\n")
  end
end
