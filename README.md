# app_links_ohos

[![pub package](https://img.shields.io/pub/v/app_links_ohos.svg)](https://pub.dartlang.org/packages/app_links_ohos) [![GitHub stars](https://img.shields.io/github/stars/harmonycandies/app_links_ohos)](https://github.com/harmonycandies/app_links_ohos/stargazers) [![GitHub forks](https://img.shields.io/github/forks/harmonycandies/app_links_ohos)](https://github.com/harmonycandies/app_links_ohos/network) [![GitHub license](https://img.shields.io/github/license/harmonycandies/app_links_ohos)](https://github.com/harmonycandies/app_links_ohos/blob/master/LICENSE) [![GitHub issues](https://img.shields.io/github/issues/harmonycandies/app_links_ohos)](https://github.com/harmonycandies/app_links_ohos/issues) ![HarmonyCandies QQ 群](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fharmonycandies%2F.github%2Frefs%2Fheads%2Fmain%2Fdata.yml&query=%24.qq_group_number&label=QQ%E7%BE%A4&logo=qq&color=1DACE8)

Flutter plugin for handling app links on OpenHarmony

The OpenHarmony implementation of [`app_links`][1]

Flutter OpenHarmony 平台的深度链接 / 应用链接处理插件

[`app_links`][1] 在 OpenHarmony 平台的实现

## 安装 / Installation

```yaml
dependencies:
  app_links: ^3.4.5
  app_links_ohos: any
```

## 限制 / Limitations

在 OpenHarmony 平台上，系统限制从浏览器直接通过自定义 Scheme 打开应用，如果有需求，推荐使用 App Linking

On OpenHarmony, the system restricts opening the app directly from the browser using a custom scheme. If you have such a requirement, it is recommended to use App Linking

## 初始化 / Initialization

Add `uris` config to your OpenHarmony project's `module.json` file. Further details can be found in the [App Linking Doc][2]

添加 `uris` 配置到 OpenHarmony 项目的 `module.json` 文件中。更多细节请参考[App Linking 文档][2]

### Flutter

The usage in Flutter is the same as `app_links`, plz refer to the [app_links][1]

在 Flutter 中的使用方法和 `app_links` 一致，请参考 [app_links][1]

 [1]: https://pub.dev/packages/app_links
 [2]: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/app-linking-startup-V5
