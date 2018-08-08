Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22e; helo=mail-it0-x22e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="beYd08S4"; 
 dkim-atps=neutral
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lx6P5GshzF0WS
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 02:04:45 +1000 (AEST)
Received: by mail-it0-x22e.google.com with SMTP id h20-v6so4261429itf.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Aug 2018 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TD1kLhalf1qhETho7TFYuaV/t43Y1ZoGtYJuGSpebp0=;
 b=beYd08S405PDBYRrFKAFadoV++DrbFsy+rfjfbaOu4iBvdYzm8XINICHKV/23is1k9
 esd+5Pt5XrCENqtQW0rY1Qu7uJ6O47n88LEej4TMP1/cSRC2utC8CdTBzw0o43eSkosa
 +6UAAkO6PlTyJkzhRRw29H7a2+gZd3OFUIEz+bwwCciECj9CvzdlNeT6lPo3PrbdlrN/
 jDCqIIjy2oOPvdTKNwHh7K1D0JuaH/ePkj8X3DZl565slsySwf6qJ5I84XCt3gudD6wy
 mr6SBsWtwD/J/g92Hud9bhSzlh1yuWJNd5ZJDOo0AMkBKc+RVq5+dHWHEuR55CuVFjqS
 stEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TD1kLhalf1qhETho7TFYuaV/t43Y1ZoGtYJuGSpebp0=;
 b=QK08Nw0WfrpHsOZxaYzEczSQ7mPph5CpOzjfj4IatKKgd71cHiItt5hsxXhFozqYbH
 p92bWM7L3aENL0wHnxY14Oj2J2suFC4bHXbffFpPAWfb9nePU9MKFqePnd9XBlHEBCTA
 LL1O5mqekZ0uM7oGaLm+6z0ox4eCkCAyqmYkq0LfAo9SSpTGY08WtrnR+X0OYhWDr/uR
 IAKFUK0sTOPDrzI1gun66YH8KPNt0dXUwL+40/QlAmUESwbsgOoZ4DWaGQehH/BNYnP7
 rrJEpXgo2Zr9Mknf1gk6zkE19Yl9IomQf72tkMKOQTTjo/SNnHZa4WzFXa5RSmhGfwBB
 +qxg==
X-Gm-Message-State: AOUpUlFL7ATLxcUfrMmQwGixQ3oeNdeKCCCo3rQGIryRI5CKbappOy9i
 MM4v3+xkSgA5dF2/yus6bWEVj3m5OkVfZmFygc7cHbKS4aE=
X-Google-Smtp-Source: AA+uWPzJfS5Nb7tQ7uGzOf9xKQmmsxM/b8rNWbx/ysGwaN7bKMsZ7P4+xatfacdPkTaX0Usd/iGgU1SMXOm0tlbqdfU=
X-Received: by 2002:a24:7882:: with SMTP id
 p124-v6mr2733557itc.111.1533744282948; 
 Wed, 08 Aug 2018 09:04:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Wed, 8 Aug 2018 09:04:22 -0700 (PDT)
In-Reply-To: <7129fe1c-73ac-0489-b34c-a44ce3490ad8@linux.ibm.com>
References: <CAO=notx7qNDyNDA=Zd2amR1CyYT1YtO1v69YMb0kc9SCJTVfuQ@mail.gmail.com>
 <7129fe1c-73ac-0489-b34c-a44ce3490ad8@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 8 Aug 2018 09:04:22 -0700
Message-ID: <CAO=notwa+5gjMK6Egft+bvAHsNv6RfSipyinkt-5+0FOFW6xxA@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Aug 2018 16:04:46 -0000

On Wed, Aug 8, 2018 at 8:56 AM, Matthew Barth <msbarth@linux.ibm.com> wrote:
>
>
> On 08/08/2018 09:42 AM, Patrick Venture wrote:
>>
>> I'm seeing the configure fail on a couple downstream recipes that
>> essentially just build ipmi libraries now that we're merged with v2.2
>> of OpenBMC.
>>
>> NOTE: recipe google-ipmi-ethstats-1.0-r0: task do_configure: Started
>> ERROR: google-ipmi-ethstats-1.0-r0 do_configure: Function failed:
>> do_configure (log file is located at
>>
>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938)
>> ERROR: Logfile of failure stored in:
>>
>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/log.do_configure.8938
>> Log data follows:
>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>> 'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
>> 'arm-linux-gnueabi', 'common']
>> | DEBUG: Executing shell function autotools_preconfigure
>> | DEBUG: Shell function autotools_preconfigure finished
>> | DEBUG: Executing python function autotools_aclocals
>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>> 'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
>> 'arm-linux-gnueabi', 'common']
>> | DEBUG: Python function autotools_aclocals finished
>> | DEBUG: Executing shell function do_configure
>> |
>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>> 1:
>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>> automake: not found
>> |
>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>> 146:
>> /tmpfs/gbmc-sm/gbmc/build/tmp/work/armv5e-openbmc-linux-gnueabi/google-ipmi-ethstats/1.0-r0/temp/run.do_configure.8938:
>> automake: not found
>
> From what's given, I'd check to see if the continuous build environment has
> the autotools installed since `automake` isnt found.

So, the environment has automake and autotools-dev installed.  I also
tried within a docker instance and made sure those were installed.
That said, with yocto 2.3 it's not supposed to rely on what's
installed in the host environment but rather rely on the native
packages that come as dependencies.  Or am I mistaken?

>
>
>> | WARNING: exit code 127 from a shell command.
>>
>> The configure.ac:
>>
>> # Initialization
>> AC_PREREQ([2.69])
>> AC_INIT([gsys-ipmi], [1.0], [https://www.google.com])
>> AC_LANG([C++])
>> AC_CONFIG_HEADERS([config.h])
>> AM_INIT_AUTOMAKE([subdir-objects -Wall -Werror foreign dist-xz])
>> AM_SILENT_RULES([yes])
>> # Checks for programs.
>> AC_PROG_CXX
>> AM_PROG_AR
>> AC_PROG_INSTALL
>> AC_PROG_MAKE_SET
>> # Checks for typedefs, structures, and compiler characteristics.
>> AX_CXX_COMPILE_STDCXX_14([noext])
>> AX_APPEND_COMPILE_FLAGS([-Wall -Werror], [CXXFLAGS])
>> # Checks for libraries.
>> PKG_CHECK_MODULES([SYSTEMD], [libsystemd >= 221], [],
>> [AC_MSG_ERROR(["systemd required and not found"])])
>> PKG_CHECK_MODULES([SDBUSPLUS], [sdbusplus], ,[AC_MSG_ERROR([The
>> openbmc/sdbusplus package is required])])
>> PKG_CHECK_MODULES([PHOSPHOR_LOGGING], [phosphor-logging],
>> ,[AC_MSG_ERROR([The openbmc/phosphor-logging package is required])])
>> PKG_CHECK_MODULES([PHOSPHOR_DBUS_INTERFACES],
>> [phosphor-dbus-interfaces], [],
>> [AC_MSG_ERROR(["phosphor-dbus-interfaces required and not found."])])
>> AC_CHECK_HEADER(experimental/any, ,[AC_MSG_ERROR([Could not find
>> experimental/any...libstdc++fs developement package required])])
>> # Checks for library functions.
>> LT_INIT # Required for systemd linking
>> # Create configured output
>> AC_CONFIG_FILES([Makefile])
>> AC_OUTPUT
>>
>> Which looks like all the others I've seen, more or less, nothing special.
>>
>> The recipe:
>>
>> SUMMARY = "Ethernet Statistics OEM Command"
>> DESCRIPTION = "Ethernet Statistics OEM Command"
>> LICENSE = "CLOSED"
>> inherit autotools pkgconfig
>> inherit obmc-phosphor-ipmiprovider-symlink
>> S = "${WORKDIR}/"
>> SRC_URI = "file://Makefile.am \
>>   file://bootstrap.sh \
>>   file://configure.ac \
>>   file://main.cpp \
>> "
>> DEPENDS += "autoconf-archive-native"
>> DEPENDS += "sdbusplus"
>> DEPENDS += "phosphor-logging"
>> # We depend on this to be built first so we can build our providers.
>> DEPENDS += "phosphor-ipmi-host"
>> RDEPENDS_${PN} += "sdbusplus phosphor-dbus-interfaces"
>> FILES_${PN}_append = " ${libdir}/ipmid-providers/lib*${SOLIBS}"
>> FILES_${PN}_append = " ${libdir}/host-ipmid/lib*${SOLIBS}"
>> FILES_${PN}_append = " ${libdir}/net-ipmid/lib*${SOLIBS}"
>> FILES_${PN}-dev_append = " ${libdir}/ipmid-providers/lib*${SOLIBSDEV}
>> ${libdir}/ipmid-providers/*.la"
>> HOSTIPMI_PROVIDER_LIBRARY += "libethstatscmd.so"
>>
>> Any things to check or poke would be appreciated.  It doesn't break in
>> all build environments, oddly.  Presumably with the yocto 2.3
>> inclusion in OpenBMC v2.2, the host environment became less involved. >
>> But when I build an image on my desktop, it builds fine.  When I run
>> the same commands in our continuous build environment, it fails.
>
> When you build on your desktop are you in an SDK and/or have autotools
> installed in your environment already and maybe not in the continuous build
> environment? I'd start poking around for those differences.

I'm not in an SDK. I'm just building the obmc-phosphor-image from a
clean check-out of the meta layers.  The command I'm running locally
and the environment for the continuous build are the same in terms of
commands and configuration, but different in terms of locally
installed packages.  Which, per the above, I thought that was no
longer a factor.

>
>>
>> Patrick
>>
>
> Matt
>
