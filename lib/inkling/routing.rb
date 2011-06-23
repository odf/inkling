
module Inkling
  module Routing
    module Helpers
      def inkling_match(resource)
        
        if resource.is_a? Symbol
          klass = resource.to_s.classify
        elsif resource.is_a? String
          klass = resource.classify
        else
          raise StandardError("Inkling: inkling_match(foo) is wrong; foo should be a Symbol or a String -'foo/bar' for Foo::Bar. :foo for Foo.")
        end
        
        match '/*path(.:format)' => "#{resource}#show", :as => resource, :constraints => Inkling::Routing::TypeConstraint.new(klass)
      end
    end
        
    class TypeConstraint
      attr_accessor :type

      def initialize(type, prefix = nil)
        @type = type
        @prefix = prefix
      end

      def matches?(request)
        path = @prefix.nil? ? request.path : request.path.gsub(@prefix, "")
        matching_path = Inkling::Path.find_by_slug(path)

        if matching_path
          result = matching_path.content.is_a? @type.constantize
          request.params[:id] = matching_path.content.id if result
          result
        else
          false
        end
      end
    end
  end
end