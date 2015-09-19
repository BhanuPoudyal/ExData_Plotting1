neededDataSet<-function(readCVS="household_power_consumption.txt")
{
  ds<-read.csv(readCVS, "r", header = TRUE, fill=T, sep = ";", col.names=c("Date","Time", "Global_active_power","Global_eactive_power", "Voltage", "Global_intensity", "Sub_meteing_1", "Sub_meteing_2","Sub_meteing_3"), row.names = NULL)
  smallDs<-subset(ds, ds$Date=="1/2/2007"|ds$Date=="2/2/2007")
  smallDs
}
# plotHist<-function()
# {
#   copyDs<-neededDataSet()
#   hist(as.numeric(copyDs$Global_active_power)/1000, 
#        col="red", xlab = "Global Active Power (kilowatts)", 
#        freq = TRUE, main=paste("Global Active Power"), plot = TRUE)
#   dev.copy(png,'Plot1.png')
#   dev.off()
#   
# }
plotLine<-function()
{
  library(lubridate)
  library(ggplot2)
  copyDs<-neededDataSet()
  ggplot(copyDs, aes(Time,Global_active_power)) + 
    geom_point() +
    geom_smooth(aes(group=1)) + 
    geom_point(aes(factor(wday(Date, label=TRUE)),Global_active_power)) + 
    geom_smooth(aes(factor(wday(Date, label=TRUE)),Global_active_power))+
    # xlab(factor(wday(copyDS$Date, label=TRUE)))+
    ylab("Global Active Power")+
    geom_line()
  dev.copy(png,'Plot2.png')
  dev.off()
  
}
# plotSubMetering<-function()
# {
#   library(lubridate)
# library(ggplot2)
# copyDs<-neededDataSet()
# ggplot(copyDs) + 
#   geom_line(aes(Time, Sub_meteing_1, color="Sub_meteing_1"))+
#   geom_line(aes(Time, Sub_meteing_2, color="Sub_meteing_2"))+
#   geom_line(aes(Time, Sub_meteing_3, color="Sub_meteing_3"))
#   # theme(plot.window(xlim=c(0,800), ylim=c(0,800)))
# # dev.copy(png,'Plot3.png')
# # dev.off()
# }
# plotMultiple<-function()
# {
#   library(lubridate)
#   library(ggplot2)
#   copyDs<-neededDataSet()
#   par(mfrow=c(2,2))
#   metering<-ggplot(copyDs) + 
#     geom_line(aes(Time, Sub_meteing_1, color="Sub_meteing_1"))+
#     geom_line(aes(Time, Sub_meteing_2, color="Sub_meteing_2"))+
#     geom_line(aes(Time, Sub_meteing_3, color="Sub_meteing_3"))+
#     ylab("Sub Metering")
#   activePower<-ggplot(copyDs, aes(Time,Global_active_power)) + 
#     geom_point() +
#     geom_smooth(aes(group=1)) + 
#     geom_point(aes(factor(wday(Date, label=TRUE)),Global_active_power)) + 
#     geom_smooth(aes(factor(wday(Date, label=TRUE)),Global_active_power))+
#     # xlab(factor(wday(copyDS$Date, label=TRUE)))+
#     ylab("Global Active Power")+
#     geom_line()
#   eactivePower<-ggplot(copyDs, aes(Time,Global_eactive_power)) + 
#     geom_point() +
#     geom_smooth(aes(group=1)) + 
#     geom_point(aes(factor(wday(Date, label=TRUE)),Global_eactive_power)) + 
#     geom_smooth(aes(factor(wday(Date, label=TRUE)),Global_eactive_power))+
#     # xlab(factor(wday(copyDS$Date, label=TRUE)))+
#     ylab("Global eActive Power")+
#     geom_line()
#   voltage<-ggplot(copyDs, aes(Time,Voltage)) + 
#     geom_point() +
#     geom_smooth(aes(group=1)) + 
#     geom_point(aes(factor(wday(Date, label=TRUE)),Voltage)) + 
#     geom_smooth(aes(factor(wday(Date, label=TRUE)),Voltage))+
#     # xlab(factor(wday(copyDS$Date, label=TRUE)))+
#     ylab("Voltager")+
#     geom_line() 
#   library(gridExtra)
#   grid.arrange(metering, activePower, eactivePower, voltage)
# }
#   