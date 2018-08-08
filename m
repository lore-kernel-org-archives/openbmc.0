Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::229; helo=mail-it0-x229.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AQ9fVuoc"; 
 dkim-atps=neutral
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m2xW6Y7tzDqk9
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 06:27:27 +1000 (AEST)
Received: by mail-it0-x229.google.com with SMTP id j81-v6so5254522ite.0
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=daveIKPinz7zg7j5JPQqho/RWkZwz5Gxe3rjWVEHdes=;
 b=AQ9fVuocIClQCZ2YkztoBqtZ6degu9p4zxXpTKLTHNf0zT+xCEsSAKikGra98sG093
 +CFB8VXsiBXlCMZUit8bOmgVlxAazewhDfU6zgxg+VwTcDt7MGPXr+Bt7s87MHaHmh2r
 ZLWYcdAQ+93u6YVpDxlorc9pR9DHrYsMr/r2Y18HPVU7u7pHt3E28CZUQ6SSj3Vj/nzA
 fZpBwqzr9qC8tFtegNgVD4Hznvw+N9n7Ih/JXb+xG14AxJCRpB5VrWm2cKO2T/z8iTFq
 ncNWblQ/kDy2sbfRgYNh512iQ906OsiyM5IHp8wZR1Z91/L1To8ZoBhLTIHbYjsMWh7k
 k5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=daveIKPinz7zg7j5JPQqho/RWkZwz5Gxe3rjWVEHdes=;
 b=T/SJ4CntmsfqcV4wZv7k24UyswMk7KarpmMkvcclV0m0WOMxLIR0iKIIsXMMdKA0jk
 3hoc+L49EaLlWT24Vr/KbuKjwZrcOSNttCrn52NlHMkB4m7vOMu+ZH5V61Dts4hIJPAT
 IsiwrW4qa8bMNS3Vn8KKaSfC77EeQsyA2+xJ95ephGQ2kD303mA66U6vaoTbuK0XwwOe
 B47hE6puKC9C5nDQzUsFYSHxWJZ60W/90k2Uen211VTZQg7Hxqon4hbxbYqZ5qs81lNc
 LgD4oPrypyO7fDtTKXnwWKpZhBgGLBY5JpSAWHJCPl5xTtin2tQypJqrWULO8NPS8mUn
 FBMQ==
X-Gm-Message-State: AOUpUlGwcg5pjz8KNyJ0tR/vQkeMkM0JOGbuU7dqj5C0i+LtZCVqdr6g
 VZVhjFsys46gOJF6ltrz3WbNn3COcpQhywsrO9cFkgmB
X-Google-Smtp-Source: AA+uWPysu6TpPWwwjUpAzxHyuOjMIVLBatOsWKa8JjZ4/IVKzxT4MQblCwiqZuWqp9lXxaC9HihOaXVWVYsb0nY5Lwo=
X-Received: by 2002:a02:45cd:: with SMTP id
 o74-v6mr3670122jad.43.1533760044925; 
 Wed, 08 Aug 2018 13:27:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Wed, 8 Aug 2018 13:27:04 -0700 (PDT)
In-Reply-To: <39b5cc92-0dfe-cfe0-c0ce-5e57e1c4295d@linux.ibm.com>
References: <CAO=notx7qNDyNDA=Zd2amR1CyYT1YtO1v69YMb0kc9SCJTVfuQ@mail.gmail.com>
 <7129fe1c-73ac-0489-b34c-a44ce3490ad8@linux.ibm.com>
 <CAO=notwa+5gjMK6Egft+bvAHsNv6RfSipyinkt-5+0FOFW6xxA@mail.gmail.com>
 <39b5cc92-0dfe-cfe0-c0ce-5e57e1c4295d@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Aug 2018 13:27:04 -0700
Message-ID: <CAO=notxfAL8GSGQT2PG85FsqAmusZC=cOoF2cD6MS1fV-f5r6g@mail.gmail.com>
Subject: Re: bitbake do_configure failure: automake: command not found
To: Matthew Barth <msbarth@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 08 Aug 2018 20:27:29 -0000

On Wed, Aug 8, 2018 at 9:31 AM, Matthew Barth <msbarth@linux.ibm.com> wrote:
>
>
> On 08/08/2018 11:04 AM, Patrick Venture wrote:
>>
>> On Wed, Aug 8, 2018 at 8:56 AM, Matthew Barth <msbarth@linux.ibm.com>
>> wrote:
>>>
>>>
>>>
>>> On 08/08/2018 09:42 AM, Patrick Venture wrote:
>>>>
>>>>
>>>> I'm seeing the configure fail on a couple downstream recipes that
>>>> essentially just build ipmi libraries now that we're merged with v2.2
>>>> of OpenBMC.
>>>>
>>>> NOTE: recipe google-ipmi-ethstats-1.0-r0: task do_configure: Started
>>>> ERROR: google-ipmi-ethstats-1.0-r0 do_configure: Function failed:
>>>> do_configure (log file is located at
>>>>
>>>>
>>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938)
>>>> ERROR: Logfile of failure stored in:
>>>>
>>>>
>>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938
>>>> Log data follows:
>>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>>> 'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
>>>> 'arm-linux-gnueabi', 'common']
>>>> | DEBUG: Executing shell function autotools_preconfigure
>>>> | DEBUG: Shell function autotools_preconfigure finished
>>>> | DEBUG: Executing python function autotools_aclocals
>>>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>>>> 'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
>>>> 'arm-linux-gnueabi', 'common']
>>>> | DEBUG: Python function autotools_aclocals finished
>>>> | DEBUG: Executing shell function do_configure
>>>> |
>>>>
>>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>>> 1:
>>>>
>>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>>> automake: not found
>>>> |
>>>>
>>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>>> 146:
>>>>
>>>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>>>> automake: not found
>>>
>>>
>>>  From what's given, I'd check to see if the continuous build environment
>>> has
>>> the autotools installed since `automake` isnt found.
>>
>>
>> So, the environment has automake and autotools-dev installed.  I also
>> tried within a docker instance and made sure those were installed.
>> That said, with yocto 2.3 it's not supposed to rely on what's
>> installed in the host environment but rather rely on the native
>> packages that come as dependencies.  Or am I mistaken?
>>
> Correct, yocto should include the dependencies. Is automake included within
> openbmc/import-layers/yocto-poky/meta/recipes-devtools ?

It is.

>
>
>>>
>>>
>>>> | WARNING: exit code 127 from a shell command.
>>>>
>>>> The configure.ac:
>>>>
>>>> # Initialization
>>>> AC_PREREQ([2.69])
>>>> AC_INIT([gsys-ipmi], [1.0], [https://www.google.com])
>>>> AC_LANG([C++])
>>>> AC_CONFIG_HEADERS([config.h])
>>>> AM_INIT_AUTOMAKE([subdir-objects -Wall -Werror foreign dist-xz])
>>>> AM_SILENT_RULES([yes])
>>>> # Checks for programs.
>>>> AC_PROG_CXX
>>>> AM_PROG_AR
>>>> AC_PROG_INSTALL
>>>> AC_PROG_MAKE_SET
>>>> # Checks for typedefs, structures, and compiler characteristics.
>>>> AX_CXX_COMPILE_STDCXX_14([noext])
>>>> AX_APPEND_COMPILE_FLAGS([-Wall -Werror], [CXXFLAGS])
>>>> # Checks for libraries.
>>>> PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 221], [],
>>>> [AC_MSG_ERROR(["systemd required and not found"])])
>>>> PKG_CHECK_MODULES([SDBUSPLUS], [sdbusplus], ,[AC_MSG_ERROR([The
>>>> openbmc/sdbusplus package is required])])
>>>> PKG_CHECK_MODULES([PHOSPHOR_LOGGING], [phosphor-logging],
>>>> ,[AC_MSG_ERROR([The openbmc/phosphor-logging package is required])])
>>>> PKG_CHECK_MODULES([PHOSPHOR_DBUS_INTERFACES],
>>>> [phosphor-dbus-interfaces], [],
>>>> [AC_MSG_ERROR(["phosphor-dbus-interfaces required and not found."])])
>>>> AC_CHECK_HEADER(experimental/any, ,[AC_MSG_ERROR([Could not find
>>>> experimental/any...libstdc++fs developement package required])])
>>>> # Checks for library functions.
>>>> LT_INIT # Required for systemd linking
>>>> # Create configured output
>>>> AC_CONFIG_FILES([Makefile])
>>>> AC_OUTPUT
>>>>
>>>> Which looks like all the others I've seen, more or less, nothing
>>>> special.
>>>>
>>>> The recipe:
>>>>
>>>> SUMMARY = "Ethernet Statistics OEM Command"
>>>> DESCRIPTION = "Ethernet Statistics OEM Command"
>>>> LICENSE = "CLOSED"
>>>> inherit autotools pkgconfig
>>>> inherit obmc-phosphor-ipmiprovider-symlink
>>>> S = "${WORKDIR}/"
>>>> SRC_URI = "file://Makefile.am \
>>>>    file://bootstrap.sh \
>>>>    file://configure.ac \
>>>>    file://main.cpp \
>>>> "
>>>> DEPENDS += "autoconf-archive-native"
>>>> DEPENDS += "sdbusplus"
>>>> DEPENDS += "phosphor-logging"
>>>> # We depend on this to be built first so we can build our providers.
>>>> DEPENDS += "phosphor-ipmi-host"
>>>> RDEPENDS_${PN} += "sdbusplus phosphor-dbus-interfaces"
>>>> FILES_${PN}_append = " ${libdir}/ipmid-providers/lib*${SOLIBS}"
>>>> FILES_${PN}_append = " ${libdir}/host-ipmid/lib*${SOLIBS}"
>>>> FILES_${PN}_append = " ${libdir}/net-ipmid/lib*${SOLIBS}"
>>>> FILES_${PN}-dev_append = " ${libdir}/ipmid-providers/lib*${SOLIBSDEV}
>>>> ${libdir}/ipmid-providers/*.la"
>>>> HOSTIPMI_PROVIDER_LIBRARY += "libethstatscmd.so"
>>>>
>>>> Any things to check or poke would be appreciated.  It doesn't break in
>>>> all build environments, oddly.  Presumably with the yocto 2.3
>>>> inclusion in OpenBMC v2.2, the host environment became less involved. >
>>>> But when I build an image on my desktop, it builds fine.  When I run
>>>> the same commands in our continuous build environment, it fails.
>>>
>>>
>>> When you build on your desktop are you in an SDK and/or have autotools
>>> installed in your environment already and maybe not in the continuous
>>> build
>>> environment? I'd start poking around for those differences.
>>
>>
>> I'm not in an SDK. I'm just building the obmc-phosphor-image from a
>> clean check-out of the meta layers.  The command I'm running locally
>> and the environment for the continuous build are the same in terms of
>> commands and configuration, but different in terms of locally
>> installed packages.  Which, per the above, I thought that was no
>> longer a factor.
>>
>>>
>>>>
>>>> Patrick
>>>>
>>>
>>> Matt
>>>
>>
>
