
require(ggplot2)
require(reshape)
require(gridExtra)

setwd("~/BRCA_mtDNA_duos/data/samples_full_deapths/")
temp = list.files(pattern="*.tsv")
list2env(
  lapply(setNames(temp, make.names(gsub("*.tsv$", "", temp))), header = FALSE,
         read.delim), envir = .GlobalEnv)

all_deapths <- cbind(B105_S41[,2], B105_S41[,3], B106_S49[,3], B108_S57[,3], B116_S39[,3], B120_S57[,3], B121_S10[,3], B123_S84[,3], B124_S9[,3], B125_S90[,3], B126_S33[,3], B135_S11[,3], B137_S19[,3], B138_S27[,3], B140_S54[,3], B141_S59[,3], B142_S42[,3], B143_S92[,3], B149_S8[,3], B150_S58[,3], B154_S93[,3], B155_S18[,3], B158_S67[,3], B160_S26[,3], B165_S24[,3], B168_S77[,3], B169_S85[,3], B172_S28[,3], B176_S12[,3], B178_S94[,3], B184_S20[,3], B186_S95[,3], B189_S28[,3], B190_S34[,3], B192_S40[,3], B193_S43[,3], B194_S51[,3], B196_S59[,3], B198_S68[,3], B200_S73[,3], B26_S56[,3], B28_S1[,3], B29_S29[,3], B30_S22[,3], B31_S70[,3], B37_S41[,3], B38_S31[,3], B39_S114[,3], B40_S115[,3], B41_S116[,3], B45_S82[,3], B48_S53[,3], B50_S17[,3], B55_S25[,3], B58_S33[,3], B59_S88[,3], B62_S46[,3], B69_S23[,3], B71_S40[,3], B73_S48[,3], B74_S27[,3], B75_S56[,3], B76_S65[,3], B79_S71[,3], B81_S83[,3], B82_S47[,3], B94_S6[,3], B96_S4[,3], B97_S34[,3], T105_S45[,3], T106_S53[,3], T108_S61[,3], T116_S2[,3], T120_S58[,3], T121_S31[,3], T123_S80[,3], T124_S87[,3], T125_S96[,3], T126_S51[,3], T135_S15[,3], T137_S23[,3], T138_S123[,3], T140_S38[,3], T141_S97[,3], T142_S46[,3], T143_S98[,3], T149_S54[,3], T150_S62[,3], T154_S99[,3], T155_S37[,3], T158_S26[,3], T160_S43[,3], T165_S22[,3], T168_S32[,3], T169_S81[,3], T172_S5[,3], T176_S45[,3], T178_S100[,3], T184_S52[,3], T186_S101[,3], T189_S16[,3], T190_S38[,3], T192_S44[,3], T193_S32[,3], T194_S39[,3], T196_S47[,3], T198_S55[,3], T200_S63[,3], T26_S78[,3], T28_S7[,3], T29_S35[,3], T30_S49[,3], T31_S13[,3], T37_S48[,3], T38_S117[,3], T39_S118[,3], T40_S119[,3], T41_S120[,3], T45_S21[,3], T48_S29[,3], T50_S36[,3], T55_S44[,3], T58_S52[,3], T59_S89[,3], T62_S25[,3], T69_S30[,3], T71_S60[,3], T73_S69[,3], T74_S36[,3], T75_S74[,3], T76_S79[,3], T79_S86[,3], T81_S50[,3], T82_S14[,3], T94_S42[,3], T96_S30[,3], T97_S37[,3])
names <- c("base_pair", "B105_S41", "B106_S49", "B108_S57", "B116_S39", "B120_S57", "B121_S10", "B123_S84", "B124_S9", "B125_S90", "B126_S33", "B135_S11", "B137_S19", "B138_S27", "B140_S54", "B141_S59", "B142_S42", "B143_S92", "B149_S8", "B150_S58", "B154_S93", "B155_S18", "B158_S67", "B160_S26", "B165_S24", "B168_S77", "B169_S85", "B172_S28", "B176_S12", "B178_S94", "B184_S20", "B186_S95", "B189_S28", "B190_S34", "B192_S40", "B193_S43", "B194_S51", "B196_S59", "B198_S68", "B200_S73", "B26_S56", "B28_S1", "B29_S29", "B30_S22", "B31_S70", "B37_S41", "B38_S31", "B39_S114", "B40_S115", "B41_S116", "B45_S82", "B48_S53", "B50_S17", "B55_S25", "B58_S33", "B59_S88", "B62_S46", "B69_S23", "B71_S40", "B73_S48", "B74_S27", "B75_S56", "B76_S65", "B79_S71", "B81_S83", "B82_S47", "B94_S6", "B96_S4", "B97_S34", "T105_S45", "T106_S53", "T108_S61", "T116_S2", "T120_S58", "T121_S31", "T123_S80", "T124_S87", "T125_S96", "T126_S51", "T135_S15", "T137_S23", "T138_S123", "T140_S38", "T141_S97", "T142_S46", "T143_S98", "T149_S54", "T150_S62", "T154_S99", "T155_S37", "T158_S26", "T160_S43", "T165_S22", "T168_S32", "T169_S81", "T172_S5", "T176_S45", "T178_S100", "T184_S52", "T186_S101", "T189_S16", "T190_S38", "T192_S44", "T193_S32", "T194_S39", "T196_S47", "T198_S55", "T200_S63", "T26_S78", "T28_S7", "T29_S35", "T30_S49", "T31_S13", "T37_S48", "T38_S117", "T39_S118", "T40_S119", "T41_S120", "T45_S21", "T48_S29", "T50_S36", "T55_S44", "T58_S52", "T59_S89", "T62_S25", "T69_S30", "T71_S60", "T73_S69", "T74_S36", "T75_S74", "T76_S79", "T79_S86", "T81_S50", "T82_S14", "T94_S42", "T96_S30", "T97_S37")
colnames(all_deapths) <- names
rownames(all_deapths) <- all_deapths[,1]
all_deapths <- as.data.frame(all_deapths)

B_deapths <- cbind(B105_S41[,2], B105_S41[,3], B106_S49[,3], B108_S57[,3], B116_S39[,3], B120_S57[,3], B121_S10[,3], B123_S84[,3], B124_S9[,3], B125_S90[,3], B126_S33[,3], B135_S11[,3], B137_S19[,3], B138_S27[,3], B140_S54[,3], B141_S59[,3], B142_S42[,3], B143_S92[,3], B149_S8[,3], B150_S58[,3], B154_S93[,3], B155_S18[,3], B158_S67[,3], B160_S26[,3], B165_S24[,3], B168_S77[,3], B169_S85[,3], B172_S28[,3], B176_S12[,3], B178_S94[,3], B184_S20[,3], B186_S95[,3], B189_S28[,3], B190_S34[,3], B192_S40[,3], B193_S43[,3], B194_S51[,3], B196_S59[,3], B198_S68[,3], B200_S73[,3], B26_S56[,3], B28_S1[,3], B29_S29[,3], B30_S22[,3], B31_S70[,3], B37_S41[,3], B38_S31[,3], B39_S114[,3], B40_S115[,3], B41_S116[,3], B45_S82[,3], B48_S53[,3], B50_S17[,3], B55_S25[,3], B58_S33[,3], B59_S88[,3], B62_S46[,3], B69_S23[,3], B71_S40[,3], B73_S48[,3], B74_S27[,3], B75_S56[,3], B76_S65[,3], B79_S71[,3], B81_S83[,3], B82_S47[,3], B94_S6[,3], B96_S4[,3], B97_S34[,3])
T_deapths <- cbind(B105_S41[,2], T105_S45[,3], T106_S53[,3], T108_S61[,3], T116_S2[,3], T120_S58[,3], T121_S31[,3], T123_S80[,3], T124_S87[,3], T125_S96[,3], T126_S51[,3], T135_S15[,3], T137_S23[,3], T138_S123[,3], T140_S38[,3], T141_S97[,3], T142_S46[,3], T143_S98[,3], T149_S54[,3], T150_S62[,3], T154_S99[,3], T155_S37[,3], T158_S26[,3], T160_S43[,3], T165_S22[,3], T168_S32[,3], T169_S81[,3], T172_S5[,3], T176_S45[,3], T178_S100[,3], T184_S52[,3], T186_S101[,3], T189_S16[,3], T190_S38[,3], T192_S44[,3], T193_S32[,3], T194_S39[,3], T196_S47[,3], T198_S55[,3], T200_S63[,3], T26_S78[,3], T28_S7[,3], T29_S35[,3], T30_S49[,3], T31_S13[,3], T37_S48[,3], T38_S117[,3], T39_S118[,3], T40_S119[,3], T41_S120[,3], T45_S21[,3], T48_S29[,3], T50_S36[,3], T55_S44[,3], T58_S52[,3], T59_S89[,3], T62_S25[,3], T69_S30[,3], T71_S60[,3], T73_S69[,3], T74_S36[,3], T75_S74[,3], T76_S79[,3], T79_S86[,3], T81_S50[,3], T82_S14[,3], T94_S42[,3], T96_S30[,3], T97_S37[,3])
Bnames <- c("base_pair", "B105_S41", "B106_S49", "B108_S57", "B116_S39", "B120_S57", "B121_S10", "B123_S84", "B124_S9", "B125_S90", "B126_S33", "B135_S11", "B137_S19", "B138_S27", "B140_S54", "B141_S59", "B142_S42", "B143_S92", "B149_S8", "B150_S58", "B154_S93", "B155_S18", "B158_S67", "B160_S26", "B165_S24", "B168_S77", "B169_S85", "B172_S28", "B176_S12", "B178_S94", "B184_S20", "B186_S95", "B189_S28", "B190_S34", "B192_S40", "B193_S43", "B194_S51", "B196_S59", "B198_S68", "B200_S73", "B26_S56", "B28_S1", "B29_S29", "B30_S22", "B31_S70", "B37_S41", "B38_S31", "B39_S114", "B40_S115", "B41_S116", "B45_S82", "B48_S53", "B50_S17", "B55_S25", "B58_S33", "B59_S88", "B62_S46", "B69_S23", "B71_S40", "B73_S48", "B74_S27", "B75_S56", "B76_S65", "B79_S71", "B81_S83", "B82_S47", "B94_S6", "B96_S4", "B97_S34")
Tnames <- c("base_pair", "T105_S45", "T106_S53", "T108_S61", "T116_S2", "T120_S58", "T121_S31", "T123_S80", "T124_S87", "T125_S96", "T126_S51", "T135_S15", "T137_S23", "T138_S123", "T140_S38", "T141_S97", "T142_S46", "T143_S98", "T149_S54", "T150_S62", "T154_S99", "T155_S37", "T158_S26", "T160_S43", "T165_S22", "T168_S32", "T169_S81", "T172_S5", "T176_S45", "T178_S100", "T184_S52", "T186_S101", "T189_S16", "T190_S38", "T192_S44", "T193_S32", "T194_S39", "T196_S47", "T198_S55", "T200_S63", "T26_S78", "T28_S7", "T29_S35", "T30_S49", "T31_S13", "T37_S48", "T38_S117", "T39_S118", "T40_S119", "T41_S120", "T45_S21", "T48_S29", "T50_S36", "T55_S44", "T58_S52", "T59_S89", "T62_S25", "T69_S30", "T71_S60", "T73_S69", "T74_S36", "T75_S74", "T76_S79", "T79_S86", "T81_S50", "T82_S14", "T94_S42", "T96_S30", "T97_S37")
colnames(B_deapths) <- Bnames
rownames(B_deapths) <- B_deapths[,1]
colnames(T_deapths) <- Tnames
rownames(T_deapths) <- T_deapths[,1]
B_deapths <- as.data.frame(B_deapths)
T_deapths <- as.data.frame(T_deapths)


setwd("~/BRCA_mtDNA_duos/samples_depth_discrimination/")

#save(B_deapths, T_deapths, all_deapths, file="mit.all.deapths.RData")

load("mit.all.deapths.RData")

dfm <- melt(all_deapths,  id.vars = 'base_pair', variable.name = 'sample')
colnames(dfm) <- c("base_pair", "sample", "coverage")
head(dfm)

min <- all_deapths[,1][which(rowMeans(all_deapths[,-1]) < 300)]

g <- ggplot(dfm, aes(x = base_pair, y = coverage, colour = sample)) + 
	geom_line() + 
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank()) + 
	geom_vline(xintercept = min)

# which(colMeans(all_deapths[-which(rowMeans(all_deapths[,-1]) < 500),]) < 300)

###########################################################################################
######  Found min under 300 depth zones

interv <- function(x) {
	if (!is.vector(x)) {
		warning("argument is not a vector: returning NA")
		return(NA_real_)
	}
	int <- x[1]
	for  (i in 1:(length(x)-1)) {
	           if(x[i+1] - x[i] > 1) {
		           int <- c(int, x[i], x[i+1])
		}
	}
	int <- c(int, x[length(x)])
	mat <- matrix(int, ncol = 2, byrow = TRUE, dimnames = list(c(1:(length(int)/2)), c("from", "to")))
            return(mat)
}

interv(min)

############################################################################################

amplicon1 <- all_deapths[c(1:623,8982:16569),]
amplicon1a <- amplicon1
amplicon1a[1:623,1] <- seq(from = 16570, by = 1, length.out = 623)

amplicon2 <- all_deapths[623:8981,]

dfm_a <- melt(amplicon1a,  id.vars = 'base_pair', variable.name = 'sample')
dfm_b <- melt(amplicon2,  id.vars = 'base_pair', variable.name = 'sample')
colnames(dfm_a) <- c("base_pair", "sample", "coverage")
colnames(dfm_b) <- c("base_pair", "sample", "coverage")
head(dfm_a)

aplot <- ggplot(dfm_a, aes(x = base_pair, y = coverage, colour = sample)) + geom_line()
bplot <- ggplot(dfm_b, aes(x = base_pair, y = coverage, colour = sample)) + geom_line()
grid.arrange(aplot, bplot, nrow=2)


threshold = 300 #change

# Filtered samples
 
fil1 <- names(which(colMeans(amplicon1) < threshold))
fil2 <- names(which(colMeans(amplicon2) < threshold))

# Plots

filt_a <- melt(cbind(amplicon1a[,1],amplicon1a[,names(which(colMeans(amplicon1a) < threshold))]),  id.vars = 'amplicon1a[, 1]', variable.name = 'sample')
colnames(filt_a) <- c("base_pair", "sample", "coverage")
filt_b <- melt(cbind(amplicon2[,1],amplicon2[,names(which(colMeans(amplicon2) < threshold))]),  id.vars = 'amplicon2[, 1]', variable.name = 'sample')
colnames(filt_b) <- c("base_pair", "sample", "coverage")


fag <- ggplot(filt_a, aes(x = base_pair, y = coverage, colour = sample)) + 
	ggtitle(paste(c("amplicon 1, filter > ", threshold), collapse = " ")) + 
	geom_line() + 
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank()) + 
	geom_vline(xintercept = 16570)  + 
	ylim(0, 4000)
fbg <- ggplot(filt_b, aes(x = base_pair, y = coverage, colour = sample)) + 
	ggtitle(paste(c("amplicon 2, filter > ", threshold), collapse = " ")) + 
	geom_line() + 
	theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())  + 
	ylim(0, 4000)
pareja <- grid.arrange(fag, fbg, nrow=2)
plotname <- paste("amplic_filt", threshold, ".pdf", sep = "")
ggsave(plotname, plot = pareja)

# Plot pass filter

filB <- c("B120_S57", "B141_S59", "B158_S67", "B200_S73", "B26_S56", "B140_S54", "B158_S67", "B176_S12", "B26_S56")
filT <- c("T108_S61", "T120_S58", "T138_S123", "T140_S38", "T50_S36",  "T97_S37", "T120_S58", "T38_S117", "T40_S119", "T59_S89")


rest1 <- B_deapths[,!colnames(B_deapths) %in% filB]
rest2 <- T_deapths[,!colnames(T_deapths) %in% filT]

rest_a <- melt(rest1,  id.vars = 'base_pair', variable.name = 'sample')
rest_b <- melt(rest2,  id.vars = 'base_pair', variable.name = 'sample')
colnames(rest_a) <- c("base_pair", "sample", "coverage")
colnames(rest_b) <- c("base_pair", "sample", "coverage")
head(rest_a)

r1plot <- ggplot(rest_a, aes(x = base_pair, y = coverage, colour = sample)) + 
	geom_line() +
	#theme(legend.position= "right", panel.grid.minor=element_blank(), panel.grid.major=element_blank()) +
	scale_x_continuous(breaks = seq(0, max(rest_a[,1]), by =  500)) +
	scale_y_continuous(breaks = seq(0, max(rest_a[,3]) + 100, by = 500)) +
	guides(col = guide_legend(ncol = 3))

r2plot <- ggplot(rest_b, aes(x = base_pair, y = coverage, colour = sample)) + 
	geom_line() +
	#theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank()) +
	scale_x_continuous(breaks = seq(0, max(rest_b[,1]), by =  500)) +
	scale_y_continuous(breaks = seq(0, max(rest_b[,3]) + 100, by = 500)) +
	guides(col = guide_legend(ncol = 3))

filtrados <- grid.arrange(r1plot, r2plot, nrow=2)
ggsave("filtrados.pdf", plot = filtrados)

