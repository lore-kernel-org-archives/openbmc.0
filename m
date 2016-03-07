Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x244.google.com (mail-ob0-x244.google.com
 [IPv6:2607:f8b0:4003:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 645B11A0008
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2016 15:01:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TrG54RfQ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=gumfiPEJ; 
 dkim-atps=neutral
Received: by mail-ob0-x244.google.com with SMTP id hc1so7820425obb.0
 for <openbmc@lists.ozlabs.org>; Sun, 06 Mar 2016 20:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Yn0dvBDg2ZFRLNLMEnXalUsVesOdpzZha+8quA73tak=;
 b=TrG54RfQFWBCRJegsZa9ww2NVpQ2HAD/7FtRsb5UfuMdjhNmpsz10Ndpb/LlTfPiCM
 zrEXgvSi462VseLXLRl0ZZba7H6J2oV39GYFq+ax82BbEUTu6JGAHBQZAMVeC9toFk4o
 1tjkX89MjlAzGJ4Qhk8MrtT04HXPB6HeXaSwS6x0NyuokrZ2ni7F5scAU4LUVWR6ilI0
 kmihpxgxDCU1G8Nmo6kg7mU5jRxVh26eWJWyKo+0gjxv6J5qfOqf6TN1BhtwV70IMvRW
 8P26QLdeeaZs1xCytfkzXUMQnxf2VnUEejBi8CqMG2DFadetaDFY9oZoMFY/N9qb2hIt
 tXbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Yn0dvBDg2ZFRLNLMEnXalUsVesOdpzZha+8quA73tak=;
 b=gumfiPEJn+p/HPm5okrT3rJjSCsZxyekwQ5ktCUpylHf1PfHvv9XViwv0Kh/k0UAKw
 SQW7R3veX4D+SHjgiuGcK3qQ9eCvly+cWyjVz9GEclahQkgjmfvnpfd4i/xqjp5HbGfk
 bMQ/+ErHNFjaB6SonkM1Lqj8UnVg+k4CPEHXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Yn0dvBDg2ZFRLNLMEnXalUsVesOdpzZha+8quA73tak=;
 b=FpQrpAGEvfOB8FJ6frHY2vhwxyqAb+zDl+wgSL9cM8S1P63k4h8uFLf4pgCtlxwwoQ
 OkmMHyLNa5GXpOoiYs10/H9zHe+HU4ZBslYozh11oj3zjkmkFENnQbM93a3tr/psNa38
 ubF94BZcrcFarFoMvH9yHO2eudNn9OrxOjoBlBI3p/hKAoEs8fpGRZtgogXpFmgYdyWv
 NLppSB6w2SX/ODYQHwVz7Bji8hVfPdroAIju3lWLS57hpbsRiT/4tt0JG9N032g3BUCB
 bg7WgxTMdXsQVWop7mQvRqcpBenXmlO6vPbWxUynshxhQB6NdhQ+elLsVyqBMNmu872g
 qhFw==
X-Gm-Message-State: AD7BkJJgW9DuNX/yy0tcrdF3DffdzwYjiin3A/rb0A1Cp04PJyAy3luFLiORYcL1O0gjQiSIlD/qjGvDS1mPzA==
X-Received: by 10.182.65.138 with SMTP id x10mr12379122obs.39.1457323271121;
 Sun, 06 Mar 2016 20:01:11 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Sun, 6 Mar 2016 20:00:51 -0800 (PST)
In-Reply-To: <1457044213-7365-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457044213-7365-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457044213-7365-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Mar 2016 14:30:51 +1030
X-Google-Sender-Auth: jpK1PShxwzYy7YaxII0zOCtNZY0
Message-ID: <CACPK8XeHoDVNgd7WrdX=RuoFcjQJvK4YSh8SLArRJpBuZjbWAQ@mail.gmail.com>
Subject: Re: [PATCH ipmi-fru-parser] RFC: use cmake.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2016 04:01:14 -0000

On Fri, Mar 4, 2016 at 9:00 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> There was a previous proposal to consider autotools (see
> openbmc/ipmi-fru-parser#7).  This is an alternative implementation
> using cmake.

I'm not a fan of autotools; I have not chosen to use it on small
projects in the past.

That said, I have stopped working on projects due to cmake's
downsides. It's overly complex, and no clear way to implement rules,
making it hard for newbies and experienced developers alike.

I would prefer to see autotools implemented by one of our team members
that has experience with it, and they can help the rest of us maintain
it.

I noticed in my feeds a new project created by some of the Xorg
developers that is a nice example of a clean, well structured project
that uses systemd, dbus, and autotools can be found here:

 https://github.com/libratbag/ratbagd

Cheers,

Joel

> ---
>  .gitignore        | 12 +++++++++
>  CMakeLists.txt    | 30 ++++++++++++++++++++++
>  Makefile          | 75 -------------------------------------------------------
>  cmake/sdbus.cmake | 16 ++++++++++++
>  4 files changed, 58 insertions(+), 75 deletions(-)
>  create mode 100644 .gitignore
>  create mode 100644 CMakeLists.txt
>  delete mode 100644 Makefile
>  create mode 100644 cmake/sdbus.cmake
>
> diff --git a/.gitignore b/.gitignore
> new file mode 100644
> index 0000000..727471a
> --- /dev/null
> +++ b/.gitignore
> @@ -0,0 +1,12 @@
> +#### vi files ####
> +*.swp
> +#### --- vi --- ####
> +
> +#### CMAKE Files ####
> +CMakeCache.txt
> +CMakeFiles
> +CMakeScripts
> +Makefile
> +cmake_install.cmake
> +install_manifest.txt
> +#### --- CMAKE --- ####
> diff --git a/CMakeLists.txt b/CMakeLists.txt
> new file mode 100644
> index 0000000..0a00985
> --- /dev/null
> +++ b/CMakeLists.txt
> @@ -0,0 +1,30 @@
> +cmake_minimum_required(VERSION 3.1)
> +project(ipmi-fru-parser)
> +
> +set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
> +set(CMAKE_CXX_STANDARD 14)
> +set(CMAKE_CXX_STANDARD_REQUIRED on)
> +
> +include("cmake/sdbus.cmake")
> +
> +add_library(writefrudata SHARED
> +    frup.c
> +    writefrudata.C
> +)
> +target_link_libraries(writefrudata ${SYSTEMD_LIBRARY})
> +install(TARGETS writefrudata LIBRARY DESTINATION lib/host-ipmid)
> +
> +add_library(strgfnhandler SHARED
> +    strgfnhandler.C
> +)
> +target_link_libraries(strgfnhandler writefrudata)
> +install(TARGETS strgfnhandler LIBRARY DESTINATION lib)
> +
> +add_executable(phosphor-read-eeprom
> +    argument.C
> +    readeeprom.C
> +)
> +target_link_libraries(phosphor-read-eeprom writefrudata)
> +target_link_libraries(phosphor-read-eeprom ${SYSTEMD_LIBRARY})
> +
> +install(TARGETS phosphor-read-eeprom RUNTIME DESTINATION bin)
> diff --git a/Makefile b/Makefile
> deleted file mode 100644
> index dc66a77..0000000
> --- a/Makefile
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -LIBS += libwritefrudata.so
> -HOST_LIBS += libstrgfnhandler.so
> -libwritefrudata.so_OBJS  += frup.o writefrudata.o
> -libstrgfnhandler.so_OBJS += strgfnhandler.o
> -
> -EXES += phosphor-read-eeprom
> -
> -phosphor-read-eeprom_OBJS  += readeeprom.o argument.o
> -phosphor-read-eeprom_EXTRA_LIBS  += writefrudata
> -libstrgfnhandler.so_EXTRA_LIBS  += writefrudata
> -libwritefrudata.so_NEEDED  += libsystemd
> -phosphor-read-eeprom_NEEDED  += libsystemd
> -
> -#### -----------------------------------------------------------------------####
> -#                                                                              #
> -##                       Compilare Regulas Sequi                              ##
> -#                                                                              #
> -#### -----------------------------------------------------------------------####
> -OPTFLAGS ?= -O3 -g -pipe -G -K
> -CFLAGS ?= $(OPTFLAGS)
> -CXXFLAGS ?= $(OPTFLAGS)
> -CFLAGS += -Wall -flto -fPIC
> -CXXFLAGS += --std=gnu++14 -Wall -flto -fPIC
> -
> -__PKG_CONFIG = $(if $1,$(shell pkg-config $2 $1))
> -__EXTRA_LIB_RESOLV = $(if $1,$1)
> -
> -define __BUILD_EXE
> -$1 : $$($1_OBJS) | $$(LIBS) $$(HOST_LIBS)
> -               $$(LINK.cpp) -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs)
> -
> -$(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
> -
> -#include $$($1_OBJS:.o=.d)
> -endef
> -
> -$(foreach exe,$(EXES),$(eval $(call __BUILD_EXE,$(exe))))
> -
> -define __BUILD_LIB
> -$1 : $$($1_OBJS) | $$(addsuffix .so,$$(addprefix lib,$$($1_EXTRA_LIBS)))
> -               $$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs)
> -
> -$(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
> -
> -#include $$($1_OBJS:.o=.d)
> -endef
> -
> -$(foreach lib,$(LIBS),$(eval $(call __BUILD_LIB,$(lib))))
> -$(foreach lib,$(HOST_LIBS),$(eval $(call __BUILD_LIB,$(lib))))
> -
> -.PHONY: clean
> -clean:
> -               $(RM) $(foreach exe,$(EXES),$(exe) $($(exe)_OBJS)) \
> -                         $(foreach lib,$(LIBS),$(lib) $($(lib)_OBJS)) \
> -                         $(foreach lib,$(HOST_LIBS),$(lib) $($(lib)_OBJS))
> -
> -DESTDIR ?= /
> -BINDIR ?= /usr/bin
> -LIBDIR ?= /usr/lib
> -
> -.PHONY: install
> -install:
> -               $(if $(EXES),\
> -               install -m 0755 -d $(DESTDIR)$(BINDIR) && \
> -               install -m 0755 $(EXES) $(DESTDIR)$(BINDIR) \
> -               )
> -               $(if $(LIBS),\
> -               install -m 0755 -d $(DESTDIR)$(LIBDIR)/host-ipmid && \
> -               install -m 0755 $(HOST_LIBS) $(DESTDIR)$(LIBDIR)/host-ipmid && \
> -               install -m 0755 $(LIBS) $(DESTDIR)$(LIBDIR) \
> -               )
> -
> -.DEFAULT_GOAL: all
> -.PHONY: all
> -all: $(EXES) $(LIBS)
> diff --git a/cmake/sdbus.cmake b/cmake/sdbus.cmake
> new file mode 100644
> index 0000000..90806f3
> --- /dev/null
> +++ b/cmake/sdbus.cmake
> @@ -0,0 +1,16 @@
> +find_library(SYSTEMD_LIBRARY systemd)
> +if(NOT SYSTEMD_LIBRARY)
> +    message(FATAL_ERROR "Cannot find libsystemd.")
> +endif(NOT SYSTEMD_LIBRARY)
> +
> +find_path(SYSTEMD_SDBUS_INCLUDE "systemd/sd-bus.h")
> +if(NOT SYSTEMD_SDBUS_INCLUDE)
> +    message(FATAL_ERROR "Cannot find sd-bus.h, libsystemd doesn't support?")
> +endif(NOT SYSTEMD_SDBUS_INCLUDE)
> +include_directories(${SYSTEMD_SDBUS_INCLUDE})
> +
> +INCLUDE (CheckLibraryExists)
> +CHECK_LIBRARY_EXISTS(systemd sd_bus_open SYSTEMD_LIBRARY SYSTEMD_HAVE_SDBUS)
> +if(NOT SYSTEMD_HAVE_SDBUS)
> +    message(FATAL_ERROR "libsystemd doesn't support sdbus functions.")
> +endif(NOT SYSTEMD_HAVE_SDBUS)
> --
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
