# -*- restclient -*-
#
# refs
# https://www.mediawiki.org/wiki/API:Login
# https://github.com/pashky/restclient.el




# Determine required fields for login type of request (which, for login uses POST)
# The results: username, password, token
GET https://en.wikipedia.org/w/api.php?action=query&meta=authmanagerinfo&amirequestsfor=login&format=json


# get a login token
GET https://en.wikipedia.org/w/api.php?action=query&meta=tokens&type=login&format=json
User-Agent: Emacs Restclient


# login
POST https://en.wikipedia.org/w/api.php?action=clientlogin&username=paxperscientiam&format=json
Content-Type: application/json

{
 "logintoken": "3cc9e95788a533bd41d158534ad0f93c5a10ca60"
}



# example login
POST https://www.mediawiki.org/w/api.php?action=clientlogin&username=Example&password=ExamplePassword&loginreturnurl=http://example.org/&logintoken=36c7278b27a7cf156c75e615766d54a65a110c1b&format=json