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
  title: "Anthropic 提出新的四层 Memory 架构：Agent 如何通过 Dreaming 变得更聪明？",
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 12),
  path: "2026-06-12-blog1/",
  title: "博客示例",
)