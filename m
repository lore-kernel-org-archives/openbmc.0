Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xrQs6mLLzDqrV
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 05:08:19 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2018 12:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,283,1531810800"; d="scan'208";a="67899175"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga008.jf.intel.com with ESMTP; 24 Aug 2018 12:08:08 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX101.amr.corp.intel.com ([169.254.8.46]) with mapi id 14.03.0319.002;
 Fri, 24 Aug 2018 12:08:07 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, "KFTING@nuvoton.com"
 <KFTING@nuvoton.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [IPMBD] ipmbSend handling
Thread-Topic: [IPMBD] ipmbSend handling
Thread-Index: AdQ7bBJlB9GQFmgMREWcf8iZ/yaUkwAV2hnwAAaAajA=
Date: Fri, 24 Aug 2018 19:08:07 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345835559@ORSMSX114.amr.corp.intel.com>
References: <4b1131fb4e684bca994c5456838c028d@NTHCML01A.nuvoton.com>
 <7E9441B1E5EFFD4681F54958E8216993458353AD@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993458353AD@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjY3NGVkNGYtNDhjZi00YjUyLWFiNmEtZDBlZTBhMGU1NDAxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSTRWUG1TS0tTOElCVGZId01aQk1HMkhkQU1makdkd2kxcHQ4Zkdqa2czU2dWajc3b1VzdEl6ckg1bnRyZVBzNCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Fri, 24 Aug 2018 19:08:22 -0000

>=20
> It would help a lot if you could add your comments to the code in the ger=
rit
> review.  It might help track down where you think the issues are.
>=20

=09
I should also mention, the code posted in the review does work for communic=
ation with Management Engine, as well as with an Aardvark debugger connecte=
d to a header on the board.  We haven't yet tested with any other IPMB capa=
ble add in cards, although it's on our list.
