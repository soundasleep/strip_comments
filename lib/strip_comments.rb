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
    when "properties"
      strip_properties(str)
    when "html"
      strip_html(str)
    else
      raise Error.new("unknown language '#{language}'")
    end
  end

  def self.strip_yaml(str)
    str.gsub(/#[^\n]+/, '')
  end

  def self.strip_properties(str)
    str.gsub(/(\n)[\t ]*#[^\n]+/, '\\1')
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

  def self.strip_html(str)
    str.gsub(/<!--.+?-->/m, '')
  end
end
