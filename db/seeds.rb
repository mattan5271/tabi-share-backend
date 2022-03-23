User.create!(
  [
    { email: "admin1@admin1", password: "admin1admin1", password_confirmation: "admin1admin1", name: "管理者1", sex: 0, age: 21, is_admin: true },
    { email: "admin2@admin2", password: "admin2admin2", password_confirmation: "admin2admin2", name: "管理者2", sex: 0, age: 22, is_admin: true },
    { email: "admin3@admin3", password: "admin3admin3", password_confirmation: "admin3admin3", name: "管理者3", sex: 0, age: 23, is_admin: true },
    { email: "admin4@admin4", password: "admin4admin4", password_confirmation: "admin4admin4", name: "管理者4", sex: 0, age: 24, is_admin: true },
    { email: "admin5@admin5", password: "admin5admin5", password_confirmation: "admin5admin5", name: "管理者5", sex: 0, age: 25, is_admin: true }
  ]
)

Genre.create!(
  [
    { name: "ジャンル1" },
    { name: "ジャンル2" },
    { name: "ジャンル3" },
    { name: "ジャンル4" },
    { name: "ジャンル5" }
  ]
)

TravelSpot.create!(
  [
    { user_id: 1,
      genre_id: 1,
      name: "東京ディズニーランド",
      postcode: "279-0031",
      prefecture_code: 12,
      address_city: "浦安市舞浜",
      address_street: "1-1",
      address_building: "",
      introduction: "東京ディズニーランドです。",
      access: "東京ディズニーランドの最寄り駅は、東京駅から電車で15分、JR舞浜駅です。",
      phone_number: "045-330-5211",
      business_hour: "8時00分～22時00分",
      parking: "普通乗用車（全長5ｍ未満）：¥2,500（平日） ¥3,000（土日祝日）大型車（全長5ｍ以上）：¥4,500（平日） ¥5,000（土日祝日）二輪車（原動機付自転車を含む）：¥500（平日） ¥500（土日祝日）",
      home_page: "https://www.tokyodisneyresort.jp/tdl/"
    },
    { user_id: 2,
      genre_id: 2,
      name: "ユニバーサル・スタジオ・ジャパン",
      postcode: "554-0031",
      prefecture_code: 27,
      address_city: "大阪市此花区桜島",
      address_street: "2-1-33",
      address_building: "",
      introduction: "ユニバーサル・スタジオ・ジャパンです。",
      access: "JR桜島線(ゆめ咲線)「ユニバーサルシティ駅」入場ゲート 徒歩4分",
      phone_number: "0570-200-606",
      business_hour: "9時00分～21時00分",
      parking: "約2,800台",
      home_page: "https://www.usj.co.jp/web/ja/jp"
    },
    { user_id: 3,
      genre_id: 3,
      name: "富士急ハイランド",
      postcode: "554-0031",
      prefecture_code: 19,
      address_city: "富士吉田市新西原",
      address_street: "5-6-1",
      address_building: "",
      introduction: "富士急ハイランドです。",
      access: "中央自動車道大月JCT経由、河口湖I.Cをおりてすぐ。",
      phone_number: "0555-24-6728",
      business_hour: "9時00分～18時00分",
      parking: "https://xn--fujiq-hh4d.jp/ticket/parking.html",
      home_page: "https://www.fujiq.jp/"
    },
    { user_id: 4,
      genre_id: 4,
      name: "ハウステンボス",
      postcode: "859-3292",
      prefecture_code: 42,
      address_city: "佐世保市ハウステンボス町",
      address_street: "1-1",
      address_building: "",
      introduction: "ハウステンボスです。",
      access: "https://www.huistenbosch.co.jp/guide/access/access_kyushu.html",
      phone_number: "03-3263-6121",
      business_hour: "9時00分～21時00分",
      parking: "https://www.huistenbosch.co.jp/guide/access/parking.html",
      home_page: "https://www.huistenbosch.co.jp/"
    },
    { user_id: 5,
      genre_id: 5,
      name: "ナガシマリゾート",
      postcode: "511-1192",
      prefecture_code: 24,
      address_city: "桑名市長島町浦安",
      address_street: "333",
      address_building: "",
      introduction: "ナガシマリゾートです。",
      access: "https://www.nagashima-onsen.co.jp/resort/access/index.html",
      phone_number: "0594-45-1111",
      business_hour: "https://www.nagashima-onsen.co.jp/resort/fee/index.html",
      parking: "https://www.nagashima-onsen.co.jp/resort/access/index.html",
      home_page: "https://www.nagashima-onsen.co.jp/"
    },
  ]
)

Review.create!(
  [
    { user_id: 1, travel_spot_id: 1, title: "レビュー1", body: "レビュー1です。" },
    { user_id: 2, travel_spot_id: 2, title: "レビュー2", body: "レビュー2です。" },
    { user_id: 3, travel_spot_id: 3, title: "レビュー3", body: "レビュー3です。" },
    { user_id: 4, travel_spot_id: 4, title: "レビュー4", body: "レビュー4です。" },
    { user_id: 5, travel_spot_id: 5, title: "レビュー5", body: "レビュー5です。" }
  ]
)
