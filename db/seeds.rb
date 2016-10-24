require('pry-byebug')
require_relative('./sql_runner.rb')
require_relative('../models/country.rb')
require_relative('../models/participant.rb')
require_relative('../models/event.rb')
require_relative('../models/result.rb')

#COUNTRIES
russia1 = Country.new({'name' => "Russia"})
united_states2 = Country.new({'name' => "United States"})
norway3 = Country.new({'name' => "Norway"})
australia4 = Country.new({'name' => "Australia"})
netherlands5 = Country.new({'name' => "Netherlands"})
germany6 = Country.new({'name' => "Germany"})
austria7 = Country.new({'name' => "Austria"})
france8 = Country.new({'name' => "France"})
sweden9 = Country.new({'name' => "Sweden"})
switzerland10 = Country.new({'name' => "Switzerland"})
china11 = Country.new({'name' => "China"})
korea12 = Country.new({'name' => "Korea"})

russia1.save
united_states2.save
norway3.save
australia4.save
netherlands5.save
germany6.save
austria7.save
france8.save
sweden9.save
switzerland10.save
china11.save
korea12.save

#PARTICIPANTS
participant1 = Participant.new({'name' => "Participant1", 'country_id' => 6})
participant2 = Participant.new({'name' => "Participant2", 'country_id' => 3})
participant3 = Participant.new({'name' => "Participant3", 'country_id' => 8})
participant4 = Participant.new({'name' => "Participant4", 'country_id' => 9})
participant5 = Participant.new({'name' => "Participant5", 'country_id' => 11})
participant6 = Participant.new({'name' => "Participant6", 'country_id' => 5})
participant7 = Participant.new({'name' => "Participant7", 'country_id' => 1})
participant8 = Participant.new({'name' => "Participant8", 'country_id' => 9})
participant9 = Participant.new({'name' => "Participant9", 'country_id' => 2})
participant10 = Participant.new({'name' => "Participant10", 'country_id' => 6})
participant11 = Participant.new({'name' => "Participant11", 'country_id' => 7})
participant12 = Participant.new({'name' => "Participant12", 'country_id' => 9})
participant13 = Participant.new({'name' => "Participant13", 'country_id' => 2})
participant14 = Participant.new({'name' => "Participant14", 'country_id' => 4})
participant15 = Participant.new({'name' => "Participant15", 'country_id' => 10})
participant16 = Participant.new({'name' => "Participant16", 'country_id' => 12})
participant17 = Participant.new({'name' => "Participant17", 'country_id' => 6})
participant18 = Participant.new({'name' => "Participant18", 'country_id' => 1})
participant19 = Participant.new({'name' => "Participant19", 'country_id' => 3})
participant20 = Participant.new({'name' => "Participant20", 'country_id' => 8})
participant21 = Participant.new({'name' => "Participant21", 'country_id' => 9})
participant22 = Participant.new({'name' => "Participant22", 'country_id' => 11})
participant23 = Participant.new({'name' => "Participant23", 'country_id' => 10})
participant24 = Participant.new({'name' => "Participant24", 'country_id' => 8})
participant25 = Participant.new({'name' => "Participant25", 'country_id' => 9})
participant26 = Participant.new({'name' => "Participant26", 'country_id' => 2})
participant27 = Participant.new({'name' => "Participant27", 'country_id' => 8})
participant28 = Participant.new({'name' => "Participant28", 'country_id' => 5})
participant29 = Participant.new({'name' => "Participant29", 'country_id' => 10})
participant30 = Participant.new({'name' => "Participant30", 'country_id' => 11})
participant31 = Participant.new({'name' => "Participant31", 'country_id' => 6})
participant32 = Participant.new({'name' => "Participant32", 'country_id' => 5})
participant33 = Participant.new({'name' => "Participant33", 'country_id' => 2})
participant34 = Participant.new({'name' => "Participant34", 'country_id' => 1})
participant35 = Participant.new({'name' => "Participant35", 'country_id' => 9})
participant36 = Participant.new({'name' => "Participant36", 'country_id' => 10})
participant37 = Participant.new({'name' => "Participant37", 'country_id' => 12})
participant38 = Participant.new({'name' => "Participant38", 'country_id' => 1})
participant39 = Participant.new({'name' => "Participant39", 'country_id' => 8})
participant40 = Participant.new({'name' => "Participant40", 'country_id' => 2})
participant41 = Participant.new({'name' => "Participant41", 'country_id' => 9})
participant42 = Participant.new({'name' => "Participant42", 'country_id' => 4})
participant43 = Participant.new({'name' => "Participant43", 'country_id' => 6})
participant44 = Participant.new({'name' => "Participant44", 'country_id' => 7})
participant45 = Participant.new({'name' => "Participant45", 'country_id' => 3})
participant46 = Participant.new({'name' => "Participant46", 'country_id' => 2})
participant47 = Participant.new({'name' => "Participant47", 'country_id' => 8})
participant48 = Participant.new({'name' => "Participant48", 'country_id' => 11})
participant49 = Participant.new({'name' => "Participant49", 'country_id' => 10})
participant50 = Participant.new({'name' => "Participant50", 'country_id' => 8})
participant51 = Participant.new({'name' => "Participant51", 'country_id' => 4})
participant52 = Participant.new({'name' => "Participant52", 'country_id' => 2})
participant53 = Participant.new({'name' => "Participant53", 'country_id' => 12})
participant54 = Participant.new({'name' => "Participant54", 'country_id' => 12})
participant55 = Participant.new({'name' => "Participant55", 'country_id' => 5})
participant56 = Participant.new({'name' => "Participant56", 'country_id' => 8})
participant57 = Participant.new({'name' => "Participant57", 'country_id' => 9})
participant58 = Participant.new({'name' => "Participant58", 'country_id' => 2})
participant59 = Participant.new({'name' => "Participant59", 'country_id' => 4})
participant60 = Participant.new({'name' => "Participant60", 'country_id' => 1})
participant61 = Participant.new({'name' => "Participant61", 'country_id' => 7})
participant62 = Participant.new({'name' => "Participant62", 'country_id' => 8})
participant63 = Participant.new({'name' => "Participant63", 'country_id' => 4})
participant64 = Participant.new({'name' => "Participant64", 'country_id' => 10})
participant65 = Participant.new({'name' => "Participant65", 'country_id' => 3})
participant66 = Participant.new({'name' => "Participant66", 'country_id' => 4})
participant67 = Participant.new({'name' => "Participant67", 'country_id' => 8})
participant68 = Participant.new({'name' => "Participant68", 'country_id' => 7})
participant69 = Participant.new({'name' => "Participant69", 'country_id' => 6})
participant70 = Participant.new({'name' => "Participant70", 'country_id' => 7})
participant71 = Participant.new({'name' => "Participant71", 'country_id' => 8})
participant72 = Participant.new({'name' => "Participant72", 'country_id' => 4})
participant73 = Participant.new({'name' => "Participant73", 'country_id' => 2})
participant74 = Participant.new({'name' => "Participant74", 'country_id' => 9})
participant75 = Participant.new({'name' => "Participant75", 'country_id' => 1})
participant76 = Participant.new({'name' => "Participant76", 'country_id' => 6})
participant77 = Participant.new({'name' => "Participant77", 'country_id' => 5})
participant78 = Participant.new({'name' => "Participant78", 'country_id' => 4})
participant79 = Participant.new({'name' => "Participant79", 'country_id' => 4})
participant80 = Participant.new({'name' => "Participant80", 'country_id' => 4})
participant81 = Participant.new({'name' => "Participant81", 'country_id' => 7})
participant82 = Participant.new({'name' => "Participant82", 'country_id' => 2})
participant83 = Participant.new({'name' => "Participant83", 'country_id' => 2})
participant84 = Participant.new({'name' => "Participant84", 'country_id' => 2})
participant85 = Participant.new({'name' => "Participant85", 'country_id' => 10})
participant86 = Participant.new({'name' => "Participant86", 'country_id' => 11})
participant87 = Participant.new({'name' => "Participant87", 'country_id' => 11})
participant88 = Participant.new({'name' => "Participant88", 'country_id' => 11})
participant89 = Participant.new({'name' => "Participant89", 'country_id' => 8})
participant90 = Participant.new({'name' => "Participant90", 'country_id' => 3})
participant91 = Participant.new({'name' => "Participant91", 'country_id' => 5})
participant92 = Participant.new({'name' => "Participant92", 'country_id' => 2})
participant93 = Participant.new({'name' => "Participant93", 'country_id' => 9})
participant94 = Participant.new({'name' => "Participant94", 'country_id' => 7})
participant95 = Participant.new({'name' => "Participant95", 'country_id' => 7})
participant96 = Participant.new({'name' => "Participant96", 'country_id' => 6})
participant97 = Participant.new({'name' => "Participant97", 'country_id' => 5})
participant98 = Participant.new({'name' => "Participant98", 'country_id' => 4})
participant99 = Participant.new({'name' => "Participant99", 'country_id' => 5})
participant100 = Participant.new({'name' => "Participant100", 'country_id' => 8})

participant1.save()
participant2.save()
participant3.save()
participant4.save()
participant5.save()
participant6.save()
participant7.save()
participant8.save()
participant9.save()
participant10.save()
participant11.save()
participant12.save()
participant13.save()
participant14.save()
participant15.save()
participant16.save()
participant17.save()
participant18.save()
participant19.save()
participant20.save()
participant21.save()
participant22.save()
participant23.save()
participant24.save()
participant25.save()
participant26.save()
participant27.save()
participant28.save()
participant29.save()
participant30.save()
participant31.save()
participant32.save()
participant33.save()
participant34.save()
participant35.save()
participant36.save()
participant37.save()
participant38.save()
participant39.save()
participant40.save()
participant41.save()
participant42.save()
participant43.save()
participant44.save()
participant45.save()
participant46.save()
participant47.save()
participant48.save()
participant49.save()
participant50.save()
participant51.save()
participant52.save()
participant53.save()
participant54.save()
participant55.save()
participant56.save()
participant57.save()
participant58.save()
participant59.save()
participant60.save()
participant61.save()
participant62.save()
participant63.save()
participant64.save()
participant65.save()
participant66.save()
participant67.save()
participant68.save()
participant69.save()
participant70.save()
participant71.save()
participant72.save()
participant73.save()
participant74.save()
participant75.save()
participant76.save()
participant77.save()
participant78.save()
participant79.save()
participant80.save()
participant81.save()
participant82.save()
participant83.save()
participant84.save()
participant85.save()
participant86.save()
participant87.save()
participant88.save()
participant89.save()
participant90.save()
participant91.save()
participant92.save()
participant93.save()
participant94.save()
participant95.save()
participant96.save()
participant97.save()
participant98.save()
participant99.save()
participant100.save()

#EVENTS
event1 = Event.new({'name' => "Men''s Singles", 'sport' => "Figure Skating"})
event2 = Event.new({'name' => "Women''s Singles", 'sport' => "Figure Skating"})
event3 = Event.new({'name' => "Pairs", 'sport' => "Figure Skating"})
event4 = Event.new({'name' => "Ice Dance", 'sport' => "Figure Skating"})
event5 = Event.new({'name' => "Team", 'sport' => "Figure Skating"})
event6 = Event.new({'name' => "Men", 'sport' => "Ice Hockey"})
event7 = Event.new({'name' => "Women", 'sport' => "Ice Hockey"})
event8 = Event.new({'name' => "Men''s Singles", 'sport' => "Luge"})
event9 = Event.new({'name' => "Women''s Singles", 'sport' => "Luge"})
event10 = Event.new({'name' => "Doubles", 'sport' => "Luge"})
event11 = Event.new({'name' => "Team Relay", 'sport' => "Luge"})
event12 = Event.new({'name' => "Men", 'sport' => "Curling"})
event13 = Event.new({'name' => "Women", 'sport' => "Curling"})
event14 = Event.new({'name' => "Men''s Ski Slopestyle", 'sport' => "Freestyle Skiing"})
event15 = Event.new({'name' => "Women''s Ski Slopestyle", 'sport' => "Freestyle Skiing"})

event1.save()
event2.save()
event3.save()
event4.save()
event5.save()
event6.save()
event7.save()
event8.save()
event9.save()
event10.save()
event11.save()
event12.save()
event13.save()
event14.save()
event15.save()

#RESULTS
result1 = Result.new({'participant_id' => participant1.id, 'event_id' => event1.id, 'result' => 1})
result2 = Result.new({'participant_id' => participant12.id, 'event_id' => event1.id, 'result' => 2})
result3 = Result.new({'participant_id' => participant16.id, 'event_id' => event1.id, 'result' => 3})
result4 = Result.new({'participant_id' => participant3.id, 'event_id' => event2.id, 'result' => 1})
result5 = Result.new({'participant_id' => participant35.id, 'event_id' => event2.id, 'result' => 2})
result6 = Result.new({'participant_id' => participant67.id, 'event_id' => event2.id, 'result' => 3})
result7 = Result.new({'participant_id' => participant26.id, 'event_id' => event3.id, 'result' => 1})
result8 = Result.new({'participant_id' => participant19.id, 'event_id' => event3.id, 'result' => 2})
result9 = Result.new({'participant_id' => participant48.id, 'event_id' => event3.id, 'result' => 3})
result10 = Result.new({'participant_id' => participant3.id, 'event_id' => event4.id, 'result' => 1})
result11 = Result.new({'participant_id' => participant19.id, 'event_id' => event4.id, 'result' => 2})
result12 = Result.new({'participant_id' => participant94.id, 'event_id' => event4.id, 'result' => 3})
result13 = Result.new({'participant_id' => participant57.id, 'event_id' => event5.id, 'result' => 1})
result14 = Result.new({'participant_id' => participant86.id, 'event_id' => event5.id, 'result' => 2})
result15 = Result.new({'participant_id' => participant26.id, 'event_id' => event5.id, 'result' => 3})
result16 = Result.new({'participant_id' => participant99.id, 'event_id' => event6.id, 'result' => 1})
result17 = Result.new({'participant_id' => participant5.id, 'event_id' => event6.id, 'result' => 2})
result18 = Result.new({'participant_id' => participant33.id, 'event_id' => event6.id, 'result' => 3})
result19 = Result.new({'participant_id' => participant20.id, 'event_id' => event7.id, 'result' => 1})
result20 = Result.new({'participant_id' => participant69.id, 'event_id' => event7.id, 'result' => 2})
result21 = Result.new({'participant_id' => participant66.id, 'event_id' => event7.id, 'result' => 3})
result22 = Result.new({'participant_id' => participant70.id, 'event_id' => event8.id, 'result' => 1})
result23 = Result.new({'participant_id' => participant64.id, 'event_id' => event8.id, 'result' => 2})
result24 = Result.new({'participant_id' => participant22.id, 'event_id' => event8.id, 'result' => 3})
result25 = Result.new({'participant_id' => participant47.id, 'event_id' => event9.id, 'result' => 1})
result26 = Result.new({'participant_id' => participant68.id, 'event_id' => event9.id, 'result' => 2})
result27 = Result.new({'participant_id' => participant33.id, 'event_id' => event9.id, 'result' => 3})
result28 = Result.new({'participant_id' => participant71.id, 'event_id' => event10.id, 'result' => 1})
result29 = Result.new({'participant_id' => participant26.id, 'event_id' => event10.id, 'result' => 2})
result30 = Result.new({'participant_id' => participant18.id, 'event_id' => event10.id, 'result' => 3})
result31 = Result.new({'participant_id' => participant42.id, 'event_id' => event11.id, 'result' => 1})
result32 = Result.new({'participant_id' => participant88.id, 'event_id' => event11.id, 'result' => 2})
result33 = Result.new({'participant_id' => participant62.id, 'event_id' => event11.id, 'result' => 3})
result34 = Result.new({'participant_id' => participant22.id, 'event_id' => event12.id, 'result' => 1})
result35 = Result.new({'participant_id' => participant59.id, 'event_id' => event12.id, 'result' => 2})
result36 = Result.new({'participant_id' => participant47.id, 'event_id' => event12.id, 'result' => 3})
result37 = Result.new({'participant_id' => participant21.id, 'event_id' => event13.id, 'result' => 1})
result38 = Result.new({'participant_id' => participant48.id, 'event_id' => event13.id, 'result' => 2})
result39 = Result.new({'participant_id' => participant89.id, 'event_id' => event13.id, 'result' => 3})
result40 = Result.new({'participant_id' => participant74.id, 'event_id' => event14.id, 'result' => 1})
result41 = Result.new({'participant_id' => participant28.id, 'event_id' => event14.id, 'result' => 2})
result42 = Result.new({'participant_id' => participant48.id, 'event_id' => event14.id, 'result' => 3})
result43 = Result.new({'participant_id' => participant54.id, 'event_id' => event15.id, 'result' => 1})
result44 = Result.new({'participant_id' => participant96.id, 'event_id' => event15.id, 'result' => 2})
result45 = Result.new({'participant_id' => participant48.id, 'event_id' => event15.id, 'result' => 3})

result1.save()
result2.save()
result3.save()
result4.save()
result5.save()
result6.save()
result7.save()
result8.save()
result9.save()
result10.save()
result11.save()
result12.save()
result13.save()
result14.save()
result15.save()
result16.save()
result17.save()
result18.save()
result19.save()
result20.save()
result21.save()
result22.save()
result23.save()
result24.save()
result25.save()
result26.save()
result27.save()
result28.save()
result29.save()
result30.save()
result31.save()
result32.save()
result33.save()
result34.save()
result35.save()
result36.save()
result37.save()
result38.save()
result39.save()
result40.save()
result41.save()
result42.save()
result43.save()
result44.save()
result45.save()

# germany6.participants
# Participant.bronze_medallists
# Country.rank_all
# event1.gold_medallist


binding.pry
nil