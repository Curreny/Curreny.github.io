#import "../index.typ": template, tufted
#show: template.with(title: "Curreny的博客")

#tufted.margin-note(image("1.jpg"))
= 博客 / Blog

== 2026

#tufted.blog-entry(
  date: datetime(year: 2026, month: 11, day: 13),
  path: "2026-11-13-blog3/",
  title: "关于 Codex 与 Clash，自己的一点折腾",
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 11, day: 8),
  path: "2026-11-08-blog2/",
  title: "从宝可梦通关到Wiki表征：Anthropic最新的Agent Memory架构和“做梦”机制",
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 12),
  path: "2026-06-12-blog1/",
  title: "博客示例",
)

