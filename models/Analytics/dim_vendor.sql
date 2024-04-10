SELECT
      ROW_NUMBER() OVER () as dim_vendor_key, 
      *
FROM {{ref('stag_vendor')}}