Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '5db0815b8bafb133d85e', '1b974b76400f6b62d4603891e4a863026c6ed745'
end
