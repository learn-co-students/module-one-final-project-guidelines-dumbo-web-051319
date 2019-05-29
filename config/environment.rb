require 'bundler'
require 'active_record'
require 'io/console'

Bundler.require
ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require_all 'lib'
require_all 'app'
# require_all 'bin'
