
require "render_object/version"
require "rubygems"
require "active_support"

module RenderObject
  def render_object(object, options = {})
    path = [options[:path], object.class.name.underscore].reject(&:blank?)

    render options.except(:path).merge(:partial => File.join(*path), :object => object)
  end

  def render_objects(objects, options = {})
    res = ""

    objects.each do |object|
      res << render_object(object, options)
    end

    res
  end
end

module ActionView
  class Base
    include RenderObject
  end
end

