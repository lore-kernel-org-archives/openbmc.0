Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="M4eDll3q"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DFbW3pzwzDqhD
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 07:51:03 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id q1so5969233pfi.5
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 12:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6DH/gK+BIZuSQWPHTYBaA2b870dSvv6dBm+mxCZ0fBk=;
 b=M4eDll3quM8U7RffQkTWlV/kHd9mOgrXhRR/sE2LC1exWfiqatbn+3jEu1oAew+2T/
 DIEHlUHCYg7qZ/y117R7a2St8sI5LAnhCalv9xcct9LdtBgVtw0RmScDfKsF7re+/YHz
 +i41vr8sCvOWNiIG4rPbE6XQAEmpea297Cpnl0aE07i4g0nbOX5xfjRL0JDRtptc8OQ+
 WZDevFyvvx5afluZuxyHBazy7qWs2p2P1/9i8HD4zoTcQQEfIXPihZ7N4zASOyi1sZ8b
 JOmkaickdpgEKDmMIoMa67Ci6zEOiWXcHYo7bbonWmIymMgdw/hIoZsF8Yz4zIcCNPYN
 hOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6DH/gK+BIZuSQWPHTYBaA2b870dSvv6dBm+mxCZ0fBk=;
 b=A8qRtmOI0+9SFziy4oXOEQmyEft8b//2oF4NcKaBwytiFEfERCjyD3VTqTWVUIVN8B
 o9D6yIm0urh/dbSVZlM/tluE070W80QorMr5GThiMTj+hxiKIRDimkuMT8Kkn8//CrWt
 NWn3Ex5d9EmllOnbtUEJzdoNHgZC00QcaV4mZjAxP67zVpEcpSvRTnEJ68VatLnCxA/s
 Ain07SbenJXMLGivjrqKhHTQcqFk8lyDfQu55ezhnLoHGFDPVz/zLKHL8y4HxiSr1SzR
 6I6JEVEusr/BGQnHbV2KihFKI85k5S+oeRL7hoiOiCgDeuUqCCDQs1MnlQJRR4uMNw9B
 Uk/g==
X-Gm-Message-State: AA+aEWZjimFHVjm5iNVy5haQ1vsmybLRlklDn5C6fcX8jLi77S3Fow2S
 7VZxEkD7mOyo7zkWnHE6oAQOGqDYVzgSdiXMmgRwTQ==
X-Google-Smtp-Source: AFSGD/VjlSKljpEkoAnfQrfJFK9tPWiZJAZlCwAvw1SGLHDQn64a5TRvk/gQo4mz8t6Z/RStswxhuQ5q5BxlPo/1ePs=
X-Received: by 2002:a63:fc49:: with SMTP id r9mr11824057pgk.209.1544475059803; 
 Mon, 10 Dec 2018 12:50:59 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwGziS7LeKh-g_G6Q-yTj7tmsGjiHMUv6uk5ic8hXxq5A@mail.gmail.com>
 <20181210202422.GI8064@mauery.jf.intel.com>
In-Reply-To: <20181210202422.GI8064@mauery.jf.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Dec 2018 12:50:47 -0800
Message-ID: <CAO=notxhnK9MSpffPh0cAHQhQG3GdXUO5WqoDhJAyXpGhL+w-g@mail.gmail.com>
Subject: Re: PTAL - phosphor-host-ipmid build warnings/errors
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Dec 2018 20:51:05 -0000

On Mon, Dec 10, 2018 at 12:24 PM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> On 10-Dec-2018 11:24 AM, Patrick Venture wrote:
> >I've noticed recently a lot of build warnings since v2.4 on phosphor-hos=
t-ipmid:
> >
> >DEBUG: Executing python function externalsrc_compile_prefunc
> >NOTE: phosphor-ipmi-host: compiling from external source tree
> >/usr/local/google/git/workspaces/rebasing_daemons/gbmc-host-ipmid
>
> I have a patch that removes some of these "notes". They aren't warnings
> because phosphor-host-ipmid builds with -Werror, which would cause it to
> fail if there were actually warnings. But the note messages are
> annoying. Digging into it, it looks like they spawn from an ABI
> difference between gcc 6 and gcc 7+. This is to notify people that are
> building new binaries to run on systems that have libraries built with
> an old gcc that they may not work as expected. Since all of our binaries
> are built with the same compiler, these notes can safely be ignored. For
> now, some of them can be removed with -Wno-psabi .

Thanks. I'm seeing an error at some point, with a couple extra patches
and I think I pointed my finger at the wrong line!

>
> --Vernon
>
> >DEBUG: Python function externalsrc_compile_prefunc finished
> >DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
> >'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> >'common']
> >DEBUG: Executing shell function do_compile
> >NOTE: make -j 12
> >/bin/sh ../../../../../../../../rebasing_daemons/gbmc-host-ipmid/generat=
e_whitelist.sh
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-nati=
ve/usr/share/phosphor-ipmi-host/phosphor-ipmi-fru-whitelist-native.conf
> >/usr/local/google/git/workspaces/rebasing_daemons/gbmc-host-ipmid/host-i=
pmid-whitelist.conf
> >> ipmiwhitelist.cpp
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-nati=
ve/usr/bin/python-native/python
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/sensor_=
gen.py
> >-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/ar=
mv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-n=
ative/usr/share/phosphor-ipmi-host/sensor/sensor.yaml
> >-o . generate-cpp
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-nati=
ve/usr/bin/python-native/python
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/invento=
ry-sensor.py
> >-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/ar=
mv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-n=
ative/usr/share/phosphor-ipmi-host/sensor/invsensor.yaml
> >-o . generate-cpp
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-nati=
ve/usr/bin/python-native/python
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/fru_gen=
.py
> >-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/ar=
mv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-n=
ative/usr/share/phosphor-ipmi-host/config/fru_config.yaml
> >-o . generate-cpp
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-nati=
ve/usr/bin/python-native/python
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/scripts/channel=
_gen.py
> >-i /usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/ar=
mv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-n=
ative/usr/share/phosphor-ipmi-host/sensor/channel.yaml
> >-o . generate-cpp
> >make  all-recursive
> >make[1]: Entering directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999'
> >Making all in .
> >make[2]: Entering directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999'
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o libipmi20_la-net.lo
> >`test -f 'net.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`net.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-apphandler.lo `test -f 'apphandler.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`apphandler.c=
pp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-sys_info_param.lo `test -f 'sys_info_param.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sys_info_par=
am.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-sensorhandler.lo `test -f 'sensorhandler.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sensorhandle=
r.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-storagehandler.lo `test -f 'storagehandler.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`storagehandl=
er.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-chassishandler.lo `test -f 'chassishandler.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`chassishandl=
er.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-dcmihandler.lo `test -f 'dcmihandler.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`dcmihandler.=
cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-ipmisensor.lo `test -f 'ipmisensor.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmisensor.c=
pp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-storageaddsel.lo `test -f 'storageaddsel.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`storageaddse=
l.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-transporthandler.lo `test -f 'transporthandler.cpp' ||
> >echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`transpo=
rthandler.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-globalhandler.lo `test -f 'globalhandler.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`globalhandle=
r.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-groupext.lo `test -f 'groupext.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`groupext.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/apphandler.cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-apphandler.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/transporthandle=
r.cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-transporthandler.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/sys_info_param.=
cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-sys_info_param.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/ipmisensor.cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-ipmisensor.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/dcmihandler.cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-dcmihandler.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/chassishandler.=
cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-chassishandler.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/storagehandler.=
cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-storagehandler.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/sensorhandler.c=
pp
> > -fPIC -DPIC -o .libs/libipmi20_la-sensorhandler.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/storageaddsel.c=
pp
> > -fPIC -DPIC -o .libs/libipmi20_la-storageaddsel.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/globalhandler.c=
pp
> > -fPIC -DPIC -o .libs/libipmi20_la-globalhandler.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/net.cpp
> >-fPIC -DPIC -o .libs/libipmi20_la-net.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/groupext.cpp
> >-fPIC -DPIC -o .libs/libipmi20_la-groupext.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o libipmi20_la-utils.lo
> >`test -f 'utils.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`utils.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/utils.cpp
> >-fPIC -DPIC -o .libs/libipmi20_la-utils.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-selutility.lo `test -f 'selutility.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`selutility.c=
pp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/selutility.cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-selutility.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-ipmi_fru_info_area.lo `test -f 'ipmi_fru_info_area.cpp'
> >|| echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmi=
_fru_info_area.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-read_fru_data.lo `test -f 'read_fru_data.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`read_fru_dat=
a.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/ipmi_fru_info_a=
rea.cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-ipmi_fru_info_area.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-sensordatahandler.lo `test -f 'sensordatahandler.cpp' ||
> >echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sensord=
atahandler.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/read_fru_data.c=
pp
> > -fPIC -DPIC -o .libs/libipmi20_la-read_fru_data.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/sensordatahandl=
er.cpp
> > -fPIC -DPIC -o .libs/libipmi20_la-sensordatahandler.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-sensor-gen.lo `test -f 'sensor-gen.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`sensor-gen.c=
pp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c sensor-gen.cpp  -fPIC
> >-DPIC -o .libs/libipmi20_la-sensor-gen.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-inventory-sensor-gen.lo `test -f
> >'inventory-sensor-gen.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`inventory-se=
nsor-gen.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-fru-read-gen.lo `test -f 'fru-read-gen.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`fru-read-gen=
.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c inventory-sensor-gen.cpp
> >-fPIC -DPIC -o .libs/libipmi20_la-inventory-sensor-gen.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libipmi20_la-channel-gen.lo `test -f 'channel-gen.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`channel-gen.=
cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c fru-read-gen.cpp  -fPIC
> >-DPIC -o .libs/libipmi20_la-fru-read-gen.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c channel-gen.cpp  -fPIC
> >-DPIC -o .libs/libipmi20_la-channel-gen.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
> >-pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >user_channel/libuserlayer_la-user_layer.lo `test -f
> >'user_channel/user_layer.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel=
/user_layer.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
> >-pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >user_channel/libuserlayer_la-user_mgmt.lo `test -f
> >'user_channel/user_mgmt.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel=
/user_mgmt.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
> >-pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >user_channel/libuserlayer_la-passwd_mgr.lo `test -f
> >'user_channel/passwd_mgr.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel=
/passwd_mgr.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
> >-g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp
> > -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-user_mgmt.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
> >-g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_layer.cpp
> > -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-user_layer.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
> >-g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/pa=
sswd_mgr.cpp
> > -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-passwd_mgr.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
> >-pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >user_channel/libuserlayer_la-channel_mgmt.lo `test -f
> >'user_channel/channel_mgmt.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel=
/channel_mgmt.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
> >-g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.cpp
> > -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-channel_mgmt.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid        -O2
> >-pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >user_channel/libuserlayer_la-channel_layer.lo `test -f
> >'user_channel/channel_layer.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel=
/channel_layer.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB     -flto -O2 -pipe -g
> >-feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libsysintfcmds_la-systemintfcmds.lo `test -f 'systemintfcmds.cpp' ||
> >echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`systemi=
ntfcmds.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid -O2 -pipe
> >-g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_layer.cpp
> > -fPIC -DPIC -o user_channel/.libs/libuserlayer_la-channel_layer.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/systemintfcmds.=
cpp
> > -fPIC -DPIC -o .libs/libsysintfcmds_la-systemintfcmds.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB     -flto -O2 -pipe -g
> >-feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >libsysintfcmds_la-host-interface.lo `test -f 'host-interface.cpp' ||
> >echo '../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`host-in=
terface.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/host-interface.=
cpp
> > -fPIC -DPIC -o .libs/libsysintfcmds_la-host-interface.o
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-ipmid.o `test
> >-f 'ipmid.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmid.cpp
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-settings.o
> >`test -f 'settings.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`settings.cpp
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >ipmid-host-cmd-manager.o `test -f 'host-cmd-manager.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`host-cmd-man=
ager.cpp
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-utils.o `test
> >-f 'utils.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`utils.cpp
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-oemrouter.o
> >`test -f 'oemrouter.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`oemrouter.cp=
p
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o ipmid-ipmiwhitelist.o
> >`test -f 'ipmiwhitelist.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`ipmiwhitelis=
t.cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >app/libipmi20_la-channel.lo `test -f 'app/channel.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`app/channel.=
cpp
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >app/libipmi20_la-watchdog.lo `test -f 'app/watchdog.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`app/watchdog=
.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/app/watchdog.cp=
p
> > -fPIC -DPIC -o app/.libs/libipmi20_la-watchdog.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >app/libipmi20_la-watchdog_service.lo `test -f
> >'app/watchdog_service.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`app/watchdog=
_service.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/app/channel.cpp
> > -fPIC -DPIC -o app/.libs/libipmi20_la-channel.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >user_channel/libipmi20_la-usercommands.lo `test -f
> >'user_channel/usercommands.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel=
/usercommands.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/app/watchdog_se=
rvice.cpp
> > -fPIC -DPIC -o app/.libs/libipmi20_la-watchdog_service.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dcompile
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >user_channel/libipmi20_la-channelcommands.lo `test -f
> >'user_channel/channelcommands.cpp' || echo
> >'../../../../../../../../rebasing_daemons/gbmc-host-ipmid/'`user_channel=
/channelcommands.cpp
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
ercommands.cpp
> > -fPIC -DPIC -o user_channel/.libs/libipmi20_la-usercommands.o
> >arm-openbmc-linux-gnueabi-libtool: compile:
> >arm-openbmc-linux-gnueabi-g++ -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -c
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annelcommands.cpp
> > -fPIC -DPIC -o user_channel/.libs/libipmi20_la-channelcommands.o
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17  -DBOOST_ERROR_CODE_HEADER_ONLY
> >-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB     -flto -O2 -pipe -g
> >-feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -lsystemd  -lphosphor_dbus
> >-lphosphor_logging -lsdbusplus -lsystemd -lsdbusplus -lsystemd
> >-version-info 0:0:0 -shared -Wl,-O1 -Wl,--hash-style=3Dgnu
> >-Wl,--as-needed -o libsysintfcmds.la -rpath /usr/lib/ipmid-providers
> >libsysintfcmds_la-systemintfcmds.lo
> >libsysintfcmds_la-host-interface.lo  -lmapper
> >arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> > -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17  -fPIC -DPIC -shared -nostdlib
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/crti.o
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/arm-openbmc-linux-gnueabi/7.3.0/crtbeginS.o
> > .libs/libsysintfcmds_la-systemintfcmds.o
> >.libs/libsysintfcmds_la-host-interface.o   -lphosphor_dbus
> >-lphosphor_logging -lsdbusplus -lsystemd -lmapper
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/=
gcc/arm-openbmc-linux-gnueabi/7.3.0
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/=
gcc
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/li=
b
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r/lib/arm-openbmc-linux-gnueabi/7.3.0
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r/lib
> >-lstdc++ -lm -lc -lgcc_s
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/arm-openbmc-linux-gnueabi/7.3.0/crtendS.o
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/crtn.o
> > -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-flto -O2 -g -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> >-Wl,-soname -Wl,libsysintfcmds.so.0 -o .libs/libsysintfcmds.so.0.0.0
> >arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
> >"libsysintfcmds.so.0" && ln -s "libsysintfcmds.so.0.0.0"
> >"libsysintfcmds.so.0")
> >arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
> >"libsysintfcmds.so" && ln -s "libsysintfcmds.so.0.0.0"
> >"libsysintfcmds.so")
> >arm-openbmc-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
> >"libsysintfcmds.la" && ln -s "../libsysintfcmds.la"
> >"libsysintfcmds.la" )
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -lsystemd  -ldl
> >-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r//lib
> >-lcrypto -lstdc++fs -pthread -export-dynamic -Wl,-O1
> >-Wl,--hash-style=3Dgnu -Wl,--as-needed -o ipmid ipmid-ipmid.o
> >ipmid-settings.o ipmid-host-cmd-manager.o ipmid-utils.o
> >ipmid-oemrouter.o ipmid-ipmiwhitelist.o  -lmapper
> >arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> >-march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED
> >-DBOOST_ALL_NO_LIB -flto -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -pthread -Wl,-O1
> >-Wl,--hash-style=3Dgnu -Wl,--as-needed -o ipmid ipmid-ipmid.o
> >ipmid-settings.o ipmid-host-cmd-manager.o ipmid-utils.o
> >ipmid-oemrouter.o ipmid-ipmiwhitelist.o -Wl,--export-dynamic  -ldl
> >-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r//lib
> >-lcrypto -lstdc++fs -lmapper -pthread
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/map:60:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_month.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_ymd.hpp:16,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_calendar.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/gregorian_types.hpp:19,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_config.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_system.hpp:13,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/ptime.hpp:12,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.hpp:20,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.cpp:17:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:
> >In member function 'std::pair<std::_Rb_tree_node_base*,
> >std::_Rb_tree_node_base*> std::_Rb_tree<_Key, _Val, _KeyOfValue,
> >_Compare, _Alloc>::_M_get_insert_hint_unique_pos(std::_Rb_tree<_Key,
> >_Val, _KeyOfValue, _Compare, _Alloc>::const_iterator, const key_type&)
> >[with _Key =3D std::__cxx11::basic_string<char>; _Val =3D std::pair<cons=
t
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
> >_KeyOfValue =3D std::_Select1st<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
> >=3D std::less<void>; _Alloc =3D std::allocator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:2130:5:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >     _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
> >     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:
> >In function 'std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
> >_Alloc>::iterator std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
> >_Alloc>::_M_emplace_hint_unique(std::_Rb_tree<_Key, _Val, _KeyOfValue,
> >_Compare, _Alloc>::const_iterator, _Args&& ...) [with _Args =3D {const
> >std::piecewise_construct_t&, std::tuple<const
> >std::__cxx11::basic_string<char, std::char_traits<char>,
> >std::allocator<char> >&>, std::tuple<>}; _Key =3D
> >std::__cxx11::basic_string<char>; _Val =3D std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
> >_KeyOfValue =3D std::_Select1st<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
> >=3D std::less<void>; _Alloc =3D std::allocator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:2395:7:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >       _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
> >       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/map:61:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_month.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_ymd.hpp:16,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_calendar.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/gregorian_types.hpp:19,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_config.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_system.hpp:13,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/ptime.hpp:12,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.hpp:20,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.cpp:17:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:
> >In member function 'std::map<_Key, _Tp, _Compare,
> >_Alloc>::mapped_type& std::map<_Key, _Tp, _Compare,
> >_Alloc>::operator[](const key_type&) [with _Key =3D
> >std::__cxx11::basic_string<char>; _Tp =3D nlohmann::basic_json<>;
> >_Compare =3D std::less<void>; _Alloc =3D std::allocator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:493:4:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >    __i =3D _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
> >    ^~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:
> >In member function 'nlohmann::basic_json<ObjectType, ArrayType,
> >StringType, BooleanType, NumberIntegerType, NumberUnsignedType,
> >NumberFloatType, AllocatorType, JSONSerializer>::value_type&
> >nlohmann::basic_json<ObjectType, ArrayType, StringType, BooleanType,
> >NumberIntegerType, NumberUnsignedType, NumberFloatType, AllocatorType,
> >JSONSerializer>::operator[](const typename
> >nlohmann::basic_json<ObjectType, ArrayType, StringType, BooleanType,
> >NumberIntegerType, NumberUnsignedType, NumberFloatType, AllocatorType,
> >JSONSerializer>::object_t::key_type&) [with ObjectType =3D std::map;
> >ArrayType =3D std::vector; StringType =3D
> >std::__cxx11::basic_string<char>; BooleanType =3D bool;
> >NumberIntegerType =3D long long int; NumberUnsignedType =3D long long
> >unsigned int; NumberFloatType =3D double; AllocatorType =3D
> >std::allocator; JSONSerializer =3D nlohmann::adl_serializer]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:493:4:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >    __i =3D _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
> >    ^~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/vector:69:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/functional:61,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/detail/shared_count.hpp:38,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/shared_ptr.hpp:28,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/shared_ptr.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/microsec_time_clock.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.hpp:20,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.cpp:17:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
> >...) [with _Args =3D {nlohmann::detail::value_t}; _Tp =3D
> >nlohmann::basic_json<>; _Alloc =3D std::allocator<nlohmann::basic_json<>
> >>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >       vector<_Tp, _Alloc>::
> >       ^~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'std::vector<_Tp, _Alloc>::reference
> >std::vector<_Tp, _Alloc>::emplace_back(_Args&& ...) [with _Args =3D
> >{nlohmann::detail::value_t}; _Tp =3D nlohmann::basic_json<>; _Alloc =3D
> >std::allocator<nlohmann::basic_json<> >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:105:21:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
> >    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
> >...) [with _Args =3D {std::nullptr_t}; _Tp =3D nlohmann::basic_json<>;
> >_Alloc =3D std::allocator<nlohmann::basic_json<> >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >       vector<_Tp, _Alloc>::
> >       ^~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
> >...) [with _Args =3D {std::__cxx11::basic_string<char,
> >std::char_traits<char>, std::allocator<char> >&}; _Tp =3D
> >nlohmann::basic_json<>; _Alloc =3D std::allocator<nlohmann::basic_json<>
> >>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'bool
> >nlohmann::detail::parser<BasicJsonType>::sax_parse_internal(SAX*)
> >[with SAX =3D nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json=
<>
> >>; BasicJsonType =3D nlohmann::basic_json<>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:105:21:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
> >    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:105:21:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
> >    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/map:61:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_month.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_ymd.hpp:16,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_calendar.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/gregorian_types.hpp:19,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_config.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_system.hpp:13,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/ptime.hpp:12,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.hpp:20,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/ch=
annel_mgmt.cpp:17:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:
> >In member function 'bool
> >nlohmann::detail::json_sax_dom_callback_parser<BasicJsonType>::key(nlohm=
ann::detail::json_sax_dom_callback_parser<BasicJsonType>::string_t&)
> >[with BasicJsonType =3D nlohmann::basic_json<>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:493:4:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >    __i =3D _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
> >    ^~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/map:60:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_month.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_ymd.hpp:16,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_calendar.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/gregorian_types.hpp:19,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_config.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_system.hpp:13,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/ptime.hpp:12,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:
> >In member function 'std::pair<std::_Rb_tree_node_base*,
> >std::_Rb_tree_node_base*> std::_Rb_tree<_Key, _Val, _KeyOfValue,
> >_Compare, _Alloc>::_M_get_insert_hint_unique_pos(std::_Rb_tree<_Key,
> >_Val, _KeyOfValue, _Compare, _Alloc>::const_iterator, const key_type&)
> >[with _Key =3D std::__cxx11::basic_string<char>; _Val =3D std::pair<cons=
t
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
> >_KeyOfValue =3D std::_Select1st<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
> >=3D std::less<void>; _Alloc =3D std::allocator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:2130:5:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >     _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
> >     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:
> >In function 'std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
> >_Alloc>::iterator std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare,
> >_Alloc>::_M_emplace_hint_unique(std::_Rb_tree<_Key, _Val, _KeyOfValue,
> >_Compare, _Alloc>::const_iterator, _Args&& ...) [with _Args =3D {const
> >std::piecewise_construct_t&, std::tuple<const
> >std::__cxx11::basic_string<char, std::char_traits<char>,
> >std::allocator<char> >&>, std::tuple<>}; _Key =3D
> >std::__cxx11::basic_string<char>; _Val =3D std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >;
> >_KeyOfValue =3D std::_Select1st<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >; _Compare
> >=3D std::less<void>; _Alloc =3D std::allocator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:2395:7:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >       _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
> >       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/map:61:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_month.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_ymd.hpp:16,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_calendar.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/gregorian_types.hpp:19,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_config.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_system.hpp:13,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/ptime.hpp:12,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:
> >In member function 'std::map<_Key, _Tp, _Compare,
> >_Alloc>::mapped_type& std::map<_Key, _Tp, _Compare,
> >_Alloc>::operator[](const key_type&) [with _Key =3D
> >std::__cxx11::basic_string<char>; _Tp =3D nlohmann::basic_json<>;
> >_Compare =3D std::less<void>; _Alloc =3D std::allocator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:493:4:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >    __i =3D _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
> >    ^~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/vector:69:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/functional:61,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/detail/shared_count.hpp:38,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/shared_ptr.hpp:28,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/shared_ptr.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/microsec_time_clock.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
> >...) [with _Args =3D {nlohmann::detail::value_t}; _Tp =3D
> >nlohmann::basic_json<>; _Alloc =3D std::allocator<nlohmann::basic_json<>
> >>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >       vector<_Tp, _Alloc>::
> >       ^~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'std::vector<_Tp, _Alloc>::reference
> >std::vector<_Tp, _Alloc>::emplace_back(_Args&& ...) [with _Args =3D
> >{nlohmann::detail::value_t}; _Tp =3D nlohmann::basic_json<>; _Alloc =3D
> >std::allocator<nlohmann::basic_json<> >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:105:21:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
> >    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
> >...) [with _Args =3D {std::nullptr_t}; _Tp =3D nlohmann::basic_json<>;
> >_Alloc =3D std::allocator<nlohmann::basic_json<> >]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >       vector<_Tp, _Alloc>::
> >       ^~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
> >...) [with _Args =3D {std::__cxx11::basic_string<char,
> >std::char_traits<char>, std::allocator<char> >&}; _Tp =3D
> >nlohmann::basic_json<>; _Alloc =3D std::allocator<nlohmann::basic_json<>
> >>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'bool
> >nlohmann::detail::parser<BasicJsonType>::sax_parse_internal(SAX*)
> >[with SAX =3D nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json=
<>
> >>; BasicJsonType =3D nlohmann::basic_json<>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:105:21:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
> >    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:105:21:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
> >    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/map:61:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_month.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_ymd.hpp:16,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/greg_calendar.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/gregorian/gregorian_types.hpp:19,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_config.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/posix_time_system.hpp:13,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/posix_time/ptime.hpp:12,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:32,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:
> >In member function 'bool
> >nlohmann::detail::json_sax_dom_callback_parser<BasicJsonType>::key(nlohm=
ann::detail::json_sax_dom_callback_parser<BasicJsonType>::string_t&)
> >[with BasicJsonType =3D nlohmann::basic_json<>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:493:4:
> >note: parameter passing for argument of type
> >'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> >,
> >std::_Select1st<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > >, std::less<void>,
> >std::allocator<std::pair<const std::__cxx11::basic_string<char>,
> >nlohmann::basic_json<> > > >::const_iterator {aka
> >std::_Rb_tree_const_iterator<std::pair<const
> >std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed
> >in GCC 7.1
> >    __i =3D _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
> >    ^~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/vector:69:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/functional:61,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/detail/shared_count.hpp:38,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/shared_ptr.hpp:28,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/shared_ptr.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/microsec_time_clock.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_realloc_insert(std::vector<_Tp, _Alloc>::iterator, _Args&&
> >...) [with _Args =3D {const nlohmann::basic_json<std::map, std::vector,
> >std::__cxx11::basic_string<char, std::char_traits<char>,
> >std::allocator<char> >, bool, long long int, long long unsigned int,
> >double, std::allocator, nlohmann::adl_serializer>&}; _Tp =3D
> >nlohmann::basic_json<>; _Alloc =3D std::allocator<nlohmann::basic_json<>
> >>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:394:7:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >       vector<_Tp, _Alloc>::
> >       ^~~~~~~~~~~~~~~~~~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/vector:64:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/functional:61,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/detail/shared_count.hpp:38,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/shared_ptr.hpp:28,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/shared_ptr.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/microsec_time_clock.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_vector.h:
> >In member function 'void ipmi::UserAccess::writeUserData()':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_vector.h:948:21:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >    _M_realloc_insert(end(), __x);
> >    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/vector:69:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/functional:61,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/detail/shared_count.hpp:38,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/shared_ptr.hpp:28,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/shared_ptr.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/microsec_time_clock.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:
> >In member function 'void std::vector<_Tp,
> >_Alloc>::_M_fill_insert(std::vector<_Tp, _Alloc>::iterator,
> >std::vector<_Tp, _Alloc>::size_type, const value_type&) [with _Tp =3D
> >nlohmann::basic_json<>; _Alloc =3D std::allocator<nlohmann::basic_json<>
> >>]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/vector.tcc:458:5:
> >note: parameter passing for argument of type
> >'std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > >::iterator {aka
> >__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
> >     vector<_Tp, _Alloc>::
> >     ^~~~~~~~~~~~~~~~~~~
> >In file included from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/vector:64:0,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/functional:61,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/detail/shared_count.hpp:38,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/smart_ptr/shared_ptr.hpp:28,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/shared_ptr.hpp:17,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/date_time/microsec_time_clock.hpp:18,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/posix_time_types_wrk.hpp:31,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/detail/os_thread_functions.hpp:36,
> >                 from
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/boost/interprocess/sync/file_lock.hpp:26,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.hpp:21,
> >                 from
> >../../../../../../../../rebasing_daemons/gbmc-host-ipmid/user_channel/us=
er_mgmt.cpp:16:
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_vector.h:
> >In member function 'void ipmi::UserAccess::readUserData()':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_vector.h:1087:16:
> >note: parameter passing for argument of type
> >'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,
> >std::vector<nlohmann::basic_json<>,
> >std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
> >  _M_fill_insert(begin() + __offset, __n, __x);
> >  ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17     -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -lsystemd
> >-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r//lib
> >-lcrypto -lpam_misc -lssl -version-info 0:0:0 -shared -Wl,-O1
> >-Wl,--hash-style=3Dgnu -Wl,--as-needed -o libuserlayer.la -rpath
> >/usr/lib user_channel/libuserlayer_la-user_layer.lo
> >user_channel/libuserlayer_la-user_mgmt.lo
> >user_channel/libuserlayer_la-passwd_mgr.lo
> >user_channel/libuserlayer_la-channel_mgmt.lo
> >user_channel/libuserlayer_la-channel_layer.lo  -lmapper
> >arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> > -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17  -fPIC -DPIC -shared -nostdlib
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/crti.o
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/arm-openbmc-linux-gnueabi/7.3.0/crtbeginS.o
> > user_channel/.libs/libuserlayer_la-user_layer.o
> >user_channel/.libs/libuserlayer_la-user_mgmt.o
> >user_channel/.libs/libuserlayer_la-passwd_mgr.o
> >user_channel/.libs/libuserlayer_la-channel_mgmt.o
> >user_channel/.libs/libuserlayer_la-channel_layer.o
> >-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r//lib
> >-lcrypto -lpam_misc -lssl -lmapper
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/=
gcc/arm-openbmc-linux-gnueabi/7.3.0
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/=
gcc
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/li=
b
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r/lib/arm-openbmc-linux-gnueabi/7.3.0
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r/lib
> >-lstdc++ -lm -lc -lgcc_s
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/arm-openbmc-linux-gnueabi/7.3.0/crtendS.o
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/crtn.o
> > -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-O2 -g -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname
> >-Wl,libuserlayer.so.0 -o .libs/libuserlayer.so.0.0.0
> >arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
> >"libuserlayer.so.0" && ln -s "libuserlayer.so.0.0.0"
> >"libuserlayer.so.0")
> >arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
> >"libuserlayer.so" && ln -s "libuserlayer.so.0.0.0" "libuserlayer.so")
> >arm-openbmc-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
> >"libuserlayer.la" && ln -s "../libuserlayer.la" "libuserlayer.la" )
> >./arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17   -DBOOST_ERROR_CODE_HEADER_ONLY
> >-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ALL_NO_LIB   -flto -O2 -pipe -g
> >-feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -lsystemd
> >-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
> >-luserlayer -version-info 0:0:0 -shared -Wl,-O1 -Wl,--hash-style=3Dgnu
> >-Wl,--as-needed -o libipmi20.la -rpath /usr/lib/ipmid-providers
> >libipmi20_la-net.lo app/libipmi20_la-channel.lo
> >app/libipmi20_la-watchdog.lo app/libipmi20_la-watchdog_service.lo
> >libipmi20_la-apphandler.lo libipmi20_la-sys_info_param.lo
> >libipmi20_la-sensorhandler.lo libipmi20_la-storagehandler.lo
> >libipmi20_la-chassishandler.lo libipmi20_la-dcmihandler.lo
> >libipmi20_la-ipmisensor.lo libipmi20_la-storageaddsel.lo
> >libipmi20_la-transporthandler.lo libipmi20_la-globalhandler.lo
> >libipmi20_la-groupext.lo libipmi20_la-utils.lo
> >libipmi20_la-selutility.lo libipmi20_la-ipmi_fru_info_area.lo
> >libipmi20_la-read_fru_data.lo libipmi20_la-sensordatahandler.lo
> >user_channel/libipmi20_la-usercommands.lo
> >user_channel/libipmi20_la-channelcommands.lo
> >libipmi20_la-sensor-gen.lo libipmi20_la-inventory-sensor-gen.lo
> >libipmi20_la-fru-read-gen.lo libipmi20_la-channel-gen.lo  -lmapper
> >arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> > -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17  -fPIC -DPIC -shared -nostdlib
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/crti.o
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/arm-openbmc-linux-gnueabi/7.3.0/crtbeginS.o
> > .libs/libipmi20_la-net.o app/.libs/libipmi20_la-channel.o
> >app/.libs/libipmi20_la-watchdog.o
> >app/.libs/libipmi20_la-watchdog_service.o
> >.libs/libipmi20_la-apphandler.o .libs/libipmi20_la-sys_info_param.o
> >.libs/libipmi20_la-sensorhandler.o .libs/libipmi20_la-storagehandler.o
> >.libs/libipmi20_la-chassishandler.o .libs/libipmi20_la-dcmihandler.o
> >.libs/libipmi20_la-ipmisensor.o .libs/libipmi20_la-storageaddsel.o
> >.libs/libipmi20_la-transporthandler.o
> >.libs/libipmi20_la-globalhandler.o .libs/libipmi20_la-groupext.o
> >.libs/libipmi20_la-utils.o .libs/libipmi20_la-selutility.o
> >.libs/libipmi20_la-ipmi_fru_info_area.o
> >.libs/libipmi20_la-read_fru_data.o
> >.libs/libipmi20_la-sensordatahandler.o
> >user_channel/.libs/libipmi20_la-usercommands.o
> >user_channel/.libs/libipmi20_la-channelcommands.o
> >.libs/libipmi20_la-sensor-gen.o
> >.libs/libipmi20_la-inventory-sensor-gen.o
> >.libs/libipmi20_la-fru-read-gen.o .libs/libipmi20_la-channel-gen.o
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-=
1.0+git999/.libs/libuserlayer.so
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r//lib
> >-lphosphor_logging -lsdbusplus -lsystemd -lphosphor_dbus -lstdc++fs
> >-lcrypto -lpam_misc -lssl -lmapper
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/=
gcc/arm-openbmc-linux-gnueabi/7.3.0
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/../../lib/arm-openbmc-linux-gnueabi/=
gcc
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/li=
b
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r/lib/arm-openbmc-linux-gnueabi/7.3.0
> >-L/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/arm=
v6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/us=
r/lib
> >-lstdc++ -lm -lc -lgcc_s
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/arm-openbmc-linux-gnueabi/7.3.0/crtendS.o
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
lib/crtn.o
> > -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-flto -O2 -g -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> >-Wl,-soname -Wl,libipmi20.so.0 -o .libs/libipmi20.so.0.0.0
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:
> >In member function
> >'_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4p=
airIKS5_N8nlohmann10basic_jsonISt3mapSt6vectorS5_bxydSaNS8_14adl_serializer=
EEEESt10_Select1stISE_ESt4lessIvESaISE_EE22_M_emplace_hint_uniqueIJRKSt21pi=
ecewise_construct_tSt5tupleIJRS7_EESP_IJEEEEESt17_Rb_tree_iteratorISE_ESt23=
_Rb_tree_const_iteratorISE_EDpOT_.isra.488':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_tree.h:2395:7:
> >note: parameter passing for argument of type 'struct const_iterator'
> >changed in GCC 7.1
> >       _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
> >       ^
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:
> >In member function 'operator[]':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:493:4:
> >note: parameter passing for argument of type 'struct const_iterator'
> >changed in GCC 7.1
> >    __i =3D _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
> >    ^
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:
> >In member function 'key':
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot/usr/=
include/c++/7.3.0/bits/stl_map.h:493:4:
> >note: parameter passing for argument of type 'struct const_iterator'
> >changed in GCC 7.1
> >    __i =3D _M_t._M_emplace_hint_unique(__i, std::piecewise_construct,
> >    ^
> >arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
> >"libipmi20.so.0" && ln -s "libipmi20.so.0.0.0" "libipmi20.so.0")
> >arm-openbmc-linux-gnueabi-libtool: link: (cd ".libs" && rm -f
> >"libipmi20.so" && ln -s "libipmi20.so.0.0.0" "libipmi20.so")
> >arm-openbmc-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f
> >"libipmi20.la" && ln -s "../libipmi20.la" "libipmi20.la" )
> >make[2]: Leaving directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999'
> >Making all in test
> >make[2]: Entering directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999/test'
> >make[2]: Nothing to be done for 'all'.
> >make[2]: Leaving directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999/test'
> >Making all in softoff
> >make[2]: Entering directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999/softoff'
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-nati=
ve/usr/bin/sdbus++
> >-r ../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >interface server-cpp xyz.openbmc_project.Ipmi.Internal.SoftPowerOff >
> >xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp
> >/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-sysroot-nati=
ve/usr/bin/sdbus++
> >-r ../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >interface server-header xyz.openbmc_project.Ipmi.Internal.SoftPowerOff
> >> xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.hpp
> >make  all-am
> >make[3]: Entering directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999/softoff'
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
> >-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >   -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >phosphor_softpoweroff-softoff.o `test -f 'softoff.cpp' || echo
> >'../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff/'`s=
oftoff.cpp
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
> >-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >   -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >phosphor_softpoweroff-mainapp.o `test -f 'mainapp.cpp' || echo
> >'../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff/'`m=
ainapp.cpp
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
> >-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >   -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-ser=
ver.o
> >`test -f 'xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp'
> >|| echo '../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/sof=
toff/'`xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/server.cpp
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -DHAVE_CONFIG_H -I.
> >-I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff
> >-I..  -I../../../../../../../../../rebasing_daemons/gbmc-host-ipmid
> >   -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -c -o
> >../phosphor_softpoweroff-utils.o `test -f '../utils.cpp' || echo
> >'../../../../../../../../../rebasing_daemons/gbmc-host-ipmid/softoff/'`.=
./utils.cpp
> >../arm-openbmc-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dlink
> >arm-openbmc-linux-gnueabi-g++  -march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17      -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> > -fvisibility-inlines-hidden -Wall -Werror -lsystemd -lsdbusplus
> >-lsystemd -lsdeventplus -lsystemd -lphosphor_logging -lsdbusplus
> >-lsystemd -lphosphor_dbus -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> >-o phosphor-softpoweroff phosphor_softpoweroff-softoff.o
> >phosphor_softpoweroff-mainapp.o
> >xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-ser=
ver.o
> >../phosphor_softpoweroff-utils.o  -lmapper
> >arm-openbmc-linux-gnueabi-libtool: link: arm-openbmc-linux-gnueabi-g++
> >-march=3Darmv6 -marm -mtune=3Darm1176jz-s
> >--sysroot=3D/usr/local/google/git/workspaces/building_24_rebase/build/tm=
p/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/recipe-=
sysroot
> >-std=3Dc++17 -O2 -pipe -g -feliminate-unused-debug-types
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1=3D/usr/src/debug/phosphor-ipmi-host/1.0+git999-r1
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot=3D
> >-fdebug-prefix-map=3D/usr/local/google/git/workspaces/building_24_rebase=
/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r=
1/recipe-sysroot-native=3D
> >-fvisibility-inlines-hidden -Wall -Werror -Wl,-O1 -Wl,--hash-style=3Dgnu
> >-Wl,--as-needed -o phosphor-softpoweroff
> >phosphor_softpoweroff-softoff.o phosphor_softpoweroff-mainapp.o
> >xyz/openbmc_project/Ipmi/Internal/SoftPowerOff/phosphor_softpoweroff-ser=
ver.o
> >../phosphor_softpoweroff-utils.o  -lsdeventplus -lphosphor_logging
> >-lsdbusplus -lsystemd -lphosphor_dbus -lmapper
> >make[3]: Leaving directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999/softoff'
> >make[2]: Leaving directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999/softoff'
> >make[1]: Leaving directory
> >'/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv=
6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host=
-1.0+git999'
> >DEBUG: Shell function do_compile finished
