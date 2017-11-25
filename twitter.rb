
require 'twitter'
#!/usr/bin/env ruby

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "pLfb7LaDNFTnEIXZPqlQAyPNE"
  config.consumer_secret     = "ihlTl79hwzed273DQO6RSntJ8zAIMkGcTfwXU2qb4kz4xZd3IK"
  config.access_token        = "835971380873158656-CPYV4OkOq4dlIsl26WKFOH4mSIigCHE"
  config.access_token_secret = "vWlWzOp4PYW0N4AarRMzdztVC0ERBwEDqfOh7KHcmaXmG"
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