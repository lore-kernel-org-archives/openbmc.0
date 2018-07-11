Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QlnR6f07zF35S
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 03:05:29 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2018 10:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; d="scan'208";a="56114538"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by orsmga008.jf.intel.com with ESMTP; 11 Jul 2018 10:05:22 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.242]) by
 ORSMSX104.amr.corp.intel.com ([169.254.4.198]) with mapi id 14.03.0319.002;
 Wed, 11 Jul 2018 10:05:21 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Jeremy Kerr <jk@ozlabs.org>
CC: OpenBMC Development <openbmc@lists.ozlabs.org>, Alexander Amelkin
 <a.amelkin@yadro.com>
Subject: RE: ipmitool default interface
Thread-Topic: ipmitool default interface
Thread-Index: AQHUGTjaWvGDukzYAkG3wLj7Pokg9qSKP2sQ
Date: Wed, 11 Jul 2018 17:05:22 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169934581157D@ORSMSX114.amr.corp.intel.com>
References: <20180711165917.GH105329@mauery>
In-Reply-To: <20180711165917.GH105329@mauery>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjE0NDhkYmMtODdmOC00MzZmLWIxZjgtYWZhZjVlMmJmNTI5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVFhcL3VTK2M2SUtJY1laWEt1WnhJQ2U5ZFJ3MVViK3FLVkFHREpMWG51NDJcL1NWUVhGZzZyYnBkYmUzVzI5T2N1In0=
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
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
X-List-Received-Date: Wed, 11 Jul 2018 17:05:32 -0000

+1

-Ed

>=20
> I have seen several requests for help on this list that could have been
> avoided if the BMC internal ipmitool used dbus as its default interface.
>=20
> I do not think we are quite ready to upstream this commit or the actual
> interface, since the dbus interface will be changing as part of the refac=
tor of
> ipmid's architecture. But for now, it makes sense to set the default inte=
rface
> as dbus.
>=20
> After I have finished working on the refactor, I will push the changes
> upstream and then we should be able to just run with a standard cross-
> compiled build of ipmitool.
>=20
> --Vernon
