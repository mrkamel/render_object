
require "test/unit"
require File.expand_path("../../lib/render_object", __FILE__)

=begin
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
=end

class TestObject
end

module ActionView
  class Base
    attr_reader :traces

    def initialize
      @traces = []
    end

    def render(options)
      @traces.push options

      options.inspect
    end
  end
end

class RenderObjectTest < Test::Unit::TestCase
  def setup
    @view = ActionView::Base.new
  end

  def test_render_object
    object = TestObject.new

    @view.render_object object, :locals => { :test => true }

    assert_equal({ :object => object, :partial => "test_object", :locals => { :test => true } }, @view.traces.last)
  end

  def test_render_object_with_path
    object = TestObject.new

    @view.render_object object, :path => "path/to/partial"

    assert_equal({ :object => object, :partial => "path/to/partial/test_object" }, @view.traces.last)
  end

  def test_render_objects
    object1 = TestObject.new
    object2 = TestObject.new

    @view.render_objects [object1, object2], :locals => { :test => true }

    assert_equal([{ :object => object1, :partial => "test_object", :locals => { :test => true } },
      { :object => object2, :partial => "test_object", :locals => { :test => true } }], @view.traces)
  end

  def test_render_objects_with_path
    object1 = TestObject.new
    object2 = TestObject.new

    @view.render_objects [object1, object2], :path => "path/to/partials"

    assert_equal([{ :object => object1, :partial => "path/to/partials/test_object" },
      { :object => object2, :partial => "path/to/partials/test_object" }], @view.traces)
  end
end

