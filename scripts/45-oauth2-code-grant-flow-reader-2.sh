#!/bin/bash
curl -k https://reader:secret@localhost:8443/oauth/token -d grant_type=authorization_code -d client_id=reader -d redirect_uri="http://my.redirect.uri" -d code=$CODE -s | jq .
