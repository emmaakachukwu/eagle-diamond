# frozen_string_literal: true

def seed_user
  users = YAML.load_file(Rails.root.join('db/seeds/users/users.yml')).deep_symbolize_keys
  return if users[:users].blank?

  users[:users].each { |user| create_user user }
end

def create_user(user)
  return if User.find_by(email: user[:email]).present?

  user[:password] ||= 'password'
  user[:confirmation_token] = "confirmationToken#{Digest::SHA1.hexdigest(user[:email])[0..7]}"
  user.merge! default_params

  User.create! user
end

def default_params
  now = Time.zone.now
  {
    confirmed_at: now,
    confirmation_sent_at: now
  }
end

seed_user
