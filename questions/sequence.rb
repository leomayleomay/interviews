class Sequence
  def self.sort(o, t)
    if o.length == 0 && t.length == 0
      return []
    end

    if o.length == 1 && t.length == 1
      return o
    end

    o_l = []
    o_h = []
    t_l = []
    t_h = []

    p = o[rand(o.length)]
    m = p

    t.each do |e|
      if e > p
        t_h << e
      end

      if e < p
        t_l << e
      end
    end

    o.each do |e|
      if e > m
        o_h << e
      end

      if e < m
        o_l << e
      end
    end

    sort(o_l, t_l) + [p] + sort(o_h, t_h)
  end
end
