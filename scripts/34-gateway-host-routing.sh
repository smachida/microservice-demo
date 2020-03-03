#!/bin/bash
curl http://localhost:8080/headerrouting -H "Host: i.feel.lucky:8080"
echo ""
curl http://localhost:8080/headerrouting -H "Host: im.a.teapot:8080"
echo ""
curl http://localhost:8080/headerrouting
echo ""

