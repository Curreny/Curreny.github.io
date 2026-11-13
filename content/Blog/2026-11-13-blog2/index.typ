#import "../index.typ": template, tufted
#show: template

= 关于 Codex 与 Clash，自己的一点折腾

关于 Codex 与 Clash，自己的一点折腾，还是蛮值得分享的：\

== 1.直接开启 TUN 模式
最早期的时候 Codex 刚出来，一股脑打开 TUN 模式，虽然能够正常使用，但 TUN 模式会在网络层接管设备流量，对全局网络连接产生影响，让网络流量的管理变得十分混乱；\

== 2.关闭 TUN，仅开启系统代理
于是乎尝试：关闭 TUN 模式只保留系统代理，在 `.codex/.env`里单独写上代理环境变量：
```bash
HTTP_PROXY="http://127.0.0.1:7890"
HTTPS_PROXY="http://127.0.0.1:7890"
ALL_PROXY="http://127.0.0.1:7890"
NO_PROXY="localhost,127.0.0.1,::1"
```
这个方案解决了此前 Codex 与服务端建立 WebSocket 长连接时反复Reconnecting（5/5）的问题，能够正常使用。
当时觉得这应该已经是比较理想的解决方案了。\

== 3.最近觉得，系统代理也不是最优解
到近期突然发现开启 Clash 的系统代理也不是最佳的方案，会发现总有一些奇奇怪怪的流量飞走了。

折腾 Clash 配置文件里的 rules 分流规则过于折腾，例如：
```yaml
- DOMAIN-SUFFIX,claude.ai,Anthropic
- GEOSITE,CN,DIRECT
- GEOSITE,openai,OpenAI
- DOMAIN-SUFFIX,xxx域名后缀,DIRECT
```
给不同的流量请求配置不同的代理组，但是 Clash Rules 只能管理已经进入 Clash 的流量，无法决定哪些应用应该使用系统代理。

== 4.抛弃系统代理的新方案
于是找到能够抛弃系统代理的解决方案：Codex 桌面端是基于 Electron（Chromium 内核）开发的，而 Chromium 本身就支持通过启动参数指定代理服务器，找到本机 ChatGPT.exe 的稳定路径并创建快捷方式：

在不开系统代理的情况下单独为前端内核传入 Chromium 启动参数，也就是 `--proxy-server="http://127.0.0.1:端口"`，在 macOS 和 Windows 验证了都是可行的，能够正常加载 app 前端。

1.Windows：
```text
C:\Users\用户名\AppData\Local\Microsoft\WindowsApps\chatgpt-desktop.exe
```
（可能因机器而异）\
创建快捷方式输入：
```bash
"C:\Users\用户名\AppData\Local\Microsoft\WindowsApps\chatgpt-desktop.exe" --proxy-server=http://127.0.0.1:端口
```
2.macOS：`/Applications/ChatGPT.app/Contents/MacOS/ChatGPT`\
创建快捷方式参考#link("https://x.com/liulangtutu/article/2066683148998439352")[如何在 macOS 优雅地为 Codex CLI 与 App 设置代理]

参考：

- #link("https://x.com/liulangtutu/article/2066683148998439352")
- #link("https://liudanking.com/beautiful-life/codex-proxy-on-macos/")

#html.hr()

#figure[#image("2.jpg")]