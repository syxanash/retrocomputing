main_file = File.read(ARGV[0])

lines_of_code = main_file.split("\n")
transpiled_code = []
goto_map = {}
gosub_map = Set.new
counter = 0

lines_of_code.each_with_index do |row, index|
  line_number = index.zero? ? 5 : counter * 10

  next if row.strip == ''

  # remove comments
  next if row.strip.start_with?('\'')

  # replaces goto labels to line numbers
  if row =~ /^label(.*?)\s/
    label_value = Regexp.last_match(1)

    goto_map["label#{label_value}"] = line_number
    row.sub!("label#{label_value}", '')
  end

  if row =~ /^goto\s(.*?)$/
    label_value = Regexp.last_match(1)

    goto_number = goto_map[label_value].to_s
    row.sub!(label_value, goto_number)
  end

  # replaces gosubs
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

File.write('BEAU.bas', new_code)
