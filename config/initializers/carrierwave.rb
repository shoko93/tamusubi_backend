require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    if Rails.env.production?
        config.storage :fog
        config.fog_provider = 'fog/aws'
        config.fog_directory  = ENV['S3_BUCKET_NAME']
        config.fog_public = false
        config.fog_credentials = {
            provider: 'AWS',
            aws_access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキー
            aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキー
            region: 'ap-northeast-1', # リージョン
            path_style: true
        }
    else
        config.storage :file
    end
end