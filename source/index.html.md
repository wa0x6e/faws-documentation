---
title: Cryptocurrency Realtime API - Faws

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://faws.com'>Faws.com</a>

<!-- includes:
  - errors -->

search: true
---

# Introduction

This is the documentation for Faws.com widgets and api.

API access is public, and does not require authentication

# API

## Currencies

Returns list of all available currencies

```shell
curl 'https://api.faws.com/v1/currencies'
```

> On success, this endpoint returns a JSON response like this:

```json
[
  {
    "id": "monetha",
    "name": "Monetha",
    "ticker": "MTH"
    },
  {
    ...another currency object
  }
]
```

### Endpoint url

`GET https://api.faws.com/v1/currencies`

### JSON Response

Returns an array of JSON object

| Key        | Type   | Description      |
| ---------- | ------ | ---------------- |
| **id**     | string | Currency ID.     |
| **name**   | string | Currency name.   |
| **ticker** | string | Currency ticker. |

## Tickers

Get data about given currency.

If no id is specified, will return all currencies.

```shell
curl 'https://api.faws.com/v1/tickers'
```

> On success, this endpoint returns a JSON response like this:

```json
[
  {
    "id": "bitcoin",
    "name": "Bitcoin",
    "ticker": "BTC",
    "last_traded_usd": 8297.61333321833,
    "last_traded_btc": null,
    "variation_usd": 0.02,
    "variation_btc": 0,
    "market_cap": 137851404491,
    "volume_24h": 4395510000
    },
  {
    ...another ticker object
  }
]
```

### Endpoint url

`GET https://api.faws.com/v1/tickers`

To get only specific currencies:

`GET https://api.faws.com/v1/tickers?id=bitcoin,neo`

See [currencies](#currencies) to retrieve list of supported IDs.

### Query parameters

| Key    | Type   | Mandatory | Description                         |
| ------ | ------ | --------- | ----------------------------------- |
| **id** | string | `false`   | Comma separated list of currency ID |

### JSON Response

Returns an array of JSON object

| Key                 | Type   | Description                                          |
| ------------------- | ------ | ---------------------------------------------------- |
| **id**              | string | Currency ID.                                         |
| **name**            | string | Currency name.                                       |
| **ticker**          | string | Currency ticker.                                     |
| **last_traded_usd** | float  | Last traded price in USD.                            |
| **last_traded_btc** | float  | Last traded price in BTC.                            |
| **variation_usd**   | float  | USD price percentage variation since midnight UTC+0. |
| **variation_btc**   | float  | BTC price percentage variation since midnight UTC+0. |
| **market_cap**      | float  | Market cap in USD.                                   |
| **volume_24h**      | float  | Past 24 volume.                                      |

## News

Get a list of news, filtered by given parameters.

If no params specified, will return the last 25 news. Results are always sorted by publish time, most recent first.

```shell
curl 'https://api.faws.com/v1/news'
```

> On success, this endpoint returns a JSON response like this:

```json
[
  {
    "id": 517,
    "title": "The U.S. Government Is Auctioning Off Almost 30,000 Bitcoins",
    "url": "http://mashable.com/2014/06/27/government-bitcoin-auction/",
    "faws_url": "https://faws.com/news/517",
    "publish_time": "2014-06-27T19:51:19.000Z"
  },
  {
    ...another news object
  }
]
```

### Query parameters

| Key            | Type            | Example      | Default        | Description                                                                                           |
| -------------- | --------------- | ------------ | -------------- | ----------------------------------------------------------------------------------------------------- |
| **locales**    | List of string  | `en,fr`      | `en`           | Comma separated list of 2-letter locale code                                                          |
| **categories** | List of integer | `1,2`        | all categories | Comma separated list of categories ID. See [categories](#categories) for list of available categories |
| **start_date** | timestamp       | `946684800`  | `null`         | Lower bound returned news publish time                                                                |
| **end_date**   | timestamp       | `1545202141` | `null`         | Upper bound returned news publish time                                                                |
| **limit**      | integer         | `100`        | `25`           | Number of results returned for each page. Max is `100`                                                |

### JSON Response

Returns an array of JSON object

| Key              | Type     | Description             |
| ---------------- | -------- | ----------------------- |
| **id**           | integer  | Faws.com internal ID    |
| **title**        | string   | News title              |
| **url**          | string   | Original url to news    |
| **faws_url**     | string   | News' faws.com url      |
| **publish_time** | datetime | ISO-8601 formatted time |

## Categories

Get list of all available categories

```shell
curl 'https://api.faws.com/v1/categories'
```

> On success, this endpoint returns a JSON response like this:

```json
[
  {
    "id": 1,
    "name": "News",
    },
  {
    ...another category object
  }
]
```

### Endpoint url

`GET https://api.faws.com/v1/categories`

### Query parameters

This endpoint does not accept parameters.

### JSON Response

Returns an array of JSON object

| Key      | Type   | Description    |
| -------- | ------ | -------------- |
| **id**   | string | Category ID.   |
| **name** | string | Category name. |

# Widgets

## Simple price

Display a cryptocurrency price widget.

### Step 1

Insert the following js code before your `</body>` closing tag.

`<script src="https://wdg.faws.com/simple_price.js"></script>`

If you are inserting multiple widgets in the same page, the tag above need to be
inserted only once.

### Step 2

Insert and customize the following tag where you want to display the widget

`<div class="faws-wdg simple-price" data-ticker="btc" data-currency="usd"></div>`

#### Attributes

| Attribute         | Mandatory | Description                                                                                                        |
| ----------------- | --------- | ------------------------------------------------------------------------------------------------------------------ |
| **class**         | `true`    | `faws-wdg simple-price` are required in order to initialize the widget. You can add additonal classes if you want. |
| **data-ticker**   | `true`    | Ticker of the cryptocurrency                                                                                       |
| **data-currency** | `false`   | Price currency. Either `usd` or `btc`. Default is `usd`.                                                           |

#### Available currencies list

See [currencies](#currencies)

### Result

<div style="margin: 30px">
<div class="faws-wdg simple-price" data-ticker="btc" ></div>
<script src="https://wdg.faws.com/simple_price.js"></script>
</div>
