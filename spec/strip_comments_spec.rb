# frozen_string_literal: true

require "pathname"

RSpec.describe StripComments do
  it "has a version number" do
    expect(StripComments::VERSION).not_to be nil
  end

  Dir.glob(File.join(File.dirname(__FILE__), "tests", "*")).each do |filename|
    language = Pathname.new(filename).split.last.to_s
    extension = language

    describe "#{language}" do
      Dir.glob(File.join(filename, "*")).reject { |f| f.include?(".expected") }.each do |test|
        test_filename = Pathname.new(test).split.last.to_s

        describe "#{test_filename}" do
          expected = test.gsub(/(.*)\./, '\\1.expected.')
          expected_filename = Pathname.new(expected).split.last.to_s

          it "is stripped to #{expected_filename}" do
            input = File.open(test).read
            goal = File.open(expected).read

            expect(StripComments::strip(language, input)).to eq goal
          end
        end
      end
    end
  end
end
