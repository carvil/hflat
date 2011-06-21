class Hash

  def flatten
    new_hash = {}
    self.each do |key, value|
      if value.is_a?(Hash)
        rec_hash = value.flatten
        new_hash.merge!(rec_hash)
      else
        new_hash[key] = value
      end
    end
    return new_hash
  end

end
