class EleventhDoctor

  def self.call(nums = 1)
    new_ipsum = ""
    ipsum = "<p>I know. Dinosaurs! On a spaceship! I once spent a hell of a long time trying to get a gobby Australian to Heathrow airport. Brave heart, Clara. I never know why. I only know who. No idea. Just do what I do: hold tight and pretend it's a plan. It's a fez. I wear a fez now. Fezzes are cool. Oh, I always rip out the last page of a book. Then it doesn't have to end. I hate endings! Bow ties are cool. Frightened people. Give me a Dalek any day. Please tell me I didn't get old. Anything but old. I was young! Oh... is he grey?</p>"
    nums.times do
      new_ipsum += ipsum
    end
    new_ipsum
  end

end
