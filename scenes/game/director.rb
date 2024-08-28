require_relative 'card/base'

module Scenes
  module Game
    # ゲーム本編シーンの担当ディレクタークラス
    class Director < DirectorBase
      FPS = 30 # フレームレート（1秒間に何回画面を更新するか）の定義

      # コンストラクタ
      def initialize
        super
        # 画像オブジェクトの読み込み
        @bg_img = Gosu::Image.new("images/bg_game.png", tileable: true)
        @sample_img = Gosu::Image.new("images/base.png") # 追加した画像オブジェクト
        # 各種インスタンス変数の初期化
        @cards = []                                            # 全てのカードを保持する配列
        @score = 0                                             # 総得点
        @cleared = false                                       # 3回duelしたか否かを保持するフラグ
        @drag_start_pos = nil                                  # マウスドラッグ用フラグ兼ドラッグ開始位置記憶用変数 
        @rectangles = []
        @images = []                                      # 長方形を保持する配列

        # カードをドローする処理
        z = 1
      end

      # 1フレーム分の更新処理
      def update(opt = {})
        # ゲームクリアフラグが立ち、且つ画面への判定結果表示が完了済みの場合、エンディングシーンへ切り替えを行う
        if @cleared || Gosu.button_down?(Gosu::KB_E)
          transition(:score)
        end

        # Dキーが押されたときに長方形を追加
        if Gosu.button_down?(Gosu::KB_D)
          add_images
        end

        # 数字キー1〜5が押されたときに対応する画像を削除
        (Gosu::KB_1..Gosu::KB_5).each_with_index do |key, index|
          if Gosu.button_down?(key)
            remove_image(index + 1)
          end
        end
      end

      # 1フレーム分の描画処理
      def draw
        # 背景画像を表示
        @bg_img.draw(0, 0, 0)

        # 全カードを表示
        # メッセージ表示フレーム数が2以上の場合はメッセージを表示する

        # スコアを表示
        draw_text("SCORE: #{@score}", :right, 5, font: :score, color: :white)

        # 長方形を表示
        @images.each do |image|
          @sample_img.draw(image[:x], image[:y], 0, image[:scale_x], image[:scale_y])
        end
      end

      private

        # 画像を追加する処理
      def add_images
        # 画像のサイズと位置を設定
        img_width = 100
        img_height = 150
        spacing = 10

        # 連続して5つの画像を追加
        5.times do |i|
          @images << {
            x: 230 + (img_width + spacing) * i, # 初期位置から横に並べる
            y: 420,                             # 固定のY位置
            scale_x: img_width / @sample_img.width.to_f,
            scale_y: img_height / @sample_img.height.to_f,
            index: i + 1
          }
        end
      end

      # 指定されたインデックスの画像を削除する処理
      def remove_image(index)
        @images.reject! { |image| image[:index] == index }
      end    

      # 長方形を描画するためのヘルパーメソッド
      def draw_rect(x, y, width, height, color)
        Gosu.draw_rect(x, y, width, height, color)
      end

    end
  end
end
