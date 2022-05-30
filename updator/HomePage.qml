/*
 * Copyright (C) 2021 CutefishOS Team.
 *
 * Author:     Kate Leet <kate@cutefishos.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import FishUI 1.0 as FishUI
import Cutefish.Updator 1.0

Item {
    id: control

    property bool error: false

    Connections {
        target: updator

        function onCheckError(details) {
            control.error = true
            _textArea.text = details
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: FishUI.Units.largeSpacing * 2

        Item {
            Layout.fillHeight: true
        }

        Image {
            width: 64
            height: 64
            sourceSize: Qt.size(width, height)
            source: "qrc:/images/check_failed.svg"
            Layout.alignment: Qt.AlignHCenter
            visible: control.error
        }

        FishUI.BusyIndicator {
            width: 64
            height: 64
            Layout.alignment: Qt.AlignHCenter
            visible: !control.error
        }

        Label {
            text: qsTr("Checking for updates...")
            Layout.alignment: Qt.AlignHCenter
            visible: !control.error
        }

        Label {
            text: updator.checkProgress + "%"
            Layout.alignment: Qt.AlignHCenter
            color: FishUI.Theme.disabledTextColor
            visible: !control.error
        }

        // Error

        Label {
            text: qsTr("Check for update failure")
            Layout.alignment: Qt.AlignHCenter
            color: FishUI.Theme.disabledTextColor
            visible: control.error
        }

        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: _textArea.text != "" && control.error
            clip: true

            TextArea {
                id: _textArea
                enabled: false
                selectByMouse: true

                implicitWidth: 0

                background: Item {
                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: FishUI.Units.smallSpacing
                        anchors.leftMargin: FishUI.Units.largeSpacing
                        anchors.rightMargin: FishUI.Units.largeSpacing
                        radius: FishUI.Theme.smallRadius
                        color: FishUI.Theme.secondBackgroundColor
                    }
                }

                leftPadding: FishUI.Units.largeSpacing * 2
                rightPadding: FishUI.Units.largeSpacing * 2
                topPadding: FishUI.Units.largeSpacing * 2
                bottomPadding: FishUI.Units.largeSpacing * 2

                // Auto scroll to bottom.
                onTextChanged: {
                    _textArea.cursorPosition = _textArea.text.length - 1
                }
            }
        }

        Button {
            text: qsTr("Recheck")
            flat: true
            Layout.alignment: Qt.AlignHCenter
            visible: control.error
            onClicked: {
                control.error = false
                _textArea.clear()
                updator.checkUpdates()
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
