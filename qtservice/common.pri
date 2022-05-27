exists(config.pri):infile(config.pri, SOLUTIONS_LIBRARY, yes): CONFIG += qtservice-uselib
TEMPLATE += fakelib
QTSERVICE_LIBNAME = QtSolutions_Service

win32 {
	CONFIG(debug, debug|release) {
		QTSERVICE_LIBNAME = QtSolutions_Serviced
	} else {
		QTSERVICE_LIBNAME = QtSolutions_Service
	}
} 
mac {
	QTSERVICE_LIBNAME = $$member(QTSERVICE_LIBNAME, 0)_debug
}

TEMPLATE -= fakelib
QTSERVICE_LIBDIR = $$PWD/lib
unix:qtservice-uselib:!qtservice-buildlib:QMAKE_RPATHDIR += $$QTSERVICE_LIBDIR
