TEMPLATE = app
TARGET = qtZint
DEPENDPATH += . debug release
INCLUDEPATH += .
QT += gui
QT += uitools
DEFINES += NO_PNG

# Input
HEADERS += barcodeitem.h \
         datawindow.h \
         exportwindow.h \
         mainwindow.h \
         sequencewindow.h

FORMS += extData.ui \
         extExport.ui \
         extSequence.ui \
         grpAztec.ui \
         grpC128.ui \
         grpC16k.ui \
         grpC39.ui \
         grpC49.ui \
         grpChannel.ui \
         grpCodeOne.ui \
         grpCodablockF.ui \
         grpDBExtend.ui \
         grpDM.ui \
         grpGrid.ui \
         grpMaxicode.ui \
         grpMicroPDF.ui \
         grpMQR.ui \
         grpMSICheck.ui \
         grpPDF417.ui \
         grpQR.ui \
         grpHX.ui \
         mainWindow.ui \
         grpDotCode.ui

SOURCES += barcodeitem.cpp \
        datawindow.cpp \
        exportwindow.cpp \
        main.cpp \
        mainwindow.cpp \
        sequencewindow.cpp
        
TRANSLATIONS = frontend_de.ts

RESOURCES += resources.qrc

# Static target following http://qt-project.org/wiki/Build_Standalone_Qt_Application_for_Windows
CONFIG += static

CONFIG += warn_on thread qt uitools

INCLUDEPATH += ../backend_qt ../backend

LIBS += -lQtZint -lQt5Core
QMAKE_LIBDIR += ../backend_qt/release

!contains(DEFINES, NO_PNG) {
# Win
    LIBS += -llibpng -zlib
    QMAKE_LIBDIR+=../../lpng/projects/visualc71_converted_to_9/Win32_LIB_Release ../../lpng/projects/visualc71_converted_to_9/Win32_LIB_Release/zlib
# Unix
    #LIBS += -lpng -zlib
    #QMAKE_LIBDIR += /usr/local/lib /usr/lib/x86_64-linux-gnu/
}
