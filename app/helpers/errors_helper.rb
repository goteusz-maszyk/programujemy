module ErrorsHelper
  INVALID_CLASS = 'is-invalid'
  VISIBLE_CLASS = 'd-block'
  ERROR_FORM_MESSAGE = "To pole nie może być puste."
  SUCCESS_FORM_MESSAGE = "OK"
  
  def error_message(item, key)
    item.errors.messages[key].first if item.errors.messages[key]
  end

  def error_message_class(item, key)
    INVALID_CLASS if error_message(item, key)
  end

  def quote_error(item, key, errors)
    errors[item.to_sym][key].first if errors && errors[item.to_sym] && errors[item.to_sym][key].any?
  end

  def quote_error_class(item, key, errors)
    INVALID_CLASS if quote_error(item, key, errors)
  end

  def array_error(item, index, key, errors)
    error_in_given_product = index &&
      errors &&
      errors[item.to_sym] &&
      errors[item.to_sym][index] &&
      errors[item.to_sym][index][key].any?

    errors[item.to_sym][index][key].first if error_in_given_product
  end

  def array_error_class(item, index, key, errors)
    INVALID_CLASS if array_error(item, index, key, errors)
  end

  def product_error(index, errors)
    I18n.t('errors.product') if array_error(:products, index, :product, errors)
  end

  def general_error_display_class(key, errors)
    VISIBLE_CLASS if general_error(key, errors)
  end

  def general_array_error_display_class(item, index, key, errors)
    VISIBLE_CLASS if array_error(item, index, key, errors)
  end

  def general_error(key, errors)
    errors[key] if errors
  end
end
