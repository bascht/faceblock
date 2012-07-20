case Padrino.env
  when :development then db_name = 'faceblock_development'
  when :production  then db_name = 'faceblock_production'
  when :test        then db_name = 'faceblock_test'
end

CouchRest::Model::Base.configure do |conf|
  conf.model_type_key = 'type' # compatibility with CouchModel 1.1
  conf.database = CouchRest.database!(db_name)
  conf.environment = Padrino.env
  conf.connection = {
    :protocol => 'http',
    :host     => '127.0.0.1',
    :port     => '5984',
  }
end