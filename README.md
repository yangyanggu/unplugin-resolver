# @vuemap/unplugin-resolver
[![npm (tag)](https://img.shields.io/npm/v/@vuemap/unplugin-resolver)](https://www.npmjs.org/package/@vuemap/unplugin-resolver)
[![NPM downloads](http://img.shields.io/npm/dm/@vuemap/unplugin-resolver.svg)](https://npmjs.org/package/@vuemap/unplugin-resolver)
![JS gzip size](http://img.badgesize.io/https://unpkg.com/@vuemap/unplugin-resolver?compression=gzip&label=gzip%20size:%20JS)
[![NPM](https://img.shields.io/npm/l/@vuemap/unplugin-resolver)](https://gitee.com/guyangyang/unplugin-resolver)

unplugin-vue-components的resolvers，已经将地图组件增加上去，目前支持@vuemap/vue-amap、vue-bmap-gl、vue-mapvgl

> 2.0版本适配@vuemap/vue-amap 2.0版本<br/>
> 如果使用的是@vuemap/vue-amap@1 版本，则需要使用@vuemap/unplugin-resolver@1

## 安装依赖
```shell
npm install -D unplugin-vue-components unplugin-auto-import
```

## 用法

```ts
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import {VueAmapResolver, VueBmapGlResolver, VueMapvglResolver} from '@vuemap/unplugin-resolver'
export default defineConfig({
  plugins: [
    vue(),
    AutoImport({
      resolvers: [VueAmapResolver(),VueBmapGlResolver(),VueMapvglResolver()],
    }),
    Components({
      resolvers: [VueAmapResolver(),VueBmapGlResolver(),VueMapvglResolver()],
    }),
  ]
})
```

### 已知问题
当前地图组件与Element-Plus的resolver冲突，因此需要在Element-Plus的resolver中增加配置，去除地图相关的组件，示例：
```ts
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'
import {VueAmapResolver, VueBmapGlResolver, VueMapvglResolver} from '@vuemap/unplugin-resolver'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    AutoImport({
      resolvers: [ElementPlusResolver({
        exclude: /^ElAmap|ElBmap|ElBmapv[A-Z]*!/
      }),VueAmapResolver(),VueBmapGlResolver(),VueMapvglResolver()],
    }),
    Components({
      resolvers: [ElementPlusResolver({
        exclude: /^ElAmap|ElBmap|ElBmapv[A-Z]*!/
      }),VueAmapResolver(),VueBmapGlResolver(),VueMapvglResolver()],
    }),
  ]
})
```

