# module Scenes
#   module Game
#     module Card

#       # カードの共通項目
#       class Base
#         @@number_font = Gosu::Font.new(80, name: DirectorBase::FONT_FILENAME)                    # カードの数字描画用フォント


#         # 必要なアクセサメソッドの定義
#         attr_accessor :num, :x, :y, :z
#         # コンストラクタ
#         def initialize(_num, _x, _y, _z = 1)
#           self.num = _num
#           self.x = _x
#           self.y = _y
#           self.z = _z
#           @number_mark = get_number_mark
#           @num_w = @@number_font.text_width(@number_mark)
#           @num_h = @@number_font.height
#         end


#         # カードを画面に描画する
#         def draw
#           if @reversed
#             draw_background
#           else
#             draw_foreground
#           end
#         end

#         private

#         # カードの表側の描画
#         def draw_foreground
#           @@card_foreground_img.draw(self.x, self.y, self.z)
#           draw_suit_mark
#           draw_number
#         end

#         # カードの種別マーク（Suit）の描画
#         def draw_suit_mark
#           @@suit_font.draw_text(
#             self.class::SUIT_MARK,
#             self.x + SUIT_MARK_OFFSET_X,
#             self.y + SUIT_MARK_OFFSET_Y,
#             self.z,
#             SCALE, SCALE,
#             self.class::SUIT_COLOR)
#         end

#         # カードの番号の描画
#         def draw_number
#           num_x = self.x + (@@card_foreground_img.width / 2) - (@num_w / 2)
#           num_y = self.y + (@@card_foreground_img.height / 2) - (@num_h / 2)
#           @@number_font.draw_text(@number_mark, num_x, num_y, self.z, SCALE, SCALE, self.class::NUMBER_COLOR)
#         end
        
#       end
#     end
#   end
# end
