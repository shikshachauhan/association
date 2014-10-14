class RangeValidator < ActiveModel::EachValidator
  CHECKS = { greater_than: :>,
             greater_than_or_equal_to: :>=,
             equal_to: :==, less_than: :<,
             less_than_or_equal_to: :<=,
             other_than: :!= }


  def validate_each(record, attr_name, value)
    options.each do |option, option_value|
      if option_value
        unless value.send(CHECKS[option], option_value)
          record.errors[attr_name] << (options[:message] || "has failed validation")
        end
      end
    end  
  end

end