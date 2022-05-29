## P2_Probstat_E_5025201168

## Soal 1

![image](https://user-images.githubusercontent.com/88140623/170880460-51d2b622-4d0f-48e9-b121-bb4c66b9ee3f.png)

Pada gambar, dapat dilihat bahwa nilai dari standard deviasi selisih sebelum dan sesudah yaitu 6.359595. Selain itu, dapat dilihat bahwa TScore-nya yaitu 2.306 dan PValue-nya yaitu 0.000119. Dikarenakan nilai PValue berada di luar batas kritis (9.408 s/d 23.035), maka nilai sebelum aktivitas A dan setelah aktivitas A dianggap memiliki perbedaan yang signifikan, sehingga Aktivitas A dinilai berpengaruh secara signifikan secara statistika dalam hal kadar saturasi oksigen

## Soal 2

![image](https://user-images.githubusercontent.com/88140623/170880518-4ea424c7-06d3-4bb6-8a11-f06f719a11e1.png)
Pada gambar, dapat dilihat bahwa nilai TScore yaitu 1.644, dan nilai Z-nya yaitu 8.974. Dikarenakan nilai Z berada di dalam range penerimaan (> -1.660), maka pernyataan awal mengenai rata-rata jarak kemudi mobil > 20.000km per tahun dapat disetujui karena setelah diuji ternyata tolak H0 (z>Z.alpha) .

## Soal 3

Didapatkan hasil seperti berikut :
![image](https://user-images.githubusercontent.com/88140623/170881039-a020de56-866e-4790-bf6b-43b92390a8be.png)

## Soal 4

 ## A
  
 membuat myFile menjadi group 
      
      ```
        my_data <- read.delim(file.choose())

        my_data$Group <- as.factor(my_data$Group)
        my_data$Group = factor(my_data$Group, labels = c("grup1", "grup1", "grup3"))
      ```
  Lalu bagi tiap valuer menjadi 3 bagian ke 3 grup
      
      ```
       grup1 <- subset(my_data, Group == "grup1")
       grup2 <- subset(my_data, Group == "grup1")
       grup3 <- subset(my_data, Group == "grup3")

       qqnorm(grup1$Length)

       qqnorm(grup2$Length)

       qqnorm(grup3$Length)
      ```
 Sehingga Hasilnya sebagai berikut:

![image](https://user-images.githubusercontent.com/88140623/170881435-08d47bc7-2dc3-4a1a-b364-13728dd3e910.png)

## B

        ```
           bartlett.test(Length ~ Group, data = my_data)
        ```
        
  Kesimpulan yang didapatkan yaitu Bartlett's K-squared memiliki nilai sebesar 0.43292 dan df bernilai 2
  Sehingga Hasilnya sebagai berikut:
  
![image](https://user-images.githubusercontent.com/88140623/170881443-7bbe2c15-8981-49c8-a6f6-4f5f15438bf7.png)

## C
        ```
         model1 <- aov(Length ~ Group, data = my_data)
         summary(model1)
        ```
 Sehingga Hasilnya sebagai berikut:
 
![image](https://user-images.githubusercontent.com/88140623/170881449-7b8b88fe-f2bf-4cd0-8ce2-9ad058f6bd86.png)

## D 
   
  Nilai p adalah 0.0013 dimana kurang dari 0.005, sehingga h0 ditolak

## E

        ```
         TukeyHSD(model1)
        ```

   Sehingga Hasilnya sebagai berikut:

![image](https://user-images.githubusercontent.com/88140623/170881456-7a2a9136-a259-42a9-ba33-ed50474094d8.png)

## F 
        ```
        library("ggplot2") 
        ggplot(my_data, aes(x = Group, y = Length)) + 
        geom_boxplot(fill = "white", colour = "black") + 
        scale_x_discrete() + xlab("Group") + ylab("Length")
        ```
   Sehingga Hasilnya sebagai berikut:

![image](https://user-images.githubusercontent.com/88140623/170881458-ec751b66-799c-4f6e-828c-ce26c23dc773.png)

## Soal 5

## A

   membaca file GTL.csv dari documents

      ```
        library(dplyr)
        library(multcompView)

        gtl <- read.csv(file.choose())
      ```
   ![image](https://user-images.githubusercontent.com/88140623/170882386-d67e5283-58a6-4d3e-9a4b-05f129014df6.png)

  visualisasi menggunakan simple plot yaitu sebagai berikut
  ```
    qplot(x = Temp, y = Light, geom = "point", data = gtl) +
    facet_grid(.~Glass, labeller = label_both)
  ```
  ![image](https://user-images.githubusercontent.com/88140623/170882396-e25b66ef-118a-4a61-b98c-8db77ae93d84.png)
        
   </br>
        
## B
       ```
         gtl$Glass <- as.factor(gtl$Glass)
         gtl$Temp_Factor <- as.factor(gtl$Temp)
         str(gtl)

         gtlaov <- aov(Light ~ Glass*Temp_Factor, data = gtl)
         summary(gtlaov)
        ```
        
   ![image](https://user-images.githubusercontent.com/88140623/170882408-fcce379e-4350-430c-9ce4-fc0acda4bf4d.png)
        </br>

## C
     ```
       data_summary <- group_by(gtl, Glass, Temp) %>%
       summarise(mean=mean(Light), sd=sd(Light)) %>%
       arrange(desc(mean))

       print(data_summary)
     ```
  ![image](https://user-images.githubusercontent.com/88140623/170882413-feaf741d-e098-4a5a-b52f-30b384f79e5f.png)
        
   </br>
   
## D
         ```
          tukey <- TukeyHSD(gtlaov)
          print(tukey)
         ```
  ![image](https://user-images.githubusercontent.com/88140623/170882421-689f15ff-c864-455d-b50d-aa7f9588182b.png)
 
## E
     ```
          tukey.cld <- multcompLetters4(gtlaov, tukey)
          print(tukey.cld)
     ```
 ![image](https://user-images.githubusercontent.com/88140623/170882425-367411d0-5087-4eb5-80d9-bc06df69d2e7.png)

