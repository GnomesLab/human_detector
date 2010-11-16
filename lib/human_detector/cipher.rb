require 'openssl'

module HumanDetector

  class Cipher
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
        aes.key = '484758fc806d09ad70af78e51cda016f4072a20f7e48ee9ab898dd0466b11b4f'

        if direction == :encrypt
          aes.iv = iv = aes.random_iv
          URI.escape(ActiveSupport::Base64.encode64(iv + (aes.update(text) + aes.final)))
        else
          raw = ActiveSupport::Base64.decode64 URI.unescape(text)
          aes.iv = raw.slice! 0, 16
          aes.update(raw) + aes.final
        end
      end

  end # Cipher

end # HumanDetector
