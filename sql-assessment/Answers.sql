
-- 1. Write a query to get the sum of impressions by day.
SELECT 
date, SUM(impressions) as "Total Impressions"
FROM marketing_performance
GROUP BY date;
-- 2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
SELECT 
state, SUM(revenue) as "Total Revenue"
FROM website_revenue
GROUP BY state
ORDER BY SUM(revenue) DESC
LIMIT 3;
-- Ohio was the third best state and it generated $37,577
-- 3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
SELECT *
FROM campaign_info ci
INNER JOIN (
	SELECT
    mp.campaign_id,
	SUM(mp.cost) as "Total Cost", 
	SUM(mp.impressions) as "Total Impressions", 
	SUM(mp.clicks) as "Total Clicks"
    FROM marketing_performance mp
    GROUP BY mp.campaign_id
    )mp ON mp.campaign_id = ci.id
INNER JOIN (
	SELECT
    wr.campaign_id,
    SUM(wr.revenue) as "Total Revenue"
	FROM website_revenue wr
    GROUP BY wr.campaign_id
    )wr ON wr.campaign_id = ci.id
GROUP BY ci.name;
-- 4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
SELECT ci.name, mp.geo as "State", SUM(mp.conversions) as "Total Conversions"
FROM marketing_performance as mp
INNER JOIN campaign_info ci
ON mp.campaign_id = ci.id
WHERE ci.name = 'Campaign5'
GROUP BY mp.geo;
-- Georgia generated the most conversions for this campaign
-- 5. In your opinion, which campaign was the most efficient, and why?
/*
In my opinion, the campaign that was the most efficient was 'Campaign2'. This campaign was able to get the most
users to interact and donate a large portion still gaining a large profit. 30% of people who intereacteed with 
the site ended up converting to whatever it was offerring.
*/


