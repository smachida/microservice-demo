#!/bin/bash
body='{"productId":1,"name":"product name C","weight":300,"recommendations":[{"recommendationId":1,"author":"author 1","rate":1,"content":"content 1"},{"recommendationId":2,"author":"author 2","rate":2,"content":"content 2"}],"reviews":[{"reviewId":1,"author":"author 1","subject":"subject 1","content":"content 1"}]}'

curl -X POST localhost:8080/product-composite -H "Content-Type: application/json" --data "$body"
