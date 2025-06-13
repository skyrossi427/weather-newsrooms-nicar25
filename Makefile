# SOURCE_URL:="https://api.weather.gov/alerts/active?status=actual&area=CA&code=HWW"
SOURCE_URL:="https://api.weather.gov/alerts/active?status=actual&area=MO"

all: clean download slack

download:
	-mkdir tmp
	wget --continue --progress=dot:mega --waitretry=60 ${SOURCE_URL} \
		--header='accept: application/geo+json' \
		--header='User-Agent: (kcur.org, skylerrossi@kcur.org)' \
		-O tmp/download.json

warnings:
	node warnings.js

slack:
	node warnings-slack.js

clean:
	-rm ./tmp/download.json
