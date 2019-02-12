# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'

Moon.destroy_all
Planet.destroy_all

html = open("https://www.windows2universe.org/our_solar_system/moons_table.html")
doc = Nokogiri::HTML(html)
#######################################
#Planets
#######################################
Planet.create(name: "Earth", size: "12,742", img_url: "https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2018/earthsoxygen.jpg", moon_count: 1)
Planet.create(name: "Mars", size: "6,779", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/OSIRIS_Mars_true_color.jpg/1200px-OSIRIS_Mars_true_color.jpg", moon_count: 2)
Planet.create(name: "Jupiter", size: "139,822", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg/220px-Jupiter_and_its_shrunken_Great_Red_Spot.jpg", moon_count: 63)
Planet.create(name: "Saturn", size: "116,464", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Saturn_during_Equinox.jpg/1200px-Saturn_during_Equinox.jpg", moon_count: 60)
Planet.create(name: "Uranus", size: "50,724", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Uranus2.jpg/220px-Uranus2.jpg", moon_count: 27)
Planet.create(name: "Neptune", size: "49,244", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Neptune_Full.jpg/1200px-Neptune_Full.jpg", moon_count: 13)

#######################################################################################################################

###############################################################
#Earth Moons ID:1
###############################################################
Moon.create(name: "Moon(Luna)", year_discovered: "?", distance: "384,400", size: "3476", img_url: "https://vignette.wikia.nocookie.net/warhammer40k/images/4/42/Luna.jpg/revision/latest?cb=20110825142346", planet_id: 1)

###############################################################
#Mars Moons ID:2
###############################################################
Moon.create(name: "Deimos", year_discovered: "1877", distance: "23,460", size: "8", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Deimos-MRO.jpg/220px-Deimos-MRO.jpg", planet_id: 2)
Moon.create(name: "Phobos", year_discovered: "1877", distance: "9,270", size: "28 X 20", img_url: "https://solarsystem.nasa.gov/system/content_pages/main_images/428_phobosincolor_pia10369.jpg", planet_id: 2)

##############################################################
#Jupiter Moons ID:3
##############################################################
jupiter_table = doc.css("table[cellpadding=5]")[1]
jupiter_moons = jupiter_table.css("tr[valign=center] strong").map{|moon|  {:name => moon.text}}
jupiter_moon_years_discovered = jupiter_table.css("tr[valign=center] td:nth-child(2)").map{|year| year.text}
jupiter_moon_distances_from_planet = jupiter_table.css("tr[valign=center] td:nth-child(4)").map{|dist| dist.text}
jupiter_moon_sizes_in_km = jupiter_table.css("tr[valign=center] td:nth-child(5)").map{|size| size.text}
jupiter_moon_images = [
    "http://homepage.eircom.net/~jackhiggins/celestia/images/adrastea1.jpg",
    "https://i.pinimg.com/originals/1f/90/61/1f9061cd4878ec5b70b968f0dd61eb25.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Amalthea_%28moon%29.png/220px-Amalthea_%28moon%29.png",
    "https://i.pinimg.com/originals/a2/91/66/a29166504052fb5a556ed79f2915d3fc.jpg",
    "https://i.pinimg.com/originals/d8/84/a2/d884a257663accf5946e4c7175a2f099.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/9/9a/Bigs2002j1barrow.png",
    "https://vignette.wikia.nocookie.net/solarsystem/images/e/e4/Autonoe.jpg/revision/latest?cb=20180611062340",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Callisto.jpg/220px-Callisto.jpg",
    "https://i.pinimg.com/originals/32/88/e1/3288e18f3b490e65cd966d71d96ef052.jpg",
    "https://cdn.disclose.tv/sites/default/files/img/inline/2018/02/04/callirrhoe.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Carpo.png/225px-Carpo.png",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/6/61/Chaldene.jpg/revision/latest?cb=20120814015903",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Elara2-LB1-mag17.jpg/220px-Elara2-LB1-mag17.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/2/2b/Erinome.jpg/revision/latest?cb=20120818203321",
    "https://i.pinimg.com/originals/da/16/21/da1621aac132ac25dfdf4305b12f608e.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/2/29/Euporie-1-1422x800.jpg/revision/latest?cb=20180123170547",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Europa-moon-with-margins.jpg/220px-Europa-moon-with-margins.jpg",
    "https://www.mpm.edu/sites/default/files/images/planetarium/eblasts/dec/Eurydome.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Ganymede_g1_true-edit1.jpg/220px-Ganymede_g1_true-edit1.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/f/f5/Harpalyke_%28moon%29.png/revision/latest?cb=20180302163545",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/7/70/Helike-1-1422x800.jpg/revision/latest?cb=20170908141234",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/6/61/Hermippe_%28moon%29.png/revision/latest?cb=20120915160507",
    "https://vignette.wikia.nocookie.net/galacticbattles/images/7/71/Himalia-moon.jpg/revision/latest?cb=20100228221710",
    "https://upload.wikimedia.org/wikipedia/commons/7/7b/Io_highest_resolution_true_color.jpg",
    "https://i.pinimg.com/originals/60/64/66/606466c83fe7d12a83198521c6e0113f.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/d/db/Isonoe.jpg/revision/latest?cb=20120824231512",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #Kallichore
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/8/8f/Kalyke.jpg/revision/latest?cb=20120815223541",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://vignette.wikia.nocookie.net/galacticbattles/images/3/34/Leda_%28moon%29.jpg/revision/latest?cb=20100228221711",
    "https://solethium.com/wp-content/uploads/2018/05/Lysithea.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/d/d5/Megaclite.jpg/revision/latest?cb=20120811013946",
    "http://planetary.s3.amazonaws.com/assets/images/5-jupiter/2013/20131017_metise26c0oo.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/a/a6/Mneme-1-1422x800.jpg/revision/latest?cb=20170908142035",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/8/8a/Orthosie-1-1422x800.jpg/revision/latest?cb=20180123171128",
    "https://i.pinimg.com/originals/fd/13/96/fd13969bfc6993ee82fe2eaded8b524f.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/5/5d/Pasithee.png/revision/latest?cb=20170909061918",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/4/40/Praxidike.jpg/revision/latest?cb=20120825033422",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/c/c0/Sinope.jpg/revision/latest?cb=20120807175551",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #Sponde
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #S/2000 J11
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #S/2003 J 23
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/c/c3/Taygete.jpg/revision/latest?cb=20120813191941",
    "https://i.pinimg.com/originals/40/6f/10/406f102e93e632d43a14410503cf1cf6.jpg",
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/b/b0/Thelxinoe-1-1422x800.jpg/revision/latest?cb=20180123170944",
    "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #Themisto
    "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/4/4a/Thyone.jpg/revision/latest?cb=20170908142255"
]

jupiter_moons.each.with_index{|moon, i|
  moon[:year_discovered] = jupiter_moon_years_discovered[i]
  moon[:distance] = jupiter_moon_distances_from_planet[i]
  moon[:size] = jupiter_moon_sizes_in_km[i]
  moon[:img_url] = jupiter_moon_images[i]
  moon[:planet_id] = 3
}

jupiter_moons.each{|moon| Moon.create!(moon)}

###############################################################
#Saturn Moons ID:4
###############################################################
saturn_table = doc.css("table[cellpadding=5]")[2]
saturn_moons = saturn_table.css("tr[valign=center] strong").map{|moon|  {:name => moon.text}}
saturn_moon_years_discovered = saturn_table.css("tr[valign=center] td:nth-child(2)").map{|year| year.text}
saturn_moon_distances_from_planet = saturn_table.css("tr[valign=center] td:nth-child(4)").map{|dist| dist.text}
saturn_moon_sizes_in_km = saturn_table.css("tr[valign=center] td:nth-child(5)").map{|size| size.text}
saturn_moon_images = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/PIA17193-SaturnMoon-Hyperion-20150531.jpg/220px-PIA17193-SaturnMoon-Hyperion-20150531.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/0/0c/Albiorix%2C_sat%C3%A9lite.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Anthe_N1832831075_1.jpg/220px-Anthe_N1832831075_1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/b/bd/Atlas_2017-04-12_raw_preview.jpg",
  "http://img.geocaching.com/cache/6bbdd734-94bf-4710-9c65-8dd75848e1b0.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PIA21436.jpg/220px-PIA21436.jpg",
  "https://static1.squarespace.com/static/57c4ce9d1b631b5c58eb6a71/5988df0e579fb39f04f821ae/5988eb2ab8a79bc9b8a9fb9b/1502171717027/Saturn_Bestla.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/b/b7/N00151485_Calypso_crop.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/PIA21056cropsharpen.jpg/220px-PIA21056cropsharpen.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Dione_in_natural_light.jpg/220px-Dione_in_natural_light.jpg",
  "http://www.jpl.nasa.gov/edu/images/enceladus.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/PIA09813_Epimetheus_S._polar_region.jpg/260px-PIA09813_Epimetheus_S._polar_region.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "http://jto.s3.amazonaws.com/wp-content/uploads/2013/08/wn20130803h3a.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "http://solarviews.com/thumb/pia/PIA12773.jpg",
  "https://img.purch.com/w/660/aHR0cDovL3d3dy5zcGFjZS5jb20vaW1hZ2VzL2kvMDAwLzAyOC8yNTQvb3JpZ2luYWwvaHlwZXJpb24uanBn",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Iapetus.jpg/220px-Iapetus.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/PIA12714_Janus_crop.jpg/220px-PIA12714_Janus_crop.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Jarnsaxa%2C_sat%C3%A9lite.jpg/250px-Jarnsaxa%2C_sat%C3%A9lite.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/3/39/Saturn_Kiviuq.jpg/revision/latest?cb=20180325093835",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/2/2c/Methone_PIA14633.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/b/bc/Mimas_Cassini.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Mundilfari_by_prog_Celeste.jpg/220px-Mundilfari_by_prog_Celeste.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/c/c9/Narvi.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Paaliaq.jpg/200px-Paaliaq.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Pallene_N1665945513_1.jpg/220px-Pallene_N1665945513_1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PIA21436.jpg/220px-PIA21436.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/b/bc/PIA21055_-_Pandora_Up_Close.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Phoebe_closeup_cassini_NASA.jpg/220px-Phoebe_closeup_cassini_NASA.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/0/04/Polydeuces.jpg",
  "http://solarviews.com/thumb/pia/PIA12548.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/PIA07763_Rhea_full_globe5.jpg/220px-PIA07763_Rhea_full_globe5.jpg",
  "https://solarsystem.nasa.gov/images/casJPGBrowseS78/N00205937.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Skoll.png/220px-Skoll.png",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/1/17/Saturn.Suttungr_%281_of_1%29.jpg/revision/latest?cb=20170909071710",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #S/2004 S13
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #S/2004 S17
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #S/2007 S3
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg", #Tarqeq
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/a/ac/Tarvos.jpg/revision/latest?cb=20180518150441",
  "https://upload.wikimedia.org/wikipedia/commons/b/b6/Telesto_cassini_closeup.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/PIA18317-SaturnMoon-Tethys-Cassini-20150411.jpg/220px-PIA18317-SaturnMoon-Tethys-Cassini-20150411.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/d/df/Thrymr_from_Cassini.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/4/45/Titan_in_true_color.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg" #Ymir
]

saturn_moons.each.with_index{|moon, i|
  moon[:year_discovered] = saturn_moon_years_discovered[i]
  moon[:distance] = saturn_moon_distances_from_planet[i]
  moon[:size] = saturn_moon_sizes_in_km[i]
  moon[:img_url] = saturn_moon_images[i]
  moon[:planet_id] = 4
}

saturn_moons.each{|moon| Moon.create!(moon)}

###############################################################
#Uranus Moons ID:5
###############################################################
uranus_table = doc.css("table[cellpadding=5]")[3]
uranus_moons = uranus_table.css("tr[valign=center] strong").map{|moon|  {:name => moon.text}}
uranus_moon_years_discovered = uranus_table.css("tr[valign=center] td:nth-child(2)").map{|year| year.text}
uranus_moon_distances_from_planet = uranus_table.css("tr[valign=center] td:nth-child(4)").map{|dist| dist.text}
uranus_moon_sizes_in_km = uranus_table.css("tr[valign=center] td:nth-child(5)").map{|size| size.text}
uranus_moon_images = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Ariel_USGS.png/220px-Ariel_USGS.png",
  "https://cdn.britannica.com/s:500x350/32/78232-004-0360C6BD.jpg",
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/d/d0/URANUS_BIANCA.jpg/revision/latest?cb=20170908134145",
  "https://upload.wikimedia.org/wikipedia/commons/b/b2/Caliban_feat.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Cordeliamoon.png/220px-Cordeliamoon.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Cressida.png/220px-Cressida.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Cupidmoon.png/220px-Cupidmoon.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Desdemonamoon.png/220px-Desdemonamoon.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/TheIrregulars_URANUS_retro.svg/800px-TheIrregulars_URANUS_retro.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/0/08/Uranus_moon_021002_02.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Julietmoon.png/220px-Julietmoon.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Mabmoon.png/220px-Mabmoon.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/TheIrregulars_URANUS.svg/290px-TheIrregulars_URANUS.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/PIA18185_Miranda%27s_Icy_Face.jpg/220px-PIA18185_Miranda%27s_Icy_Face.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Voyager_2_picture_of_Oberon.jpg/220px-Voyager_2_picture_of_Oberon.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Opheliamoon.png/220px-Opheliamoon.png",
  "https://upload.wikimedia.org/wikipedia/commons/f/f9/Perdita_%28moon%29.png",
  "https://www.go-astronomy.com/images/moons/uranus-moon-portia-cressida.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Puck.png/220px-Puck.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Rosalindmoon.png/220px-Rosalindmoon.png",
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/1/16/Setebos17.png/revision/latest?cb=20170908135855",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Stephano_-_Uranus_moon.jpg/220px-Stephano_-_Uranus_moon.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Sycorax.png/268px-Sycorax.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Titania_%28moon%29_color%2C_edited.jpg/260px-Titania_%28moon%29_color%2C_edited.jpg",
  "https://ak5.picdn.net/shutterstock/videos/6051815/thumb/1.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/PIA00040_Umbrielx2.47.jpg/260px-PIA00040_Umbrielx2.47.jpg"
]
uranus_moons.each.with_index{|moon, i|
  moon[:year_discovered] = uranus_moon_years_discovered[i]
  moon[:distance] = uranus_moon_distances_from_planet[i]
  moon[:size] = uranus_moon_sizes_in_km[i]
  moon[:img_url] = uranus_moon_images[i]
  moon[:planet_id] = 5
}

uranus_moons.each{|moon| Moon.create!(moon)}

###############################################################
#Neptune Moons ID: 6
###############################################################
neptune_table = doc.css("table[cellpadding=5]")[4]
neptune_moons = neptune_table.css("tr[valign=center] strong").map{|moon|  {:name => moon.text}}
neptune_moon_years_discovered = neptune_table.css("tr[valign=center] td:nth-child(2)").map{|year| year.text}
neptune_moon_distances_from_planet = neptune_table.css("tr[valign=center] td:nth-child(4)").map{|dist| dist.text}
neptune_moon_sizes_in_km = neptune_table.css("tr[valign=center] td:nth-child(5)").map{|size| size.text}
neptune_moon_images = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Simulated_view_of_Despina.jpg/220px-Simulated_view_of_Despina.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/a/aa/Simulated_view_of_Galatea.jpg",
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/e/ea/Halimede_Moon.png/revision/latest?cb=20170909164019",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Simulated_view_of_Larissa.jpg/220px-Simulated_view_of_Larissa.jpg",
  "https://alchetron.com/cdn/laomedeia-3f813d0a-387c-4f3c-9535-0fb04658979-resize-750.jpeg",
  "https://kids.kiddle.co/images/thumb/4/46/Simulated_view_of_Naiad.jpg/614px-Simulated_view_of_Naiad.jpg",
  "https://alchetron.com/cdn/nereid-moon-5c11cbe6-d033-46cd-82a3-f3e3bb991c2-resize-750.jpeg",
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/5/52/Neso-celestia.jpg/revision/latest?cb=20170909164842",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Proteus_%28Voyager_2%29.jpg/220px-Proteus_%28Voyager_2%29.jpg",
  "https://vignette.wikia.nocookie.net/thesolarsystem6361/images/0/02/Psamathe.png/revision/latest?cb=20180305122253",
  "https://3c1703fe8d.site.internapcdn.net/newman/gfx/news/hires/2012/theoriginoft.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Simulated_view_of_Thalassa.jpg/250px-Simulated_view_of_Thalassa.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Triton_moon_mosaic_Voyager_2_%28large%29.jpg/300px-Triton_moon_mosaic_Voyager_2_%28large%29.jpg"
]

# Planet.create(name: "Neptune")
neptune_moons.each.with_index {|moon, i|
  moon[:year_discovered] = neptune_moon_years_discovered[i]
  moon[:distance] = neptune_moon_distances_from_planet[i]
  moon[:size] = neptune_moon_sizes_in_km[i]
  moon[:img_url] = neptune_moon_images[i]
  moon[:planet_id] = 6
}

neptune_moons.each{|moon| Moon.create!(moon)}
