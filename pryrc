Pry.config.editor = "vim"

# Prompt with ruby version
# Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# loading rails configuration if it is running as a rails console
#if defined?(Rails) && Rails.env
#  rails_rc = Rails.root + '/.railsrc'
#  load(rails_rc) if File.exists?(rails_rc)
#  extend Rails::ConsoleMethods if defined?(Rails::ConsoleMethods)
#end
#
# enable Hirb to capture output
if defined?(Hirb)
  Pry.config.print = proc do |output, value|
    Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
  end
  Hirb.enable
end

