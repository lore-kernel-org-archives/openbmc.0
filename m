Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DF2F1f4RzDqVS
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 07:25:41 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2018 12:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,339,1539673200"; d="scan'208";a="258360318"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga004.jf.intel.com with ESMTP; 10 Dec 2018 12:24:27 -0800
Date: Mon, 10 Dec 2018 12:24:22 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
Subject: Re: PTAL - phosphor-host-ipmid build warnings/errors
Message-ID: <20181210202422.GI8064@mauery.jf.intel.com>
References: <CAO=notwGziS7LeKh-g_G6Q-yTj7tmsGjiHMUv6uk5ic8hXxq5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notwGziS7LeKh-g_G6Q-yTj7tmsGjiHMUv6uk5ic8hXxq5A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 11 Dec 2018 09:31:20 +1100
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
X-List-Received-Date: Mon, 10 Dec 2018 20:25:43 -0000

On 10-Dec-2018 11:24 AM, Patrick Venture wrote:
>I've noticed recently a lot of build warnings since v2.4 on phosphor-host-ipmid:
>
>DEBUG: Executing python function externalsrc_compile_prefunc
>NOTE: phosphor-ipmi-host: compiling from external source tree
>/usr/local/google/git/workspaces/rebasing_daemons/gbmc-host-ipmid

I have a patch that removes some of these "notes". They aren't warnings 
because phosphor-host-ipmid builds with -Werror, which would cause it to 
fail if there were actually warnings. But the note messages are 
annoying. Digging into it, it looks like they spawn from an ABI 
difference between gcc 6 and gcc 7+. This is to notify people that are 
building new binaries to run on systems that have libraries built with 
an old gcc that they may not work as expected. Since all of our binaries 
are built with the same compiler, these notes can safely be ignored. For 
now, some of them can be removed with -Wno-psabi .

--Vernon

>DEBUG: Python function externalsrc_compile_prefunc finished
>DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
>'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
>'common']
>DEBUG: Executing shell function do_compile
>NOTE: make -j 12
>/bin/sh ../../../../../../../../rebasing_daemons/gbmc-host-ipmid/generate_whitelist.sh
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/share/phosphor-ipmi-host/phosphor-ipmi-fru-whitelist-native.conf
>/usr/local/google/git/workspaces/rebasing_daemons/gbmc-host-ipmid/host-ipmid-whitelist.conf
>> ipmiwhitelist.cpp
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/python-native/python
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/sensor_gen.py
>-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/share/phosphor-ipmi-host/sensor/sensor.yaml
>-o . generate-cpp
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/python-native/python
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/inventory-sensor.py
>-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/share/phosphor-ipmi-host/sensor/invsensor.yaml
>-o . generate-cpp
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/python-native/python
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/fru_gen.py
>-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/share/phosphor-ipmi-host/config/fru_config.yaml
>-o . generate-cpp
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/python-native/python
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/channel_gen.py
>-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/share/phosphor-ipmi-host/sensor/channel.yaml
>-o . generate-cpp
>make  all-recursive
>make[1]: Entering directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999'
>Making all in .
>make[2]: Entering directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999'
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o libipmi20_la-net.lo
>`test -f 'net.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`net.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-apphandler.lo `test -f 'apphandler.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`apphandler.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-sys_info_param.lo `test -f 'sys_info_param.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sys_info_param.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-sensorhandler.lo `test -f 'sensorhandler.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sensorhandler.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-storagehandler.lo `test -f 'storagehandler.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`storagehandler.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-chassishandler.lo `test -f 'chassishandler.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`chassishandler.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-dcmihandler.lo `test -f 'dcmihandler.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`dcmihandler.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-ipmisensor.lo `test -f 'ipmisensor.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmisensor.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-storageaddsel.lo `test -f 'storageaddsel.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`storageaddsel.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-transporthandler.lo `test -f 'transporthandler.cpp' ||
>echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`transporthandler.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-globalhandler.lo `test -f 'globalhandler.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`globalhandler.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-groupext.lo `test -f 'groupext.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`groupext.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/apphandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-apphandler.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/transporthandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-transporthandler.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/sys_info_param.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-sys_info_param.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/ipmisensor.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-ipmisensor.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/dcmihandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-dcmihandler.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/chassishandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-chassishandler.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/storagehandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-storagehandler.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/sensorhandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-sensorhandler.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/storageaddsel.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-storageaddsel.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/globalhandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-globalhandler.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/net.cpp
>-fPIC -DPIC -o .libs/libipmi20_la-net.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/groupext.cpp
>-fPIC -DPIC -o .libs/libipmi20_la-groupext.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o libipmi20_la-utils.lo
>`test -f 'utils.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`utils.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/utils.cpp
>-fPIC -DPIC -o .libs/libipmi20_la-utils.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-selutility.lo `test -f 'selutility.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`selutility.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/selutility.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-selutility.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-ipmi_fru_info_area.lo `test -f 'ipmi_fru_info_area.cpp'
>|| echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmi_fru_info_area.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-read_fru_data.lo `test -f 'read_fru_data.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`read_fru_data.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/ipmi_fru_info_area.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-ipmi_fru_info_area.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-sensordatahandler.lo `test -f 'sensordatahandler.cpp' ||
>echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sensordatahandler.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/read_fru_data.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-read_fru_data.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/sensordatahandler.cpp
> -fPIC -DPIC -o .libs/libipmi20_la-sensordatahandler.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-sensor-gen.lo `test -f 'sensor-gen.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sensor-gen.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c sensor-gen.cpp  -fPIC
>-DPIC -o .libs/libipmi20_la-sensor-gen.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-inventory-sensor-gen.lo `test -f
>'inventory-sensor-gen.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`inventory-sensor-gen.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-fru-read-gen.lo `test -f 'fru-read-gen.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`fru-read-gen.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c inventory-sensor-gen.cpp
>-fPIC -DPIC -o .libs/libipmi20_la-inventory-sensor-gen.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libipmi20_la-channel-gen.lo `test -f 'channel-gen.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`channel-gen.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c fru-read-gen.cpp  -fPIC
>-DPIC -o .libs/libipmi20_la-fru-read-gen.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c channel-gen.cpp  -fPIC
>-DPIC -o .libs/libipmi20_la-channel-gen.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
>-pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>user_channel/libuserlayer_la-user_layer.lo `test -f
>'user_channel/user_layer.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel/user_layer.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
>-pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>user_channel/libuserlayer_la-user_mgmt.lo `test -f
>'user_channel/user_mgmt.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel/user_mgmt.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
>-pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>user_channel/libuserlayer_la-passwd_mgr.lo `test -f
>'user_channel/passwd_mgr.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel/passwd_mgr.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
>-g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp
> -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-user_mgmt.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
>-g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_layer.cpp
> -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-user_layer.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
>-g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/passwd_mgr.cpp
> -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-passwd_mgr.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
>-pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>user_channel/libuserlayer_la-channel_mgmt.lo `test -f
>'user_channel/channel_mgmt.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel/channel_mgmt.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
>-g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.cpp
> -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-channel_mgmt.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
>-pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>user_channel/libuserlayer_la-channel_layer.lo `test -f
>'user_channel/channel_layer.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel/channel_layer.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB     -flto -O2 -pipe -g
>-feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libsysintfcmds_la-systemintfcmds.lo `test -f 'systemintfcmds.cpp' ||
>echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`systemintfcmds.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
>-g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_layer.cpp
> -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-channel_layer.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/systemintfcmds.cpp
> -fPIC -DPIC -o .libs/libsysintfcmds_la-systemintfcmds.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB     -flto -O2 -pipe -g
>-feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>libsysintfcmds_la-host-interface.lo `test -f 'host-interface.cpp' ||
>echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`host-interface.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/host-interface.cpp
> -fPIC -DPIC -o .libs/libsysintfcmds_la-host-interface.o
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-ipmid.o `test
>-f 'ipmid.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmid.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-settings.o
>`test -f 'settings.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`settings.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>ipmid-host-cmd-manager.o `test -f 'host-cmd-manager.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`host-cmd-manager.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-utils.o `test
>-f 'utils.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`utils.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-oemrouter.o
>`test -f 'oemrouter.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`oemrouter.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-ipmiwhitelist.o
>`test -f 'ipmiwhitelist.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmiwhitelist.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>app/libipmi20_la-channel.lo `test -f 'app/channel.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`app/channel.cpp
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>app/libipmi20_la-watchdog.lo `test -f 'app/watchdog.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`app/watchdog.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/app/watchdog.cpp
> -fPIC -DPIC -o app/.libs/libipmi20_la-watchdog.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>app/libipmi20_la-watchdog_service.lo `test -f
>'app/watchdog_service.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`app/watchdog_service.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/app/channel.cpp
> -fPIC -DPIC -o app/.libs/libipmi20_la-channel.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>user_channel/libipmi20_la-usercommands.lo `test -f
>'user_channel/usercommands.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel/usercommands.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/app/watchdog_service.cpp
> -fPIC -DPIC -o app/.libs/libipmi20_la-watchdog_service.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=compile
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>user_channel/libipmi20_la-channelcommands.lo `test -f
>'user_channel/channelcommands.cpp' || echo
>'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel/channelcommands.cpp
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/usercommands.cpp
> -fPIC -DPIC -o user_channel/.libs/libipmi20_la-usercommands.o
>arm-openbmc-linux-gnueabi-libtool: compile:
>arm-openbmc-linux-gnueabi-g++ -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -c
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channelcommands.cpp
> -fPIC -DPIC -o user_channel/.libs/libipmi20_la-channelcommands.o
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=link
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17  -DBOOST_ERROR_CODE_HEADER_ONLY
>-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB     -flto -O2 -pipe -g
>-feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -lsystemd  -lphosphor_dbus
>-lphosphor_logging -lsdbusplus -lsystemd -lsdbusplus -lsystemd
>-version-info 0:0:0 -shared -Wl,-O1 -Wl,--hash-style=gnu
>-Wl,--as-needed -o libsysintfcmds.la -rpath /usr/lib/ipmid-providers
>libsysintfcmds_la-systemintfcmds.lo
>libsysintfcmds_la-host-interface.lo  -lmapper
>arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17  -fPIC -DPIC -shared -nostdlib
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/crti.o
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0/crtbeginS.o
> .libs/libsysintfcmds_la-systemintfcmds.o
>.libs/libsysintfcmds_la-host-interface.o   -lphosphor_dbus
>-lphosphor_logging -lsdbusplus -lsystemd -lmapper
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/7.3.0
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/gcc
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/lib
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib
>-lstdc++ -lm -lc -lgcc_s
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0/crtendS.o
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/crtn.o
> -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-flto -O2 -g -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>-Wl,-soname -Wl,libsysintfcmds.so.0 -o .libs/libsysintfcmds.so.0.0.0
>arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
>"libsysintfcmds.so.0" && ln -s "libsysintfcmds.so.0.0.0"
>"libsysintfcmds.so.0")
>arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
>"libsysintfcmds.so" && ln -s "libsysintfcmds.so.0.0.0"
>"libsysintfcmds.so")
>arm-openbmc-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
>"libsysintfcmds.la" && ln -s "../libsysintfcmds.la"
>"libsysintfcmds.la" )
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=link
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -lsystemd  -ldl
>-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr//lib
>-lcrypto -lstdc++fs -pthread -export-dynamic -Wl,-O1
>-Wl,--hash-style=gnu -Wl,--as-needed -o ipmid ipmid-ipmid.o
>ipmid-settings.o ipmid-host-cmd-manager.o ipmid-utils.o
>ipmid-oemrouter.o ipmid-ipmiwhitelist.o  -lmapper
>arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
>-march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
>-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -pthread -Wl,-O1
>-Wl,--hash-style=gnu -Wl,--as-needed -o ipmid ipmid-ipmid.o
>ipmid-settings.o ipmid-host-cmd-manager.o ipmid-utils.o
>ipmid-oemrouter.o ipmid-ipmiwhitelist.o -Wl,--export-dynamic  -ldl
>-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr//lib
>-lcrypto -lstdc++fs -lmapper -pthread
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/map:60:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_month.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_ymd.hpp:16,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_calendar.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/gregorian_types.hpp:19,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_config.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_system.hpp:13,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/ptime.hpp:12,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.hpp:20,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.cpp:17:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:
>In member function 'std::pair<std::_Rb_tree_node_base*,
>std::_Rb_tree_node_base*> std::_Rb_tree<_Key, _Val, _KeyOfValue,
>_Compare, _Alloc>::_M_get_insert_hint_unique_pos(std::_Rb_tree<_Key,
>_Val, _KeyOfValue, _Compare, _Alloc>::const_iterator, const key_type&)
>[with _Key = std::__cxx11::basic_string<char>; _Val = std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
>_KeyOfValue = std::_Select1st<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
>= std::less<void>; _Alloc = std::allocator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:2130:5:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>     _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:
>In function 'std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
>_Alloc>::iterator std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
>_Alloc>::_M_emplace_hint_unique(std::_Rb_tree<_Key, _Val, _KeyOfValue,
>_Compare, _Alloc>::const_iterator, _Args&& ...) [with _Args = {const
>std::piecewise_construct_t&, std::tuple<const
>std::__cxx11::basic_string<char, std::char_traits<char>,
>std::allocator<char> >&>, std::tuple<>}; _Key =
>std::__cxx11::basic_string<char>; _Val = std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
>_KeyOfValue = std::_Select1st<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
>= std::less<void>; _Alloc = std::allocator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:2395:7:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>       _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/map:61:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_month.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_ymd.hpp:16,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_calendar.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/gregorian_types.hpp:19,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_config.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_system.hpp:13,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/ptime.hpp:12,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.hpp:20,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.cpp:17:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:
>In member function 'std::map<_Key, _Tp, _Compare,
>_Alloc>::mapped_type& std::map<_Key, _Tp, _Compare,
>_Alloc>::operator[](const key_type&) [with _Key =
>std::__cxx11::basic_string<char>; _Tp = nlohmann::basic_json<>;
>_Compare = std::less<void>; _Alloc = std::allocator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:493:4:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>    __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
>    ^~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:
>In member function 'nlohmann::basic_json<ObjectType, ArrayType,
>StringType, BooleanType, NumberIntegerType, NumberUnsignedType,
>NumberFloatType, AllocatorType, JSONSerializer>::value_type&
>nlohmann::basic_json<ObjectType, ArrayType, StringType, BooleanType,
>NumberIntegerType, NumberUnsignedType, NumberFloatType, AllocatorType,
>JSONSerializer>::operator[](const typename
>nlohmann::basic_json<ObjectType, ArrayType, StringType, BooleanType,
>NumberIntegerType, NumberUnsignedType, NumberFloatType, AllocatorType,
>JSONSerializer>::object_t::key_type&) [with ObjectType = std::map;
>ArrayType = std::vector; StringType =
>std::__cxx11::basic_string<char>; BooleanType = bool;
>NumberIntegerType = long long int; NumberUnsignedType = long long
>unsigned int; NumberFloatType = double; AllocatorType =
>std::allocator; JSONSerializer = nlohmann::adl_serializer]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:493:4:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>    __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
>    ^~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/vector:69:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/functional:61,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/detail/shared_count.hpp:38,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/shared_ptr.hpp:28,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/shared_ptr.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/microsec_time_clock.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.hpp:20,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.cpp:17:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
>...) [with _Args = {nlohmann::detail::value_t}; _Tp =
>nlohmann::basic_json<>; _Alloc = std::allocator<nlohmann::basic_json<>
>>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>       vector<_Tp, _Alloc>::
>       ^~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'std::vector<_Tp, _Alloc>::reference
>std::vector<_Tp, _Alloc>::emplace_back(_Args&& ...) [with _Args =
>{nlohmann::detail::value_t}; _Tp = nlohmann::basic_json<>; _Alloc =
>std::allocator<nlohmann::basic_json<> >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:105:21:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
>    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
>...) [with _Args = {std::nullptr_t}; _Tp = nlohmann::basic_json<>;
>_Alloc = std::allocator<nlohmann::basic_json<> >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>       vector<_Tp, _Alloc>::
>       ^~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
>...) [with _Args = {std::__cxx11::basic_string<char,
>std::char_traits<char>, std::allocator<char> >&}; _Tp =
>nlohmann::basic_json<>; _Alloc = std::allocator<nlohmann::basic_json<>
>>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'bool
>nlohmann::detail::parser<BasicJsonType>::sax_parse_internal(SAX*)
>[with SAX = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<>
>>; BasicJsonType = nlohmann::basic_json<>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:105:21:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
>    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:105:21:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
>    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/map:61:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_month.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_ymd.hpp:16,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_calendar.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/gregorian_types.hpp:19,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_config.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_system.hpp:13,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/ptime.hpp:12,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.hpp:20,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/channel_mgmt.cpp:17:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:
>In member function 'bool
>nlohmann::detail::json_sax_dom_callback_parser<BasicJsonType>::key(nlohmann::detail::json_sax_dom_callback_parser<BasicJsonType>::string_t&)
>[with BasicJsonType = nlohmann::basic_json<>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:493:4:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>    __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
>    ^~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/map:60:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_month.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_ymd.hpp:16,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_calendar.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/gregorian_types.hpp:19,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_config.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_system.hpp:13,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/ptime.hpp:12,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:
>In member function 'std::pair<std::_Rb_tree_node_base*,
>std::_Rb_tree_node_base*> std::_Rb_tree<_Key, _Val, _KeyOfValue,
>_Compare, _Alloc>::_M_get_insert_hint_unique_pos(std::_Rb_tree<_Key,
>_Val, _KeyOfValue, _Compare, _Alloc>::const_iterator, const key_type&)
>[with _Key = std::__cxx11::basic_string<char>; _Val = std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
>_KeyOfValue = std::_Select1st<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
>= std::less<void>; _Alloc = std::allocator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:2130:5:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>     _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:
>In function 'std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
>_Alloc>::iterator std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
>_Alloc>::_M_emplace_hint_unique(std::_Rb_tree<_Key, _Val, _KeyOfValue,
>_Compare, _Alloc>::const_iterator, _Args&& ...) [with _Args = {const
>std::piecewise_construct_t&, std::tuple<const
>std::__cxx11::basic_string<char, std::char_traits<char>,
>std::allocator<char> >&>, std::tuple<>}; _Key =
>std::__cxx11::basic_string<char>; _Val = std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
>_KeyOfValue = std::_Select1st<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
>= std::less<void>; _Alloc = std::allocator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:2395:7:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>       _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/map:61:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_month.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_ymd.hpp:16,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_calendar.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/gregorian_types.hpp:19,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_config.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_system.hpp:13,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/ptime.hpp:12,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:
>In member function 'std::map<_Key, _Tp, _Compare,
>_Alloc>::mapped_type& std::map<_Key, _Tp, _Compare,
>_Alloc>::operator[](const key_type&) [with _Key =
>std::__cxx11::basic_string<char>; _Tp = nlohmann::basic_json<>;
>_Compare = std::less<void>; _Alloc = std::allocator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:493:4:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>    __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
>    ^~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/vector:69:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/functional:61,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/detail/shared_count.hpp:38,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/shared_ptr.hpp:28,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/shared_ptr.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/microsec_time_clock.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
>...) [with _Args = {nlohmann::detail::value_t}; _Tp =
>nlohmann::basic_json<>; _Alloc = std::allocator<nlohmann::basic_json<>
>>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>       vector<_Tp, _Alloc>::
>       ^~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'std::vector<_Tp, _Alloc>::reference
>std::vector<_Tp, _Alloc>::emplace_back(_Args&& ...) [with _Args =
>{nlohmann::detail::value_t}; _Tp = nlohmann::basic_json<>; _Alloc =
>std::allocator<nlohmann::basic_json<> >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:105:21:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
>    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
>...) [with _Args = {std::nullptr_t}; _Tp = nlohmann::basic_json<>;
>_Alloc = std::allocator<nlohmann::basic_json<> >]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>       vector<_Tp, _Alloc>::
>       ^~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
>...) [with _Args = {std::__cxx11::basic_string<char,
>std::char_traits<char>, std::allocator<char> >&}; _Tp =
>nlohmann::basic_json<>; _Alloc = std::allocator<nlohmann::basic_json<>
>>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'bool
>nlohmann::detail::parser<BasicJsonType>::sax_parse_internal(SAX*)
>[with SAX = nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<>
>>; BasicJsonType = nlohmann::basic_json<>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:105:21:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
>    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:105:21:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
>    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/map:61:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_month.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_ymd.hpp:16,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/greg_calendar.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/gregorian/gregorian_types.hpp:19,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_config.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/posix_time_system.hpp:13,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/posix_time/ptime.hpp:12,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:
>In member function 'bool
>nlohmann::detail::json_sax_dom_callback_parser<BasicJsonType>::key(nlohmann::detail::json_sax_dom_callback_parser<BasicJsonType>::string_t&)
>[with BasicJsonType = nlohmann::basic_json<>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:493:4:
>note: parameter passing for argument of type
>'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
>std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > >, std::less<void>,
>std::allocator<std::pair<const std::__cxx11::basic_string<char>,
>nlohmann::basic_json<> > > >::const_iterator {aka
>std::_Rb_tree_const_iterator<std::pair<const
>std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
>in GCC 7.1
>    __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
>    ^~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/vector:69:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/functional:61,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/detail/shared_count.hpp:38,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/shared_ptr.hpp:28,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/shared_ptr.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/microsec_time_clock.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
>...) [with _Args = {const nlohmann::basic_json<std::map, std::vector,
>std::__cxx11::basic_string<char, std::char_traits<char>,
>std::allocator<char> >, bool, long long int, long long unsigned int,
>double, std::allocator, nlohmann::adl_serializer>&}; _Tp =
>nlohmann::basic_json<>; _Alloc = std::allocator<nlohmann::basic_json<>
>>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:394:7:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>       vector<_Tp, _Alloc>::
>       ^~~~~~~~~~~~~~~~~~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/vector:64:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/functional:61,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/detail/shared_count.hpp:38,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/shared_ptr.hpp:28,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/shared_ptr.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/microsec_time_clock.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_vector.h:
>In member function 'void ipmi::UserAccess::writeUserData()':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_vector.h:948:21:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>    _M_realloc_insert(end(), __x);
>    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/vector:69:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/functional:61,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/detail/shared_count.hpp:38,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/shared_ptr.hpp:28,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/shared_ptr.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/microsec_time_clock.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:
>In member function 'void std::vector<_Tp,
>_Alloc>::_M_fill_insert(std::vector<_Tp, _Alloc>::iterator,
>std::vector<_Tp, _Alloc>::size_type, const value_type&) [with _Tp =
>nlohmann::basic_json<>; _Alloc = std::allocator<nlohmann::basic_json<>
>>]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/vector.tcc:458:5:
>note: parameter passing for argument of type
>'std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > >::iterator {aka
>__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
>     vector<_Tp, _Alloc>::
>     ^~~~~~~~~~~~~~~~~~~
>In file included from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/vector:64:0,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/functional:61,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/detail/shared_count.hpp:38,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/smart_ptr/shared_ptr.hpp:28,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/shared_ptr.hpp:17,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/date_time/microsec_time_clock.hpp:18,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/detail/os_thread_functions.hpp:36,
>                 from
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/boost/interprocess/sync/file_lock.hpp:26,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.hpp:21,
>                 from
>../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/user_mgmt.cpp:16:
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_vector.h:
>In member function 'void ipmi::UserAccess::readUserData()':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_vector.h:1087:16:
>note: parameter passing for argument of type
>'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
>std::vector<nlohmann::basic_json<>,
>std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
>  _M_fill_insert(begin() + __offset, __n, __x);
>  ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=link
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17     -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -lsystemd
>-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr//lib
>-lcrypto -lpam_misc -lssl -version-info 0:0:0 -shared -Wl,-O1
>-Wl,--hash-style=gnu -Wl,--as-needed -o libuserlayer.la -rpath
>/usr/lib user_channel/libuserlayer_la-user_layer.lo
>user_channel/libuserlayer_la-user_mgmt.lo
>user_channel/libuserlayer_la-passwd_mgr.lo
>user_channel/libuserlayer_la-channel_mgmt.lo
>user_channel/libuserlayer_la-channel_layer.lo  -lmapper
>arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17  -fPIC -DPIC -shared -nostdlib
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/crti.o
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0/crtbeginS.o
> user_channel/.libs/libuserlayer_la-user_layer.o
>user_channel/.libs/libuserlayer_la-user_mgmt.o
>user_channel/.libs/libuserlayer_la-passwd_mgr.o
>user_channel/.libs/libuserlayer_la-channel_mgmt.o
>user_channel/.libs/libuserlayer_la-channel_layer.o
>-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr//lib
>-lcrypto -lpam_misc -lssl -lmapper
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/7.3.0
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/gcc
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/lib
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib
>-lstdc++ -lm -lc -lgcc_s
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0/crtendS.o
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/crtn.o
> -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-O2 -g -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname
>-Wl,libuserlayer.so.0 -o .libs/libuserlayer.so.0.0.0
>arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
>"libuserlayer.so.0" && ln -s "libuserlayer.so.0.0.0"
>"libuserlayer.so.0")
>arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
>"libuserlayer.so" && ln -s "libuserlayer.so.0.0.0" "libuserlayer.so")
>arm-openbmc-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
>"libuserlayer.la" && ln -s "../libuserlayer.la" "libuserlayer.la" )
>./arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=link
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17   -DBOOST_ERROR_CODE_HEADER_ONLY
>-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g
>-feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -lsystemd
>-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
>-luserlayer -version-info 0:0:0 -shared -Wl,-O1 -Wl,--hash-style=gnu
>-Wl,--as-needed -o libipmi20.la -rpath /usr/lib/ipmid-providers
>libipmi20_la-net.lo app/libipmi20_la-channel.lo
>app/libipmi20_la-watchdog.lo app/libipmi20_la-watchdog_service.lo
>libipmi20_la-apphandler.lo libipmi20_la-sys_info_param.lo
>libipmi20_la-sensorhandler.lo libipmi20_la-storagehandler.lo
>libipmi20_la-chassishandler.lo libipmi20_la-dcmihandler.lo
>libipmi20_la-ipmisensor.lo libipmi20_la-storageaddsel.lo
>libipmi20_la-transporthandler.lo libipmi20_la-globalhandler.lo
>libipmi20_la-groupext.lo libipmi20_la-utils.lo
>libipmi20_la-selutility.lo libipmi20_la-ipmi_fru_info_area.lo
>libipmi20_la-read_fru_data.lo libipmi20_la-sensordatahandler.lo
>user_channel/libipmi20_la-usercommands.lo
>user_channel/libipmi20_la-channelcommands.lo
>libipmi20_la-sensor-gen.lo libipmi20_la-inventory-sensor-gen.lo
>libipmi20_la-fru-read-gen.lo libipmi20_la-channel-gen.lo  -lmapper
>arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17  -fPIC -DPIC -shared -nostdlib
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/crti.o
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0/crtbeginS.o
> .libs/libipmi20_la-net.o app/.libs/libipmi20_la-channel.o
>app/.libs/libipmi20_la-watchdog.o
>app/.libs/libipmi20_la-watchdog_service.o
>.libs/libipmi20_la-apphandler.o .libs/libipmi20_la-sys_info_param.o
>.libs/libipmi20_la-sensorhandler.o .libs/libipmi20_la-storagehandler.o
>.libs/libipmi20_la-chassishandler.o .libs/libipmi20_la-dcmihandler.o
>.libs/libipmi20_la-ipmisensor.o .libs/libipmi20_la-storageaddsel.o
>.libs/libipmi20_la-transporthandler.o
>.libs/libipmi20_la-globalhandler.o .libs/libipmi20_la-groupext.o
>.libs/libipmi20_la-utils.o .libs/libipmi20_la-selutility.o
>.libs/libipmi20_la-ipmi_fru_info_area.o
>.libs/libipmi20_la-read_fru_data.o
>.libs/libipmi20_la-sensordatahandler.o
>user_channel/.libs/libipmi20_la-usercommands.o
>user_channel/.libs/libipmi20_la-channelcommands.o
>.libs/libipmi20_la-sensor-gen.o
>.libs/libipmi20_la-inventory-sensor-gen.o
>.libs/libipmi20_la-fru-read-gen.o .libs/libipmi20_la-channel-gen.o
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libuserlayer.so
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr//lib
>-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
>-lcrypto -lpam_misc -lssl -lmapper
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/7.3.0
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/gcc
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/lib
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0
>-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib
>-lstdc++ -lm -lc -lgcc_s
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/arm-openbmc-linux-gnueabi/7.3.0/crtendS.o
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/lib/crtn.o
> -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-flto -O2 -g -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>-Wl,-soname -Wl,libipmi20.so.0 -o .libs/libipmi20.so.0.0.0
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:
>In member function
>'_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_N8nlohmann10basic_jsonISt3mapSt6vectorS5_bxydSaNS8_14adl_serializerEEEESt10_Select1stISE_ESt4lessIvESaISE_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJRS7_EESP_IJEEEEESt17_Rb_tree_iteratorISE_ESt23_Rb_tree_const_iteratorISE_EDpOT_.isra.488':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_tree.h:2395:7:
>note: parameter passing for argument of type 'struct const_iterator'
>changed in GCC 7.1
>       _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
>       ^
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:
>In member function 'operator[]':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:493:4:
>note: parameter passing for argument of type 'struct const_iterator'
>changed in GCC 7.1
>    __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
>    ^
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:
>In member function 'key':
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/include/c++/7.3.0/bits/stl_map.h:493:4:
>note: parameter passing for argument of type 'struct const_iterator'
>changed in GCC 7.1
>    __i = _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
>    ^
>arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
>"libipmi20.so.0" && ln -s "libipmi20.so.0.0.0" "libipmi20.so.0")
>arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
>"libipmi20.so" && ln -s "libipmi20.so.0.0.0" "libipmi20.so")
>arm-openbmc-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
>"libipmi20.la" && ln -s "../libipmi20.la" "libipmi20.la" )
>make[2]: Leaving directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999'
>Making all in test
>make[2]: Entering directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/test'
>make[2]: Nothing to be done for 'all'.
>make[2]: Leaving directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/test'
>Making all in softoff
>make[2]: Entering directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/softoff'
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/sdbus++
>-r ../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>interface server-cpp xyz.openbmc_project.Ipmi.Internal.SoftPowerOff >
>xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp
>/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native/usr/bin/sdbus++
>-r ../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>interface server-header xyz.openbmc_project.Ipmi.Internal.SoftPowerOff
>> xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.hpp
>make  all-am
>make[3]: Entering directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/softoff'
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
>-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>   -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>phosphor_softpoweroff-softoff.o `test -f 'softoff.cpp' || echo
>'../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff/'`softoff.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
>-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>   -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>phosphor_softpoweroff-mainapp.o `test -f 'mainapp.cpp' || echo
>'../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff/'`mainapp.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
>-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>   -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-server.o
>`test -f 'xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp'
>|| echo '../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff/'`xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -DHAVE_CONFIG_H -I.
>-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
>-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
>   -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -c -o
>../phosphor_softpoweroff-utils.o `test -f '../utils.cpp' || echo
>'../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff/'`../utils.cpp
>../arm-openbmc-linux-gnueabi-libtool  --tag=CXX   --mode=link
>arm-openbmc-linux-gnueabi-g++  -march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17      -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
> -fvisibility-inlines-hidden -Wall -Werror -lsystemd -lsdbusplus
>-lsystemd -lsdeventplus -lsystemd -lphosphor_logging -lsdbusplus
>-lsystemd -lphosphor_dbus -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>-o phosphor-softpoweroff phosphor_softpoweroff-softoff.o
>phosphor_softpoweroff-mainapp.o
>xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-server.o
>../phosphor_softpoweroff-utils.o  -lmapper
>arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
>-march=armv6 -marm -mtune=arm1176jz-s
>--sysroot=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot
>-std=c++17 -O2 -pipe -g -feliminate-unused-debug-types
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1=/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot=
>-fdebug-prefix-map=/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-native=
>-fvisibility-inlines-hidden -Wall -Werror -Wl,-O1 -Wl,--hash-style=gnu
>-Wl,--as-needed -o phosphor-softpoweroff
>phosphor_softpoweroff-softoff.o phosphor_softpoweroff-mainapp.o
>xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-server.o
>../phosphor_softpoweroff-utils.o  -lsdeventplus -lphosphor_logging
>-lsdbusplus -lsystemd -lphosphor_dbus -lmapper
>make[3]: Leaving directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/softoff'
>make[2]: Leaving directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/softoff'
>make[1]: Leaving directory
>'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999'
>DEBUG: Shell function do_compile finished
