# Note: heat map is designed to work with the counties data set
# It may not work correctly with other data sets if their row order does 
# not exactly match the order in which the maps package plots counties
heatmap <- function(var, titlein) {

  # generate vector of fill colors for map
    shades <- colorRampPalette(c("yellow", "red"))(5)
    
  
  # cut the data into 5 categories and assign colors
  cutpts<-(quantile(var, probs = seq(0,1,.2)))
  cats <- as.integer(cut(var, cutpts, 
  include.lowest = TRUE, ordered = TRUE))
  fills <- shades[cats]

  # plot choropleth map
  map("county", fill = TRUE, col = fills, 
    resolution = 0, lty = 0, projection = "polyconic", 
    myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", col = "white", fill = FALSE, add = TRUE,
    lty = 1, lwd = 1, projection = "polyconic", 
    myborder = 0, mar = c(0,0,0,0))
  
  # add title
  title(titlein)
  
  # add a legend
  legend.txt<-paste0("between ", signif(cutpts[1:5],3), " and ", signif(cutpts[2:6],3))
  
  legend("bottomleft", 
    legend = legend.txt, 
    fill = shades[c(1:5)],
    cex = 0.8,
    bty = "n")
}