library(ggplot2)
library(dplyr)

# 创建数据框 d_nhsub
d_nhsub <- data.frame(
  Education = c("High School", "Bachelor", "Master", "High School", "PhD", "Bachelor", "PhD", "Master", "High School") # nolint: line_length_linter.
)

# 计算每个教育类别的计数，并计算比例
d_edu <- d_nhsub |>
  count(Education) |>
  mutate(pct = n / sum(n)) |>
  mutate(Education = factor(Education, levels = c("High School", "Bachelor", "Master", "PhD")))  # 重新排序因子水平 # nolint: line_length_linter.

# 使用 ggplot2 绘制柱状图，增加标题和标签
print(ggplot(d_edu, aes(x = Education, y = n)) +
  geom_col(fill = "steelblue") +  # 添加颜色
  labs(
    title = "Distribution of Education Levels",
    x = "Education Level",
    y = "Count"
  ) +
  theme_minimal() +  # 使用简约主题
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
    plot.title = element_text(hjust = 0.5)  # 居中标题
  ))
