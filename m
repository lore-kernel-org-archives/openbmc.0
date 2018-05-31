Return-Path: <Lakesh.Sharma@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.94; helo=esa3.dell-outbound.iphmx.com;
 envelope-from=lakesh.sharma@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="S63YUzsC"; 
 dkim-atps=neutral
Received: from esa3.dell-outbound.iphmx.com (esa3.dell-outbound.iphmx.com
 [68.232.153.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xZVB5hkmzDrbk
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 03:40:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1527788048; x=1559324048;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iU34w5x+dv1fA4fZHUUiLDSBvfChYsyTeaeHB4OYGTY=;
 b=S63YUzsCJQv34LkQriCY5C0AdFzW+kfYf9XhtYIanMoSgOtpgQWZHiDM
 gt1RgSHfuGovFUqD9Ke8LdFUuMyzc1DkhQWBcvfTdbL583zjk002sz/HR
 CYIRCIyMEQkLb8oqiNI4TJ7qxyZJTenDDejr0EVkMrbK43QqujJcOsE/G s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GwAABeMhBbh8mZ6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQYgQ0oCphUgXmBD19hhUeMNYF4CxiEVAKCBSE2FgECAQEBAQE?=
 =?us-ascii?q?BAgEBAhABAQEIDQkIKC+CNSKCUwEBAQQBOT8MBAIBCBEEAQEBHgkHIQceCQgBA?=
 =?us-ascii?q?QQBDQUIgxqBaQMVpkMRgzyHBg2BLIFoiEGCE4EPgw2CT0IEgWWFTQKHPYYSim4?=
 =?us-ascii?q?sBwKLAV8BgniNG4o7hlqBSASCAHCDE4IujiBvAY5HgRkBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GwAABeMhBbh8mZ6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?YgQ0oCphUgXmBD19hhUeMNYF4CxiEVAKCBSE2FgECAQEBAQEBAgEBAhABAQEID?=
 =?us-ascii?q?QkIKC+CNSKCUwEBAQQBOT8MBAIBCBEEAQEBHgkHIQceCQgBAQQBDQUIgxqBaQM?=
 =?us-ascii?q?VpkMRgzyHBg2BLIFoiEGCE4EPgw2CT0IEgWWFTQKHPYYSim4sBwKLAV8BgniNG?=
 =?us-ascii?q?4o7hlqBSASCAHCDE4IujiBvAY5HgRkBAQ?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa3.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2018 12:34:05 -0500
From: <Lakesh.Sharma@dell.com>
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2018 23:33:44 +0600
X-LoopCount0: from 10.166.132.55
X-IronPort-AV: E=Sophos;i="5.49,463,1520917200"; d="scan'208";a="659636802"
X-DLP: DLP_GlobalPCIDSS
To: <mkbrown32@hotmail.com>, <mine260309@gmail.com>
CC: <openbmc@lists.ozlabs.org>
Subject: RE: openbmc build err "internal compiler error'
Thread-Topic: openbmc build err "internal compiler error'
Thread-Index: AdPzf/BfFD8XbX/RS/y0bRg59wQL0QAc4B8AAUNb//AAC74jgAAKbCRA
Date: Thu, 31 May 2018 17:39:57 +0000
Message-ID: <bce3c8ec90c14e8fbc48e9a123f6c513@ausx13mpc113.AMER.DELL.COM>
References: <90852837c20b4169a7d4d66efaca7399@ausx13mpc109.AMER.DELL.COM>
 <CAARXrtmp_MdKe44q-dgMyO-P=FQRWH5JQ7zMVWVZSj=_HGykmQ@mail.gmail.com>,
 <0928cde3464f4377be4f58f114486543@ausx13mpc113.AMER.DELL.COM>
 <MWHPR02MB2320468019D310BACB2B3E7AAE630@MWHPR02MB2320.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB2320468019D310BACB2B3E7AAE630@MWHPR02MB2320.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 31 May 2018 17:40:04 -0000

Earlier was 2048 MB, now is 3584 MB, which is the max value shown in Base M=
emory option.


-----Original Message-----
From: Mark Brown [mailto:mkbrown32@hotmail.com]=20
Sent: Thursday, May 31, 2018 10:37 AM
To: Sharma, Lakesh; mine260309@gmail.com
Cc: openbmc@lists.ozlabs.org
Subject: Re: openbmc build err "internal compiler error'

What was the earlier VM Memory size and what is the current VM Memory size =
?

________________________________________
From: openbmc <openbmc-bounces+mkbrown32=3Dhotmail.com@lists.ozlabs.org> on=
 behalf of Lakesh.Sharma@dell.com <Lakesh.Sharma@dell.com>
Sent: Thursday, May 31, 2018 10:12 AM
To: mine260309@gmail.com
Cc: openbmc@lists.ozlabs.org
Subject: RE: openbmc build err "internal compiler error'


Thanks, I increased the memory of VM, and after that it seems to progress o=
k. I see  zImage, fitImage and few other binaries in images folder.
However I also saw following err message in build log. Could it be due uboo=
t archive was not available or it could not download it ?
Should I attempt rebuild, and if see same err then probably put uboot archi=
ve manually in build/download, if so which ver ?

| dd: failed to open=20
| ?/home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/deploy/images/evb-ast
| 2500/u-boot.bin?: No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_generate_static (log file is located at=20
| /home/lsharma/open_bmc_evb/ws/openbmc/build/tmp/work/evb_ast2500-openb
| mc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_stati
| c.29415)
ERROR: Task (/home/lsharma/open_bmc_evb/ws/openbmc/meta-phosphor/common/rec=
ipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static) failed with=
 exit code '1'
NOTE: Tasks Summary: Attempted 3396 tasks of which 2082 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
  /home/lsharma/open_bmc_evb/ws/openbmc/meta-phosphor/common/recipes-phosph=
or/images/obmc-phosphor-image.bb:do_generate_static
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


-----Original Message-----
From: Lei YU [mailto:mine260309@gmail.com]
Sent: Thursday, May 24, 2018 6:42 PM
To: Sharma, Lakesh
Cc: OpenBMC Maillist
Subject: Re: openbmc build err "internal compiler error'

On Fri, May 25, 2018 at 12:55 AM,  <Lakesh.Sharma@dell.com> wrote:
> I am seeing following build err.
>
> "arm-openbmc-linux-gnueabi-g++: internal compiler error: Killed=20
> (program cc1plus)"
>

I guess g++ is killed due to using too much memory, maybe you can check you=
r system log to see if there is any oom.
It is known issue that building phosphor-host-ipmid (more precisely, the ge=
nerated sensor-gen.cpp) consumes too much memory.

Possibly increase the RAM for your VM, e.g. my 16GiB VM is fine.
