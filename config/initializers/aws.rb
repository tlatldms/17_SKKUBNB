CarrierWave.configure do |config|
  
        config.fog_credentials = {
            
                provider: 'AWS',
                aws_access_key_id:     'X',                        # required
                aws_secret_access_key: 'X',                    # required
                region: 'X',
                endpoint: 'X'
                
        }
        config.fog_directory = 'X'
        config.fog_attributes = {} # optional, defaults to {}
end
