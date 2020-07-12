library(tidyverse)
library(mclust)

df = read.csv("winemag-data-130k-v2.csv")

df1 <- df[ which(df$country== "US"),]

df1 <- na.omit((df1))

df2 <- subset(df1, select = c(price,points))

boxplot(df2)$out
boxplot(df2$price)

plot(df2)

df2 <- subset(df2, price < 250) # remove outlier
plot(df2)

head(df2)

fit <- Mclust(df2)
#summary(geyser_mc, parameters = TRUE)
print(fit)
summary(fit)

fit$parameters$pro
fit$parameters$mean

plot(fit, what = "classification")
plot(fit, what = "uncertainty")
table(fit$classification,fit$uncertainty)
plot(fit, what = "BIC")
plot(fit, what = "density")

fit$BIC

#Bestfit1 <- Mclust(df2, G= 9, modelNames = "VVV")
Bestfit1 <- Mclust(df2, G= 16:20)


plot(Bestfit1, what = "classification")
plot(Bestfit1,what = "uncertainty")
plot(Bestfit1, what = "BIC")
plot(Bestfit1, what = "density")


table(Bestfit1$classification,Bfit1$uncertainty)
summary(Bestfit1)
