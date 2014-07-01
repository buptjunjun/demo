require 'json'
class UploadController < ApplicationController

  def index

  end

  def upload
    file  = params[:file]['file']
    str = file.read

      jobj = JSON.parse(str)
      puts jobj
      save_demo2(jobj[0])
    render :template => "upload/index"
end

private
  def save_demo2(jobj)
    Topic.delete_all
    Question.delete_all
    Answer.delete_all

    #save topic
    title = jobj['sumary']['title']
    t = Topic.new
    t.name = title
    t.save

    part1 = jobj['part1']
    part1.each { |part|
        q = t.questions.new
        q.qtype = 0
        q.gif = part["gif"]
        q.voice = part['voice']
        q.text = part['chinese']+"|||"+part['english']
        q.save
    }
    part2 = jobj['part2']
    part2.each { |part|
      q = t.questions.new
      q.qtype=1
      word = part['word']
      q.text = word
      q.save

      count = 1
      right = Integer(part["right"])
      answers = part['answers']
      answers.each { |answer|
        a = q.answers.new
        a.gif = answer
        a.isright = false
        if count == right
          a.isright = true
        end
        a.save
        count+=1
      }
    }
    
    part3 = jobj['part3']
    part3.each { |part|
      text = part['text']
      q = t.questions.new
      q.qtype = 2
      q.text = text
      q.save

      answers = q.answers
      a = q.answers.new
      a.text = part['answers']
      a.save
    }

  end
end
