module AsyncSupport

  # This code uses Ruby’s begin..rescue structure to run the block of code passed to the method and catch any error.
  # If there was no error, we return from the method, meaning the step can carry on successfully.
  # Remember that Cucumber will assume the step has passed unless it raises an error.
  # If there was an error and the time limit has been reached, we raise the error so the step will fail.
  # Finally, we take a little sleep to give the system a chance to do other things before we go around the loop again.

  def eventually
    timeout = 2
    polling_interval = 0.1
    time_limit = Time.now + timeout

    loop do
      begin
        yield
      rescue Exception => error
      end

      return if error.nil?
      raise error if Time.now >= time_limit
      sleep polling_interval
    end
  end
end

World(AsyncSupport)