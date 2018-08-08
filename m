Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::231; helo=mail-io0-x231.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ReqRCmig"; 
 dkim-atps=neutral
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lvHy1QZqzDr5r
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 00:42:53 +1000 (AEST)
Received: by mail-io0-x231.google.com with SMTP id m4-v6so963466iop.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hgHguHLPsrNHEnPrnQQ05WWECqMzqiEgNRWFRWT0ZYw=;
 b=ReqRCmigixO4asRBWCDScccsXIDbpNMSZMkorIiog/im4ZPtcQN+RB2JhnwhYgCGST
 Q/cA0OV5LiXm3OdahRW4kHfw2PtJblVqqlHSeT7K1+2eEbl4kWwI1CzF2JtmqZEFv7qA
 rGL81KzicvmPKXelXaXMGdf3ZsAKJCp+gO3poV+DnwedtUV/biz6Q7GCaSD8E+ZD96Q0
 WjN/96NSWneL0Q9JdA8FQt+M9E+tu6500wXSdYRsk7KpJlmhY57FnXO72tQiLRfL782E
 gPNdvdpDdsQ9AbuYNX3cYQ2DRir/tKf6cZfIT6KK1lL2CFQ/OaOODphOP3+3dOxrLybV
 jARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hgHguHLPsrNHEnPrnQQ05WWECqMzqiEgNRWFRWT0ZYw=;
 b=btB+05HktlQIbuTqz/XGrr1WVnHGoQfHWzqjxA50AutcDwk2/BbnvefGEH9NkF+/97
 pf2vPSnAnDw7oGS4jTXGM2ikNfYe6ojCGsLnD7FvbNnjt6We3R0edIFkdZov1Wm/wXug
 7y5QCN6D9g/2Shvb6x5mD0GPRaCcP4LHN1lsnjOkvCbV0wY1tpWecqKNr3sunx92fuvr
 pJrQnV1e7xGTKCbHdCSOJYK5SbUcMzFjv1jQT3RcVdiRQMcPRNH1rl6knSsNWuXBAVM1
 zq9L4TJNEiJ4DAgr6IooSO275qXaFcyvHdrU7x0/xzilqJPWkJxAH/R0CVI5p2bZQvJm
 rFKQ==
X-Gm-Message-State: AOUpUlG7gsihzrtrgDoZabXW6Yqtiqw35CRqVW/WOFTo+uq04fhQAjWW
 2mYO7zRN3Q+k0Dwg8ELNK5cCaplIHGrojeQ4TWGFFkGL8i224A==
X-Google-Smtp-Source: AA+uWPz9DD7UDorsdWEVWQzPkCaX/LakjCkjMo+yOeP7u5lyoqgHYcZ4OPAgIopJRjGjxg7CEk0NVhwLvcGvoSswl0I=
X-Received: by 2002:a6b:ab87:: with SMTP id
 u129-v6mr2673231ioe.30.1533739370436; 
 Wed, 08 Aug 2018 07:42:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Wed, 8 Aug 2018 07:42:29 -0700 (PDT)
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Aug 2018 07:42:29 -0700
Message-ID: <CAO=notx7qNDyNDA=Zd2amR1CyYT1YtO1v69YMb0kc9SCJTVfuQ@mail.gmail.com>
Subject: bitbake do_configure failure: automake: command not found
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 14:42:56 -0000

I'm seeing the configure fail on a couple downstream recipes that
essentially just build ipmi libraries now that we're merged with v2.2
of OpenBMC.

NOTE: recipe google-ipmi-ethstats-1.0-r0: task do_configure: Started
ERROR: google-ipmi-ethstats-1.0-r0 do_configure: Function failed:
do_configure (log file is located at
/tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938)
ERROR: Logfile of failure stored in:
/tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
'arm-linux-gnueabi', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
1: /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
automake: not found
| /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
146: /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
automake: not found
| WARNING: exit code 127 from a shell command.

The configure.ac:

# Initialization
AC_PREREQ([2.69])
AC_INIT([gsys-ipmi], [1.0], [https://www.google.com])
AC_LANG([C++])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE([subdir-objects -Wall -Werror foreign dist-xz])
AM_SILENT_RULES([yes])
# Checks for programs.
AC_PROG_CXX
AM_PROG_AR
AC_PROG_INSTALL
AC_PROG_MAKE_SET
# Checks for typedefs, structures, and compiler characteristics.
AX_CXX_COMPILE_STDCXX_14([noext])
AX_APPEND_COMPILE_FLAGS([-Wall -Werror], [CXXFLAGS])
# Checks for libraries.
PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 221], [],
[AC_MSG_ERROR(["systemd required and not found"])])
PKG_CHECK_MODULES([SDBUSPLUS], [sdbusplus], ,[AC_MSG_ERROR([The
openbmc/sdbusplus package is required])])
PKG_CHECK_MODULES([PHOSPHOR_LOGGING], [phosphor-logging],
,[AC_MSG_ERROR([The openbmc/phosphor-logging package is required])])
PKG_CHECK_MODULES([PHOSPHOR_DBUS_INTERFACES],
[phosphor-dbus-interfaces], [],
[AC_MSG_ERROR(["phosphor-dbus-interfaces required and not found."])])
AC_CHECK_HEADER(experimental/any, ,[AC_MSG_ERROR([Could not find
experimental/any...libstdc++fs developement package required])])
# Checks for library functions.
LT_INIT # Required for systemd linking
# Create configured output
AC_CONFIG_FILES([Makefile])
AC_OUTPUT

Which looks like all the others I've seen, more or less, nothing special.

The recipe:

SUMMARY = "Ethernet Statistics OEM Command"
DESCRIPTION = "Ethernet Statistics OEM Command"
LICENSE = "CLOSED"
inherit autotools pkgconfig
inherit obmc-phosphor-ipmiprovider-symlink
S = "${WORKDIR}/"
SRC_URI = "file://Makefile.am \
 file://bootstrap.sh \
 file://configure.ac \
 file://main.cpp \
"
DEPENDS += "autoconf-archive-native"
DEPENDS += "sdbusplus"
DEPENDS += "phosphor-logging"
# We depend on this to be built first so we can build our providers.
DEPENDS += "phosphor-ipmi-host"
RDEPENDS_${PN} += "sdbusplus phosphor-dbus-interfaces"
FILES_${PN}_append = " ${libdir}/ipmid-providers/lib*${SOLIBS}"
FILES_${PN}_append = " ${libdir}/host-ipmid/lib*${SOLIBS}"
FILES_${PN}_append = " ${libdir}/net-ipmid/lib*${SOLIBS}"
FILES_${PN}-dev_append = " ${libdir}/ipmid-providers/lib*${SOLIBSDEV}
${libdir}/ipmid-providers/*.la"
HOSTIPMI_PROVIDER_LIBRARY += "libethstatscmd.so"

Any things to check or poke would be appreciated.  It doesn't break in
all build environments, oddly.  Presumably with the yocto 2.3
inclusion in OpenBMC v2.2, the host environment became less involved.
But when I build an image on my desktop, it builds fine.  When I run
the same commands in our continuous build environment, it fails.

Patrick
