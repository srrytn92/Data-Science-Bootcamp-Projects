# build aregression model

head(mtcars)

model <- lm(mpg ~ hp + wt, data = mtcars)

summary(model)
