CREATE DATABASE  IF NOT EXISTS gdb041

USE gdb041;

CREATE TABLE dim_customer (
  customer varchar(255) NOT NULL PRIMARY KEY,
  market varchar(255) NOT NULL FOREIGN KEY,
  platform varchar(255) NOT NULL,
  channel varchar(255) NOT NULL,
  customer_code varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE dim_market (
  market varchar(255) NOT NULL PRIMARY KEY,
  sub_zone varchar(255) NOT NULL,
  region varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE dim_product (
  product_code varchar(255) NOT NULL PRIMARY KEY,
  division varchar(255) NOT NULL,
  segment varchar(255) NOT NULL,
  category varchar(255) NOT NULL,
  product varchar(255) NOT NULL,
  variant varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE fact_forecast_monthly (
  date datetime NOT NULL,
  division varchar(255) NOT NULL,
  category varchar(255) NOT NULL,
  product_code varchar(255) NOT NULL FOREIGN KEY,
  product varchar(255) NOT NULL,
  market varchar(255) NOT NULL FOREIGN KEY,
  platform varchar(255) NOT NULL,
  channel varchar(255) NOT NULL,
  customer_code varchar(255) NOT NULL FOREIGN KEY,
  customer_name varchar(255) NOT NULL,
  forecast_quantity int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE fact_sales_monthly (
  date datetime NOT NULL,
  division varchar(255) NOT NULL,
  category varchar(255) NOT NULL,
  product_code varchar(255) NOT NULL FOREIGN KEY,
  product varchar(255) NOT NULL,
  market varchar(255) NOT NULL FOREIGN KEY,
  platform varchar(255) NOT NULL,
  channel varchar(255) NOT NULL,
  customer_code varchar(255) NOT NULL FOREIGN KEY,
  customer_name varchar(255) NOT NULL,
  sold_quantity int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE freight_cost (
  market varchar(255) NOT NULL FOREIGN KEY,
  fiscal_year varchar(10) NOT NULL,
  freight_pct decimal(15,10) NOT NULL,
  other_cost_pct decimal(15,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE gross_price (
  product_code varchar(255) NOT NULL PRIMARY KEY,
  fiscal_year varchar(10) NOT NULL,
  gross_price decimal(15,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE manufacturing_cost (
  product_code varchar(255) NOT NULL PRIMARY KEY,
  cost_year varchar(255) NOT NULL,
  manufacturing_cost decimal(15,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE post_invoice_deductions (
  customer_code varchar(255) NOT NULL FOREIGN KEY,
  product_code varchar(255) NOT NULL FOREIGN KEY,
  date date NOT NULL,
  discounts_pct decimal(15,10) NOT NULL,
  other_deductions_pct decimal(15,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE pre_invoice_deductions (
  customer_code varchar(255) NOT NULL PRIMARY KEY,
  fiscal_year varchar(10) NOT NULL,
  pre_invoice_discount_pct decimal(25,20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

