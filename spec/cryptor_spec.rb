require 'spec_helper'

describe Cryptor do
  let(:plaintext)  { 'THE MAGIC WORDS ARE SQUEAMISH OSSIFRAGE' }
  subject { Cryptor.new(secret_key) }

  context 'xsalsa20poly1305' do
    require 'cryptor/ciphers/xsalsa20poly1305'

    let(:secret_key) { Cryptor.random_key(:xsalsa20poly1305) }

    it 'encrypts and decrypts' do
      ciphertext = subject.encrypt(plaintext)
      expect(subject.decrypt(ciphertext)).to eq plaintext
    end
  end

  context 'message_encryptor' do
    require 'cryptor/ciphers/message_encryptor'

    let(:secret_key) { Cryptor.random_key(:message_encryptor) }

    it 'encrypts and decrypts' do
      ciphertext = subject.encrypt(plaintext)
      expect(subject.decrypt(ciphertext)).to eq plaintext
    end
  end
end
