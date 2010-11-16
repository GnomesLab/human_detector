require 'openssl'

module HumanDetector

  class Cipher
    KEY = "\xFDZ\e\x9A\r\xD2\xF6D\xA2T\xA0:\xB5p\xAE'\xB8\b\xE1\xABc\xEBP\x92\xDE\xDDU\xD0\x8F\xA0\xAB\xF7"
    IV  = "\x88@;8H=\xEE\xF0I\xE8s7\xE2\xA7\xC4\xA4\xA76|\xEB\xDE\xB2\xF1\x99J)\x87\xB9{\x04\xB5\xAD\xA89\xBB9i9\x8E\eD\xDB\n\x874r\xF8\xCE\xB5C\x1D\xEE\xEB\xD0\xB49\xF4bJ\\S@(D"

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
