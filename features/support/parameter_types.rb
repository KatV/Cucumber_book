require 'money'

# encoding: utf-8"
# In 3.0.0, int conversion is built-in, so there is no need for that transform.
# CAPTURE_CASH_AMOUNT = Transform(/^(£|\$|€)(\d+)$/) do |currency_symbol, digits|
#   # Obviously we have to create a Currency::Money class to make this work.
#   Currency::Money.new(digits, currency_symbol)
# end

ParameterType(
    name: 'capture_cash_amount',
    regexp: /(EUR|USD|GBP)(\d+)/,
    transformer: -> (currency_symbol, digits) { Money.new(digits, currency_symbol) }
)