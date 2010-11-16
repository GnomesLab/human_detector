require 'openssl'

module HumanDetector

  class Cipher
    KEY = "\xFDZ\e\x9A\r\xD2\xF6D\xA2T\xA0:\xB5p\xAE'\xB8\b\xE1\xABc\xEBP\x92\xDE\xDDU\xD0\x8F\xA0\xAB\xF7"
    IV  = "\xDA\xFD+\xF3.A\x05z2\xB8\xF2Lq\x8E\xB3o"

    def self.encrypt(text)
      return nil unless text
    end
  end # Cipher

end # HumanDetector
