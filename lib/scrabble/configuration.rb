module Scrabble
  module Configuration

    BOARD_HEIGHT = 15
    BOARD_WIDTH = 15

    DOUBLE_LETTER_SCORE_SQUARES = [ [:D, 1], [:L, 1], [:G, 3], [:I, 3],
                                    [:A, 4], [:H, 4], [:O, 4],
                                    [:C, 7], [:G, 7], [:I, 7], [:M, 7],
                                    [:D, 8], [:L, 8],
                                    [:C, 9], [:G, 9], [:I, 9], [:M, 9],
                                    [:A, 12], [:H, 12], [:O, 12],
                                    [:G, 13], [:I, 13], [:D, 15], [:L, 15] ]
    DOUBLE_WORD_SCORE_SQUARES = [ [:B, 2], [:N, 2],
                                  [:C, 3], [:M, 3],
                                  [:D, 4], [:L, 4],
                                  [:E, 5], [:K, 5],
                                  [:E, 11], [:K, 11],
                                  [:D, 12], [:L, 12],
                                  [:C, 13], [:M, 13],
                                  [:B, 14], [:N, 14] ]
    TRIPLE_LETTER_SCORE_SQUARES = [ [:F, 2], [:J, 2],
                                    [:B, 6], [:F, 6], [:J, 6], [:N, 6],
                                    [:B, 10], [:F, 10], [:J, 10], [:N, 10],
                                    [:F, 14], [:J, 14] ]
    TRIPLE_WORD_SCORE_SQUARES = [ [:A, 1], [:H, 1], [:O, 1],
                                  [:A, 8], [:O, 8],
                                  [:A, 15], [:H, 15], [:O, 15] ]
    STAR_SQUARE = [:H, 8]

  end
end

