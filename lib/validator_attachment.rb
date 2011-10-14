module ValidatorAttachment
  def is_attached?(klass, attribute, options=nil, exact_match=false)
    validators = klass._validate_callbacks.map{|vc| vc.raw_filter}
    validators = validators.find_all{ |val| val.is_a?(self) }
    return false unless validators.present?

    # for those validators I am interested in those that they have attributes that include the attribute
    validators = validators.find_all{ |val| val.attributes.present? && val.attributes.include?(attribute)}
    return false unless validators.present?

    # if options given, then validator needs to have these options too
    if options.present?
      if exact_match
        validators = validators.find_all{|val| val.options.present? && val.options == options}
      else
        # In this case, I want to find all the 'options' inside the options of the validator.
        # Even if validator has more options this is acceptable
        # The logic of comparison:
        #   I find the difference of +val.options+ to +options+ and then I remove from +val.options+ this difference.
        #   The remaining keys of +val.options+ should be hash equal to +options+
        validators = validators.find_all{|val| val.options.present? && val.options.reject{|k,v| val.options.diff(options).keys.include?(k)} == options}
      end
    end

    validators.present?
  end
end

class ActiveRecord::EachValidator
  extend ValidatorAttachment
end
