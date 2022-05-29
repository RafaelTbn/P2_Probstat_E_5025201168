#1
data <- data.frame(
  Responden=c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  X=c(78, 75, 67, 77, 70, 72, 78, 74, 77),
  Y=c(100, 95, 70, 90, 90, 90, 89, 90, 100)
)
significance <- 0.05
dataDf <- 8

#a
dataDiff <- data$Y - data$X
dataSd <- sd(dataDiff)
paste(dataSd)

#b
dataTScore <- qt(p=(significance/2), df=dataDf, lower.tail = FALSE)
dataPValue <- pt(q=dataTScore, df =dataDf, lower.tail=FALSE)

paste(dataTScore)
paste(dataPValue)

#c
dataX <- data$X
dataY <- data$Y

t.test(dataY, dataX, var.equal = TRUE)

#2

cat("H0 : mu <= 20.000","\n","H0 : mu > 20.000")
xbar2 = 23500         
mu02 = 20000
sd2 = 3900
n2 = 100
z2 = (xbar2-mu02)/(sd2/sqrt(n2)) 
z2

alpha2 =0.05
z.alpha2 = qnorm(1-alpha2) 
z.alpha2 

#a
cat("saya setuju dengan klaim tersebut karena setelah diuji ternyata tolak H0 (z>Z.alpha) sehingga rata-rata mobil dikemudikan per tahun lebih dari 20.000km")

#b
cat("seperti yang sudah tertulis diatas nilai 8,974359 merupakan nilai dari zhitung(z2 dalam syntax ini) melebihi nilai ztabel(z.alpha2) sehingga keputusan yang diambil adalah Tolak H0","\n",
    "sehingga disimpulkan bahwa rata-rata mobil dikemudikan pertahun lebih dari 20.000km")
#c
pval = pnorm(z2, lower.tail=FALSE) 
pval 
cat("Dikarenakan nilai pvalue< alpha(0,05) maka keputusan yang diambil adalah Tolak H0","\n",
    "sehingga disimpulkan bahwa rata-rata mobil dikemudikan pertahun lebih dari 20.000km")

#3
library(BSDA)

#a
cat("H0 : mu = mu0","\n","mu !=(tidak sama dengan) mu0")

#b) Sampel statistik menggunakan uji t
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y=2.79, s.y = 1.32, n.y = 27, 
          alternative = "two.sided", mu = 0, var.equal = TRUE,
          conf.level = 0.95)

#c
xbar3 = 2.79
mu03 = 3.64
s3 = 1.32
n3 = 27              
t3 = (xbar3-mu03)/(s3/sqrt(n3)) 
t3  

#d nilai kritis
alpha3 = 0.05 
t.alpha3 = qt(1-alpha3, df=2) 
t.alpha3 

#e
cat("Keputusan : Gagal Tolak H0")

#f
cat("Kesimpulan : Tidak ada perbedaan pada rata-rata jumlah saham perusahaan di dua kota tersebut")

#4

#a Pembagian menjadi 3 subjek grup dan membuat plot kuantil normal setiap kelompok

my_data <- read.delim(file.choose())

my_data$Group <- as.factor(my_data$Group)
my_data$Group = factor(my_data$Group, labels = c("grup1", "grup1", "grup3"))


grup1 <- subset(my_data, Group == "grup1")
grup2 <- subset(my_data, Group == "grup1")
grup3 <- subset(my_data, Group == "grup3")

qqnorm(grup1$Length)

qqnorm(grup2$Length)

qqnorm(grup3$Length)

#b
bartlett.test(Length ~ Group, data = my_data)

#c 
model1 <- aov(Length ~ Group, data = my_data)
summary(model1)

#d 
# nilai p adalah 0.0013, maka H0 ditolak

#e
TukeyHSD(model1)

#f
# Visualisasikan data dengan ggplot2

library(ggplot2)
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")

#5
library(dplyr)
library(multcompView)

gtl <- read.csv(file.choose())

#a
qplot(x = Temp, y = Light, geom = "point", data = gtl) +
  facet_grid(.~Glass, labeller = label_both)

#b
gtl$Glass <- as.factor(gtl$Glass)
gtl$Temp_Factor <- as.factor(gtl$Temp)
str(gtl)

gtlaov <- aov(Light ~ Glass*Temp_Factor, data = gtl)
summary(gtlaov)

#c
data_summary <- group_by(gtl, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))

print(data_summary)

#d
tukey <- TukeyHSD(gtlaov)
print(tukey)

#e
tukey.cld <- multcompLetters4(gtlaov, tukey)
print(tukey.cld)