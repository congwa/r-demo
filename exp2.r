library(ggplot2)

# 创建数据框
df1 <- data.frame(x = seq(-2, 2, length.out=100))
df1$y <- exp(df1$x)

df2 <- data.frame(x = seq(0.01, 10, length.out=100))
df2$y <- log(df2$x)

# 使用ggplot2绘图
p1 <- ggplot(df1, aes(x, y)) +
  geom_line(color = "blue") +
  ggtitle("y = exp(x) 在[-2,2]区间") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

p2 <- ggplot(df2, aes(x, y)) +
  geom_line(color = "red") +
  ggtitle("y = ln(x) 在[0.01,10]区间") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# 并排显示两个图形
library(gridExtra)
grid.arrange(p1, p2, ncol=2)