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

    ColumnLayout {
        anchors.fill: parent

        FishUI.BusyIndicator {
            width: 32
            height: 32
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            height: FishUI.Units.smallSpacing
        }

        Label {
            text: qsTr("Updating, please wait")
            Layout.alignment: Qt.AlignHCenter
        }

        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true

            TextArea {
                id: _textArea
                text: updator.statusDetails
                enabled: false

                background: Item {
                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: FishUI.Units.largeSpacing
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
    }
}
