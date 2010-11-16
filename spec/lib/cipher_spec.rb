require 'spec_helper'

describe HumanDetector::Cipher do

  subject { HumanDetector::Cipher }

  describe "constants" do

    it "defines KEY as a constant" do
      subject.const_defined? 'KEY'
    end

    it "defines IV as a constant" do
      subject.const_defined? 'IV'
    end

  end # constants

  describe "class methods" do

    describe "encrypt" do

      it "is available as a class method" do
        subject.respond_to? :encrypt
      end

      it "it accepts a single non-optional parameter" do
        subject.method(:encrypt).arity.should == 1
      end

      it "returns nil when passed nil" do
        subject.encrypt(nil).should be_nil
      end

      it "returns the encrypted text" do
        # We need to use the decrypt due to the fact that IV is a randomly generated value
        subject.decrypt(subject.encrypt('gnomeslab')).should == 'gnomeslab'
      end

    end # encrypt

    describe "decrypt" do

      it "is available as a class method" do
        subject.respond_to? :decrypt
      end

      it "it accepts a single non-optional parameter" do
        subject.method(:decrypt).arity.should == 1
      end

      it "returns nil when passed nil" do
        subject.decrypt(nil).should be_nil
      end

      it "returnes the raw string" do
        subject.decrypt("lOsALS7ceDWRpYz9gRfeUuaEsrv0OU6i6N1Y4ZyVioY=%0A").should == 'gnomeslab'
      end

    end # decrypt

  end # class methods

end # HumanDetector::Cipher
