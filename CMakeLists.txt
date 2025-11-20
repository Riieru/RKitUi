cmake_minimum_required(VERSION 3.28)

project(RKitUi VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(PANEL_TESTING ON CACHE BOOL "是否编译测试实例")
set(PANEL_BUILD_INSTALL ON CACHE BOOL "编译后是否执行安装")

#设置安装主路径
set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/install" CACHE PATH "安装根目录" FORCE)

#qml控件库
add_subdirectory(src)

#测试实例
if(PANEL_TESTING)
add_subdirectory(example)
endif()

#执行安装命令
if(PANEL_BUILD_INSTALL)
    add_custom_target(
        ExecuteInstall
        ALL
        COMMAND ${CMAKE_COMMAND} --install ${CMAKE_BINARY_DIR}
        COMMENT "文件已安装到: ${CMAKE_INSTALL_PREFIX}"
    )
  add_dependencies(ExecuteInstall example RKitUiSource)
endif()
