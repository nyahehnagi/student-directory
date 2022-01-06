
def print_source_code (filename)
  File.foreach(filename) do |line|
    puts line
  end
end

print_source_code (__FILE__)