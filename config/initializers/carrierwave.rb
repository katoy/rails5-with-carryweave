CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
    path_style: true
  }
  config.fog_public = true # public-read

  config.remove_previously_stored_files_after_update = false

  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.asset_host = ENV['AWS_S3_URL']

  config.cache_storage = :fog
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
