 require 'spec_helper'

describe Ntail::LogLine do

  let(:raw_log_line) {
    "Foo Bar Blegga Qux Thud"
  }

  let(:log_line_regexp) {
    /Blegga/
  }

  let(:filename) {
    "foo/bar/blegga.log"
  }

  let(:line_number) {
    666
  }

  describe '#initialize' do

    it 'requires raw_log_line and log_line_regexp as mandatory parameters' do
      # when
      log_line = described_class.new(raw_log_line, log_line_regexp)
      # then
      log_line.raw_log_line.should be raw_log_line
      # and
      log_line.log_line_regexp.should be log_line_regexp
    end

    it 'throws an exception if both raw_log_line and log_line_regexp are missing' do
      # when/then
      expect {
        described_class.new(nil, nil)
      }.to raise_error(ArgumentError, "Required 'raw_log_line' and 'log_line_regexp' parameters are missing")
    end

    it 'throws an exception if raw_log_line is missing' do
      # when/then
      expect {
        described_class.new(nil, log_line_regexp)
      }.to raise_error(ArgumentError, "Required 'raw_log_line' parameter is missing")
    end

    it 'throws an exception if raw_log_line is not a String' do
      # when/then
      expect {
        described_class.new(Object.new, log_line_regexp)
      }.to raise_error(ArgumentError, "Paramter 'raw_log_line' should be a String")
    end

    it 'throws an exception if log_line_regexp is missing' do
      # when/then
      expect {
        described_class.new(raw_log_line, nil)
      }.to raise_error(ArgumentError, "Required 'log_line_regexp' parameter is missing")
    end

    it 'throws an exception if raw_log_line is not a Regexp' do
      # when/then
      expect {
        described_class.new(raw_log_line, Object.new)
      }.to raise_error(ArgumentError, "Paramter 'log_line_regexp' should be a Regexp")
    end

    it 'accepts filename and line number as optional parameters' do
      # when
      log_line = described_class.new(raw_log_line, log_line_regexp, filename, line_number)
      # then
      log_line.filename.should be filename
      # and
      log_line.line_number.should be line_number
    end

    it 'still works if filename and line number are missing' do
      # when
      log_line = described_class.new(raw_log_line, log_line_regexp)
      # then
      log_line.filename.should be_nil
      # and
      log_line.line_number.should be_nil
    end

    it 'still works if filename and line number are nil' do
      # when
      log_line = described_class.new(raw_log_line, log_line_regexp, nil, nil)
      # then
      log_line.filename.should be_nil
      # and
      log_line.line_number.should be_nil
    end

  end

  describe '#parsable' do

    it 'is true when raw_log_line matches log_line_regexp' do
      # given/when
      log_line = described_class.new('Foo Bar Blegga Qux Thud', /Blegga/)
      # then
      log_line.parsable.should be_true
    end

    it 'is false when raw_log_line does not match log_line_regexp' do
      # given/when
      log_line = described_class.new('Foo Bar Blegga Qux Thud', /Square/)
      # then
      log_line.parsable.should be_false
    end

  end

  describe '#components' do

    let(:log_line) {
      described_class.new(raw_log_line, log_line_regexp)
    }

    it 'stores the log line components as a Hash' do
      log_line.components.should be_instance_of(Hash)
    end

    it 'should always have a "prefix" entry' do
      log_line.components.should have_key 'prefix'
    end

    it 'should always have a "suffix" entry' do
      log_line.components.should have_key 'suffix'
    end

    it 'should always include the captured prefix and suffix when not empty' do
      # given/when
      log_line = described_class.new("Foo Bar Blegga Qux Thud", / Blegga /)
      # then
      log_line.components['prefix'].should eq "Foo Bar"
      # and
      log_line.components['suffix'].should eq "Qux Thud"
    end

    it 'should always include the captured prefix and suffix even when empty' do
      # given/when
      log_line = described_class.new("Foo Bar Blegga Qux Thud", /Foo Bar Blegga Qux Thud/)
      # then
      log_line.components['prefix'].should eq ""
      # and
      log_line.components['suffix'].should eq ""
    end

    it 'should always include the named captures in the regexp' do
      # given/when
      log_line = described_class.new("Foo Bar Blegga Qux Thud", / (?<first>.*) (?<second>.*) (?<third>.*) /)
      # then
      log_line.components['prefix'].should eq "Foo"
      log_line.components['suffix'].should eq "Thud"
      # and
      log_line.components['first'].should eq "Bar"
      log_line.components['second'].should eq "Blegga"
      log_line.components['third'].should eq "Qux"
    end

  end

end