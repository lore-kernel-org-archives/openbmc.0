Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xmQh6RXQzDqk8
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 02:07:52 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2018 09:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,283,1531810800"; d="scan'208";a="257766297"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2018 09:07:48 -0700
Received: from orsmsx159.amr.corp.intel.com (10.22.240.24) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Fri, 24 Aug 2018 09:07:48 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX159.amr.corp.intel.com ([169.254.11.207]) with mapi id 14.03.0319.002;
 Fri, 24 Aug 2018 09:07:47 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "KFTING@nuvoton.com" <KFTING@nuvoton.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [IPMBD] ipmbSend handling
Thread-Topic: [IPMBD] ipmbSend handling
Thread-Index: AdQ7bBJlB9GQFmgMREWcf8iZ/yaUkwAV2hnw
Date: Fri, 24 Aug 2018 16:07:47 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E8216993458353AD@ORSMSX114.amr.corp.intel.com>
References: <4b1131fb4e684bca994c5456838c028d@NTHCML01A.nuvoton.com>
In-Reply-To: <4b1131fb4e684bca994c5456838c028d@NTHCML01A.nuvoton.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjY3NGVkNGYtNDhjZi00YjUyLWFiNmEtZDBlZTBhMGU1NDAxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSTRWUG1TS0tTOElCVGZId01aQk1HMkhkQU1makdkd2kxcHQ4Zkdqa2czU2dWajc3b1VzdEl6ckg1bnRyZVBzNCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 24 Aug 2018 16:07:57 -0000

>=20
> The direction is always from the master device to the slave device.
>=20
Not true in either the spec or the implementation.  The IPMB bridge was des=
igned to operate two ways.  First, requests could be made from external ent=
ities, like an IPMB header on the board, or the Management Engine (On x86 p=
latforms).  These requests first require the BMC to be a slave for the requ=
est, and a master for the response.  Second, the BMC could initiate a reque=
st (Probably to the management engine).  In that case, it would be an maste=
r for the request, then a slave for the response.  In theory, both scenario=
s are supported by the daemon, but only the first case might be enabled at =
this point.

>=20
> It seems to me that ipmbSend behavior doesn't get aligned with the descri=
ption of request/response protocol in IPMB spec.
>=20

What do you refer to as ipmbSend here?

It would help a lot if you could add your comments to the code in the gerri=
t review.  It might help track down where you think the issues are.

-Ed
