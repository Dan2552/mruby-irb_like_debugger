def _debugger_input(input)
  s = "begin\n"
  r = "\nrescue => exc\nputs exc.class.to_s; puts exc.inspect\nend"

  s + input + r
end

DEBUGGER = '
_parts = caller[0].split(":", 3)
_file = _parts[0]
_line_str = _parts[1]
_line = _line_str.to_i
output = File.read(_file).split("\n")
puts ""
puts "From: #{_file} @ line #{_line} :"
puts ""
puts "   #{_line - 5}: #{output[_line - 6]}" if _line - 5 > 0 rescue nil
puts "   #{_line - 4}: #{output[_line - 5]}" if _line - 4 > 0 rescue nil
puts "   #{_line - 3}: #{output[_line - 4]}" if _line - 3 > 0 rescue nil
puts "   #{_line - 2}: #{output[_line - 3]}" if _line - 2 > 0 rescue nil
puts "   #{_line - 1}: #{output[_line - 2]}" if _line - 1 > 0 rescue nil
puts "=> #{_line - 0}: #{output[_line - 1]}"
puts "   #{_line - 1}: #{output[_line - 0]}" rescue nil
puts "   #{_line + 2}: #{output[_line + 1]}" rescue nil
puts "   #{_line + 3}: #{output[_line + 2]}" rescue nil
puts "   #{_line + 4}: #{output[_line + 3]}" rescue nil
puts "   #{_line + 5}: #{output[_line + 4]}" rescue nil
puts ""

loop do
  begin
    print "(debugger) > "
    _input = gets
    if _input.nil? || _input.chomp == "continue" || _input.chomp == "exit"
      break
    end

    if _input.chomp == "exit!" || _input.chomp == "!!!"
      raise ExitError
    end

    output = eval(_debugger_input(_input)).inspect
    puts("=> #{output}")
    output
  rescue Exception => exc
    raise exc if exc.is_a?(ExitError)
    puts exc.class.to_s
    puts exc.inspect
  end
end
'
