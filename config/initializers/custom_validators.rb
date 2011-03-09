class ClassNameValidator < ActiveModel::EachValidator
  def validate_each record, attr, value
    klass = (eval(value) rescue nil)
    unless klass.is_a?(Class) and self.class_is_ok(record, attr, klass)
      record.errors[attr] << (options[:message] || "Not a valid Feed Format class name")
    end
  end

  def class_is_ok record, attr, klass
    true
  end
end

class ClassHasMethodsValidator < ClassNameValidator
  def class_is_ok record, attr, klass
    m = required_methods
    required_method_names = m.keys
    unless (klass.instance_methods & required_method_names) == required_method_names
      missing = (required_method_names-klass.instance_methods).map(&:to_s)
      record.errors[attr] << ("Feed Format #{klass.name} lacks required methods #{missing*', '}")
      return false
    end

    required_method_names.all? do |k|
      unless (a = klass.instance_method(k).arity) == (e = required_methods[k])
        record.errors[attr] << ("Feed Format #{klass.name} has required method #{k} with incorrect arity #{a} (expected #{e})")
        return false
      end
    end
    true
  end
end

class FeedFormatValidator < ClassHasMethodsValidator
  def required_methods
    {:generate => 1}
  end
end
