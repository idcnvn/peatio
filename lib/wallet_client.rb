# encoding: UTF-8
# frozen_string_literal: true

module WalletClient
  Error                  = Class.new(StandardError) # TODO: Rename to Exception.
  ConnectionRefusedError = Class.new(StandardError) # TODO: Remove this.

  class << self
    #
    # Returns API client for given gateway options hash.
    #
    # @param wallet [String, Symbol]
    #   The wallet object.
    # @return [BaseAPI]
    def [](wallet)
      "WalletClient::#{wallet.gateway.fetch('client').capitalize}"
        .constantize
        .new(wallet)
    end
  end

  class Base
    extend Memoist

    #
    # Returns the blockchain.
    #
    # @return [gateway]
    attr_reader :wallet

    def initialize(wallet)
      @wallet = wallet
    end
  end
end