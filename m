Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::234; helo=mail-io0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v0PTtDjL"; 
 dkim-atps=neutral
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m4j466tBzDqk9
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 07:46:47 +1000 (AEST)
Received: by mail-io0-x234.google.com with SMTP id n18-v6so3083330ioa.9
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 14:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fRT73qsW1iGyvB6jUg20f8LjKDEiF5znaFEPnuKHWiU=;
 b=v0PTtDjLRPJyl7AinITGpIkLqHbPaDv5bTbLc/ygLMOAW3A8PtUsjOKC9nc/4zYK7v
 4h5YizLk/T3UHqCgI29hNTqxEakLFi6fZ5VSD7GcTayTaTD4zsypihUMZH540EVxtWlp
 olim5L+ffL8hd0imNxfHgzx/Jn9cpvgFFsrM1mQ/kYyMSeoPbGHzbXSAdKdnZuMnr64q
 XMKxpi0Q3wQfVsP/otw1XEMT9kI04nSBJ2pezwsYa0iWV7iJkUnc8mEkHtrN4A+PdL9u
 dkOEXviWLukqlSIc5lcnW+UdtNvd/2XXfPAaNHFMIi79qKBHVgXsvMhlJFsvOfVHRHvO
 /f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fRT73qsW1iGyvB6jUg20f8LjKDEiF5znaFEPnuKHWiU=;
 b=dcyARy8RhDlIfEfm3K7equnMURWZCYaxhJh2P+Xy+gBpAX3HHHSzL0tSBfvcMd0uOa
 d5FEm/ULBR60Jahk+Y8hrnaNL/BplnItBPKdrAzHOeA+sXQOrdbIy1AETGPBPG9RU1ZO
 tCmz+32lZ9FyT+1lxkaNc/oHWKrbh1a6QWk2vF8drv2JSxB8uTwewOGP56/iCW6pVNy1
 4GLLvT6EdBrsRtEBKGARgO36nGm5ZPiO2ybwd/1kBZ8f2JcxPns8hNj0w17/yAWka0LS
 HsX3nxTNMPiVmMA9FY5YeZamACvsThMElnYLXwy+gDLE9stuPKIa3ANqXiVgbpm+D1aL
 g91w==
X-Gm-Message-State: AOUpUlHhEyIBdQJ0truo8EL32zo+ObpxSpPRYSDHl/Mdau9lAWf44jap
 OrA0XdJ/iXQAqA7vrOEPdbOWQNMSAPFV8Cj34bu6yQ==
X-Google-Smtp-Source: AA+uWPxyDy6iYNcemS0mqCCM3W3hfb5Umam8eFbarUgD5Qiyi0vRXmPviZpBAubgVJv5nHzW4iiL57PqfiW987XCwCA=
X-Received: by 2002:a6b:9415:: with SMTP id
 w21-v6mr4052366iod.290.1533764804998; 
 Wed, 08 Aug 2018 14:46:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Wed, 8 Aug 2018 14:46:24 -0700 (PDT)
In-Reply-To: <39b5cc92-0dfe-cfe0-c0ce-5e57e1c4295d@linux.ibm.com>
References: <CAO=notx7qNDyNDA=Zd2amR1CyYT1YtO1v69YMb0kc9SCJTVfuQ@mail.gmail.com>
 <7129fe1c-73ac-0489-b34c-a44ce3490ad8@linux.ibm.com>
 <CAO=notwa+5gjMK6Egft+bvAHsNv6RfSipyinkt-5+0FOFW6xxA@mail.gmail.com>
 <39b5cc92-0dfe-cfe0-c0ce-5e57e1c4295d@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Aug 2018 14:46:24 -0700
Message-ID: <CAO=notzTOLgTyRNhxVtVLJcvEMY8BPz-0SU=6EY=YJwK_iEj3w@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Aug 2018 21:46:50 -0000

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

Tried:

+ bitbake-layers show-recipes
+ grep -A1 automake
automake:
  meta                 1.15.1

So we're seeing it's available...
