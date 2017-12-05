Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrNc516tpzDrpn
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 11:56:36 +1100 (AEDT)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2017 16:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="183633861"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.115])
 by fmsmga005.fm.intel.com with ESMTP; 04 Dec 2017 16:56:32 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Joel Stanley'" <joel@jms.id.au>
Cc: "'Andrew Jeffery'" <andrew@aj.id.au>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <1512376203-147224-1-git-send-email-yong.b.li@linux.intel.com>
 <CACPK8XfXtjxaRXnbK3uCz4RscvRXCHkp==eU4O4dXghOErVypQ@mail.gmail.com>
In-Reply-To: <CACPK8XfXtjxaRXnbK3uCz4RscvRXCHkp==eU4O4dXghOErVypQ@mail.gmail.com>
Subject: RE: [PATCH linux dev-4.10 0/1] pinctrl: aspeed: Allow disabling Port
 D and Port E loopback mode
Date: Tue, 5 Dec 2017 08:56:31 +0800
Message-ID: <000701d36d63$e48fb710$adaf2530$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Content-Language: en-us
Thread-Index: AQDzBDyEc5M+uM02Jm+072wx4kCUJwI6iopVpOLq4WA=
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjA2OGRkZmUtMTgwMC00ZTQyLThiMzMtNjVkYmNhN2M1MTRmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImtOSFwvMDRCNG5sNVlUTU1aY1gxM1dkUVlqT2czYUsyVzhcLzFmcE44QUFWQT0ifQ==
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2017 00:56:38 -0000

Thanks Joel!

-----Original Message-----
From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel =
Stanley
Sent: Tuesday, December 5, 2017 8:43 AM
To: Yong Li <yong.b.li@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>; OpenBMC Maillist =
<openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.10 0/1] pinctrl: aspeed: Allow disabling =
Port D and Port E loopback mode

On Mon, Dec 4, 2017 at 7:00 PM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
> Backport pinctrl patch from kernel 4.12
>
> This patch is used to control the pass-through functions for=20
> GPIOE/GPIOD
>
> It is included in kernel V4.12:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com
> mit/?id=3Dc825676b0823fd43a4d08bf865f81bb188b51db1

Thanks. I've backported this to 4.10, as well as the "pinctrl: aspeed:
Fix ast2500 strap register write logic" that you submitted (and Andrew's =
fix "pinctrl: aspeed: Allow disabling Port D and Port E loopback mode").

Cheers,

Joel
