# RKitUi
RKitUi 是一个基于 Qt6 的 QML 控件库，提供了自定义 UI 组件及相关工具类，旨在简化 Qt 应用程序的界面开发。仓库包含控件库核心代码及示例程序，方便开发者快速集成和使用。


## 可自定义shape形状，如仅通过修改参数可以得到任意方向，任意大小，任意样式的箭头
##   内部有实例程序，可自行找到想要的控件，直接复制控件，修改下参数即可,非常方便


## 环境要求
CMake 3.28 及以上

Qt6 6.8 及以上，需包含以下模块：
Core
Gui
Qml
Quick


## 编译

要部署这个项目，请运行

* 克隆仓库:
```bash
  git clone <仓库地址>
  cd RKitUi
```
* 生成构建目录
```bash
  mkdir build 
  cd build    
```
* 编译配置
```bash
cmake .. \
  -DCMAKE_PREFIX_PATH=<Qt安装路径>/lib/cmake \   #若Qt未在系统PATH中需指定
  -DPANEL_TESTING=ON \                          # 默认为ON，编译示例程序
  -DPANEL_BUILD_INSTALL=ON                      # 默认为ON，编译后自动安装
```
* 编译项目
```bash
cmake --build .
```
* 安装目录
 默认安装到项目根目录的 install 文件夹，可通过以下参数修改：

```bash
cmake .. -DCMAKE_INSTALL_PREFIX=<自定义安装路径>
```



## 使用

* 项目集成

  1.在 CMake 项目中引用 RKitUi：

```bash
# 引入RKitUi（若已安装到系统路径，可直接find_package；否则使用add_subdirectory）
add_subdirectory(path/to/RKitUi)

# 链接RKitUi库
target_link_libraries(your_project PRIVATE RKitUiSource)
```
\
    2.在 QML 文件中导入控件模块并使用组件：
  
```bash
import RKitUi
```  
