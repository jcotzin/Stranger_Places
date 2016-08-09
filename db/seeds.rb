Place.create!([
  {name: "Benagil Sea Cave", description: "Marvel at the beautiful nature formations off Portimao. Benagil Caves are considered some of the most exotic beaches in the world.", latitude: 37.0874, longitude: 8.4259, city: "Lagoa", state_province: nil, country: "Portugal", airport: "FAO", main_img:"http://i4.piimg.com/9510/209dcf9fa3878fd0.jpg"},
  {name: "Byodo-In Temple", description: "Byodo-In is a replica of a temple in Kyoto, commissioned in 1968 to commemorate the opening of Japan in 1868 and the arrival of the first immigrants to Hawaii.", latitude: 21.4307, longitude: 157.8322, city: "Ahiumanu", state_province: nil, country: "Hawaii", airport: "HNL", main_img:"http://damedovolenou.com/wp-content/uploads/2016/06/Japonsko.jpg"},
  {name: "Machu Picchu", description: "Dating to the mid-1400s, Machu Picchu is a marvel of mortar-free limestone architecture perched on a high plateau deep in the Amazonian jungle.", latitude: 13.1631, longitude: 72.545, city: "Cuzco", state_province: nil, country: "Peru", airport: "CUZ", main_img:"http://travelier.mx/wp-content/uploads/2015/12/Fotolia_69910180_Subscription_Monthly_M.jpg"},
  {name: "Mù Cang Chải", description: "Once called 'The forgotten land in Viet Name', Mù Cang Chải has a stunning natural landscape and traditional way of living.", latitude: 21.767, longitude: 104.1466, city: "YenBai", state_province: "Yen Bai", country: "Vietnam", airport: "SQH", main_img:"http://travelier.mx/wp-content/uploads/2015/12/Fotolia_69910180_Subscription_Monthly_M.jpg"},
  {name: "Travertine Hot Springs", description: "The white travertine pools of Pamukkale cascade down the cliffs below the ancient Roman city of Hierapolis", latitude: 37.9186, longitude: 29.1103, city: "Denizli", state_province: "Denizli Province", country: "Turkey", airport: "DNZ", main_img:"http://thoidai.com.vn/data/data/nguyenvu/files/gam-mau-ruc-ro-tren-nhung-thua-ruong-bac-thang/4.jpg"},
  {name: "Procida", description: "Procida is the quintessential Mediterranean paradise, an absolute vision of colorful harborside homes and picturesque piazzas.", latitude: 40.7578, longitude: 14.0151, city: "Procida Island", state_province: nil, country: "Italy", main_img:"http://www.brotherstaxikusadasi.com/wp-content/uploads/photo-gallery/pamukkale%20(28).jpg"},
  {name: "Ahu Tongariki", description: "The monumental Ahu Tongariki has 15 imposing and majestic statues, and it is the largest ahu ever built.", latitude: 27.113, longitude: 109.3496, city: "Easter Island", state_province: nil, country: "Chile", airport: "IPC", main_img:"http://api.ning.com/files/t7OHPZDdmLu8TgQu1Nr00X1*eCWQt1j2-rxg06eNBPb0gD-5Km8HyhocR9UnpD-V5rpyaJSJ*Wh2ok6Bz2278rYXw8QCvBKm/RapaNui011.jpg"},
  {name: "Mohatta Palace", description: "The Mohatta Palace is the pride of Karachi, and a treasure trove of arts, constructed in 1927.", latitude: 24.8146, longitude: 67.0325, city: "Karachi", state_province: nil, country: "Pakistan", airport: "KHI", main_img:"https://upload.wikimedia.org/wikipedia/commons/e/eb/Mohatta_Palace.jpg"},
  {name: "Turkey Hot Air Balloons", description: "Down in the valley...a hot-air balloon drifts right among the fairy chimneys of Cappadocia.", latitude: 38.6463, longitude: 34.8423, city: "Cappadocia", state_province: nil, country: "Turkey", airport: "NAV", main_img:"http://atis.com.sg/deal/static/team/2015/0910/14418756001329.jpg"}
])
User.create!([
  {name: "Jessica", email: "jcotzin@gmail.com", password_digest: "$2a$10$LZ.Xc4TOBHkjx7z6trZdYOUPMsG6Ddxhr54337irFHZexPbiNQ6JG"}
])
Tag.create!([
  {name:"Adventure"},
  {name:"Beaches"},
  {name:"Budget"},
  {name:"Family"},
  {name:"Honeymoon"},
  {name:"Romance"},
  {name:"Tropical"},
  {name:"Luxury"},
  {name:"Wildlife"},
  {name:"Outdoor"},
  {name:"Nature"},
  {name:"Historic"},
  ])
# places.each do |place|
#   Place.create!(place)
# end
