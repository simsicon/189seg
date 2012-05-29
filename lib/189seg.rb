require "189seg/version"
require 'openssl'
require 'base64'
require 'rest_client'
require 'yajl'
require 'net/http'
require 'uri'
require 'json'


module CnTelecomeSeg
  
end

directory = File.expand_path(File.dirname(__FILE__))
require File.join(directory, '189seg', 'base')