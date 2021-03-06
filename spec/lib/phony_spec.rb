# encoding: utf-8
#
require 'spec_helper'

describe Phony do
  
  describe "split" do
    it 'handles afghan numbers' do
      Phony.split('93201234567').should == ['93', '20', '1234567'] # Kabul
    end
    it "should handle austrian numbers" do
      Phony.split('43198110').should == ['43', '1', '98110']
    end
    it 'handles brazilian numbers' do
      Phony.split('551112341234').should == ['55', '11', '1234', '1234']
    end
    it 'handles chilean numbers' do
      Phony.split('5621234567').should == ['56', '2', '1234567']   # Santiago
      Phony.split('5675123456').should == ['56', '75', '123456']   # Curico
      Phony.split('56912345678').should == ['56', '9', '12345678'] # mobile
    end
    it 'handles danish numbers' do
      Phony.split('4532121212').should == ['45', '32', '12', '12', '12']
    end
    it 'handles dutch numbers' do
      Phony.split('31612345678').should == ['31', '6', '12345678'] # mobile
      Phony.split('31201234567').should == ['31', '20', '1234567']
      Phony.split('31222123456').should == ['31', '222', '123456']
    end
    it "should handle egyptian numbers" do
      Phony.split('20212345678').should == ['20', '2', '12345678']
      Phony.split('20951234567').should == ['20', '95', '1234567']
    end
    it "should handle french numbers" do
      Phony.split('33112345678').should == ['33', '1', '12','34','56','78']
    end
    it "should handle german numbers" do
      Phony.split('4930123456').should ==   ['49', '30', '123', '456']
      Phony.split('4976112345').should ==   ['49', '761', '123', '45']
      Phony.split('492041123456').should == ['49', '2041', '123', '456']
      Phony.split('493434112345').should == ['49', '34341', '123', '45'] # Geithain
    end
    it "should handle greek numbers" do
      Phony.split('3022631234').should == ['30', '2263', '1234']
    end
    it "should handle hungarian numbers" do
      Phony.split('3612345678').should == ['36', '1', '234', '5678']
    end
    it "should handle italian numbers" do
      Phony.split('3928061371').should == ['39', '2', '806', '1371']
    end
    it 'handles peruvian numbers' do
      Phony.split('51112341234').should == ['51', '1', '1234', '1234'] # Lima
      Phony.split('51912341234').should == ['51', '9', '1234', '1234'] # mobile
      Phony.split('51841234123').should == ['51', '84', '1234', '123'] # Cuzco, best effort
    end
    it "should handle polish numbers" do
      Phony.split('48121123123').should == ['48', '12', '1', '123', '123']
    end
    it 'handles romanian numbers' do
      Phony.split('40211231234').should == ['40', '21', '123', '1234'] # Bucureşti
      Phony.split('40721231234').should == ['40', '72', '123', '1234'] # mobile
      Phony.split('40249123123').should == ['40', '249', '123', '123'] # Olt
    end
    it 'handles russian numbers' do
      Phony.split('78122345678').should == ['7', '812', '234', '56', '78']
    end
    it "should handle swedish numbers" do
      Phony.split('46812345678').should == ['46', '8', '12345678']
      Phony.split('46111234567').should == ['46', '11', '1234567']
      Phony.split('46125123456').should == ['46', '125', '123456']
    end
    it "should handle swiss numbers" do
      Phony.split('41443643532').should == ['41', '44', '364', '35', '32']
    end
    it "should handle US numbers" do
      Phony.split('15551115511').should == ['1', '555', '111', '5511']
    end
    it "should handle venezuelan numbers" do
      Phony.split('582121234567').should == ["58", "212", "1234567"]
    end
    it "should handle new zealand numbers" do
      Phony.split('6491234567').should == ['64', '9', '123', '4567']
    end
    
    it "should handle french service numbers" do
      Phony.split('33812345678').should == ['33', '8', '12','34','56','78']
    end
    it "should handle swiss service numbers" do
      Phony.split('41800334455').should == ['41', '800', '334', '455']
    end
  end
  
  describe "normalize" do
    describe "some examples" do
      it "should normalize an already normalized number" do
        Phony.normalize('41443643533').should == '41443643533'
      end
      it "should normalize a formatted number" do
        Phony.normalize('+41 44 364 35 33').should == '41443643533'
      end
      it "should normalize a formatted number" do
        Phony.normalize('+41 44 364 35 33').should == '41443643533'
      end
      it "should normalize a service number" do
        Phony.normalize('+41 800 11 22 33').should == '41800112233'
      end
      it "should remove characters from the number" do
        Phony.normalize('John: +41 44 364 35 33').should == '41443643533'
      end
      it "should normalize one of these crazy american numbers" do
        Phony.normalize('1 (703) 451-5115').should == '17034515115'
      end
      it "should normalize another one of these crazy american numbers" do
        Phony.normalize('1-888-407-4747').should == '18884074747'
      end
      it "should normalize a number with colons" do
        Phony.normalize('1.906.387.1698').should == '19063871698'
      end
      it "should normalize a number with optional ndc" do
        Phony.normalize('+41 (044) 364 35 33').should == '41443643533'
      end
      it "should normalize a number with erroneous zero inside" do
        Phony.normalize('+410443643533').should == '41443643533'
      end
    end
  end
  
  describe "formatted" do
    describe "default" do
      it "should format swiss numbers" do
        Phony.formatted('41443643532').should == '+41 44 364 35 32'
      end
      # TODO
      #
      it "should format swiss service numbers" do
        Phony.formatted('41800112233').should == '+41 800 112 233'
      end
      it "should format austrian numbers" do
        Phony.formatted('43198110').should == '+43 1 98110'
      end
      it "should format american numbers" do
        Phony.formatted('18705551122').should == '+1 870 555 1122'
      end
    end
    describe "international" do
      it "should format north american numbers" do
        Phony.formatted('18091231234', :format => :international).should == '+1 809 123 1234'
      end
      it "should format austrian numbers" do
        Phony.formatted('43198110', :format => :international).should == '+43 1 98110'
      end
      it "should format austrian numbers" do
        Phony.formatted('43198110', :format => :international_absolute).should == '+43 1 98110'
      end
      it "should format french numbers" do
        Phony.formatted('33142278186', :format => :+).should == '+33 1 42 27 81 86'
      end
      it "should format austrian numbers" do
        Phony.formatted('43198110', :format => :international_relative).should == '0043 1 98110'
      end
      it 'should format liechtensteiner numbers' do
        Phony.formatted('4233841148', :format => :international_relative).should == '00423 384 11 48'
      end
      context 'with no spaces' do
        it "should format north american numbers" do
          Phony.formatted('18091231234', :format => :international, :spaces => '').should == '+18091231234'
        end
        it "should format austrian numbers" do
          Phony.formatted('43198110', :format => :international, :spaces => '').should == '+43198110'
        end
        it "should format austrian numbers" do
          Phony.formatted('43198110', :format => :international_absolute, :spaces => '').should == '+43198110'
        end
        it "should format french numbers" do
          Phony.formatted('33142278186', :format => :+, :spaces => '').should == '+33142278186'
        end
        it "should format austrian numbers" do
          Phony.formatted('43198110', :format => :international_relative, :spaces => '').should == '0043198110'
        end
        it 'should format liechtensteiner numbers' do
          Phony.formatted('4233841148', :format => :international_relative, :spaces => '').should == '004233841148'
        end
      end
      context 'with special spaces' do
        it "should format swiss numbers" do
          Phony.formatted('41443643532', :format => :international).should == '+41 44 364 35 32'
        end
        it "should format north american numbers" do
          Phony.formatted('18091231234', :format => :international, :spaces => :-).should == '+1-809-123-1234'
        end
        it "should format austrian numbers" do
          Phony.formatted('43198110', :format => :international, :spaces => :-).should == '+43-1-98110'
        end
        it "should format austrian numbers" do
          Phony.formatted('43198110', :format => :international_absolute, :spaces => :-).should == '+43-1-98110'
        end
        it "should format french numbers" do
          Phony.formatted('33142278186', :format => :+, :spaces => :-).should == '+33-1-42-27-81-86'
        end
        it "should format austrian numbers" do
          Phony.formatted('43198110', :format => :international_relative, :spaces => :-).should == '0043-1-98110'
        end
        it 'should format liechtensteiner numbers' do
          Phony.formatted('4233841148', :format => :international_relative, :spaces => :-).should == '00423-384-11-48'
        end
      end
    end
    describe "national" do
      it "should format swiss numbers" do
        Phony.formatted('41443643532', :format => :national).should == '044 364 35 32'
      end
      # TODO
      #
      it "should format swiss service numbers" do
        Phony.formatted('41800112233', :format => :national).should == '0800 112 233'
      end
      it "should format austrian numbers" do
        Phony.formatted('43198110', :format => :national).should == '01 98110'
      end
    end
    describe "local" do
      it "should format swiss numbers" do
        Phony.formatted('41443643532', :format => :local).should == '364 35 32'
      end
      it "should format german numbers" do
        Phony.formatted('493038625454', :format => :local).should == '386 25454'
      end
    end
  end
  
  context "speed" do
    before(:each) do
      @phone_numbers = [
        '41443643532',
        '18091231234',
        '43198110',
        '33142278186',
        '4233841148'
      ]
    end
    describe 'split' do
      it 'is fast' do
        number = @phone_numbers.first
        performance_of { Phony.split(number) }.should < 0.00005
      end
      it 'is fast' do
        performance_of { @phone_numbers.each { |number| Phony.split(number) } }.should < 0.00015
      end
    end
    describe 'normalize' do
      it 'is fast' do
        number = @phone_numbers.first
        performance_of { Phony.normalize(number) }.should < 0.0001
      end
      it 'is fast' do
        performance_of { @phone_numbers.each { |number| Phony.normalize(number) } }.should < 0.00015
      end
    end
    describe 'formatted' do
      it 'is fast' do
        number = @phone_numbers.first
        performance_of { Phony.formatted(number) }.should < 0.000075
      end
      it 'is fast' do
        performance_of { @phone_numbers.each { |number| Phony.formatted(number) } }.should < 0.00015
      end
    end
  end
  
  # describe "service?" do
  # 
  # end
  # describe "mobile?" do
  #   # TODO Test dirty numbers.
  #   #
  #   it 'is correct' do
  #     Phony.mobile?('49172123456').should == true
  #   end
  #   it 'is correct' do
  #     Phony.mobile?('12172123456').should == false
  #   end
  # end
  
  describe 'vanity' do
    describe 'vanity_number?' do
      it {Phony.vanity?('41800 WEGGLI').should be_true}
      it {Phony.vanity?('41800WEGGLI').should be_true}
      it {Phony.vanity?('41848 SUCCESSMATCH').should be_true}
      it {Phony.vanity?('4180 NO NO NO').should be_false}
      it {Phony.vanity?('41900 KURZ').should be_false}
      it {Phony.vanity?('41 44 364 35 32').should be_false}
    end
    
    describe 'vanity_to_number' do
      it {Phony.vanity_to_number('41800WEGGLI').should == '41800934454'}
      it {Phony.vanity_to_number('41800weggli').should == '41800934454'}
      it {Phony.vanity_to_number('41800SUCCESSMATCH').should == '41800782237'} # Cut off according to the swiss norms.
      it {Phony.vanity_to_number('4180BLA').should == '4180252'} # Does not check for validity of number.
    end
  end

end