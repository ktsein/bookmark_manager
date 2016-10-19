require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class Link

  DataMapper::Logger.new($stdout, :debug)

  include DataMapper::Resource

  property :id,      Serial
  property :title,   String
  property :url,     String
  property :tags,    String

end

data_mapper_setup
