module Demo2Helper
  def split_text(text, sperator)
    ret = text.split(sperator)
    return ret
  end

  def text_decorate(text)
    return text.sub("{" , "<span class='redspan'>").sub("}" , "</span>").sub("[","<span class='greenspan'>").sub("]","</span>")
  end
end
