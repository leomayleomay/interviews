class Number
  def str_to_int(str)
    return 0 if str.nil? || str.empty?
    return 0 if str !~ /^\d+$/

    factor = 1

    str.split("").reverse.inject(0) do |sum, e|
      sum += (e.bytes.first - '0'.bytes.first) * factor

      factor *= 10

      sum
    end
  end
end
