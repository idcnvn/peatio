# encoding: UTF-8
# frozen_string_literal: true

module CurrencyHelper
  # Yaroslav Konoplov: I don't use #image_path & #image_url here
  # since Gon::Jbuilder attaches ActionView::Helpers which behave differently
  # compared to what ActionController does.
  def currency_icon_url(currency)
    if currency.coin?
      ActionController::Base.helpers.image_url coin_icon_url(currency)
    else
      ActionController::Base.helpers.image_url fiat_icon_url(currency)
    end
  end

  private

  def coin_icon_url(currency)
    currency.icon_url || "yarn_components/cryptocurrency-icons/svg/color/#{currency.code}.svg"
  end

  def fiat_icon_url(currency)
    currency.icon_url || "yarn_components/currency-flags/src/flags/#{currency.code}.png"
  end
end
