require 'openssl'

module HumanDetector

  class Cipher
    KEY = "\xFDZ\e\x9A\r\xD2\xF6D\xA2T\xA0:\xB5p\xAE'\xB8\b\xE1\xABc\xEBP\x92\xDE\xDDU\xD0\x8F\xA0\xAB\xF7"
    IV  = "9d66dbe0f944c5e81f75a0d32d1ecb2e934804e104d86fdb1dcedcf3c3e006c0fda401c8bfb430f7ae00edf1200db66b1408c36dfbfbd8d2ef1dfc2b49b87e295b0a4b952a39072b35c0fc88ea65c9e669ddb3bbfcb7d12f84c4b233fbe774bfc9edabe1993420218435ace6e859d39b4601712f1928f4e04f765189ec518f7a"

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
