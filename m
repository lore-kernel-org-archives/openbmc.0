Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405HM04nVkzF12N
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 02:45:14 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2018 08:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,336,1517904000"; d="scan'208";a="26076436"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga008.fm.intel.com with ESMTP; 20 Mar 2018 08:45:12 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.126]) by
 ORSMSX108.amr.corp.intel.com ([169.254.2.52]) with mapi id 14.03.0319.002;
 Tue, 20 Mar 2018 08:45:11 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Wim Vervoorn <wvervoorn@eltan.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: can't access openbmc-boost-dbus when building openbmc for s2600wf
Thread-Topic: can't access openbmc-boost-dbus when building openbmc for s2600wf
Thread-Index: AdPAPOfRWU+eF0mXQfOdH9039C7NuQAJPwRg
Date: Tue, 20 Mar 2018 15:45:11 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F66E4BA@ORSMSX114.amr.corp.intel.com>
References: <89370cb4fa8e4235a9272035ddbb3263@Eltsrv03.Eltan.local>
In-Reply-To: <89370cb4fa8e4235a9272035ddbb3263@Eltsrv03.Eltan.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmU3MTdkNTctOGZlYi00NWM0LTkzMTUtYTZjNTA3MzE0YTRhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6ImV1MVYxRGloczJNUmdycTh1ejhZcGdmajI1VllwVDdCbXVqbzE0endDazQ9In0=
x-originating-ip: [10.22.254.140]
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
X-List-Received-Date: Tue, 20 Mar 2018 15:45:17 -0000

Please check out this code review and let me know if it solves your issues.=
  There were some disconnects between the recipe and the code checked in th=
at would cause it to not build.

https://gerrit.openbmc-project.xyz/9624

-Ed

> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+ed.tanous=3Dintel.com@lists.ozlabs.org] On Behalf Of Wim Vervoorn
> Sent: Tuesday, March 20, 2018 4:24 AM
> To: openbmc@lists.ozlabs.org
> Subject: can't access openbmc-boost-dbus when building openbmc for
> s2600wf
>=20
> Hello,
>=20
> I am trying to build openbmc for the s2600wf board.
>=20
> During the process I get the message that the "boost-dbus" module can't b=
e
> read.
>=20
> The issue is due to the url referred to in the  openbmc/bmcweb/.gitmodule=
s
>=20
> [submodule "boost-dbus"]
> 	path =3D boost-dbus
> 	url =3D ssh://git-amr-2.devtools.intel.com:29418/openbmc-boost-dbus
>=20
> The message I get is : "ssh: Could not resolve hostname git-amr-
> 2.devtools.intel.com: Name or service not known"
>=20
> Is this a matter of a server that is down? It there an alternate location=
 I can
> use for this module
>=20
> Thanks for helping me out.
>=20
> Best regards,
>=20
> Wim Vervoorn
