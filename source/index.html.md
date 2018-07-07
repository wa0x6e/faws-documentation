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

`<div class="faws-wdg simple-price" data-ticker="btc"
data-currence="usd"></div>`

#### Attributes

| Attribute         | Mandatory | Description                                                                                                        |
| ----------------- | --------- | ------------------------------------------------------------------------------------------------------------------ |
| **class**         | `true`    | `faws-wdg simple-price` are required in order to initialize the widget. You can add additonal classes if you want. |
| **data-ticker**   | `true`    | Ticker of the cryptocurrency                                                                                       |
| **data-currency** | `false`   | Price currency. Either `usd` or `btc`. Default is `usd`.                                                           |

### Result

<div class="faws-wdg simple-price" data-ticker="btc" ></div>
<script src="https://wdg.faws.com/simple_price.js"></script>

.
