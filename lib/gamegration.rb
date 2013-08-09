Dir[File.expand_path("../gamegration/*.rb", __FILE__)].each { |f| require f }
module Gamegration
  # Your code goes here...
  Config.instance.tap do |config|
    config.database   = "gamegration_development"
    config.adapter    = "mysql2"
    config.host       = "localhost"
    config.username   = "root"
  end.connection
end
