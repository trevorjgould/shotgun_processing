#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# usage: Rscript dool_report.R FILENAME

df <- read.csv(args[1], skip=5)
lab <- as.character(args[1])
lab <- tools::file_path_sans_ext(basename(lab))
library(reshape2)
library(ggplot2)
library(patchwork)

	# columns 1 is x axis for time
	# columns 2:6 is total cpu usage
melted <- melt(df[,c(1,2:6)], id.vars = c("time"))
colnames(melted) <- c("Time","Data","Value")
p1 <- ggplot(melted, aes(Time,Value, group = Data, color = Data)) + geom_line() + theme_bw() + ggtitle("CPU_Usage")+ theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
	
	# columns 7:9 is processors
melted <- melt(df[,c(1,7:9)], id.vars = c("time"))
colnames(melted) <- c("Time","Data","Value")
p2 <- ggplot(melted, aes(Time,Value, group = Data, color = Data)) + geom_line() + theme_bw() + ggtitle("Process")+ theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())

	# columns 10:13 is memory usage
melted <- melt(df[,c(1,10:13)], id.vars = c("time"))
colnames(melted) <- c("Time","Data","Value")
p3 <- ggplot(melted, aes(Time,Value, group = Data, color = Data)) + geom_line() + theme_bw() + ggtitle("Memory_Usage")+ theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())

	# columns 14:15 is paging
melted <- melt(df[,c(1,14:15)], id.vars = c("time"))
colnames(melted) <- c("Time","Data","Value")
p4 <- ggplot(melted, aes(Time,Value, group = Data, color = Data)) + geom_line() + theme_bw() + ggtitle("Paging")+ theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())

	# columns 16:17 is disk usage
melted <- melt(df[,c(1,16:17)], id.vars = c("time"))
colnames(melted) <- c("Time","Data","Value")
p5 <- ggplot(melted, aes(Time,Value, group = Data, color = Data)) + geom_line() + theme_bw() + ggtitle("Disk_Usage")+ theme(axis.text.x=element_blank(),axis.ticks.x=element_blank())


# piece back together
ps <- p1 / p2 / p3 / p4 / p5
# save as an plot pdf
filename1 = paste0("Usage_Report_",lab,".pdf")
ggsave(ps, file = filename1, height = 10.5, width = 8, units = "in")

# CPU stats: cpu usage by a user (usr) processes, system (sys) processes, as well as the number of idle (idl) and waiting (wai) processes, 
# Process stats: number of running (run), blocked (blk) and new (new) spawned processes.
	# The "procs_running" line gives the number of processes currently running on CPUs.
	# The "procs_blocked" line gives the number of processes currently blocked, waiting for I/O to complete.
# Memory stats: amount of used (used), buffered (buff), cached (cach) and free (free) memory.
# Paging stats: number of times information is copied into (in) and moved out (out) of memory.
# Disk stats: total number of read (read) and write (writ) operations on disks.