Return-Path: <Lakesh.Sharma@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=lakesh.sharma@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="BsgviRFb"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sFrb3vx8zF1Pr
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 02:55:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1527180656; x=1558716656;
 h=from:to:subject:date:message-id:mime-version;
 bh=xaqg/Anek1rZFkkR/TaAW6PKe9RVyTv2OpJTTJIf0Uc=;
 b=BsgviRFb1zu/FHmbXmS9HVk08Sv90sK62RakZnUXN8ja25gkZ6evh7Js
 Bt9dBn61c4/ItR2Sf0U5I23s7vMr4tSqe78ynXvbbd+eIkyxZ3PX0wMZI
 UgLI/2gS18VDvuqiXSCcCTJCNBTW5hHk42RtmVje5qc/6cObk0RKVi7aI A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FnAQAM7gZbmMqZ6ERcHAEBAQQBAQoBA?=
 =?us-ascii?q?YJOgUoCDH0oCotxjGc0glSSVGWBPRckCyUJg3iCVCE0GAECAQEBAQEBAgEBAhA?=
 =?us-ascii?q?BAQEBAQgLCwYoIwyCNSINBEsqMgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBCQINDjBZXgGBJgEEG4MaAoEbZA+tY4hDgXyINoELgQiBD4YHFwQBhzE?=
 =?us-ascii?q?ChzyEbYEig1WHPwcChWqIaIFCPoMxh1yJZocbgUGCC3CDEwmCJYgnO4U+bwEBA?=
 =?us-ascii?q?QEIjQ+BGAEB?=
X-IPAS-Result: =?us-ascii?q?A2FnAQAM7gZbmMqZ6ERcHAEBAQQBAQoBAYJOgUoCDH0oCot?=
 =?us-ascii?q?xjGc0glSSVGWBPRckCyUJg3iCVCE0GAECAQEBAQEBAgEBAhABAQEBAQgLCwYoI?=
 =?us-ascii?q?wyCNSINBEsqMgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBCQINDjB?=
 =?us-ascii?q?ZXgGBJgEEG4MaAoEbZA+tY4hDgXyINoELgQiBD4YHFwQBhzEChzyEbYEig1WHP?=
 =?us-ascii?q?wcChWqIaIFCPoMxh1yJZocbgUGCC3CDEwmCJYgnO4U+bwEBAQEIjQ+BGAEB?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2018 11:50:52 -0500
From: <Lakesh.Sharma@dell.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2018 22:54:16 +0600
X-LoopCount0: from 10.166.132.71
X-IronPort-AV: E=Sophos;i="5.49,436,1520917200"; 
 d="scan'208,217";a="1159055021"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: openbmc build err "internal compiler error'
Thread-Topic: openbmc build err "internal compiler error'
Thread-Index: AdPzf/BfFD8XbX/RS/y0bRg59wQL0Q==
Date: Thu, 24 May 2018 16:55:53 +0000
Message-ID: <90852837c20b4169a7d4d66efaca7399@ausx13mpc109.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_90852837c20b4169a7d4d66efaca7399ausx13mpc109AMERDELLCOM_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2018 16:56:01 -0000

--_000_90852837c20b4169a7d4d66efaca7399ausx13mpc109AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am seeing following build err.
"arm-openbmc-linux-gnueabi-g++: internal compiler error: Killed (program cc=
1plus)"
More logs shown below.
I am using Ubuntu 14.04 based VM. Could it be an issue, do I have to use ac=
tual stand-alone linux host.

Steps followed:
export TEMPLATECONF=3Dmeta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-e=
vb-ast2500/conf
. openbmc-env
bitbake obmc-phosphor-imag


Build err log:

NOTE: Executing RunQueue Tasks
WARNING: nspr-native-4.16-r0 do_fetch: Failed to fetch URL http://ftp.mozil=
la.org/pub/nspr/releases/v4.16/src/nspr-4.16.tar.gz, attempting MIRRORS if =
available
WARNING: nss-native-3.31.1-r0 do_fetch: Failed to fetch URL http://ftp.mozi=
lla.org/pub/mozilla.org/security/nss/releases/NSS_3_31_1_RTM/src/nss-3.31.1=
.tar.gz, attempting MIRRORS if available
WARNING: shadow-4.2.1-r0 do_fetch: Failed to fetch URL http://pkg-shadow.al=
ioth.debian.org/releases/shadow-4.2.1.tar.xz, attempting MIRRORS if availab=
le
WARNING: libpng-native-1.6.31-r0 do_fetch: Failed to fetch URL http://downl=
oads.sourceforge.net/project/libpng/libpng16/1.6.31/libpng-1.6.31.tar.xz, a=
ttempting MIRRORS if available
WARNING: coreutils-8.27-r0 do_fetch: Failed to fetch URL http://distfiles.g=
entoo.org/distfiles/coreutils-8.27-man.tar.xz;name=3Dmanpages, attempting M=
IRRORS if available
ERROR: phosphor-ipmi-host-1.0-r1 do_compile: oe_runmake failed
ERROR: phosphor-ipmi-host-1.0-r1 do_compile: Function failed: do_compile (l=
og file is located at /home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/=
armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/temp/log.do_compile.1=
444)
ERROR: Logfile of failure stored in: /home/lsharma/open_bmc_evb/ws/openbmc/=
build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/temp/l=
og.do_compile.1444
Log data follows:

....

| arm-openbmc-linux-gnueabi-libtool: compile:  arm-openbmc-linux-gnueabi-g+=
+ -march=3Darmv6 -marm -mtune=3Darm1176jz-s --sysroot=3D/home/lsharma/open_=
bmc_evb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi=
-host/1.0-r1/recipe-sysroot -DHAVE_CONFIG_H -I. -I../git -O2 -pipe -g -feli=
minate-unused-debug-types -fdebug-prefix-map=3D/home/lsharma/open_bmc_evb/w=
s/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0=
-r1=3D/usr/src/debug/phosphor-ipmi-host/1.0-r1 -fdebug-prefix-map=3D/home/l=
sharma/open_bmc_evb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/p=
hosphor-ipmi-host/1.0-r1/recipe-sysroot-native=3D -fdebug-prefix-map=3D/hom=
e/lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueab=
i/phosphor-ipmi-host/1.0-r1/recipe-sysroot=3D -fvisibility-inlines-hidden -=
Wall -Werror -c sensor-gen.cpp  -fPIC -DPIC -o .libs/libapphandler_la-senso=
r-gen.o
| arm-openbmc-linux-gnueabi-g++: internal compiler error: Killed (program c=
c1plus)
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <https://gcc.gnu.org/bugs/> for instructions.
| make[2]: *** [libapphandler_la-sensor-gen.lo] Error 1
| make[2]: Leaving directory `/home/lsharma/open_bmc_evb/ws/openbmc/build/t=
mp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/build'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/lsharma/open_bmc_evb/ws/openbmc/build/t=
mp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/lsharma/=
open_bmc_evb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor=
-ipmi-host/1.0-r1/temp/log.do_compile.1444)
ERROR: Task (/home/lsharma/open_bmc_evb/ws/openbmc/meta-phosphor/common/rec=
ipes-phosphor/ipmi/phosphor-ipmi-host.bb:do_compile) failed with exit code =
'1'
NOTE: Tasks Summary: Attempted 2071 tasks of which 6 didn't need to be reru=
n and 1 failed.

Summary: 1 task failed:
  /home/lsharma/open_bmc_evb/ws/openbmc/meta-phosphor/common/recipes-phosph=
or/ipmi/phosphor-ipmi-host.bb:do_compile
Summary: There were 5 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.




Log file openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-h=
ost/1.0-r1/temp/log.do_compile.1444 shows following err.

arm-openbmc-linux-gnueabi-g++: internal compiler error: Killed (program cc1=
plus)
Please submit a full bug report,
with preprocessed source if appropriate.
See <https://gcc.gnu.org/bugs/> for instructions.
make[2]: *** [libapphandler_la-sensor-gen.lo] Error 1
make[2]: Leaving directory `/home/lsharma/open_bmc_evb/ws/openbmc/build/tmp=
/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/build'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/lsharma/open_bmc_evb/ws/openbmc/build/tmp=
/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/build'
make: *** [all] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.


--_000_90852837c20b4169a7d4d66efaca7399ausx13mpc109AMERDELLCOM_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I am seeing following build err.<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;arm-openbmc-linux-gnueabi-g&#43;&#43;: intern=
al compiler error: Killed (program cc1plus)&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">More logs shown below.<o:p></o:p></p>
<p class=3D"MsoNormal">I am using Ubuntu 14.04 based VM. Could it be an iss=
ue, do I have to use actual stand-alone linux host.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Steps followed:<o:p></o:p></p>
<p class=3D"MsoNormal">export TEMPLATECONF=3Dmeta-openbmc-machines/meta-evb=
/meta-evb-aspeed/meta-evb-ast2500/conf<o:p></o:p></p>
<p class=3D"MsoNormal">. openbmc-env<o:p></o:p></p>
<p class=3D"MsoNormal">bitbake obmc-phosphor-imag<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Build err log:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">NOTE: Executing RunQueue Tasks<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: nspr-native-4.16-r0 do_fetch: Failed to fet=
ch URL http://ftp.mozilla.org/pub/nspr/releases/v4.16/src/nspr-4.16.tar.gz,=
 attempting MIRRORS if available<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: nss-native-3.31.1-r0 do_fetch: Failed to fe=
tch URL http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_=
31_1_RTM/src/nss-3.31.1.tar.gz, attempting MIRRORS if available<o:p></o:p><=
/p>
<p class=3D"MsoNormal">WARNING: shadow-4.2.1-r0 do_fetch: Failed to fetch U=
RL http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz, attemp=
ting MIRRORS if available<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: libpng-native-1.6.31-r0 do_fetch: Failed to=
 fetch URL http://downloads.sourceforge.net/project/libpng/libpng16/1.6.31/=
libpng-1.6.31.tar.xz, attempting MIRRORS if available<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: coreutils-8.27-r0 do_fetch: Failed to fetch=
 URL http://distfiles.gentoo.org/distfiles/coreutils-8.27-man.tar.xz;name=
=3Dmanpages, attempting MIRRORS if available<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: phosphor-ipmi-host-1.0-r1 do_compile: oe_runm=
ake failed<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: phosphor-ipmi-host-1.0-r1 do_compile: Functio=
n failed: do_compile (log file is located at /home/lsharma/open_bmc_evb/ws/=
openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r=
1/temp/log.do_compile.1444)<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Logfile of failure stored in: /home/lsharma/o=
pen_bmc_evb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-=
ipmi-host/1.0-r1/temp/log.do_compile.1444<o:p></o:p></p>
<p class=3D"MsoNormal">Log data follows:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&#8230;.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">| arm-openbmc-linux-gnueabi-libtool: compile:&nbsp; =
arm-openbmc-linux-gnueabi-g&#43;&#43; -march=3Darmv6 -marm -mtune=3Darm1176=
jz-s --sysroot=3D/home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/armv6=
-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/recipe-sysroot
 -DHAVE_CONFIG_H -I. -I../git -O2 -pipe -g -feliminate-unused-debug-types -=
fdebug-prefix-map=3D/home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/ar=
mv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1=3D/usr/src/debug/phosph=
or-ipmi-host/1.0-r1 -fdebug-prefix-map=3D/home/lsharma/open_bmc_evb/ws/open=
bmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/re=
cipe-sysroot-native=3D
 -fdebug-prefix-map=3D/home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/=
armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0-r1/recipe-sysroot=3D -fv=
isibility-inlines-hidden -Wall -Werror -c sensor-gen.cpp&nbsp; -fPIC -DPIC =
-o .libs/libapphandler_la-sensor-gen.o<o:p></o:p></p>
<p class=3D"MsoNormal">| arm-openbmc-linux-gnueabi-g&#43;&#43;: internal co=
mpiler error: Killed (program cc1plus)<o:p></o:p></p>
<p class=3D"MsoNormal">| Please submit a full bug report,<o:p></o:p></p>
<p class=3D"MsoNormal">| with preprocessed source if appropriate.<o:p></o:p=
></p>
<p class=3D"MsoNormal">| See &lt;https://gcc.gnu.org/bugs/&gt; for instruct=
ions.<o:p></o:p></p>
<p class=3D"MsoNormal">| make[2]: *** [libapphandler_la-sensor-gen.lo] Erro=
r 1<o:p></o:p></p>
<p class=3D"MsoNormal">| make[2]: Leaving directory `/home/lsharma/open_bmc=
_evb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-ho=
st/1.0-r1/build'<o:p></o:p></p>
<p class=3D"MsoNormal">| make[1]: *** [all-recursive] Error 1<o:p></o:p></p=
>
<p class=3D"MsoNormal">| make[1]: Leaving directory `/home/lsharma/open_bmc=
_evb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-ho=
st/1.0-r1/build'<o:p></o:p></p>
<p class=3D"MsoNormal">| make: *** [all] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">| ERROR: oe_runmake failed<o:p></o:p></p>
<p class=3D"MsoNormal">| WARNING: exit code 1 from a shell command.<o:p></o=
:p></p>
<p class=3D"MsoNormal">| ERROR: Function failed: do_compile (log file is lo=
cated at /home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/armv6-openbmc=
-linux-gnueabi/phosphor-ipmi-host/1.0-r1/temp/log.do_compile.1444)<o:p></o:=
p></p>
<p class=3D"MsoNormal">ERROR: Task (/home/lsharma/open_bmc_evb/ws/openbmc/m=
eta-phosphor/common/recipes-phosphor/ipmi/phosphor-ipmi-host.bb:do_compile)=
 failed with exit code '1'<o:p></o:p></p>
<p class=3D"MsoNormal">NOTE: Tasks Summary: Attempted 2071 tasks of which 6=
 didn't need to be rerun and 1 failed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Summary: 1 task failed:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; /home/lsharma/open_bmc_evb/ws/openbmc/meta-ph=
osphor/common/recipes-phosphor/ipmi/phosphor-ipmi-host.bb:do_compile<o:p></=
o:p></p>
<p class=3D"MsoNormal">Summary: There were 5 WARNING messages shown.<o:p></=
o:p></p>
<p class=3D"MsoNormal">Summary: There were 2 ERROR messages shown, returnin=
g a non-zero exit code.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Log file openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/phosphor-ipmi-host/1.0-r1/temp/log.do_compile.1444 shows following =
err.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">arm-openbmc-linux-gnueabi-g&#43;&#43;: internal comp=
iler error: Killed (program cc1plus)<o:p></o:p></p>
<p class=3D"MsoNormal">Please submit a full bug report,<o:p></o:p></p>
<p class=3D"MsoNormal">with preprocessed source if appropriate.<o:p></o:p><=
/p>
<p class=3D"MsoNormal">See &lt;https://gcc.gnu.org/bugs/&gt; for instructio=
ns.<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: *** [libapphandler_la-sensor-gen.lo] Error =
1<o:p></o:p></p>
<p class=3D"MsoNormal">make[2]: Leaving directory `/home/lsharma/open_bmc_e=
vb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host=
/1.0-r1/build'<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: *** [all-recursive] Error 1<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: Leaving directory `/home/lsharma/open_bmc_e=
vb/ws/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host=
/1.0-r1/build'<o:p></o:p></p>
<p class=3D"MsoNormal">make: *** [all] Error 2<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: oe_runmake failed<o:p></o:p></p>
<p class=3D"MsoNormal">WARNING: exit code 1 from a shell command.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_90852837c20b4169a7d4d66efaca7399ausx13mpc109AMERDELLCOM_--
