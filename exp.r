# 定义一个计算exp(x)的函数，使用泰勒级数
calculate_exp <- function(x, terms = 10) {
  result <- 0
  factorial <- 1
  
  for(n in 0:(terms-1)) {
    # 计算阶乘
    if(n == 0) {
      factorial <- 1
    } else {
      factorial <- factorial * n
    }
    
    # 计算当前项并累加
    term <- (x^n) / factorial
    result <- result + term
    
    cat(sprintf("第%d项: %.10f\n", n, term))
  }
  
  return(result)
}

# 测试函数
x <- 1
cat("\n计算 exp(1):\n")
approximation <- calculate_exp(1)
cat(sprintf("\n使用泰勒级数计算的结果: %.10f\n", approximation))
cat(sprintf("实际 exp(1) 的值: %.10f\n", exp(1)))

# 绘制exp(x)和ln(x)的图形
par(mfrow=c(1,2))  # 创建1行2列的图形布局

# 绘制exp(x)
x1 <- seq(-2, 2, length.out=100)
y1 <- exp(x1)
plot(x1, y1, type="l", col="blue", 
     main="y = exp(x) 在[-2,2]区间",
     xlab="x", ylab="y")
grid()

# 绘制ln(x)
x2 <- seq(0.01, 10, length.out=100)
y2 <- log(x2)
plot(x2, y2, type="l", col="red", 
     main="y = ln(x) 在[0.01,10]区间",
     xlab="x", ylab="y")
grid()