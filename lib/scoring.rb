class Scoring

  BONUS = 50
  SCORES = {
    A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1, D: 2, G: 2,
    B: 3, C: 3, M: 3, P: 3, F: 4, H: 4, V: 4, W: 4, Y: 4, K: 5, J: 8, X: 8,
    Q: 10, Z: 10
  }

  def self.score(word)

    word = word.upcase.split(//) # change letters of word to uppercase to match keys
    points = 0  # points start at 0
    points += BONUS if word.length == 7

    word.each do |letter|
      points += SCORES[letter.to_sym]
    end
    return points
  end
end
