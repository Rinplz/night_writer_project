class Interface

  def initialize(args)
    @file_name = args[1]
  end

  def creation_message
    p "Created '#{@file_name}' containing 256 characters"
  end

end
