module ValidatorAttachment

  # Given a +klass+ checks whether the target Validator is attached to
  # the given +attribute+ of the model with class +klass+. It can also check
  # whether validator is attached together with some +options+ and if these
  # +options+ are the only ones used (given +exact_math+ +true+)
  #
  # @param [Class] klass the Model class that uses the Validator
  # @param [Symbol] attribute the attribute of the Model class that we want
  #   to check whether it uses the Validator or not
  # @param [Hash] options optional parameter that, if given, will be used to
  #   check whether the Validator is attached to the +attribute of the Model +klass+
  #   but with the given +options+, even if there are more options (not exact match).
  # @param [boolean] exact_match if +true+ then the +options+ given should be matched
  #   with the +options+ of the Validator both in number and in content, and Validator
  #   should not have more or less options.
  # @return [boolean] whether Validator is attached or not
  #
  # @see http://github.com/pmatsinopoulos/validator_attachment Please project home page for more details and examples of usage.
  #
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

module ActiveModel
  class EachValidator
    extend ValidatorAttachment
  end
end
