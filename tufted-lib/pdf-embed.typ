
/// 在 HTML 输出中嵌入 PDF（浏览器原生 PDF 查看器），PDF 输出时降级为第一页图片。
/// - `path`: PDF 文件路径（相对于 .typ 文件）
/// - `width`: 嵌入宽度，默认 100%（正文同宽 55%，可改为 100% 撑满）
/// - `height`: 嵌入高度，默认 600pt（约 800px）
#let embed-pdf(path, width: 100%, height: 600pt) = {
  context {
    if target() == "html" {
      // width 语义和 #image 一致：百分比相对于正文 55% 列，不是整个页面。
      // CSS 定位复用 section > img 的公式：
      //   max-width: col%;  left: col/2%;  transform: translateX(-50%)
      // 其中 col = width_ratio * 55（正文列占页面 55%）
      let w; let pos
      if type(width) == ratio {
        let col = calc.round(width / 1% * 0.55, digits: 2)
        w = str(col) + "%"
        pos = str(col / 2)
      } else {
        w = str(int(width.pt())) + "px"
        pos = "0"
      }
      let h = str(int(height.pt())) + "px"
      let style = if type(width) == ratio {
        "max-width: " + w + "; position: relative; left: " + pos + "%; transform: translateX(-50%); border: none; display: block; margin: 1em 0;"
      } else {
        "max-width: " + w + "; border: none; display: block; margin: 1em 0;"
      }
      html.elem("iframe",
        attrs: (
          src: path,
          width: "100%",
          height: h,
          style: style,
        ),
        []
      )
    } else {
      image(path, width: width)
    }
  }
}