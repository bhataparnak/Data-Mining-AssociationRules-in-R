# Data-Mining-AssociationRules-in-R
This project is about understanding association rule mining on a real-world data set and analyzing the results. In this project, you are given retail data of store purchases. This kind of retail data is well-suited for market basket analysis.
For this project, you will extract basket for each transaction and items bought together in that transaction. So, the frequent items can be any combinations of the items bought and rules
correspond to co-occurrences that satisfies min_sup and min_conf. Our analysis aim is to understand a few things about association rules: i) how the size of the
search space varies with respect to iterations, ii) how the number of candidate itemsets change with respect to min_sup for each iteration, iii) same for frequent itemsets, iv) how to generate
top k rules that have the > 10 lift, and < 10 lift and analyze them further. Of course, they have to satisfy both min_sup and min_conf, and iv) visualize these (and may be other rules) in some way
(points earned will be based on how easy it is to understand the rules from the visualization!). The rules indicate items that have been bought together in the data set that have some
significance for the seller/store. They may also indicate the items that are popular during that period. It may also throw up rules that you may have to interpret as to what they may mean.
That challenge comes with the analysis of any real-world data set.
