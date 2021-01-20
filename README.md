# Data-Mining-AssociationRules-in-R
This project is about understanding association rule mining on a real-world data set and analyzing the results. In this project, you are given retail data of store purchases. This kind of retail data is well-suited for market basket analysis.
For this project, you will extract basket for each transaction and items bought together in that transaction. So, the frequent items can be any combinations of the items bought and rules
correspond to co-occurrences that satisfies min_sup and min_conf. Our analysis aim is to understand a few things about association rules: i) how the size of the
search space varies with respect to iterations, ii) how the number of candidate itemsets change with respect to min_sup for each iteration, iii) same for frequent itemsets, iv) how to generate
top k rules that have the > 10 lift, and < 10 lift and analyze them further. Of course, they have to satisfy both min_sup and min_conf, and iv) visualize these (and may be other rules) in some way
(points earned will be based on how easy it is to understand the rules from the visualization!). The rules indicate items that have been bought together in the data set that have some
significance for the seller/store. They may also indicate the items that are popular during that period. It may also throw up rules that you may have to interpret as to what they may mean.
That challenge comes with the analysis of any real-world data set.

Dataset: consists of extracted data from a retail store in UK.

1. Dataset size: each team will get about 500 K transactions each having a number of
items. If this is too large, you need to partition the data. If you want to, you can do
random selection of itemsets after creating itemsets. If there are no memory issues, you
should process all data. If you partition the data, you need to include acceptable
justification in you report. The default should be to process all given data.

2. The data set is given in a spread sheet. It certainly needs pre-processing as indicated
below.

a. Need to convert the data into “transactions” with a Tx number and items in that Tx.
A Tx corresponds to a basket

b. Since the item names are long, you may want to replace it with integers (usual
practice) and convert it back at the end.

c. You also need to clean the data as follows:
i. Any invoiceNo that starts with a C should be discarded
ii. The description has many words denoting various actions. They following
descriptions should be discarded. That is, they are NOT items bought. The words
to be considered are ("WRONG","LOST", "CRUSHED", "SMASHED", "DAMAGED",
"FOUND", "THROWN", "MISSING", "AWAY", "\\?", "CHECK", "POSTAGE",
"MANUAL", "CHARGES", "AMAZON", "FEE", "FAULT", "SALES", "ADJUST",
"COUNTED", "LABEL", "INCORRECT", "SOLD", "BROKEN", "BARCODE",
"CRACKED", "RETURNED", "MAILOUT", "DELIVERY", "MIX UP", "MOULDY", "PUT
ASIDE", "ERROR", "DESTROYED", "RUSTY")
iii. You need to pre-process before you convert the data into Txs.
