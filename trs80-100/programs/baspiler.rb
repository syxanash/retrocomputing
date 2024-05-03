main_file = File.read(ARGV[0])

lines_of_code = main_file.split("\n")
transpiled_code = []
goto_map = {}
gosub_map = Set.new
counter = 0

lines_of_code.each do |row|
  line_number = counter * 10

  next if row.strip == ''

  # remove comments
  next if row.strip.start_with?('\'')

  if row =~ /^label(.*?)\s/
    label_value = Regexp.last_match(1)
    full_label = "label#{label_value}"

    if goto_map.keys.include?(full_label)
      transpiled_code.each do |current_row|
        if current_row.include? full_label.upcase
          current_row.sub!(full_label.upcase, line_number.to_s)
          row.sub!(full_label, '')
        end

        next
      end
    else
      goto_map[full_label] = line_number
      row.sub!(full_label, '')
    end
  end

  if row =~ /goto\s(.*?)(?:\s+(.*))?$/
    label_value = Regexp.last_match(1)

    if goto_map.keys.include?(label_value)
      goto_number = goto_map[label_value].to_s
      row.sub!(label_value, goto_number)
    else
      goto_map[label_value] = line_number.to_s
    end
  end

  if row =~ /gosub\s(.*?)$/
    gosub_map.add(Regexp.last_match(1))
  end

  if row =~ /function\s(.*$)$/
    function_name = Regexp.last_match(1)

    if gosub_map.include?(function_name)
      row = "REM function #{function_name}"

      transpiled_code.each do |item|
        if item.include? function_name.upcase
          item.sub!(function_name.upcase, line_number.to_s)
        end
      end
    end
  end

  transpiled_code[counter] = "#{line_number} #{row.strip}".upcase
  counter += 1
end

new_code = transpiled_code.join("\n")

File.write(ARGV[0].split('.').join('T.'), new_code)
