cmake_minimum_required(VERSION 3.28)

project(example VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)


#主窗口路径
set(SEARCH_GUI_PATH ${CMAKE_CURRENT_SOURCE_DIR}/gui)
#源代码路径
set(SEARCH_SRC_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src)

find_package(Qt6 6.8 REQUIRED COMPONENTS Core Gui Qml Quick)

#检查包是否找到
if(NOT Qt6_FOUND)
    message(FATAL_ERROR "Qt6模块未找到")
endif()
if(NOT Qt6Quick_FOUND)
    message(FATAL_ERROR "Qt6子模块Quick未找到")
endif()
if(NOT Qt6Qml_FOUND)
    message(FATAL_ERROR "Qt6子模块QML未找到")
endif()
if(NOT Qt6Core_FOUND)
    message(FATAL_ERROR "Qt6子模块Core未找到")
endif()
if(NOT Qt6Gui_FOUND)
    message(FATAL_ERROR "Qt6子模块Gui未找到")
endif()

qt_standard_project_setup(REQUIRES 6.5)



#添加测试程序
qt_add_executable(${PROJECT_NAME}
    ${SEARCH_SRC_PATH}/main.cpp
)
#添加测试qml实例
qt_add_qml_module(${PROJECT_NAME}
    URI WinApp
    VERSION 1.0
    QML_FILES
    gui/Main.qml
)

#属性设置
set_target_properties(${PROJECT_NAME} PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER ${PROJECT_NAME}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

#链接库
target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick
    RKitUiSource
)

include(GNUInstallDirs)


install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION ${CMAKE_INSTALL_PREFIX}
    LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}
    RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}
)


