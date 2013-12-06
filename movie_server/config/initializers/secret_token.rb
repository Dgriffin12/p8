# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
MovieServer::Application.config.secret_key_base = '423dc7dd80f2a342eb84260fb69be746f1358a616f8c71f6ad08a6bf02755435420c5622d7d935161d3b488c71f78c28c5b0b6f4b4afcda55eba1adffe0bedc3'
