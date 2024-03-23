# frozen_string_literal: true

class MessageCrypto
  def initialize(key, hash_key: false)
    @key = key
    @key = key_hash if hash_key
    @client = setup_client
  end

  def encrypt(value)
    client.encrypt_and_sign value
  end

  def decrypt(encrypted_value)
    client.decrypt_and_verify encrypted_value
  end

  private

  attr_reader :key, :client

  def setup_client
    ActiveSupport::MessageEncryptor.new key
  end

  # generate a 32 bytes value from key as required by 'ActiveSupport::MessageEncryptor'
  def key_hash
    Digest::SHA1.hexdigest(key)[0...32]
  end
end
