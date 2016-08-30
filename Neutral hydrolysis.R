#Neutral hydrolysis
#07-29-16
#includes a way to draw box plots in ascending order (using medians)
par(mar=c(15,5,2,0.3))
#this changes the axes fonts to bigger size
par(cex.lab=1.25)
par(cex.axis=1.25)
#end of new code addition
dataset4=read.csv("neutral_ranking.csv",h=T)
dataset3=read.csv("neutral_all_avg_07-05-16.csv ",h=T)
dataset3$Rank<-factor(dataset3$Rank,levels=c(dataset4$Rank_No),labels=dataset4$Scheme)
boxplot(Half.Life~Rank,data=dataset3,names,las=2,log="y",yaxs="i",ylim=c(0.0000000001,1000000000))
title(main="Neutral Hydrolysis")
title(ylab="Half Life (Days)", line = 4)

means <- tapply(dataset3$Half.Life, dataset3$Rank,mean) 
#dont forget to change dataset3$Tab to dataset3$Rank
points(means,pch=3)
rect(-3,0.0000000001,23,0.1,col='#FFFF004D')
rect(-3,0.1,23,1,col='#FF8C0050')
rect(-3,1,23,7,col='#1E90FF50')
rect(-3,7,23,60,col='#FF303050')
rect(-3,60,23,365,col='#90EE9050')
rect(-3,365,23,1000000000,col='#9F79EE50')
#legend code legend(x, y = NULL, legend, fill = NULL
#the one below works though color is having issue with codes
#legend('topright', legend=c("test"), fill = "red", cex=.75)
#legend('bottomright', legend=c("test"), fill = "#FF8C0050", bg = par("#90EE9050"), cex=.75)
legend('bottomright', legend=c("Rank 6", "Rank 5", "Rank 4", "Rank 3", "Rank 2", "Rank 1"), fill = c('#FFFF004D', '#FF8C0050', '#1E90FF50', '#FF303050', '#90EE9050', '#9F79EE50'), cex=.75)
#legend('bottomright', legend=c("test"), fill = c("#90EE9050"), cex=.75)


