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

    DEFAULT_TILES_WITH_COUNT = [ { name: :A, value: 1, count: 9 },
                                 { name: :B, value: 3, count: 2 },
                                 { name: :C, value: 3, count: 2 },
                                 { name: :D, value: 2, count: 4 },
                                 { name: :E, value: 1, count: 12 },
                                 { name: :F, value: 4, count: 2 },
                                 { name: :G, value: 2, count: 3 },
                                 { name: :H, value: 4, count: 2 },
                                 { name: :I, value: 1, count: 9 },
                                 { name: :J, value: 8, count: 1 },
                                 { name: :K, value: 5, count: 1 },
                                 { name: :L, value: 1, count: 4 },
                                 { name: :M, value: 3, count: 2 },
                                 { name: :N, value: 1, count: 6 },
                                 { name: :O, value: 1, count: 8 },
                                 { name: :P, value: 3, count: 2 },
                                 { name: :Q, value: 10, count: 1 },
                                 { name: :R, value: 1, count: 6 },
                                 { name: :S, value: 1, count: 4 },
                                 { name: :T, value: 1, count: 6 },
                                 { name: :U, value: 1, count: 4 },
                                 { name: :V, value: 4, count: 2 },
                                 { name: :W, value: 4, count: 2 },
                                 { name: :X, value: 8, count: 1 },
                                 { name: :Y, value: 4, count: 2 },
                                 { name: :Z, value: 10, count: 1 },
                                 { name: :blank, value: 0, count: 2 } ]

    def self.default_tiles
      DEFAULT_TILES_WITH_COUNT.inject([]) do |bag, tile|
        tile[:count].times do
          bag << Tile.new(tile[:name], tile[:value])
        end
        bag
      end
    end
  end
end

