
require 'twitter'
#!/usr/bin/env ruby

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end


	promotion = {
		"photo" => "promo.jpg",
  		"text" => "Code réduction Beauté Privée : '10%' offerts sur la rubrique Fait le buzz, c'est presque magique, jetez vous dessus avec le code LUCKYDAY depuis le site marchand #promo #codepromo #beauteprivee http://inscription.beauteprivee.fr/2014-maquillage-livraison/7776bbd1aac33d6743b5b7ecc2960085?utm_medium=affiliation&utm_source=public-idees&utm_campaign=35315"
  	}


client.search("#beauteprivee").take(10).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
      users = []
      users.push(tweet.user.id)
      puts tweet
      client.follow(users)
  		client.favorite(tweet)
  		client.update_with_media("@#{tweet.user.screen_name} " + promotion["text"], open(promotion["photo"]), {})

end
