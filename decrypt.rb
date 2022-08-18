require 'cgi'
require 'active_support'
require 'json'

def verify_and_decrypt_session_cookie(cookie, secret_key_base = Rails.application.secret_key_base)
  cookie = CGI::unescape(cookie)
  salt   = 'authenticated encrypted cookie'
  encrypted_cookie_cipher = 'aes-256-gcm'
  serializer = ActiveSupport::MessageEncryptor::NullSerializer

  key_generator = ActiveSupport::KeyGenerator.new(secret_key_base, iterations: 1000)
  key_len = ActiveSupport::MessageEncryptor.key_len(encrypted_cookie_cipher)
  secret = key_generator.generate_key(salt, key_len)
  encryptor = ActiveSupport::MessageEncryptor.new(secret, cipher: encrypted_cookie_cipher, serializer: serializer)

  encryptor.decrypt_and_verify(cookie)
end

pp JSON.parse(verify_and_decrypt_session_cookie('A6xrNE4f4fv97dbn0KgGv98%2FV5OIfaonvZuaoox4UK1ZFe9iBer0LeJQEcg4YFFg5EOaO4YuhXbBo%2FVgSn9jBZX1Fw4DF39A3kPXMvUWeKnbrRHt3NCwVnt%2Bkj%2F9Lbw%2FxeM8j2n7V3fhaTk9fCWSCbKtEXLMFYtH4CGWfahqBYKSmHW9SU6Anyxlia8NSMhnsZsC7CEK%2FTmSBt%2FnPIYoOve3Z2G%2BNSZ%2BZZc6d4WVP2NGHojacvckSRpFvnnyynDwa7%2Bld3uK0OBGmda2SD3NceI00mFXokSzqHmPOOnTBiM1SYOHqWfYCIafpDwx%2BLHKSJGCcTg5xrr2uLLdbg%3D%3D--oL0HXJPhdg%2BQ2ltl--HWHFFO2c9JoZtoTYuknNfw%3D%3D', '231679f7c5baeb57294b60d42581a826032b373647ad756a37a8d483e4954dd574cb7092267994712a7eaeb6b7bd5a173fc3898539d4117fb95f8bd7a25c188d'))