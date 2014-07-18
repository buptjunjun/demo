module Question1sHelper

  def firststrn(text,n)
    if text == nil
      return ""
    else
      if  text.length < n
       length = text.length
      else
        length = n
      end;

      return text[0,length]
    end
  end

end
