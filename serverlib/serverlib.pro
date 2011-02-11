TEMPLATE = lib
TARGET = kdsoap-server
CONFIG(debug, debug|release):!unix:TARGET = $${TARGET}d
QT -= gui

QT += network

# Workaround for visual studio integration
DESTDIR = ../lib
win32:DLLDESTDIR = ../bin

include(../variables.pri)
INSTALLHEADERS = KDSoapServer.h \

EXTENSIONLESSHEADERS =
PRIVATEHEADERS =

HEADERS = $$INSTALLHEADERS \
    $$PRIVATEHEADERS \
    KDSoapThreadPool.h \
    KDSoapServerObject.h \
    KDSoapServerSocket_p.h \
    KDSoapServerThread_p.h \
    KDSoapSocketList_p.h

SOURCES = KDSoapServer.cpp \
    KDSoapThreadPool.cpp \
    KDSoapServerObject.cpp \
    KDSoapServerSocket.cpp \
    KDSoapServerThread.cpp \
    KDSoapSocketList.cpp

DEFINES += KDSOAP_BUILD_KDSOAPSERVER_LIB

# installation targets:
headers.files = $$INSTALLHEADERS \
    $$EXTENSIONLESSHEADERS
headers.path = $$INSTALL_PREFIX/include
INSTALLS += headers

target.path = $$INSTALL_PREFIX/lib
INSTALLS += target

# Mac frameworks
macx:lib_bundle: {
    FRAMEWORK_HEADERS.version = Versions
    FRAMEWORK_HEADERS.files = $$INSTALLHEADERS \
        $$EXTENSIONLESSHEADERS
    FRAMEWORK_HEADERS.path = Headers
    QMAKE_BUNDLE_DATA += FRAMEWORK_HEADERS
}