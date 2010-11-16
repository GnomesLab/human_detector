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

      it "returnes the encrypted string" do
        subject.encrypt('gnomeslab').should_not be_nil
      end

    end # encrypt

  end # class methods

end # HumanDetector::Cipher
