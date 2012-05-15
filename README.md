
# RenderObject

Simply map an object to a partial and render it.
For instance, to render path/to/partial/some_object.html.erb, simply use in your view:

<pre>
render_object SomeObject.new, :path => "path/to/partial"
</pre>

