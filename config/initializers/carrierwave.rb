CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_KEY'],
      region:                ENV['AWS_REGION']
    }
    config.fog_directory  = ENV['AWS_BUCKET_NAME']
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
    config.asset_host = "http://lvh.me:3000" # Chrome doest allow CORS for localhost in case of static images
  end
end
