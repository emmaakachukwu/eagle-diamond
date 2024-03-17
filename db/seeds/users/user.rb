# frozen_string_literal: true

def seed_users
  _user_configs = user_configs
  return if _user_configs.blank?

  _user_configs.each { |user_config| create_user user_config }
end

def user_configs
  config = YAML.load_file(Rails.root.join('db/seeds/users/users.yml')).deep_symbolize_keys
  config[:users]
end

def create_user(user_config)
  return if User.find_by(email: user_config[:email]).present?

  user = user_params(user_config).merge user_config

  User.create! user
end

def user_params(user_config)
  now = Time.zone.now
  {
    password: 'password',
    confirmation_token: "confirmationToken#{Digest::SHA1.hexdigest(user_config[:email])[0..7]}",
    confirmed_at: now,
    confirmation_sent_at: now
  }
end
