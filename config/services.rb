require 'service_manager'

ServiceManager.start

# not for windows
# This configuration tells Service Manager what command to run in order to start our backend service.
# It also gives it a string to watch out for so that it knows when the service has started up.
# We told it the working directory to use, and we gave it the name of a process identifier (PID) file
# where Service Manager can keep track of the identity of the running service.
# When Cucumber has finished, Service Manager will use the PID to shut down the backend service for us automatically.
ServiceManager.define_service 'transaction_processor' do |s|
  s.start_cmd = 'ruby lib/transaction_processor.rb'
  s.loaded_cue = /ready/
  s.cwd = Dir.pwd
  s.pid_file = 'transaction_processor.pid'
end
