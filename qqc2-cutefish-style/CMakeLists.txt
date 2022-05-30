# Copyright 2021 Camilo Higuita <milo.h@aol.com>
#
# SPDX-License-Identifier: GPL-3.0-or-later

cmake_minimum_required(VERSION 3.14)

set(QQC2_CUTEFISH_STYLE_VERSION 2.0.2)

project(qqc2-cutefish-style VERSION ${QQC2_CUTEFISH_STYLE_VERSION})

set(REQUIRED_KF5_VERSION 5.40.0)

find_package(ECM ${REQUIRED_KF5_VERSION} NO_MODULE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH}
    ${ECM_KDE_MODULE_DIR})

include(KDEInstallDirs)

install(DIRECTORY style/ DESTINATION ${KDE_INSTALL_QMLDIR}/QtQuick/Controls.2/Cutefish)
install(DIRECTORY csd/ DESTINATION ${DATA_INSTALL_DIR}/org.mauikit.controls/csd/Cutefish)
#install(FILES data/mauiproject.conf DESTINATION "$ENV{HOME}/.config/org.kde.maui")

