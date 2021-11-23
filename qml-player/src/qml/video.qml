/*
* VLC-Qt QML Player
* Copyright (C) 2015 Tadej Novak <tadej@tano.si>
*/

import QtQuick 2.0
import VLCQt 1.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import Qt.labs.platform 1.0

ApplicationWindow {
    id: window
    visible: true
    minimumWidth: 800
    minimumHeight: 640
    width: minimumWidth
    height: minimumHeight
    title: Qt.application.name

    header: ToolBar {
        RowLayout {
            Button {
                text: "Open file"
                onClicked: {
                    fileDialog.open()
                }
            }

            Text {
                id: fileName
                text: "No file selected"
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent

        VlcVideoPlayer {
            id: vidwidget
            Layout.fillWidth: true
            Layout.fillHeight: true
            fillColor: "black"
        }

//        Slider {
//            id: seekBar
//            Layout.fillWidth: true
//            from: 0
//            to: vidwidget.length
//            value: vidwidget.position
//        }

        FileDialog {
            id: fileDialog
            onAccepted: {
                vidwidget.url = file
                vidwidget.play()
                fileName.text = file;
            }
        }
    }
}


