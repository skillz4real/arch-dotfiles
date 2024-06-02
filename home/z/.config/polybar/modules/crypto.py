#! /usr/bin/python3
import json
import requests
import os
import sys

btc_response = requests.api.get("https://api.coinranking.com/v2/coin/Qwsogvtv82FCd", params=f"x-access-token: {os.getenv('COINRANK_API')}").text

btc_data = json.loads(btc_response)['data']['coin']
btc_symbol = btc_data['symbol']
btc_price = round(float(btc_data['price']),2)


xmr_response = requests.api.get("https://api.coinranking.com/v2/coin/3mVx2FX_iJFp5",  params=f"x-access-token: {os.getenv('COINRANK_API')}").text

xmr_data = json.loads(xmr_response)['data']['coin']
xmr_symbol = xmr_data['symbol']
xmr_price = round(float(xmr_data['price']),2)

sys.stdout.write(f"₿:{btc_price}\t\tXMR:{xmr_price}\t")
