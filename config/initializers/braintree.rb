Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['5nnfnt3y6c2kqc9m']
Braintree::Configuration.public_key = ENV['wb48cn4p5hy8r5pb']
Braintree::Configuration.private_key = ENV['de3db66c26ec2b6123470e95000e9e81']