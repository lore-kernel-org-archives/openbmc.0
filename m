Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ttXPVZ95"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42zQ3h1FXPzF3Bn
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 10:27:27 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id u3-v6so24183pfm.4
 for <openbmc@lists.ozlabs.org>; Mon, 19 Nov 2018 15:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UmT6zYiOpw/ttbEoP/z7JsIa6QLc9WTOfvwLxuiTnJ4=;
 b=ttXPVZ95/QaWFn+peQ+/GLIdYfXRWdmgxxoVDQEPQp4qfz07QZDr2HXpHf1Sb0tEn8
 P+d3m3iNEVdspj+un8DSEbylwRq8b+p/tMDOC6r6mdxpK36vV5RLECQYl+7xocsyQYJ9
 H57r7QKNT1uYncAwrdge9H0S7Jqpd5p3KQgdO5waDaEyFGPfAZ37tho6GTLMPbDMIRlu
 wHciOlBogGscaIm22nLMHwuQPBWBUflyh6Q5w8Hmu3DtDz3yz9JkSVneRlgVlmB9D7IP
 wu1aSUhOYR14Ydqei9oIxMJT2XQmVlFrPc307VwLQ3T+R76KTB3nrJbhYB6kqYRW1y0J
 VBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UmT6zYiOpw/ttbEoP/z7JsIa6QLc9WTOfvwLxuiTnJ4=;
 b=YgY48mxKvNqKodaTWySMYqn0C2J1GYP9+kF4ymJgVcQgjB+aS9pbapaT/jGd9moOqM
 96Hvz+uLpAS/VdRq1VKFIhKlk/U39Oe5z93R8Vrnsw1rPbPebzH0id941UYpWUKpM/1A
 A8M2/Lpj5eQJvTIJqZm83e+qv7VK8u7jvDaPnz3xRy2slvFdWxRrr5OIo69RniWnLQ9M
 ybgI+iutIrEnKSQbScL4IrQfgLAFSlEJ/dMEsd3m3vBEQdyIdO5yRRw2INqO5uf6gaun
 bJQOFMbmv3GepOwnN02bHx63JpPTT4DwiZhddUiOpGieluzbHNzshuBbZpmGyTvNTYqj
 gpAQ==
X-Gm-Message-State: AGRZ1gKsdHHL0okmahkFyS6N8jivoMFhJeiBXmGeF2cbpHKhkYEKqYr+
 bAXiaPceaC8zVdLBL473bt7rfsBJZWdtrFbPj97KxRqWHxbZrw==
X-Google-Smtp-Source: AJdET5ceGIbfw9R3KeZJwflxyWLT+N9jkrO9Nyh8NX3GMfAB0kRhWKcW+PNBLMfxZw7VMJpGerzp+hbx2YeLPnwSb4k=
X-Received: by 2002:a63:4044:: with SMTP id n65mr21299634pga.90.1542670044533; 
 Mon, 19 Nov 2018 15:27:24 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 19 Nov 2018 15:27:13 -0800
Message-ID: <CAO=notwCR+JFtQUpbJGNYhkiXxW+VhYG9O4Jy_MH1phi0d4ehQ@mail.gmail.com>
Subject: build failure rebasing onto openbmc v2.4
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2018 23:27:29 -0000

I'm running into the following failure rebasing our patchset onto openbmc v2.4

Any thoughts?

/usr/local/google/git/workspaces/rebase_staging/gbmc-dbus-interfaces
ERROR: phosphor-inventory-manager-1.0+gitAUTOINC+6e94b65268-r1
do_compile: oe_runmake failed
ERROR: phosphor-inventory-manager-1.0+gitAUTOINC+6e94b65268-r1
do_compile: Function failed: do_compile (log file is located at
/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/temp/log.do_compile.93181)
ERROR: Logfile of failure stored in:
/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/temp/log.do_compile.93181
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'arm-32', 'common-linux', 'common-glibc', 'arm-linux',
'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 12
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native/usr/bin/python-native/python
../git/pimgen.py -i
/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native/usr/share/phosphor-dbus-yaml/yaml
-d \
|       /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native/usr/share/phosphor-inventory-manager
-o . -b xyz.openbmc_project.Inventory.Manager generate-cpp
| touch extra_ifaces.cpp
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native/usr/bin/python-native/python
../git/pimgen.py -i
/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native/usr/share/phosphor-dbus-yaml/yaml
-d \
|       /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native/usr/share/phosphor-inventory-manager
-o . -b xyz.openbmc_project.Inventory.Manager \
|       generate-serialization
| make  all-recursive
| make[1]: Entering directory
'/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/build'
| Making all in .
| make[2]: Entering directory
'/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/build'
| ./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
arm-openbmc-linux-gnueabi-g++  -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git       -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
 -fvisibility-inlines-hidden -fpic -Wall -Werror -c -o
libmanagercommon_la-errors.lo `test -f 'errors.cpp' || echo
'../git/'`errors.cpp
| ./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
arm-openbmc-linux-gnueabi-g++  -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git       -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
 -fvisibility-inlines-hidden -fpic -Wall -Werror -c -o
libmanagercommon_la-functor.lo `test -f 'functor.cpp' || echo
'../git/'`functor.cpp
| ./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
arm-openbmc-linux-gnueabi-g++  -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git       -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
 -fvisibility-inlines-hidden -fpic -Wall -Werror -c -o
libmanagercommon_la-manager.lo `test -f 'manager.cpp' || echo
'../git/'`manager.cpp
| ./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
arm-openbmc-linux-gnueabi-g++  -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git     -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
 -fvisibility-inlines-hidden -fpic -Wall -Werror -c -o extra_ifaces.lo
extra_ifaces.cpp
| ./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
arm-openbmc-linux-gnueabi-g++  -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git     -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
 -fvisibility-inlines-hidden -fpic -Wall -Werror -c -o generated.lo
generated.cpp
| arm-openbmc-linux-gnueabi-g++  -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git     -flto -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
 -fvisibility-inlines-hidden -fpic -Wall -Werror -c -o
phosphor_inventory-app.o `test -f 'app.cpp' || echo '../git/'`app.cpp
| arm-openbmc-linux-gnueabi-libtool: compile:
arm-openbmc-linux-gnueabi-g++ -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
-fvisibility-inlines-hidden -fpic -Wall -Werror -c ../git/manager.cpp
-fPIC -DPIC -o .libs/libmanagercommon_la-manager.o
| arm-openbmc-linux-gnueabi-libtool: compile:
arm-openbmc-linux-gnueabi-g++ -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
-fvisibility-inlines-hidden -fpic -Wall -Werror -c extra_ifaces.cpp
-fPIC -DPIC -o .libs/extra_ifaces.o
| arm-openbmc-linux-gnueabi-libtool: compile:
arm-openbmc-linux-gnueabi-g++ -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
-fvisibility-inlines-hidden -fpic -Wall -Werror -c generated.cpp
-fPIC -DPIC -o .libs/generated.o
| arm-openbmc-linux-gnueabi-libtool: compile:
arm-openbmc-linux-gnueabi-g++ -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
-fvisibility-inlines-hidden -fpic -Wall -Werror -c ../git/errors.cpp
-fPIC -DPIC -o .libs/libmanagercommon_la-errors.o
| arm-openbmc-linux-gnueabi-libtool: compile:
arm-openbmc-linux-gnueabi-g++ -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17 -DHAVE_CONFIG_H -I. -I../git -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
-fvisibility-inlines-hidden -fpic -Wall -Werror -c ../git/functor.cpp
-fPIC -DPIC -o .libs/libmanagercommon_la-functor.o
| ./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=link
arm-openbmc-linux-gnueabi-g++  -march=armv5e -marm
--sysroot=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot
-std=c++17    -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1=/usr/src/debug/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot=
-fdebug-prefix-map=/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot-native=
 -fvisibility-inlines-hidden -fpic -Wall -Werror -static -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -o libmanagercommon.la
libmanagercommon_la-errors.lo libmanagercommon_la-functor.lo
libmanagercommon_la-manager.lo -lsdbusplus -lsystemd -lphosphor_dbus
-lphosphor_logging -lsdbusplus -lsystemd -lstdc++fs
| arm-openbmc-linux-gnueabi-libtool: link:
arm-openbmc-linux-gnueabi-ar cru .libs/libmanagercommon.a
.libs/libmanagercommon_la-errors.o .libs/libmanagercommon_la-functor.o
.libs/libmanagercommon_la-manager.o
| arm-openbmc-linux-gnueabi-ar: `u' modifier ignored since `D' is the
default (see `U')
| arm-openbmc-linux-gnueabi-libtool: link:
arm-openbmc-linux-gnueabi-ranlib .libs/libmanagercommon.a
| arm-openbmc-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
"libmanagercommon.la" && ln -s "../libmanagercommon.la"
"libmanagercommon.la" )
| In file included from
/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/archives/json.hpp:32:0,
|                  from ../git/serialize.hpp:5,
|                  from ../git/manager.hpp:5,
|                  from generated.cpp:2:
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:
In instantiation of 'ArchiveType& cereal::OutputArchive<ArchiveType,
Flags>::operator()(Types&& ...) [with Types = {}; ArchiveType =
cereal::JSONOutputArchive; unsigned int Flags = 0]':
| gen_serialization.hpp:1025:6:   required from 'void
cereal::save(Archive&, const
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation&,
uint32_t) [with Archive = cereal::JSONOutputArchive; uint32_t =
unsigned int]'
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:535:34:
  required from 'ArchiveType& cereal::OutputArchive<ArchiveType,
Flags>::processImpl(const T&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
typename cereal::traits::detail::EnableIfHelper<cereal::traits::has_non_member_versioned_save<T,
ArchiveType>::value, (!
cereal::traits::has_invalid_output_versioning<T, ArchiveType>::value),
(cereal::traits::is_output_serializable<T, ArchiveType>::value &&
(cereal::traits::is_specialized_non_member_versioned_save<T,
ArchiveType>::value || (! cereal::traits::is_specialized<T,
ArchiveType>::value)))>::type <anonymous> =
(cereal::traits::detail::type)0; ArchiveType =
cereal::JSONOutputArchive; unsigned int Flags = 0]'
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:347:9:
  required from 'void cereal::OutputArchive<ArchiveType,
Flags>::process(T&&) [with T = const
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation&;
ArchiveType = cereal::JSONOutputArchive; unsigned int Flags = 0]'
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:249:9:
  required from 'ArchiveType& cereal::OutputArchive<ArchiveType,
Flags>::operator()(Types&& ...) [with Types = {const
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation&};
ArchiveType = cereal::JSONOutputArchive; unsigned int Flags = 0]'
| ../git/serialize.hpp:34:13:   required from 'void
cereal::serialize(const Path&, const Interface&, const T&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
cereal::Path = std::__cxx11::basic_string<char>; cereal::Interface =
std::__cxx11::basic_string<char>]'
| ../git/manager.hpp:107:22:   required from 'void
phosphor::inventory::manager::propSerialize(const string&, const
string&, const std::experimental::fundamentals_v1::any&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
typename std::enable_if<phosphor::inventory::manager::HasProperties<T>::value,
bool>::type <anonymous> = 1; std::__cxx11::string =
std::__cxx11::basic_string<char>]'
| ../git/manager.hpp:157:25:   required from 'static void
phosphor::inventory::manager::MakeInterface<T>::serialize(const
string&, const string&, const
std::experimental::fundamentals_v1::any&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
std::__cxx11::string = std::__cxx11::basic_string<char>]'
| generated.cpp:875:105:   required from here
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:249:9:
error: no matching function for call to
'cereal::JSONOutputArchive::process()'
|          self->process( std::forward<Types>( args )... );
|          ^~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:344:12:
note: candidate: template<class T> void
cereal::OutputArchive<ArchiveType, Flags>::process(T&&) [with T = T;
ArchiveType = cereal::JSONOutputArchive; unsigned int Flags = 0]
|        void process( T && head )
|             ^~~~~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:344:12:
note:   template argument deduction/substitution failed:
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:249:9:
note:   candidate expects 1 argument, 0 provided
|          self->process( std::forward<Types>( args )... );
|          ^~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:353:12:
note: candidate: template<class T, class ... Other> void
cereal::OutputArchive<ArchiveType, Flags>::process(T&&, Other&& ...)
[with T = T; Other = {Other ...}; ArchiveType =
cereal::JSONOutputArchive; unsigned int Flags = 0]
|        void process( T && head, Other && ... tail )
|             ^~~~~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:353:12:
note:   template argument deduction/substitution failed:
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:249:9:
note:   candidate expects at least 1 argument, 0 provided
|          self->process( std::forward<Types>( args )... );
|          ^~~~
| In file included from
/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/archives/json.hpp:32:0,
|                  from ../git/serialize.hpp:5,
|                  from ../git/manager.hpp:5,
|                  from generated.cpp:2:
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:
In instantiation of 'ArchiveType& cereal::InputArchive<ArchiveType,
Flags>::operator()(Types&& ...) [with Types = {}; ArchiveType =
cereal::JSONInputArchive; unsigned int Flags = 0]':
| gen_serialization.hpp:1034:6:   required from 'void
cereal::load(Archive&,
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation&,
uint32_t) [with Archive = cereal::JSONInputArchive; uint32_t =
unsigned int]'
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:935:34:
  required from 'ArchiveType& cereal::InputArchive<ArchiveType,
Flags>::processImpl(T&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
typename cereal::traits::detail::EnableIfHelper<cereal::traits::has_non_member_versioned_load<T,
ArchiveType>::value, (!
cereal::traits::has_invalid_input_versioning<T, ArchiveType>::value),
(cereal::traits::is_input_serializable<T, ArchiveType>::value &&
(cereal::traits::is_specialized_non_member_versioned_load<T,
ArchiveType>::value || (! cereal::traits::is_specialized<T,
ArchiveType>::value)))>::type <anonymous> =
(cereal::traits::detail::type)0; ArchiveType =
cereal::JSONInputArchive; unsigned int Flags = 0]'
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:730:9:
  required from 'void cereal::InputArchive<ArchiveType,
Flags>::process(T&&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation&;
ArchiveType = cereal::JSONInputArchive; unsigned int Flags = 0]'
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:619:16:
  required from 'ArchiveType& cereal::InputArchive<ArchiveType,
Flags>::operator()(Types&& ...) [with Types =
{sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation&};
ArchiveType = cereal::JSONInputArchive; unsigned int Flags = 0]'
| ../git/serialize.hpp:70:21:   required from 'void
cereal::deserialize(const Path&, const Interface&, T&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
cereal::Path = std::__cxx11::basic_string<char>; cereal::Interface =
std::__cxx11::basic_string<char>]'
| ../git/manager.hpp:122:24:   required from 'void
phosphor::inventory::manager::propDeSerialize(const string&, const
string&, std::experimental::fundamentals_v1::any&) [with T =
sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
typename std::enable_if<phosphor::inventory::manager::HasProperties<T>::value,
bool>::type <anonymous> = 1; std::__cxx11::string =
std::__cxx11::basic_string<char>]'
| ../git/manager.hpp:163:27:   required from 'static void
phosphor::inventory::manager::MakeInterface<T>::deserialize(const
string&, const string&, std::experimental::fundamentals_v1::any&)
[with T = sdbusplus::xyz::openbmc_project::Inventory::Decorator::server::VendorInformation;
std::__cxx11::string = std::__cxx11::basic_string<char>]'
| generated.cpp:878:105:   required from here
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:619:16:
error: no matching function for call to
'cereal::InputArchive<cereal::JSONInputArchive>::process()'
|          process( std::forward<Types>( args )... );
|          ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:727:12:
note: candidate: template<class T> void
cereal::InputArchive<ArchiveType, Flags>::process(T&&) [with T = T;
ArchiveType = cereal::JSONInputArchive; unsigned int Flags = 0]
|        void process( T && head )
|             ^~~~~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:727:12:
note:   template argument deduction/substitution failed:
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:619:16:
note:   candidate expects 1 argument, 0 provided
|          process( std::forward<Types>( args )... );
|          ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:736:12:
note: candidate: template<class T, class ... Other> void
cereal::InputArchive<ArchiveType, Flags>::process(T&&, Other&& ...)
[with T = T; Other = {Other ...}; ArchiveType =
cereal::JSONInputArchive; unsigned int Flags = 0]
|        void process( T && head, Other && ... tail )
|             ^~~~~~~
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:736:12:
note:   template argument deduction/substitution failed:
| /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/recipe-sysroot/usr/include/cereal/cereal.hpp:619:16:
note:   candidate expects at least 1 argument, 0 provided
|          process( std::forward<Types>( args )... );
|          ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| Makefile:620: recipe for target 'generated.lo' failed
| make[2]: *** [generated.lo] Error 1
| make[2]: Leaving directory
'/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/build'
| Makefile:673: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
'/usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/build'
| Makefile:460: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: /usr/local/google/git/workspaces/building_rebase/build/tmp/work/armv5e-openbmc-linux-gnueabi/phosphor-inventory-manager/1.0+gitAUTOINC+6e94b65268-r1/temp/run.do_compile.93181:1
exit 1 from 'exit 1'

Patrick
