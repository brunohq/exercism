# frozen_string_literal: true

class Bob
  ANSWERS = {
    yell: 'Whoa, chill out!',
    question: 'Sure.',
    yell_question: "Calm down, I know what I'm doing!",
    silence: 'Fine. Be that way!',
    whatever: 'Whatever.'
  }.freeze

  YELLING = /[A-Z]/.freeze

  def self.hey(remark)
    remark.strip!
    if silent?(remark)
      ANSWERS[:silence]
    elsif yelling?(remark) && questioning?(remark)
      ANSWERS[:yell_question]
    elsif yelling?(remark)
      ANSWERS[:yell]
    elsif questioning?(remark)
      ANSWERS[:question]
    else
      ANSWERS[:whatever]
    end
  end

  def self.silent?(remark)
    remark.empty?
  end

  def self.yelling?(remark)
    YELLING === remark && remark.upcase == remark
  end

  def self.questioning?(remark)
    remark[-1] == '?'
  end
end
