## scatter plot 
### qplot(displ,hwy,data=mpg,color=drv,geom=c("point","smooth"))
## scatter plot with one variable 
### qplot(y=hwy,data=mpg,color=drv)
## box plot
### qplot(drv,hwy,data=mpg,geom="boxplot",color=manufacturer)
## histogram
### qplot(hwy,data=mpg,fill=drv)
### qplot(price,data=diamonds,binwidth=18497/30,fill=cut)
###  qplot(price,data=diamonds,geom="density")
###  qplot(price,data=diamonds,geom="density",color=cut)

##  hisotgram using subset data
### qplot(displ,hwy,data=mpg,facets=.~drv)
## sactterplot on subset data
### qplot(hwy,data=mpg,facets=drv~.,binwidth=2)
### qplot(displ,hwy,data=mpg,geom=c("point","smooth"),facets=.~drv,method="loess")
## ggplot
### g <- ggplot(dataframe,aes(x,y))
### g+geom_point()+geom_smooth()
### g+geom_point(color="pink",size=4,alpha=1/2)
### g+geom_point(size=4,alpha=1/2,aes(color=drv))
### g+geom_point(aes(color=drv))+labs(title="Swirl Rules!") +labs(x="Displacement",y="Hwy Mileage")
### g+geom_point()+geom_smooth(method="lm")
### g +geom_point(aes(color = drv),size=2,alpha=1/2) + geom_smooth(size=4,linetype=3,method="lm",se=FALSE)
### g+geom_point()+geom_smooth(method="lm")+facet_grid(.~drv)
### g+geom_point()+facet_grid(drv~cyl,margins=TRUE)
### g+geom_point()+facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black")
###  g+geom_point()+facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black")+labs(title="Swirl Rules!",x="Displacement",y="Highway Mileage")
### g+geom_point()+geom_smooth(method="lm")+facet_grid(.~drv)+ggtitle("Swirl Rules!")
### g + geom_point(aes(color = drv)) + theme_bw(base_family="Times")
### g+geom_line()+coord_cartesian(ylim=c(-3,3))
### cutpoints <- quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)
### diamonds$car2 <- cut(diamonds$carat,cutpoints)
### g+geom_point(alpha=1/3)+facet_grid(cut~car2)+geom_smooth(method="lm",size=3,color="pink")
##  making a box plot
### ggplot(diamonds,aes(carat,price))+geom_boxplot()+facet_grid(.~cut)

###Plotting and Color in R
##grDevices packages
##colorRamp - mixing colors
###pal <- colorRamp(c("red","blue"))
###pal(0) -- red
###pal(1) -- blue
###pal(seq(0,1,len=10)) -- colors between red and blue
##colorRampPalette
###pal <- colorRampPalette(c("red","yellow"))
###pal(2) -- hexademical --#FF0000 (red) #FFFF00 (red, green, 0-blue)
##RColorBrewer
###3 types of palettes - sequential(ordered data), diverging(deviate) and qualitiative(factors, categorical data)
###can be used in conjubction with colorRamp() and colorRampPalette()
##cols <- brewer.pal(3, "BuGn")
###pal <- colorRampPalette(cols)
###image(volcano, col=pal(20))
###can be used with smoothScatter
###smoothScatter(x,y)
###rgb fn can be used to produce any color via RGB proportions
###plot(x,y,col=rgb(0,0,0,0.2),pch=19) -- 0.2 alpha parameter, rest are RGB
###color transparency can be added
###colorspace package

