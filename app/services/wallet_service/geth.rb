# encoding: UTF-8
# frozen_string_literal: true

module WalletService
  class Geth < Base

    def create_address(options = {})
      @client.create_address!(options)
    end

  end
end