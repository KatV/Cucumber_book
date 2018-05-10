require 'fileutils'

class TransactionQueue

  # we’ll use to ensure the queue is cleaned up between scenarios
  def self.clear
    FileUtils.rm_rf('messages')
    FileUtils.mkdir_p('messages')
  end

  # When we initialize the TransactionQueue , we create an instance variable @next_id
  def initialize
    @next_id = 1
  end

  def write(transaction)
    File.open("messages/#{@next_id}", 'w') {|f| f.puts(transaction)}
    @next_id +=1
  end

  # When we’re asked to read a message, we try to find a file in the messages directory.
  # If the directory is empty, we just return from the method.
  # If we do find a message, we read it, yield the contents to the caller,
  # and then delete the message from the queue.
  def read
    next_message_file = Dir['messages/*'].first
    return unless next_message_file
    yield
      File.read(next_message_file)
    FileUtils.rm_rf(next_message_file)
  end

end