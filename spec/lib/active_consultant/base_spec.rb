require 'spec_helper'

describe ActiveConsultant::Base do
  class TestConsultant < ActiveConsultant::Base
    attr_reader :bar, :baz

    attribute :foo, String
    validates :foo, :presence => true

    before_work :_set_baz

    def run
      @bar = @foo.split('_')
    end

    def run!
      raise "foo must contain an underscore" unless @foo.include?('_')
      @bar = @foo.split('_')
    end

    private

    def _set_baz
      @baz = "blah"
    end
  end

  subject { TestConsultant.new(:foo => "foo_bar_baz") }

  describe "#work" do
    context "when the consultant is valid" do
      it "should perform the job" do
        subject.work
        subject.bar.should eq(['foo', 'bar', 'baz'])
      end
    end

    context "when the consultant is invalid" do
      subject { TestConsultant.new }

      it "should not perform the job" do
        subject.work
        subject.bar.should be_nil
      end
    end

    it "should run the callbacks for work" do
      subject.work
      subject.baz.should eq("blah")
    end
  end

  describe "#work!" do
    context "when the consultant is valid" do
      it "should perform the job" do
        subject.work!
        subject.bar.should eq(['foo', 'bar', 'baz'])
      end
    end

    context "when the consultant is invalid" do
      subject { TestConsultant.new }

      it "should not perform the job" do
        expect { subject.work! }.to raise_exception
      end
    end

    it "should run the callbacks for work" do
      subject.work!
      subject.baz.should eq("blah")
    end
  end
end
