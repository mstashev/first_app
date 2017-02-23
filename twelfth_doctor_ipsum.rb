class TwelfthDoctor

  def self.call(nums = 1)
    new_ipsum = ""
    ipsum = "<p>Please just... just see me. I don't know. But I'd probably blame the English. Shush. I was being chased by a giant dinosaur, but I think I've managed to give it the slip. Oh, you've got a dinosaur too! Well, you're very similar heights. Maybe you should wear labels. I'm Scottish. I can complain about things now. I can really complain about things now. He was dead already, I'm saving us. Follow me, and run! I don't think that I'm a hugging person now. Clara, I'm not your boyfriend. I never said it was your mistake.</p>"
    nums.times do
      new_ipsum += ipsum
    end
    new_ipsum
  end


end
