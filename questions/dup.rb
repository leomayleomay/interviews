module Dup
  module S1
    def push_duplicates_back
      unique = []
      duplicates = []

      self.each do |e|
        if unique.last != e
          unique << e
        else
          duplicates << e
        end
      end

      unique + duplicates
    end
  end

  module S2
    def push_duplicates_back
      r = 0
      w = 0

      while self[r] && self[w]
        while self[r] && self[w] && self[r] <= self[w]
          r += 1
        end

        if r < self.length
          e = self.delete_at(r)

          self.insert(w+1, e)

          w += 1
        end
      end

      self
    end
  end
end
