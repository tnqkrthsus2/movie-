library(xml2)
library(XML)
library(stringr)
#도굴
baseurl <- "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=193194&target=after&page="
all.movie.review <- data.frame()
for(page in 1:30){
  url <- paste(baseurl,page,sep='')
  html <- read_html(url, encoding = "CP949")
  html.parsed <- htmlParse(html)
  review <- xpathSApply(html.parsed, "//td[@class='title']", function(x) {val <- unlist(xpathSApply(x, "./text()[normalize-space()]", xmlValue)) 
  if (is.null(val)) val <- NA 
  else val})
  review <- gsub("\n", "", review)
  review <- gsub("\t", "", review)
  score <- xpathSApply(html.parsed, "//*[@id='old_content']//td/div/em", xmlValue)
  score <- as.numeric(score)
  movie.review <- data.frame(score=score, review=review)
  all.movie.review <- rbind(all.movie.review, movie.review)
  print(page)
  str(movie.review)
}
all.movie.review <- cbind(id=1:nrow(all.movie.review), all.movie.review)

#점수 분포 시각화
library(ggplot2)
ggplot(all.movie.review, aes(x=score)) +
  geom_bar() +
  scale_x_continuous(breaks=c(1:10))

str(all.movie.review)
review


xpath
mean(all.movie.review$score)
#호평과 악평을 구분해 워드 클라우드 생성
positive.review <- subset(all.movie.review, score>=mean(all.movie.review$score))
positive.review
str(positive.review)
negative.review <- subset(all.movie.review, score<mean(all.movie.review$score))
negative.review
str(negative.review)
head(negative.review)
head(positive.review)
useSejongDic()
warnings()
negative <- sapply(negative.review$review, extractNoun)
negative
negative <- extractNoun(negative.review$review)
negative
negative <- extractNoun(negative.review$review)
negative
positive <- extractNoun(positive.review$review)
positive
str(negative)
positive
str(positive)
review_unlist <- unlist(review)
review_unlist
wordcount <- table(review_unlist)
wordcount
head(wordcount)
wordcount_top <- head(sort(wordcount, decreasing = T), 100)
wordcount_top
wordcloud(names(wordcount_top), wordcount_top)
wordcloud(names(wordcount_top),wordcount_top)

library(ggplot2)
ggplot(all.movie.review, aes(x=score)) +
  geom_bar() +
  scale_x_continuous(breaks=c(1:10))
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("tm")
install.packages("slam")
install.packages("KoNLP")
library(RColorBrewer)
library(tm)
library(wordcloud)
library(slam)
library(KoNLP)
library(digest)
library(Sejong)
library(hash)
library(rJava)
library(tau)
library(RSQLite)
library(devtools)

install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
install.packages("digest")

useSejongDic()

review <- sapply(all.movie.review$review, extractNoun)
review
review_unlist <- unlist(review)
review_unlist
wordcount <- table(review_unlist)
wordcount
head(wordcount)
wordcount_top <- head(sort(wordcount, decreasing = T), 100)
wordcount_top
wordcloud(names(wordcount_top), wordcount_top)
wordcloud(names(wordcount_top),wordcount_top)
#???? ?״? ????
baseurl <- "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=190381&target=after&page=1"
all.movie.review <- data.frame()
for(page in 1:30){
  url <- paste(baseurl,page,sep='', encoding="euc-kr")
  html <- read_html(url)
  html.parsed <- htmlParse(html)
  review <- xpathSApply(html.parsed, "//*[@id='old_content']/table/tbody/tr/td[2]/text()", xmlValue)
  review <- gsub("\n", "", review)
  review <- gsub("\t", "", review)
  review <- review[-c(which(review==""))]
  score <- xpathSApply(html.parsed, "//*[@id='old_content']//td/div/em", xmlValue)
  score <- as.numeric(score)
  movie.review <- data.frame(score=score, review=review)
  all.movie.review <- rbind(all.movie.review, movie.review)
}
all.movie.review <- cbind(id=1:nrow(all.movie.review), all.movie.review)
str(all.movie.review)