Country::COUNTRIES ||= Hash[Hash[ISO3166::Country::Data.collect { |code, data| [code, data["name"]] }].sort_by{|k,v| v}]

priority = {"DE" => "Germany"}

Country::PRIORITY_COUNTRIES = priority.merge(Country::COUNTRIES)

Country::COUNTRY_CODES ||= ISO3166::Country::Data.map{|code, data| code }

