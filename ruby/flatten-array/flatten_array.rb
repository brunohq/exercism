class FlattenArray
  def self.flatten(arr, flat = [])
    arr.each do |el|
      if el.is_a? (Array)
        flat = self.flatten(el, flat)
      else
        flat << el unless el.nil?
      end
    end

    return flat
  end
end