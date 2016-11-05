class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :img]
  before_action :auth, only: [:index, :show, :new, :sv, :pk, :dq]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.where(key: params[:key])
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    type = @picture.temp_type
    key = @picture.key
    # ToDo ファットコントローラを殺す
    case type
      when 0
        json = ' {
                "temp": "1 に 2 すんでいる。 3 が 4 ため 5 を 6 という。 ",
                "1": ["もりのなか", "うみのなか", "くうちゅう", "うちゅう", "なぞのばしょ",
                  "スカートのなか", "くさむら", "さばく", "どくぬま", "みずうみ", "どうくつ",
                  "シオンタウン", "カミナリぐも", "マグマの　なか", "１ごうかん", "いくたりょくち",
                  "２じげん", "たんまつしつ", "グリーントップ", "マルメ"
                ],
                "2": ["ひとりで", "むれをなして", "なかまと", "かぞくと", "しゅうだんで", "ぼっちで",
                  "こいびとと", "ともだちと"
                ],
                "3": ["ウロコ", "きんにく", "ツノ", "トゲ", "しっぽ", "つばさ", "さいぼう", "はっぱ",
                  "はなびら", "たいもう", "ツメ", "ヒゲ", "みずかき", "ないぞう", "くち", "おしり",
                  "しょくしゅ", "ベロ", "せびれ"
                ],
                "4": ["かたい", "はったつしている", "ふくらんでいる", "くさい", "うつくしい",
                  "おおきくなる", "ぜんしんを　おおう", "つよい", "するどい", "たくましい",
                  "すけている", "ぬれている", "すごい"
                ],
                "5": ["インドゾウ", "ドラムかん", "てっとう", "てっこつ", "ほかの　ポケモン",
                  "じゅうでんき", "メガネ", "きんメダリスト", "ゴローン", "イシツブテ",
                  "ユーエスビー", "カイリキー", "にんげん", "１トンの　いわ", "モンスターボール",
                  "せいみつきかい", "はつでんしょ", "タマタマ", "せかいチャンピオン", "かだい",
                  "マックブック"
                ],
                "6": ["もちあげる", "へしおる", "おそう", "あふれさせる", "たべる", "つくる", "こわす",
                  "はかいする", "つかまえる", "のみこむ", "まっぷたつにする", "もやす",
                  "なぎたおす", "あやつる", "ぜつめつさせる", "ほろぼす"
                ]
               }'
        json = JSON.parse(json)
        @data = {
            text: json["temp"].gsub('1', json["1"].sample).gsub('2', json["2"].sample).gsub('3', json["3"].sample).gsub('4', json["4"].sample).gsub('5', json["5"].sample).gsub('6', json["6"].sample),
            ashi: rand(1..9),
            weight: rand(0..256),
            tall: rand(0..300).to_f / 100.0,
            num: "%03d" % rand(1..999),
            type: %w(ねがく がくせい うぇい).sample,
        }
        render layout: 'pk' and return
      when 1
        json = '{
                "temp": "1で2をしていたところ　なかまになった。\nとくぎは3で　 こうぶつは4である。\nせいちょうすると　5と6がおおきくのびていく。",
                "1": ["アトリウム", "ビュー", "キャビン", "スエヒロ", "ホワイエ", "ぶしつ"],
                "2": ["かだい", "どくしょ", "おひるね", "べんきょう", "おしゃべり", "ゲーム", "ダンス", "ランチ", "ディナー"],
                "3": ["メラ", "メラゾーマ", "ヒャド", "マヒャド", "バギ", "バギクロス", "イオ", "イオグランデ", "ギガデイン", "マヒャデドス", "ホイミ", "ベホマラー", "ザオリク", "マホカンタ", "バイキルト", "マダンテ"],
                "4": ["やくそう", "アモールのみず", "いやしぐさ", "せかいじゅのは", "まほうのせいすい", "どくけしそう", "ばんのうやく", "いのちのきのは", "まんげつそう", "きつけぐさ", "ちからのたね", "まもりのたね", "スタミナのたね", "かしこさのたね"],
                "5": ["HP", "MP", "ちから", "すばやさ", "たいりょく"],
                "6": ["かしこさ", "うんのよさ", "さいだいHP", "さいだいMP", "こうげきりょく", "しゅびりょく"]
              }'
        json = JSON.parse(json)
        @data = {
            text: json["temp"].gsub('1', json["1"].sample).gsub('2', json["2"].sample).gsub('3', json["3"].sample).gsub('4', json["4"].sample).gsub('5', json["5"].sample).gsub('6', json["6"].sample),
            sex: %w(おとこ おんな ふめい).sample,
            job: %w(がくせい にーと).sample,
            lv: rand(0..99),
            hp: rand(1..255),
            mp: rand(1..255),
            power: rand(1..255),
            speed: rand(1..255),
            pp: rand(1..255),
            clever: rand(1..255),
            lucky: rand(1..255),
            exp: rand(1..10000),
        }
        render layout: 'dq' and return
      when 2
        render layout: 'sv' and return
      when 3
        render layout: 'ds' and return
    end
    render :nothing and return
  end

  def sv
  end

  def img
    # kit = IMGKit.new("http://#{request.host_with_port}/pictures/#{params[:id]}?key=#{params[:key]}")
    kit = IMGKit.new("http://localhost:3000/pictures/12?key=dJHq0xuQ")
    # kit = IMGKit.new("http://google.com")
    # send_data(kit.to_png, :type => "image/png", :disposition => 'inline')
    send_data(kit.to_png, :type => "image/png", :disposition => 'inline')
  end

  def pk
  end

  def dq
  end

  # GET /pictures/new
  def new
    @picture = Picture.new(key: params[:key])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to picture_path(@picture, key: @picture.key), notice: 'Picture was successfully created.', params: @picture.key }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:name, :key, :temp_type, :photo)
    end

    def auth
      key = params[:key]
      user = User.find_by(key: key)
      if user
        @user = user
      else
        throw(:abort)
      end
    end
end
