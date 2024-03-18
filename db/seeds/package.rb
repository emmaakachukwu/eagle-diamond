# frozen_string_literal: true

def seed_packages
  users = user_configs
  return if users.size < 2

  sender = User.find_by email: users[0][:email]
  recipient = User.find_by email: users[1][:email]
  return unless sender.present? && recipient.present?

  5.times do |i|
    package = {
      title: "Package #{i + 1}",
      body: "Body: Package #{i + 1} - Details",
      sender: sender,
      deliver_at: 1.day.from_now
    }

    package = Package.find_or_create_by(title: package[:title]) do |p|
      p.update package
    end
    Recipient.find_or_create_by!(user:recipient, package: package)
  end
end

def package_default_params
  {
    title: "Package #{i + 1}",
    body: "Body: Package #{i + 1} - Details",
    sender: sender,
    deliver_at: 1.day.from_now
  }
end
