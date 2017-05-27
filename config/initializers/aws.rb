CarrierWave.configure do |config|
  
        config.fog_credentials = {
            
                provider: 'AWS',
                aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
                aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                    # required
                region: 'ap-northeast-2',
                endpoint: 'http://s3.ap-northeast-2.amazonaws.com'
                
        }
        config.fog_directory = 'test0522'
        config.fog_attributes = {} # optional, defaults to {}
end
