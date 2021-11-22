# 영화의 평점과 댓글의 상관관계

## 개발환경

### Rstudio
## 참고
### [도굴](https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=193194&target=after&page=)

## 목적
### 평점과 댓글의 상관관계 분석
## 데이터 분석
### 혹평과 악평의 키워드로 워드 클라우드를 생성
![image](https://user-images.githubusercontent.com/83806593/142767627-42ce4962-1b6d-4d52-aeed-802eb5c29f82.png)
![image](https://user-images.githubusercontent.com/83806593/142767642-3714bf42-a84a-4378-a08d-427d03b57c96.png)
### 등장 빈도가 가장 높은 키워드를 중심으로 댓글을 검색
결과에 따르면 이제훈이라는 키워드는 영화의 주연 배우로, 주연 배우의 외모와 연기력이 호평에서 가장 큰 영향을 갖고있다. 반대로 스캔들이라는 키워드는 과거에 존재했던 유사한 장르의 영화로, 과거의 영화와의 유사성이 악평에서 가장 큰 영향을 갖고 있다.
## 감성분석 결과
### 감성분석으로 긍정이라고 평가를 받았던 리뷰의 평점 분포
![image](https://user-images.githubusercontent.com/83806593/142767769-50c5d31c-7671-412d-8393-10faeb64a437.png)
### 감성분석에서 부정으로 평가 받았던 리뷰의 평점 분포
![image](https://user-images.githubusercontent.com/83806593/142767801-2ab97812-4a79-46df-9833-be679e45c951.png)
## 문제점
### 감성평가의 오류 발생은 감성어 사전의 문제
![image](https://user-images.githubusercontent.com/83806593/142767921-c980e830-a401-4b45-b7cb-4c5c80fa1904.png)
스트레스라는 키워드를 인식해서 해당 평가를 부정적으로 판단
## 개선점
### 감성어 사전에는 더 많은 어휘와 의미로 구성된 단어의 추가
