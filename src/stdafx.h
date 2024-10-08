// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#include "targetver.h"

#include <stdio.h>
#include <tchar.h>

#define OAUTH2_PACKAGE_NAME_VERSION "mod_oauth2-3.2.0"

#pragma comment(lib, "ws2_32.lib")

//////////////////////////////////////////////////////////////////////////////
// Choose an OS
#if defined (_WIN64) 
#pragma comment(lib, "libcrypto.lib")
#pragma comment(lib, "liboauth2.lib")
#pragma comment(lib, "libcurl.lib")
#pragma comment(lib, "jansson.lib")
#pragma comment(lib, "libapr-1.lib")
#pragma comment(lib, "libaprutil-1.lib")
#pragma comment(lib, "libhttpd.lib")
#pragma comment(lib, "cjose.lib")

#elif defined (_WIN32) 

 //  #pragma comment(lib, "vcpkg/packages/openssl-windows_x86-windows/lib/libeay32.lib")
 //  #pragma comment(lib, "vcpkg/installed/x86-windows/lib/libcurl.lib")
 //  #pragma comment(lib, "vcpkg/installed/x86-windows/lib/jansson.lib")
 //  #pragma comment(lib, "vcpkg/installed/x86-windows/lib/ssleay32.lib")
 //  #pragma comment(lib, "target/httpd-latest/Apache24/lib/libapr-1.lib")
 //  #pragma comment(lib, "target/httpd-latest/Apache24/lib/libaprutil-1.lib")
	//#pragma comment(lib, "target/httpd-latest/Apache24/lib/libhttpd.lib")
	//#pragma comment(lib, "cjose/win32/Release/cjose.lib")
 //  #pragma comment(lib, "vcpkg/installed/x86-windows/lib/pcre.lib")
#else
	#error "Add OS here"
#endif