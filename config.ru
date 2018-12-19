require_relative './lib/app'

use Rack::Static, urls: ['/files']

run FileReceiver
