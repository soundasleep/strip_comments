# frozen_string_literal: true

require_relative "strip_comments/version"

module StripComments
  class Error < StandardError; end

  def self.strip(language, str) 
    case language
    when "yaml", "yml"
      strip_yaml(str)
    else
      raise Error.new("unknown language '#{language}'")
    end
  end

  def self.strip_yaml(str)
    str.gsub(/#[^\n]+/, '')
  end
end
