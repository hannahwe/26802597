datcolatplayers <- Data_Collating(Datroot = "data/players/")
datcolat1 <- Data_Collating(Datroot = "data/rankings/")

#rename matching variable
datcolat1 <- rename(datcolat1, player_id = player) #player csv file

#now matched players and the ranking....
playerranking <- merge(datcolat1,datcolatplayers,by="player_id")
#merge by gemeinsamer Variable
datcolat2 <- Data_Collating(Datroot = "data/Tennis_single_atp/")