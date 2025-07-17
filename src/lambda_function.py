import json
import requests
from bs4 import BeautifulSoup
import urllib.parse

def lambda_handler(event, context):
    # Get URL from query string parameters
    url = event.get('queryStringParameters', {}).get('url', '')
    
    # URL decode the parameter
    url = urllib.parse.unquote(url)

    if not url:
        return {
            'statusCode': 400,
            'body': json.dumps('URL is required')
        }

    # Headers to mimic browser request
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language': 'en-US,en;q=0.5',
        'Connection': 'keep-alive',
    }

    try:
        # Make request to Amazon
        response = requests.get(url, headers=headers)
        soup = BeautifulSoup(response.content, 'html.parser')

        # Extract product details
        product_data = {
            'title': get_title(soup),
            'price': get_price(soup),
            'description': get_description(soup)
        }

        return {
            'statusCode': 200,
            'body': json.dumps(product_data),
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            }
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)}),
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            }
        }

def get_title(soup):
    try:
        return soup.find('span', {'id': 'productTitle'}).text.strip()
    except:
        return None

def get_price(soup):
    try:
        price = soup.find('span', {'class': 'a-price-whole'})
        fraction = soup.find('span', {'class': 'a-price-fraction'})
        if price and fraction:
            return f"{price.text}{fraction.text}"
        return None
    except:
        return None

def get_description(soup):
    try:
        description = soup.find('div', {'id': 'productDescription'})
        return description.text.strip() if description else None
    except:
        return None
