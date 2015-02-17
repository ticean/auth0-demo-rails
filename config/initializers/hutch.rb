# Configure Hutch for AMQP message publishing.
module Utils
  # Returns true if value matches 1, enabled, on, true, yes
  def self.to_boolean(value)
    value.to_s.match(/^(1|enabled?|on|true|yes)$/i) ? true : false
  end
end

Hutch.global_properties = { app_id: 'scaleworks.mail' }
Hutch.connect({}, {
  mq_host: ENV['HUTCH_AMQP_HOST'],
  mq_port: ENV['HUTCH_AMQP_PORT'],
  mq_exchange: ENV['HUTCH_AMQP_EXCHANGE'],
  mq_vhost: ENV['HUTCH_AMQP_VHOST'],
  mq_username: ENV['HUTCH_AMQP_USERNAME'],
  mq_password: ENV['HUTCH_AMQP_PASSWORD'],
  mq_tls: Utils.to_boolean(ENV['HUTCH_AMQP_TLS']),
  mq_api_host: ENV['HUTCH_AMQP_API_HOST'],
  mq_api_port: ENV['HUTCH_AMQP_API_PORT'],
  mq_api_ssl: Utils.to_boolean(ENV['HUTCH_AMQP_API_SSL']),
  publisher_confirms: ENV['HUTCH_PUBLISHER_CONFIRMS'],
  namespace: ENV['HUTCH_NAMESPACE']
})
