module Scenes
  module Score
    # エンディングシーンの担当ディレクタークラス
    class Director < DirectorBase
      # コンストラクタ
      def initialize
        super
        @bg_img = Gosu::Image.new("images/bg_ending.png", tileable: true)
      end

      # 1フレーム分の更新処理
      def update(opt = {})
      end

      # 1フレーム分の描画処理
      def draw
        @bg_img.draw(0, 0, 0)
      end
    end
  end
end