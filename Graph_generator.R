#dataset.main = read.csv("N=3_results.csv", header=FALSE)
#dataset.main = read.csv("N=4_results.csv", header=FALSE) #Choose 1
#dataset.main = read.csv("N=5_results.csv", header=FALSE)

BFS3 = read.csv("BFS3.csv")
Manhattan3 = read.csv("Manhattan3.csv")
Euclidean3 = read.csv("Euclidean3.csv")
Misplaced3 = read.csv("Misplaced3.csv")

Manhattan4 = read.csv("Manhattan4.csv")
Euclidean4 = read.csv("Euclidean4.csv")
Misplaced4 = read.csv("Misplaced4.csv")

Manhattan5 = read.csv("Manhattan5.csv")
Euclidean5 = read.csv("Euclidean5.csv")
Misplaced5 = read.csv("Misplaced5.csv")

x = c()
for (q in 1:4650){ #5200 for n=3
  if (q %% 150 == 1){ #200 for n=3
    x = c(x,q)
  }
}

for (z in x){

  start = z
  end = start + 150 #200 for n = 3
  
  BFS.time = 0
  BFS.pathcost = 0
  BFS.visted = 0
  BFS.unique = 0
  BFS.in_queue = 0
  
  Manhattan.time = 0
  Manhattan.pathcost = 0
  Manhattan.visted = 0
  Manhattan.unique = 0
  Manhattan.in_queue = 0
  
  Euclidean.time = 0
  Euclidean.pathcost = 0
  Euclidean.visted = 0
  Euclidean.unique = 0
  Euclidean.in_queue = 0
  
  Misplaced.time = 0
  Misplaced.pathcost = 0
  Misplaced.visted = 0
  Misplaced.unique = 0
  Misplaced.in_queue = 0
  
  for (i in start:end){ #length(dataset.main[,1])){
    
    if (i %% 4 == 2){ #i %% 3 for n = 4,5
      Manhattan.time = Manhattan.time + dataset.main[i,4]
      Manhattan.pathcost = Manhattan.pathcost + dataset.main[i,5]
      Manhattan.visted = Manhattan.visted + dataset.main[i,6]
      Manhattan.unique = Manhattan.unique + dataset.main[i,7]
      Manhattan.in_queue = Manhattan.in_queue + dataset.main[i,8]
    }
    
    else if (i %% 4 == 1){ #comment out this block forn = 4,5
      BFS.time = BFS.time + dataset.main[i,4]
      BFS.pathcost = BFS.pathcost + dataset.main[i,5]
      BFS.visted = BFS.visted + dataset.main[i,6]
      BFS.unique = BFS.unique + dataset.main[i,7]
      BFS.in_queue = BFS.in_queue + dataset.main[i,8]
    }
      
    
    else if (i %% 4 == 3){ #i %% 3 for n = 4,5
      Euclidean.time = Euclidean.time + dataset.main[i,4]
      Euclidean.pathcost = Euclidean.pathcost + dataset.main[i,5]
      Euclidean.visted = Euclidean.visted + dataset.main[i,6]
      Euclidean.unique = Euclidean.unique + dataset.main[i,7]
      Euclidean.in_queue = Euclidean.in_queue + dataset.main[i,8]
    }
    
    else if (i %% 4 == 0){ # i %% 3 for n = 4,5
      Misplaced.time = Misplaced.time + dataset.main[i,4]
      Misplaced.pathcost = Misplaced.pathcost + dataset.main[i,5]
      Misplaced.visted = Misplaced.visted + dataset.main[i,6]
      Misplaced.unique = Misplaced.unique + dataset.main[i,7]
      Misplaced.in_queue = Misplaced.in_queue + dataset.main[i,8]
    }
  }
  
  
  BFS.stats = data.frame(BFS.time/50, BFS.pathcost/50, BFS.visted/50, BFS.unique/50, BFS.in_queue/50)
  Manhattan.stats = data.frame(Manhattan.time/50, Manhattan.pathcost/50, Manhattan.visted/50, Manhattan.unique/50, Manhattan.in_queue/50)
  Euclidean.stats = data.frame(Euclidean.time/50, Euclidean.pathcost/50, Euclidean.visted/50, Euclidean.unique/50, Euclidean.in_queue/50)
  Misplaced.stats = data.frame(Misplaced.time/50, Misplaced.pathcost/50, Misplaced.visted/50, Misplaced.unique/50, Misplaced.in_queue/50)
  
  BFS3 = rbind(BFS3, BFS.stats)
  Manhattan5 = rbind(Manhattan5, Manhattan.stats)
  Euclidean5 = rbind(Euclidean5, Euclidean.stats)
  Misplaced5 = rbind(Misplaced5, Misplaced.stats)
}

write.csv(Manhattan5, "Manhattan5.csv")
write.csv(Euclidean5, "Euclidean5.csv")
write.csv(Misplaced5, "Misplaced5.csv")
write.csv(BFS3, "BFS3.csv")

########################################################

data.BFS = read.csv("BFS3.csv", header=TRUE)
data.Manhattan = read.csv("Manhattan3.csv", header=TRUE)
data.Euclidean = read.csv("Euclidean3.csv", header=TRUE)
data.Misplaced = read.csv("Misplaced3.csv", header=TRUE)

x1range <- c(0,30)
y1range <- c(0,max(log(data.BFS$BFS.visted.50)))

plot(x1range, y1range, type="n", xlab="Depth of goal node",
     ylab="log(Number of nodes expanded)")

lines(data.BFS$BFS.pathcost.50, log(data.BFS$BFS.visted.50), type="b", lwd=1.5,
      col = "green4")

lines(data.Manhattan$Manhattan.pathcost.50, log(data.Manhattan$Manhattan.visted.50), type="b", lwd=1.5,
      col = "black")

lines(data.Euclidean$Euclidean.pathcost.50, log(data.Euclidean$Euclidean.visted.50), type="b", lwd=1.5,
      col = "blue")

lines(data.Misplaced$Misplaced.pathcost.50, log(data.Misplaced$Misplaced.visted.50), type="b", lwd=1.5,
      col = "red")

legend(1,12, legend = c("BFS", "Misplaced", "Euclidean", "Manhattan"), col = c("green4", "red", "blue", "black"), lty = 1)

#######################################################################

data.Manhattan = read.csv("Manhattan4.csv", header=TRUE)
data.Euclidean = read.csv("Euclidean4.csv", header=TRUE)
data.Misplaced = read.csv("Misplaced4.csv", header=TRUE)

x2range <- c(0,30)
y2range <- c(0,max(log(data.Misplaced$Misplaced.visted.50)))

plot(x2range, y2range, type="n", xlab="Depth of goal node",
     ylab="log(Number of nodes expanded)")

lines(data.Manhattan$Manhattan.pathcost.50, log(data.Manhattan$Manhattan.visted.50), type="b", lwd=1.5,
      col = "black")

lines(data.Euclidean$Euclidean.pathcost.50, log(data.Euclidean$Euclidean.visted.50), type="b", lwd=1.5,
      col = "blue")

lines(data.Misplaced$Misplaced.pathcost.50, log(data.Misplaced$Misplaced.visted.50), type="b", lwd=1.5,
      col = "red")

legend(1,12, legend = c("Misplaced", "Euclidean", "Manhattan"), col = c("red", "blue", "black"), lty = 1)

#######################################################################

data.Manhattan = read.csv("Manhattan5.csv", header=TRUE)
data.Euclidean = read.csv("Euclidean5.csv", header=TRUE)
data.Misplaced = read.csv("Misplaced5.csv", header=TRUE)

x2range <- c(0,30)
y2range <- c(0,max(log(data.Misplaced$Misplaced.visted.50)))

plot(x2range, y2range, type="n", xlab="Depth of goal node",
     ylab="log(Number of nodes expanded)")

lines(data.Manhattan$Manhattan.pathcost.50, log(data.Manhattan$Manhattan.visted.50), type="b", lwd=1.5,
      col = "black")

lines(data.Euclidean$Euclidean.pathcost.50, log(data.Euclidean$Euclidean.visted.50), type="b", lwd=1.5,
      col = "blue")

lines(data.Misplaced$Misplaced.pathcost.50, log(data.Misplaced$Misplaced.visted.50), type="b", lwd=1.5,
      col = "red")

legend(1,12, legend = c("Misplaced", "Euclidean", "Manhattan"), col = c("red", "blue", "black"), lty = 1)