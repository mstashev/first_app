class TenthDoctor

  def self.call(nums = 1)
    new_ipsum = ""
    ipsum = "<p>Sweet, maybe... Passionate, I suppose... But don't ever mistake that for nice. There's something else I've always wanted to say: Allons-y, Alonso! I'm Dr. James McCrimmon from the township of Balamory. People assume that time is a strict progression of cause-and-effect... but actually, from a non-linear, non-subjective viewpoint, it's more like a big ball of wibbly-wobbly... timey-wimey... stuff. River, you know my name. You whispered my name in my ear! There's only one reason I would ever tell anyone my name. There's only one time I could...</p>"
    nums.times do
      new_ipsum += ipsum
    end
    new_ipsum
  end
end
