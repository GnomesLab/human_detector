require 'openssl'

module HumanDetector

  class Cipher
    KEY = "\xFDZ\e\x9A\r\xD2\xF6D\xA2T\xA0:\xB5p\xAE'\xB8\b\xE1\xABc\xEBP\x92\xDE\xDDU\xD0\x8F\xA0\xAB\xF7"
    IV  = "\xDA\xFD+\xF3.A\x05z2\xB8\xF2Lq\x8E\xB3o"

    def self.encrypt(text)
      aes_wrapper :encrypt, text
    end # encrypt

    def self.decrypt(text)
      aes_wrapper :decrypt, text
    end # decrypt

    private
      def self.aes_wrapper(direction, text)
        return nil unless text

        aes = OpenSSL::Cipher::Cipher.new('aes-256-cbc').send(direction)
        aes.key = KEY
        aes.iv = IV

        aes.update(text) << aes.final
      end

  end # Cipher

end # HumanDetector
