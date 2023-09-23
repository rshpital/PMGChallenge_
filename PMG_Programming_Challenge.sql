
#1) Write a query to get the sum of impressions by day.
SELECT sum(impressions), date FROM marketing_performance 
      group by date order by date asc;
      


#2)Write a query to get the top three revenue-generating states 
# in order of best to worst. How much revenue did the third best
# state generate?

Select state, sum(revenue) from website_revenue 
      group by state order by sum(revenue) desc limit 3;

#The third best state generated $37,577 in revenue



#3) Write a query that shows total cost, impressions, clicks, and 
# revenue of each campaign. Make sure to include the campaign 
# name in the output.


SELECT campaign_info.name, sum(impressions), sum(clicks), sum(cost), 
sum(revenue) from marketing_performance join website_revenue on 
      marketing_performance.campaign_id = website_revenue.campaign_id join campaign_info on 
      campaign_info.id = website_revenue.campaign_id
      group by marketing_performance.campaign_id;
      
      
#4a) Write a query to get the number of conversions of Campaign5 by state

SELECT campaign_info.name, sum(conversions) as number_of_conversion  from marketing_performance join website_revenue on 
      marketing_performance.campaign_id = website_revenue.campaign_id join campaign_info on 
      campaign_info.id = website_revenue.campaign_id
      where campaign_info.name = 'Campaign5'
      group by marketing_performance.campaign_id;


#4b) Which state generated the most conversions for this campaign?

SELECT state, campaign_info.name, sum(conversions) as number_of_conversion  from marketing_performance join website_revenue on 
      marketing_performance.campaign_id = website_revenue.campaign_id join campaign_info on 
      campaign_info.id = website_revenue.campaign_id
      where campaign_info.name = 'Campaign5' 
      group by website_revenue.state


# GA generated the most conversions off this campaign



#5) In your opinion, which campaign was the most efficient, and why?

sqldf("SELECT campaign_info.name, sum(conversions)/sum(cost) as costperconversion, 
sum(conversions)*1.0/sum(impressions) as conversionratio, (sum(conversions)/sum(cost))/(sum(conversions)*1.0/sum(impressions))
from marketing_performance join website_revenue on 
      marketing_performance.campaign_id = website_revenue.campaign_id join campaign_info on 
      campaign_info.id = website_revenue.campaign_id
      group by marketing_performance.campaign_id
      ")


#
#Campaign5 stands out as the most efficient among the campaigns. It achieved this 
#distinction by obtaining the lowest score in my calculations, which stems from the 
#ratio of the campaign's cost per conversion to its conversion rate. A lower score 
#indicates a higher level of effectiveness. What makes Campaign5 particularly 
#noteworthy is its ability to strike a delicate balance between a competitive 
#conversion rate and a cost-effective approach in terms of conversions. While 
#this efficiency is readily evident for Campaign5 due to its substantial numerator
#and minimal denominator, it may not be as transparent for some other campaigns 
#with less clear efficiency estimates from the outset. However, utilizing this
#ratio provides a more comprehensive understanding of their true efficiency, 
#allowing us to make more informed comparisons.







      