# @vuemap/unplugin-resolver

unplugin-vue-components的resolvers，已经将地图组件增加上去，目前支持@vuemap/vue-amap、vue-bmap-gl、vue-mapvgl

## 用法

```
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
```
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

