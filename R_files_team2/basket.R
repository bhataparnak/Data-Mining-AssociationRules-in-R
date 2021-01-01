library(arules)
library(arulesViz)

tr <- read.transactions('F:/UTA/Courses/Assignments/Data Mining/Project3/basket.csv', format = 'basket', sep=',')
summary(tr)
# transactions as itemMatrix in sparse format with
# 18485 rows (elements/itemsets/transactions) and
# 7793 columns (items) and a density of 0.002277027

apriori_ruleseg<-apriori(tr,parameter=list(supp= 0.0001,conf = 0.5, minlen=1,maxlen=2))
summary(apriori_ruleseg)
plot(apriori_ruleseg,method = 'grouped')
subRuleseg <- head(apriori_ruleseg, n = 100, by = "confidence")
summary(subRuleseg)
plot(subRuleseg, method = "grouped")
#relative shows how many times these items have appeared as cmp to others
itemFrequencyPlot(tr,topN=15,main="Relative Item Frequency Plot")
#absolute shows numeric frequency of each item independently
itemFrequencyPlot(tr,topN=15, type="absolute",main="Absolute Item Frequency Plot")
apriori_rules<-apriori(tr,parameter=list(supp= 0.003,conf = 0.5))
summary(apriori_rules)
quality(apriori_rules)<- round(quality(apriori_rules),digits = 4)
rules_sorted <- sort(apriori_rules, by = 'lift', decreasing = TRUE)
summary(rules_sorted)
arules::inspect(apriori_rules[1:10])
arules::inspect(tail(apriori_rules, 10))
plot(apriori_rules, method = "graph",  engine = "htmlwidget")



subset.matrix <- is.subset(rules_sorted, rules_sorted, sparse = FALSE)	
subset.matrix[lower.tri(subset.matrix, diag = T)] <- NA	
redundant <- colSums(subset.matrix, na.rm = T) >= 1	
rules_pruned <- rules_sorted[!redundant]
summary(rules_pruned)
inspect(rules_pruned[1:10])
plot(rules_pruned, method = "graph",  engine = "htmlwidget")
inspect(apriori_rules[1:10])
plot(apriori_rules,method = 'two-key plot', jitter=0)
plot(apriori_rules,method = 'grouped')
plot(apriori_rules,method = 'paracoord')
plotly_arules(apriori_rules, jitter=0)
plot(apriori_rules@quality)

subRules<-apriori_rules[quality(apriori_rules)$confidence>0.4]
plot(subRules, method="two-key plot")
subRules <- head(apriori_rules, n = 100, by = "confidence", decreasing = TRUE)
summary(subRules)
plot(subRules, method = "graph",  engine = "htmlwidget")



apriori_rules1<-apriori(tr,parameter=list(supp= 0.007,conf = 0.7, minlen=1,maxlen=5))
summary(apriori_rules1)
#set of 201 rules
quality(apriori_rules1)<- round(quality(apriori_rules1),digits = 4)
rules_sorted1 <- sort(apriori_rules1, by = 'lift')
summary(rules_sorted1)
arules::inspect(rules_sorted1[1:10])
arules::inspect(tail(rules_sorted1, 10))

subset.matrix1 <- is.subset(rules_sorted1, rules_sorted1, sparse = FALSE)	
subset.matrix1[lower.tri(subset.matrix1, diag = T)] <- NA	
redundant1 <- colSums(subset.matrix1, na.rm = T) >= 1	
rules_pruned1 <- rules_sorted1[!redundant1]
summary(rules_pruned1)
arules::inspect(rules_pruned1[1:10])
#   [1] 303.03279 172.75701 168.02394 165.25543 163.64990 161.99687 156.47090
# [8] 152.88346 148.76298 144.78683

plot(apriori_rules1,method = 'two-key plot', jitter=0)
plot(apriori_rules1,method = 'grouped')
plot(apriori_rules1,method = 'paracoord')
plotly_arules(apriori_rules1, jitter=0)
plot(rules_sorted1@quality)

subRules1<-apriori_rules1[quality(apriori_rules1)$confidence>0.6]
plot(subRules1, method="two-key plot",jitter=0)
subRules1 <- head(apriori_rules1, n = 100, by = "confidence",decreasing = TRUE)
plot(subRules1, method = "graph",  engine = "htmlwidget")



apriori_rules2<-apriori(tr,parameter=list(supp= 0.012,conf = 0.8, minlen=1,maxlen=6))
summary(apriori_rules2)
inspect(apriori_rules2[1:6])

rules_sorted2 <- sort(apriori_rules2, by = 'lift')
summary(rules_sorted2)
inspect(rules_sorted2[1:6])

subset.matrix2 <- is.subset(rules_sorted2, rules_sorted2, sparse = FALSE)	
subset.matrix2[lower.tri(subset.matrix2, diag = T)] <- NA	
redundant2 <- colSums(subset.matrix2, na.rm = T) >= 1	
rules_pruned2 <- rules_sorted2[!redundant2]
summary(rules_pruned2)
arules::inspect(rules_sorted2[1:5])
arules::inspect(tail(rules_sorted2, 10))

plot(apriori_rules2,method = 'two-key plot', jitter=0)
plot(apriori_rules2,method = 'grouped')
plot(apriori_rules2,method = 'paracoord')
plotly_arules(apriori_rules2, jitter=0)
plot(apriori_rules2@quality)


subRules2<-apriori_rules2[quality(apriori_rules2)$confidence>0.7]
plot(subRules2, method="two-key plot")
subRules2 <- head(apriori_rules2, n = 100, by = "confidence", decreasing = TRUE)
summary(subRules2)
plot(subRules2, method = "graph",  engine = "htmlwidget")


redundant_rules <- which(colSums(is.subset(apriori_rules, apriori_rules)) > 1) 
length(redundant_rules)
redundant_apriori_rules <- apriori_rules[-redundant_rules]
summary(redundant_apriori_rules)


redundant_rules1 <- which(colSums(is.subset(apriori_rules1, apriori_rules1)) > 1) 
length(redundant_rules1)
redundant_apriori_rules1 <- apriori_rules1[-redundant_rules1]
summary(redundant_apriori_rules1)

redundant_rules2 <- which(colSums(is.subset(apriori_rules2, apriori_rules2)) > 1) 
length(redundant_rules2)
redundant_apriori_rules2 <- apriori_rules2[-redundant_rules2]
summary(redundant_apriori_rules2)

