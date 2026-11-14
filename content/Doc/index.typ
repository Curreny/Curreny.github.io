#import "../index.typ": template, tufted
#show: template.with(title: "Curreny的文档")

#tufted.margin-note(image("1.jpg"))
= 文档 / Doc

== 2026
#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 12),
  path: "blog-template/",
  title: "博客模板",
)
#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 12),
  path: "website-config/",
  title: "网站配置",
)
#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 12),
  path: "typst-example/",
  title: "Typst 示例",
)
#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 12),
  path: "github-deploy/",
  title: "GitHub 网站部署",
)
#tufted.blog-entry(
  date: datetime(year: 2026, month: 6, day: 12),
  path: "custom-styling/",
  title: "自定义样式",
)