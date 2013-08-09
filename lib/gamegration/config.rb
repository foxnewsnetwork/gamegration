class Gamegration::Config
  include Singleton
  attr_accessor :adapter, :host, :username, :password, :database, :logger

  def connection
    ActiveRecord::Base.logger = logger if logger.present?
    @connection ||= ActiveRecord::Base.establish_connection( connection_hash )
  end

  def connection_hash
    {
      :adapter  => adapter,
      :host     => host,
      :username => username,
      :password => password,
      :database => database
    }
  end
end