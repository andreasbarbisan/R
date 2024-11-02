#APS2 - Estatística 1 - Andreas Azambuja Barbisan, Amanda Ribeiro Caroline da Costa e  e Lucas Vilela

# Item "a":

"
Qualitativa nominal:
- Artist
- Track
- Album
- Genre

Quantitativa contínua:
- Energy
- Loudness
- Speechiness
- Acousticness
- Liveness

Quantitativa discreta:
- Duration_ms
- Stream
- Likes
- Views

"

# Item B:

boxplot(APS$Duration_ms/1000,
        col = "lightblue",
        ylab = "Tempo (segundos)",
        xlab = "Duração da música",
        main = "Esquema de 5 pontos (Boxplot) da duração das músicas",
        ylim = c(90, 350))

quantileduration = quantile(APS$Duration_ms)/1000
tabeladuration = round(cbind(quantileduration), 1)
colnames(tabeladuration) = c("Duração das músicas (segundos)")
View(tabeladuration)

# Item C:

par(mfrow = c(1,1))
boxplot(APS$Duration_ms[APS$Genre == "RnB"]/1000,
        APS$Duration_ms[APS$Genre == "Dark Trap"]/1000,
        APS$Duration_ms[APS$Genre == "Rap"]/1000,
        col = c("darkblue", "grey", "purple"),
        xlab = "Gêneros Músicais", ylab = "Tempo (segundos)",
        main = "Duração das músicas por gênero musical",
        ylim = c(90, 450),
        cex.main = 1.3, 
        cex.lab = 1.3)
legend("topright",
       legend = c("RnB", "Dark Trap", "Rap"),
       fill = c("darkblue", "grey", "purple"),
       cex = 0.7)

# Item D:

corenergy = cor(APS$Energy, APS$Stream)
corloudness= cor(APS$Loudness, APS$Stream)
corspeechiness = cor(APS$Speechiness, APS$Stream)
coracousticness = cor(APS$Acousticness, APS$Stream)
corliveness = cor(APS$Liveness, APS$Stream)

tabelacor = round(rbind(corenergy, corloudness, corspeechiness, coracousticness, corliveness), 2)
colnames(tabelacor) = c("Índice de correlação linear com Stream")
rownames(tabelacor) = c("Energy", "Loudness", "Speechiness", "Acousticness", "Liveness")
View(tabelacor) 


# Item E:


# RnB:
corrnbenergy = cor(APS$Energy[APS$Genre == "RnB"], APS$Stream[APS$Genre == "RnB"])
corrnbloudness = cor(APS$Loudness[APS$Genre == "RnB"], APS$Stream[APS$Genre == "RnB"])
corrnbspeechiness = cor(APS$Speechiness[APS$Genre == "RnB"], APS$Stream[APS$Genre == "RnB"])
corrnbacousticness = cor(APS$Acousticness[APS$Genre == "RnB"], APS$Stream[APS$Genre == "RnB"])
corrnbliveness = cor(APS$Liveness[APS$Genre == "RnB"], APS$Stream[APS$Genre == "RnB"])

tabelacorrnb = round(rbind(corrnbenergy, corrnbloudness, corrnbspeechiness, corrnbacousticness, corrnbliveness), 2)
colnames(tabelacorrnb) = c("RnB")
rownames(tabelacorrnb) = c("Energy", "Loudness", "Speechiness", "Acousticness", "Liveness")

# Dark Trap:
cordkenergy = cor(APS$Energy[APS$Genre == "Dark Trap"], APS$Stream[APS$Genre == "Dark Trap"])
cordkloudness = cor(APS$Loudness[APS$Genre == "Dark Trap"], APS$Stream[APS$Genre == "Dark Trap"])
cordkspeechiness = cor(APS$Speechiness[APS$Genre == "Dark Trap"], APS$Stream[APS$Genre == "Dark Trap"])
cordkacousticness = cor(APS$Acousticness[APS$Genre == "Dark Trap"], APS$Stream[APS$Genre == "Dark Trap"])
cordkliveness = cor(APS$Liveness[APS$Genre == "Dark Trap"], APS$Stream[APS$Genre == "Dark Trap"])

tabelacordk = round(rbind(cordkenergy, cordkloudness, cordkspeechiness, cordkacousticness, cordkliveness), 2)
colnames(tabelacordk) = c("Dark Trap")
rownames(tabelacordk) = c("Energy", "Loudness", "Speechiness", "Acousticness", "Liveness")

# Rap:
corrapenergy = cor(APS$Energy[APS$Genre == "Rap"], APS$Stream[APS$Genre == "Rap"])
corraploudness = cor(APS$Loudness[APS$Genre == "Rap"], APS$Stream[APS$Genre == "Rap"])
corrapspeechiness = cor(APS$Speechiness[APS$Genre == "Rap"], APS$Stream[APS$Genre == "Rap"])
corrapacousticness = cor(APS$Acousticness[APS$Genre == "Rap"], APS$Stream[APS$Genre == "Rap"])
corrapliveness = cor(APS$Liveness[APS$Genre == "Rap"], APS$Stream[APS$Genre == "Rap"])

tabelacorrap = round(rbind(corrapenergy, corraploudness, corrapspeechiness, corrapacousticness, corrapliveness), 2)
colnames(tabelacorrap) = c("Rap")
rownames(tabelacorrap) = c("Energy", "Loudness", "Speechiness", "Acousticness", "Liveness")

# União das três tabelas 
tabelacorrelacoes = cbind(tabelacorrnb, tabelacordk, tabelacorrap)
View(tabelacorrelacoes)

# Item F:
par(mfrow = c(1, 3))

#RnB

streamrnb = APS$Stream[APS$Genre == "RnB"]/1000000
speechinessrnb = APS$Speechiness[APS$Genre == "RnB"]

plot(streamrnb ~ speechinessrnb,
     main = "RnB",
     xlab = "Speechiness",
     ylab = "Sucesso da música (Streams) - em milhões de streams",
     cex = 1,
     pch = 18,
     col = "darkblue")
abline(lm(streamrnb ~ speechinessrnb))

coefrnb = round(coef(lm(streamrnb ~ speechinessrnb)), 2)

intercepto1 = coefrnb[1]
coef_angular1 = coefrnb[2]

legend("topright", legend = c(paste("Intercepto:", round(intercepto1, 2)), paste("Coef. Angular:", round(coef_angular1, 2))), bty = "i", cex = 0.8)

#Dark Trap

streamdk = APS$Stream[APS$Genre == "Dark Trap"]/1000000
speechinessdk = APS$Speechiness[APS$Genre == "Dark Trap"]

plot(streamdk ~ speechinessdk,
     main = "Dark Trap",
     xlab = "Speechiness",
     ylab = "Sucesso da música (Streams) - em milhões de streams",
     cex = 1,
     pch = 18,
     col = "purple")
abline(lm(streamdk ~ speechinessdk))

coefdk = round(coef(lm(streamdk ~ speechinessdk)), 2)

intercepto2 = coefdk[1]
coef_angular2 = coefdk[2]

legend("topright", legend = c(paste("Intercepto:", round(intercepto2, 2)), paste("Coef. Angular:", round(coef_angular2, 2))), bty = "i", cex = 0.8)

#Rap
streamrap = APS$Stream[APS$Genre == "Rap"]/1000000
energyrap = APS$Energy[APS$Genre == "Rap"]

plot(streamrap ~ energyrap,
     main = "Rap",
     xlab = "Energia da música",
     ylab = "Sucesso da música (Streams) - em milhões de streams",
     cex = 1,
     pch = 18,
     col = "lightblue")
abline(lm(streamrap ~ energyrap))

coefrap = round(coef(lm(streamrap ~ energyrap)), 2)

intercepto3 = coefrap[1]
coef_angular3 = coefrap[2]

legend("topright", legend = c(paste("Intercepto:", round(intercepto3, 2)), paste("Coef. Angular:", round(coef_angular3, 2))), bty = "i", cex = 0.8)

# Item G:

par(mfrow = c(1, 1))

boxplot(APS$Likes[APS$Genre=="RnB"]/1000000,
        APS$Likes[APS$Genre=="Dark Trap"]/1000000,
        APS$Likes[APS$Genre =="Rap"]/1000000,
        main = "Número de likes por gênero musical (em milhões de likes)",
        col= c("darkblue", "purple", "lightblue"),
        ylim = c(0, 35))

legend("topright", legend = c("RnB", "Dark Trap", "Rap"), fill = c("darkblue", "purple", "lightblue"))


# Item H:

stream_mi = APS$Stream/1000000
likes_mi = APS$Likes/1000000

plot(likes_mi ~ stream_mi,
     ylab = "Likes no YouTube (em milhões de likes)",
     xlab = "Streams no Spotify (em milhões de streams)",
     cex = 0.7,
     cex.lab = 0.7,
     pch = 18,
     col = "darkblue",
     main = "Streams no Spotify x Likes no YouTube")
abline(lm(likes_mi ~ stream_mi))

coefstream = round(coef(lm(likes_mi ~ stream_mi)), 2)

intercepto4 = coefstream[1]
coef_angular4 = coefstream[2]

legend("topright", legend = c(paste("Intercepto:", round(intercepto4, 2)), paste("Coef. Angular:", round(coef_angular4, 2))), bty = "i", cex = 0.7)


#Equação da reta:
coefreta = coef(lm(stream_mi ~ likes_mi))
a = coefreta[2]
b = coefreta[1]

#Correlação
correlH = cor(stream_mi, likes_mi)

# Item I:

likes_mi = APS$Likes/1000000
views_mi = APS$Views/1000000


plot(likes_mi ~ views_mi,
     ylab = "Likes no YouTube (em milhões de likes)",
     xlab = "Views no Youtube (em milhões de views)",
     cex = 0.7,
     cex.lab = 0.7,
     pch = 18,
     col = "darkblue",
     main = "Views no Yotube x Likes no YouTube")
abline(lm(likes_mi ~ views_mi))

coefstream2 = round(coef(lm(likes_mi ~ views_mi)), 2)

intercepto5 = coefstream2 [1]
coef_angular5 = coefstream2 [2]

legend("topright", legend = c(paste("Intercepto:", round(intercepto5, 2)), paste("Coef. Angular:", round(coef_angular5, 2))), bty = "i", cex = 0.7)

#Equação da reta:
coefreta = coef(lm(likes_mi ~ views_mi))
a = coefreta[2]
b = coefreta[1]

#Correlação
correlI = cor(likes_mi, views_mi)

plot(views_mi ~ stream_mi,
     ylab = "Views no YouTube (em milhões de views)",
     xlab = "Streams no Spotify (em milhões de streams)",
     cex = 0.7,
     cex.lab = 0.7,
     pch = 18,
     col = "darkblue",
     main = "Views no Yotube x Streams no Spotify")
abline(lm(views_mi ~ stream_mi))
coefstream3 = round(coef(lm(views_mi ~ stream_mi)), 2)

intercepto6 = coefstream3 [1]
coef_angular6 = coefstream3 [2]

legend("topright", legend = c(paste("Intercepto:", round(intercepto6, 2)), paste("Coef. Angular:", round(coef_angular6, 2))), bty = "i", cex = 0.7)

#Equação da reta:
coefreta = coef(lm(views_mi ~ stream_mi))
a = coefreta[2]
b = coefreta[1]

#Correlação
correlI = cor(views_mi ~ stream_mi)