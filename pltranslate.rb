class String
  def vowel?
    return false unless length == 1
    match(/[aeiou]/i) ? true : false
  end

  def caps?
    ('A'..'Z').include?(self)
  end

  def piggify
    gsub(/[a-zA-Z\-\']+/) { |wd| wd[0].caps? ? piggify_word(wd, false, true) : piggify_word(wd) }
  end
end

def piggify_word(word, switch_made = false, caps = false, count = 0)
  if !word[0].vowel? && (count < (word.length - 1))
    if word[0..1] == 'qu'
      return piggify_word(word[2..-1] + word[0..1], true, caps, count + 1)
    else
      return piggify_word(word[1..-1] + word[0], true, caps, count + 1)
    end
  end

  switch_made ? (word += "ay") : (word += "way")
  caps ? word.downcase.capitalize : word
end

