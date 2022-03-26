require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  if Rails.env.production? # 本番環境の場合はS3へアップロード
    config.storage :fog
    config.fog_provider = "fog/aws"
    config.fog_directory = "tabi-share-backend"
    config.fog_public = false
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["S3_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
      region: "ap-northeast-1",
      path_style: true
    }
  else
    config.asset_host = "http://localhost:3001"
    config.storage = :file
    config.cache_storage = :file
    config.enable_processing = false if Rails.env.test?
  end
end
