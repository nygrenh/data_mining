require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'csv'
require 'set'
require_relative 'student'
require_relative 'students'
require_relative 'course_attempt.rb'
require_relative 'magic.rb'
require_relative './sequence_appriori.rb'

require 'active_support'
require 'active_support/core_ext'
require 'thread_safe'
require 'parallel'
require 'thread'
