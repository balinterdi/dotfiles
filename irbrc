#!/usr/bin/env ruby
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 100
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

# load rc files from .irbrc.d
Dir[File.join("#{__FILE__}.d", "*.rb")].each {|f| require(f) rescue nil}

# load .irbrc from current directory
if File.exists?(".irbrc") and File.expand_path(".irbrc") != __FILE__
  begin
    load(".irbrc")
    $console_extensions << "#{ANSI[:GREEN]}local .irbrc#{ANSI[:RESET]}"
  rescue
    puts "Error loading local .irbrc: #{ANSI[:RED]}#{$!}#{ANSI[:RESET]}"
  end
end

