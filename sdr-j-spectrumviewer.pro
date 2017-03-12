######################################################################
# Automatically generated by qmake (2.01a) Tue Oct 6 19:48:14 2009
# but modified by me to accomodate for the includes for qwt, hamlib and
# portaudio
######################################################################

TEMPLATE	= app
TARGET		= sdr-j-spectrumviewer
QT		+= widgets
CONFIG		+= console 
QMAKE_CFLAGS    +=  -flto -ffast-math
QMAKE_CXXFLAGS  +=  -flto -ffast-math
QMAKE_LFLAGS    +=  -flto
#QMAKE_CFLAGS   +=  -g
#QMAKE_CXXFLAGS +=  -g
#QMAKE_LFLAGS   +=  -g


DEPENDPATH += . \
	      ./src \
	      ./includes \
	      ./src/input

INCLUDEPATH += . \
	      ./includes \
	      ./src/input

# Input
HEADERS += ./viewer.h \
	   ./includes/spectrum-constants.h \
           ./includes/fft.h \
           ./includes/ringbuffer.h \
	   ./includes/spectrogramdata.h \
	   ./includes/scope.h  \
	   ./src/input/virtual-input.h

FORMS += ./sdrgui.ui 

SOURCES += ./main.cpp \
           ./viewer.cpp \
           ./src/fft.cpp \
	   ./src/scope.cpp \
	   ./src/input/virtual-input.cpp 

#for Fedora and Ubuntu use
unix { 
DESTDIR		= ./linux-bin
INCLUDEPATH	+= /usr/include/qt5/qwt
INCLUDEPATH	+= /usr/local/include
#LIBS		+= -lqwt -lusb-1.0 -lrt -lfftw3f -ldl		# ubuntu 15.04
LIBS		+= -lqwt-qt5 -lusb-1.0 -lrt -lfftw3f -ldl	# fedora 25
CONFIG		+= dabstick
CONFIG		+= airspy
CONFIG		+= sdrplay
CONFIG		+= elad-s1
CONFIG		+= soundcard
#CONFIG		+= extio
}

## and for windows32 we use:
win32 {
DESTDIR	= ../../windows-bin
# includes in mingw differ from the includes in fedora linux
INCLUDEPATH 	+= /usr/i686-w64-mingw32/sys-root/mingw/include
INCLUDEPATH 	+= /usr/i686-w64-mingw32/sys-root/mingw/include/qt5/qwt
LIBS		+= -lfftw3f
LIBS		+= -lportaudio		# for the cardreader
LIBS		+= -lqwt-qt5
#LIBS		+= -lsndfile
LIBS		+= -lsamplerate
LIBS		+= -lole32
LIBS		+= -lwinmm
LIBS 		+= -lstdc++
LIBS		+= -lusb-1.0
LIBS		+= -lpthread
CONFIG		+= dabstick
CONFIG		+= airspy
CONFIG		+= sdrplay
CONFIG		+= soundcard;
CONFIG		+= extio
}
#
#	the devices
dabstick {
	DEFINES		+= HAVE_DABSTICK
	INCLUDEPATH	+= ./src/input/dabstick
	HEADERS		+= ./src/input/dabstick/dabstick.h \
	                   ./src/input/dabstick/dongleselect.h
	SOURCES		+= ./src/input/dabstick/dabstick.cpp \
	                   ./src/input/dabstick/dongleselect.cpp
	FORMS		+= ./src/input/dabstick/dabstick-widget.ui
}
#
#	the SDRplay
#
sdrplay {
DEFINES		+= HAVE_SDRPLAY
	INCLUDEPATH	+= ./src/input/sdrplay
	HEADERS		+= ./src/input/sdrplay/sdrplay.h \
	                   ./src/input/sdrplay/sdrplayselect.h
	SOURCES		+= ./src/input/sdrplay/sdrplay.cpp \
	                   ./src/input/sdrplay/sdrplayselect.cpp
	FORMS		+= ./src/input/sdrplay/sdrplay-widget.ui
}
#
airspy {
	DEFINES		+= HAVE_AIRSPY
	INCLUDEPATH	+= ./src/input/airspy \
	                   /usr/local/include/libairspy
	HEADERS		+= ./src/input/airspy/airspy-handler.h 
	SOURCES		+= ./src/input/airspy/airspy-handler.cpp 
	FORMS		+= ./src/input/airspy/airspy-widget.ui
}
#
#	extio dependencies, windows only
#
extio {
	DEFINES		+= HAVE_EXTIO
	INCLUDEPATH	+= ./src/input/extio-handler
	HEADERS		+= ./src/input/extio-handler/extio-handler.h \
	                   ./src/input/extio-handler/common-readers.h \
	                   ./src/input/extio-handler/virtual-reader.h \
	                   ./src/input/extio-handler/card-reader.h
	SOURCES		+= ./src/input/extio-handler/extio-handler.cpp \
	                   ./src/input/extio-handler/common-readers.cpp \
	                   ./src/input/extio-handler/virtual-reader.cpp \
	                   ./src/input/extio-handler/card-reader.cpp
	FORMS		+= ./src/input/extio-handler/extio-widget.ui
}

rtl_tcp {
	DEFINES		+= HAVE_RTL_TCP
	QT		+= network
	INCLUDEPATH	+= ./src/input/rtl_tcp
	HEADERS		+= ./src/input/rtl_tcp/rtl_tcp_client.h
	SOURCES		+= ./src/input/rtl_tcp/rtl_tcp_client.cpp
	FORMS		+= ./src/input/rtl_tcp/rtl_tcp-widget.ui
}

elad-s1 {
	DEFINES		+= HAVE_ELAD_S1
	INCLUDEPATH	+= ./src/input/sw-elad-s1
	HEADERS		+= ./src/input/sw-elad-s1/elad-s1.h \
	                   ./src/input/sw-elad-s1/elad-worker.h \
	                   ./src/input/sw-elad-s1/elad-loader.h
	SOURCES		+= ./src/input/sw-elad-s1/elad-s1.cpp \
	                   ./src/input/sw-elad-s1/elad-worker.cpp \
	                   ./src/input/sw-elad-s1/elad-loader.cpp
	FORMS		+= ./src/input/sw-elad-s1/elad-widget.ui
}

soundcard {
	DEFINES		+= HAVE_SOUNDCARD
	INCLUDEPATH	+= ./src/input/soundcard
	HEADERS		+= ./src/input/soundcard/pa-reader.h \
	                   ./src/input/soundcard/soundcard.h
	SOURCES		+= ./src/input/soundcard/pa-reader.cpp \
	                   ./src/input/soundcard/soundcard.cpp
	FORMS		+= ./src/input/soundcard/soundcard-widget.ui
	LIBS		+= -lportaudio
}
