/*
* VLC-Qt QML Player
* Copyright (C) 2015 Tadej Novak <tadej@tano.si>
*/

#include <QtCore/QCoreApplication>
#include <QApplication>
#include <QQmlApplicationEngine>

#include <VLCQtCore/Common.h>
#include <VLCQtQml/QmlVideoPlayer.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setApplicationName("VLC-Qt QML Player");
    QCoreApplication::setAttribute(Qt::AA_X11InitThreads);

    QApplication app(argc, argv);
    VlcCommon::setPluginPath(app.applicationDirPath() + "/plugins");
    VlcQmlVideoPlayer::registerPlugin();

    QQmlApplicationEngine engine;

    engine.load(QStringLiteral("qrc:/qml/video.qml"));

    return app.exec();
}
