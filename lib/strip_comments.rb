# frozen_string_literal: true

require_relative "strip_comments/version"

module StripComments
  class Error < StandardError; end

  def self.strip(language, str) 
    case language
    when "yaml", "yml"
      strip_yaml(str)
    when "glsl"
      strip_glsl(str)
    when "css"
      strip_css(str)
    else
      raise Error.new("unknown language '#{language}'")
    end
  end

  def self.strip_yaml(str)
    str.gsub(/#[^\n]+/, '')
  end

  def self.strip_glsl(str)
    strip_c_like(str)
  end

  def self.strip_css(str)
    strip_c_like(str)
  end

  def self.strip_c_like(str)
    str.gsub(/\/\/[^\n]+/, '')
        .gsub(/\/\*.+?\*\//m, '')
  end
end
