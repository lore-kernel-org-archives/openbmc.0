Return-Path: <mkbrown32@hotmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.9.17; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=mkbrown32@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="NkhR18hk"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092009017.outbound.protection.outlook.com [40.92.9.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nwST4SnKzDqH4
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 04:43:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xclw6rXfrbR4uXQyfizRnODrs9iUJYEPnmYFiGRBfaE=;
 b=NkhR18hkhf8k2EebV7bq0CcFWqdIXGgKyKAOYdFjN3eMoiRHvhHEYfMQLsZrV8HtGkVJWXstYxtssx4nWCdA39JzcbPxNJr0yjHDGyI9qx+3PisrZ+azHusmsA/VFqPcgH6CM+g6loz65+tHt3owF6RTKhi3/Ql9lrctWo8es2lRnr2DSY3SM9gOXwDTLeL2PhM+L9YFbEatF2Fj/sBhQmJ7jHi+kK735v3x4imvBkOFEO191rB1P3vqbzaedW3i/4IEI4MyIr9fJMitgRm5W8Gd6CeAWQfkYvUPfDl8Dnv3Fll3tX3KwQiDy4woi3pFUTAkpsToE63LJzz1PhOY5Q==
Received: from BN3NAM04FT041.eop-NAM04.prod.protection.outlook.com
 (10.152.92.55) by BN3NAM04HT100.eop-NAM04.prod.protection.outlook.com
 (10.152.92.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16; Mon, 22 Apr
 2019 18:42:58 +0000
Received: from BYAPR02MB5847.namprd02.prod.outlook.com (10.152.92.51) by
 BN3NAM04FT041.mail.protection.outlook.com (10.152.93.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1771.16 via Frontend Transport; Mon, 22 Apr 2019 18:42:58 +0000
Received: from BYAPR02MB5847.namprd02.prod.outlook.com
 ([fe80::458:7638:5c3d:4ec1]) by BYAPR02MB5847.namprd02.prod.outlook.com
 ([fe80::458:7638:5c3d:4ec1%6]) with mapi id 15.20.1813.017; Mon, 22 Apr 2019
 18:42:58 +0000
From: Mark Brown <mkbrown32@hotmail.com>
To: Emily Shaffer <emilyshaffer@google.com>
CC: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Seeking openbmc programmer's editor info
Thread-Topic: Seeking openbmc programmer's editor info
Thread-Index: AQHU99lZjX3kq29ZfEeJqOC6txbbb6ZIPvCAgAAbJzqAAAPLAIAAAJwMgAAdGoCAAAikqA==
Date: Mon, 22 Apr 2019 18:42:58 +0000
Message-ID: <BYAPR02MB58475E4DBCCE9FEB3C5DA17CAE220@BYAPR02MB5847.namprd02.prod.outlook.com>
References: <CAO=notwmhWoeCry_Z+xL=7N1Pp+74tJ9BCF7nr4Jq1MwqRjfOA@mail.gmail.com>
 <BYAPR02MB58478B07866A63D01DA3EB25AE210@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notzqWthZ29ghauXdzS7Y8WYeVrnMbbmz6Tgt=R6n_mRRAA@mail.gmail.com>
 <BYAPR02MB5847D889707010DEF7F58A95AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notyZ8Qj96iGYqcPMnkMFSL-Q38-OC8F88oAgpsmu030pxQ@mail.gmail.com>
 <BYAPR02MB58475342BB3F33226E6446C9AE220@BYAPR02MB5847.namprd02.prod.outlook.com>,
 <CAJoAoZnBEWP+x_R=55Cp9rh=iyh7QZMqfvMrnWqAjmjQ=qvvGw@mail.gmail.com>
In-Reply-To: <CAJoAoZnBEWP+x_R=55Cp9rh=iyh7QZMqfvMrnWqAjmjQ=qvvGw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:36AA5A79B46478D4E264479F7F5BDEFFDEAD3CDFF0BC5BFE44007B5C442F7FD1;
 UpperCasedChecksum:15B8026F4C863F9F320984DE2C8E107FC6522D0D5C05D2A5F812975C5D547D10;
 SizeAsReceived:7327; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [YS3aZoq0tig+bz9JT9KUFbkMpYCVoR5V]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:BN3NAM04HT100; 
x-ms-traffictypediagnostic: BN3NAM04HT100:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-message-info: lICgxFPafjhpEU05dwQ2AnH1q9F+atD7QONeq5ZNnsoE7nFmlOgiTjX2dlEbfCkbdZB+v2gBNUTN60Cklrmtc7QbCmr8BP83OHG+VySlniIsrqFjJZGBrtIpomtbbXHZFth+ZErsTcqAQC30ox5BlQ4Kkfo5eGMDmkkqlOtfpUreObSYBI2WPw3rDErJT3CM
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6318b119-b26a-49e9-476b-08d6c7525713
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2019 18:42:58.0760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT100
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
X-List-Received-Date: Mon, 22 Apr 2019 18:43:07 -0000

Thanks for your response.=0A=
Are there updated openbmc build instructions that the new developer=0A=
should follow, posted elsewhere ?=0A=
=0A=
Here is the C-scope errors paste, =0A=
I sent to someone else here but,  you are right,=0A=
it is unclear whether someone who may post here pervasively=0A=
is more of an administrative person (e.g. git project manager) ,=0A=
and may not be familiar with the issue raised.=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
Cscope 15.8a   generated a lot of errors -- maybe Vim  7.4.52   =0A=
is not compatible with Ubuntu 14.04.6 .=0A=
Any ideas ?=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
markbmc@markbmc-Precision-5520:~$=0A=
markbmc@markbmc-Precision-5520:~$ wget -P ~/.vim/plugin http://cscope.sourc=
eforge.net/cscope_maps.vim=0A=
--2019-04-18 01:09:51--  http://cscope.sourceforge.net/cscope_maps.vim=0A=
Resolving cscope.sourceforge.net (cscope.sourceforge.net)... 216.105.38.10=
=0A=
Connecting to cscope.sourceforge.net (cscope.sourceforge.net)|216.105.38.10=
|:80... connected.=0A=
HTTP request sent, awaiting response... 200 OK=0A=
Length: 7336 (7.2K)=0A=
Saving to: =91/home/markbmc/.vim/plugin/cscope_maps.vim=92=0A=
=0A=
100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D>] 7,336       --.-K/s   in 0s=0A=
=0A=
2019-04-18 01:09:51 (1.21 GB/s) - =91/home/markbmc/.vim/plugin/cscope_maps.=
vim=92 saved [7336/7336]=0A=
=0A=
markbmc@markbmc-Precision-5520:~$=0A=
markbmc@markbmc-Precision-5520:~$=0A=
markbmc@markbmc-Precision-5520:~$=0A=
markbmc@markbmc-Precision-5520:~$ cd openbmc=0A=
markbmc@markbmc-Precision-5520:~/openbmc$=0A=
markbmc@markbmc-Precision-5520:~/openbmc$=0A=
markbmc@markbmc-Precision-5520:~/openbmc$=0A=
markbmc@markbmc-Precision-5520:~/openbmc$ find . -type f -print | grep -E '=
\.(c(pp)?|h)$' > cscope.files=0A=
markbmc@markbmc-Precision-5520:~/openbmc$ ls -la=0A=
total 124420=0A=
drwxrwxr-x 29 markbmc markbmc      4096 Apr 18 01:30 .=0A=
drwxr-xr-x 22 markbmc markbmc      4096 Apr 18 01:01 ..=0A=
lrwxrwxrwx  1 markbmc markbmc        13 Apr 11 09:45 bitbake -> poky/bitbak=
e/=0A=
drwxrwxr-x  7 markbmc markbmc      4096 Apr 11 13:35 build=0A=
-rw-rw-r--  1 markbmc markbmc 127253925 Apr 18 01:42 cscope.files=0A=
drwxrwxr-x  8 markbmc markbmc      4096 Apr 11 13:21 .git=0A=
drwxrwxr-x  2 markbmc markbmc      4096 Apr 11 09:45 .github=0A=
-rw-rw-r--  1 markbmc markbmc        31 Apr 11 09:45 .gitignore=0A=
-rw-rw-r--  1 markbmc markbmc       101 Apr 11 09:45 .gitreview=0A=
lrwxrwxrwx  1 markbmc markbmc        12 Apr 11 09:45 LICENSE -> poky/LICENS=
E=0A=
-rw-rw-r--  1 markbmc markbmc      2000 Apr 11 09:45 MAINTAINERS=0A=
lrwxrwxrwx  1 markbmc markbmc         9 Apr 11 09:45 meta -> poky/meta=0A=
drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-arm=0A=
drwxrwxr-x  6 markbmc markbmc      4096 Apr 11 09:45 meta-aspeed=0A=
drwxrwxr-x  7 markbmc markbmc      4096 Apr 11 09:45 meta-evb=0A=
drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-facebook=0A=
drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-google=0A=
drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-hxt=0A=
drwxrwxr-x  9 markbmc markbmc      4096 Apr 11 09:45 meta-ibm=0A=
drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-ingrasys=0A=
drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-inspur=0A=
drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-intel=0A=
drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-inventec=0A=
drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-mellanox=0A=
drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-nuvoton=0A=
drwxrwxr-x 14 markbmc markbmc      4096 Apr 11 09:45 meta-openembedded=0A=
drwxrwxr-x  6 markbmc markbmc      4096 Apr 11 09:45 meta-openpower=0A=
drwxrwxr-x 15 markbmc markbmc      4096 Apr 11 09:45 meta-phosphor=0A=
lrwxrwxrwx  1 markbmc markbmc        15 Apr 11 09:45 meta-poky -> poky/meta=
-poky/=0A=
drwxrwxr-x  3 markbmc markbmc      4096 Apr 11 09:45 meta-portwell=0A=
drwxrwxr-x  4 markbmc markbmc      4096 Apr 11 09:45 meta-qualcomm=0A=
drwxrwxr-x  7 markbmc markbmc      4096 Apr 11 09:45 meta-quanta=0A=
drwxrwxr-x 17 markbmc markbmc      4096 Apr 11 09:45 meta-raspberrypi=0A=
drwxrwxr-x 14 markbmc markbmc      4096 Apr 11 09:45 meta-security=0A=
lrwxrwxrwx  1 markbmc markbmc        18 Apr 11 09:45 meta-skeleton -> poky/=
meta-skeleton=0A=
drwxrwxr-x  3 markbmc markbmc      4096 Apr 11 09:45 meta-x86=0A=
drwxrwxr-x  5 markbmc markbmc      4096 Apr 11 09:45 meta-xilinx=0A=
lrwxrwxrwx  1 markbmc markbmc        22 Apr 11 09:45 oe-init-build-env -> p=
oky/oe-init-build-env=0A=
-rw-rw-r--  1 markbmc markbmc       327 Apr 11 09:45 openbmc-env=0A=
drwxrwxr-x 10 markbmc markbmc      4096 Apr 11 09:45 poky=0A=
-rw-rw-r--  1 markbmc markbmc      4177 Apr 11 09:45 README.md=0A=
lrwxrwxrwx  1 markbmc markbmc        13 Apr 11 09:45 scripts -> poky/script=
s/=0A=
-rwxrwxr-x  1 markbmc markbmc      1609 Apr 11 09:45 setup=0A=
-rw-rw-r--  1 markbmc markbmc        49 Apr 11 09:45 .templateconf=0A=
markbmc@markbmc-Precision-5520:~/openbmc$=0A=
markbmc@markbmc-Precision-5520:~/openbmc$=0A=
markbmc@markbmc-Precision-5520:~/openbmc$=0A=
markbmc@markbmc-Precision-5520:~/openbmc$ cscope -bq=0A=
cscope: cannot find file build/tmp/work/armv6-openbmc-linux-gnueabi/phospho=
r-debug-collector/1.0+gitAUTOINC+fa180596fe-r1/packages-split/phosphor-debu=
g-collector-src/usr/src/debug/phosphor-debug-collector/1.0+gitAUTOINC+fa180=
596fe-r1/build/xyz/openbmc_project/Dump/Internal=0A=
cscope: cannot find file /Create/server.cpp=0A=
cscope: cannot find file build/tmp/work/armv6-openbmc-linux-gnueabi/openpow=
er-debug-collector/1.0+gitAUTOINC+b618ccbaa7-r1/packages-split/openpower-de=
bug-collector-src/usr/src/debug/openpower-debug-collector/1.0+gitAUTOINC+b6=
18ccbaa7-r1/build/org/open_power/Host/Boot/error=0A=
cscope: cannot find file .cpp=0A=
cscope: cannot find file build/tmp/work/armv6-openbmc-linux-gnueabi/phospho=
r-led-manager/1.0+gitAUTOINC+ab3b247f04-r1/packages-split/phosphor-led-mana=
ger-src/usr/src/debug/phosphor-led-manager/1.0+gitAUTOINC+ab3b247f04-r1/bui=
ld/fault-monitor/xyz/openbmc_project/Led/Fru/Mon=0A=
cscope: cannot find file itor/error.cpp=0A=
cscope: cannot find file build/tmp/work/armv6-openbmc-linux-gnueabi/phospho=
r-led-manager/1.0+gitAUTOINC+ab3b247f04-r1/packages-split/phosphor-led-mana=
ger-src/usr/src/debug/phosphor-led-manager/1.0+gitAUTOINC+ab3b247f04-r1/bui=
ld/fault-monitor/xyz/openbmc_project/Led/Mapper=0A=
cscope: cannot find file error.cpp=0A=
cscope: cannot find file build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0=
/image/home/markbmc/openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0=
-r0/recipe-sysroot-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc=
-linux-gnueabi/8.3.0/plugin/include/gimple-build=0A=
cscope: cannot find file er.h=0A=
cscope: cannot find file build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0=
/image/home/markbmc/openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0=
-r0/recipe-sysroot-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc=
-linux-gnueabi/8.3.0/plugin/include/gt-fortran-t=0A=
cscope: cannot find file rans-stmt.h=0A=
cscope: cannot find file build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0=
/image/home/markbmc/openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0=
-r0/recipe-sysroot-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc=
-linux-gnueabi/8.3.0/plugin/include/gt-cp-method=0A=
cscope: cannot find file .h=0A=
cscope: cannot find file build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0-r0=
/image/home/markbmc/openbmc/build/tmp/work/x86_64-linux/gcc-cross-arm/8.3.0=
-r0/recipe-sysroot-native/usr/lib/arm-openbmc-linux-gnueabi/gcc/arm-openbmc=
-linux-gnueabi/8.3.0/plugin/include/cp/name-look=0A=
...=0A=
...=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
________________________________________=0A=
From: Emily Shaffer <emilyshaffer@google.com>=0A=
Sent: Monday, April 22, 2019 11:03 AM=0A=
To: Mark Brown=0A=
Cc: Patrick Venture; OpenBMC Maillist=0A=
Subject: Re: Seeking openbmc programmer's editor info=0A=
=0A=
OpenBMC is cross-compiled to target the embedded chip that it will run=0A=
on (often an Aspeed or Nuvoton part). I really doubt anybody is doing=0A=
their coding on an AST2400 :) Those stale-Ubuntu-targeted instructions=0A=
might still work, and if they don't, please let us know which=0A=
libraries are missing.=0A=
=0A=
I use a Debian derivative and Vim. However, it's worth noting that=0A=
openbmc/openbmc references a bunch of other Git repos. Bitbake will=0A=
pull these down and build for you, but if you want to edit anything,=0A=
you'll need to either check them out on your own or use devtool.=0A=
=0A=
Can you paste the errors you're seeing with C-Scope? (I don't use it,=0A=
but the text of the error might help us suss out what's going wrong.)=0A=
=0A=
By the way, even for questions like this, it's better to mail the=0A=
entire list than choose one person at random to ask in a direct email.=0A=
Later developers may have the same question and your email will help=0A=
answer it for them. :)=0A=
=0A=
Welcome to the project!=0A=
=0A=
On Mon, Apr 22, 2019 at 9:22 AM Mark Brown <mkbrown32@hotmail.com> wrote:=
=0A=
>=0A=
> On the official github   openbmc/openbmc   page:=0A=
>=0A=
> https://github.com/openbmc/openbmc=0A=
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=0A=
> 1) Prerequisite=0A=
> Ubuntu 14.04=0A=
> sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk ch=
rpath diffstat=0A=
> Fedora 28=0A=
> sudo dnf install -y git patch diffstat texinfo chrpath SDL-devel bitbake =
rpcgen=0A=
> sudo dnf groupinstall "C Development Tools and Libraries"=0A=
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=0A=
>=0A=
> ________________________________________=0A=
> From: Patrick Venture <venture@google.com>=0A=
> Sent: Monday, April 22, 2019 9:16 AM=0A=
> To: Mark Brown=0A=
> Cc: OpenBMC Maillist=0A=
> Subject: Re: Seeking openbmc programmer's editor info=0A=
>=0A=
> + openbmc mailing list=0A=
>=0A=
> On Mon, Apr 22, 2019 at 9:11 AM Mark Brown <mkbrown32@hotmail.com> wrote:=
=0A=
> >=0A=
> > The openbmc build instructions state that Ubuntu 14=0A=
> > should be used.=0A=
> > Are you saying that you read, navigate, modify source code=0A=
> > in a different development platform from the build ?=0A=
>=0A=
> Yes, what documentation are you reading that says to use ubuntu 14?=0A=
> It's likely just out of date.=0A=
>=0A=
> >=0A=
> > Also, someone else mentioned Vim/C-scope -- however, I experience=0A=
> > many "cannot find file" errors and then hangs of the Term window=0A=
> > under C-scope.=0A=
>=0A=
> I don't use C-scope.=0A=
>=0A=
> >=0A=
> >=0A=
> > ________________________________________=0A=
> > From: Patrick Venture <venture@google.com>=0A=
> > Sent: Monday, April 22, 2019 7:26 AM=0A=
> > To: Mark Brown=0A=
> > Subject: Re: Seeking openbmc programmer's editor info=0A=
> >=0A=
> > I don't use Ubuntu 14, but generally grep/sed/vim are used most.=0A=
> >=0A=
> > On Sat, Apr 20, 2019 at 5:30 PM Mark Brown <mkbrown32@hotmail.com> wrot=
e:=0A=
> > >=0A=
> > > I am a firmware guy watching the traffic on this email list.=0A=
> > > I am interested to know what programmer's editor is most useful,=0A=
> > > under Ubuntu 14,=0A=
> > > to navigate and read the source code here, perform multi-file searche=
s,=0A=
> > > and help find bugs.=0A=
> > > Which editor is most commonly used here ?=0A=
> > >=0A=
> > > Mark=0A=
> > >=0A=
> > > ________________________________________=0A=
> > > From: openbmc <openbmc-bounces+mkbrown32=3Dhotmail.com@lists.ozlabs.o=
rg> on behalf of Patrick Venture <venture@google.com>=0A=
> > > Sent: Friday, April 19, 2019 12:43 PM=0A=
> > > To: Joel Stanley; Brad Bishop; Andrew Jeffery=0A=
> > > Cc: OpenBMC Maillist=0A=
> > > Subject: meta-ingrasys patches required for new merged drivers=0A=
> > >=0A=
> > > If you don't work on or maintain meta-ingrasys/meta-zaius you can sto=
p=0A=
> > > reading and go on with your Friday. :D=0A=
> > >=0A=
> > > All;=0A=
> > >=0A=
> > > https://gerrit.openbmc-project.xyz/20692 and below are all ready-to-g=
o=0A=
> > > and some are required for the meta-aspeed bump staged for=0A=
> > > openbmc/openbmc.=0A=
> > >=0A=
> > > I wanted to throw this into an email to it jumps out more.=0A=
> > >=0A=
> > > Patrick=0A=
=0A=
=0A=
=0A=
--=0A=
Emily Shaffer=0A=
