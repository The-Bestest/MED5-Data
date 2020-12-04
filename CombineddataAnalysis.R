
source("utils/loadrawdata.R")







# ----- importing all files and cleaning things up -------
df <-    list.files(recursive=T,path = "./data",
                    pattern = "*Game.csv", 
                    full.names = T) %>% 
  data_frame(filename = .) %>%   
  mutate(file_contents = map(filename,~ read_csv(file.path(.),na = "NULL")))  %>% 
  unnest(cols=-filename) %>% 
  separate(col=filename,sep="/",into=c("start","folder","Participant","Level","filename")) %>%
  mutate(Participant=as.numeric(str_replace(Participant,"P","")))




# manipulating the time stamps

df <- df %>% mutate(vis_t_time = as.POSIXlt(vis_t_time, format = "%Y-%m-%d %H:%M:%OS"),
                    hoursecs = (vis_t_time$hour - df$vis_t_time[1]$hour) * 60 * 60,
                    minsecs = (vis_t_time$min - df$vis_t_time[1]$min) * 60,
                    secs = (vis_t_time$sec - df$vis_t_time[1]$sec),
                    timeInSecs = hoursecs + minsecs + secs)


ggplot()+ geom_smooth(method = "lm", fill = NA)
questionnaire %>% filter (SoA>2) %>% ggplot(aes(x=SoA,y=SoO,colour=Level))+geom_jitter()+ geom_smooth(method = "lm", fill = NA)






questionnaire %>% 
  filter(SoA>2) %>%
  tidy(lm(SoA~Level)) %>%
  mutate_if(is.numeric, round, 5)

lvl1 <- questionnaire %>% filter(Level == "lvl1")
lvl2 <- questionnaire %>% filter(Level == "lvl2")

quick_stats <- function(level1, level2) {
  lvl1q <- quantile(level1)
  lvl2q <- quantile(level2)
  
  t <- matrix(
    c(mean(level1), median(level1), sd(level1), paste(lvl1q[1], lvl1q[2], lvl1q[3], lvl1q[4], sep=";"),
      mean(level2), median(level2), sd(level2), paste(lvl2q[1], lvl2q[2], lvl2q[3], lvl2q[4], sep=";")
    ),ncol=4,byrow=TRUE)
  
  colnames(t) <- c("Mean","Median","SD", "Quantiles")
  rownames(t) <- c("Body","Blocks")
  
  as.table(t)
}

full_stats <- function(name, level1, level2) {
  w <- wilcox.test(level1, level2, paired = TRUE, exact = FALSE)
  
  message(name)
  print(quick_stats(level1, level2))
  cat(sprintf("Wilcoxon: %.1f (p=%.5f)\n", w$statistic, w$p.value))
  cat("\n")
}

full_stats("SoA", lvl1$SoA, lvl2$SoA)
full_stats("SoO", lvl1$SoO, lvl2$SoO)
# rho <- 

cor.test(questionnaire$SoA, questionnaire$SoO, method = "spearman", exact = FALSE)
cat(sprintf("Spearman's rho: %.1f (p=%.5f)\n", rho$statistic, rho$p.value))

full_stats("Proprioception", lvl1$Proprioception, lvl2$Proprioception)
full_stats("Frustration", lvl1$Frustration, lvl2$Frustration)
