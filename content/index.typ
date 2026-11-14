#import "../config.typ": template, tufted
#import "@preview/theorion:0.4.1": *
#show: template.with(title: "Curreny的文档")

#{
  tufted.margin-note(image("1.jpg"))
  tufted.margin-note[
    Recently\
    在整理自己、整理生活、整理杂杂碎碎的事儿。\
    在学习更慢地表达。\
    在把一些想法从草稿里捞出来。\
  ]
}

= Curreny's Blog

#quote-box[
  我深怕自己本非美玉，故而不敢加以刻苦琢磨，却又半信自己是块美玉，故又不肯庸庸碌碌，与瓦砾为伍。于是我渐渐地脱离凡尘，疏远世人，结果便是一任愤懑与羞恨日益助长内心那怯弱的自尊心。其实任何人都是驯兽师，而那野兽，无非就是各人的性情而已。于我而言，这种妄自尊大的羞耻心就是野兽，就是猛虎。\
  ——— 中岛敦 《山月记》
]
\
== 最近
#tufted.blog-entry(
  date: datetime(year: 2026, month: 11, day: 13),
  path: "2026-11-13-blog3/",
  title: "不开系统代理和tun，如何给Codex配置代理",
)

#tufted.blog-entry(
  date: datetime(year: 2026, month: 11, day: 8),
  path: "2026-11-08-blog2/",
  title: "Anthropic 提出新的四层 Memory 架构：Agent 如何通过 Dreaming 变得更聪明？",
)