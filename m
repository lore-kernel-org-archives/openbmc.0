Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Q50M0xX9zDr0d
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 00:57:35 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2018 07:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,335,1526367600"; d="scan'208";a="71130955"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2018 07:57:15 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.242]) by
 ORSMSX109.amr.corp.intel.com ([169.254.11.113]) with mapi id 14.03.0319.002;
 Tue, 10 Jul 2018 07:57:14 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Hariharasubramanian Ramasubramanian <hramasub@in.ibm.com>, Ratan Gupta
 <ratagupt@linux.vnet.ibm.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: IPMI and Redfish support in openbmc Linux
Thread-Topic: IPMI and Redfish support in openbmc Linux
Thread-Index: AQHUGAfNUJbKLHM0W02PGYXZ3mzYtaSIlwOAgAAM6YD//+a88A==
Date: Tue, 10 Jul 2018 14:57:14 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345810FF6@ORSMSX114.amr.corp.intel.com>
References: <CAG9c7cAqGU5gBkjOG7=Q+bdNDqqd3ALFi+GZwgWpGPN6YHn4dA@mail.gmail.com>
 <57babd9a-22fd-093f-3edd-214642e0a016@linux.vnet.ibm.com>
 <OFCA608E26.3D7FF9BB-ON652582C6.00327BAF-652582C6.00335CBE@notes.na.collabserv.com>
In-Reply-To: <OFCA608E26.3D7FF9BB-ON652582C6.00327BAF-652582C6.00335CBE@notes.na.collabserv.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjg3NTkxMTAtYjU3MC00ODM1LWJiZGUtOWFlZTc3OTEwMjVlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicjBUU0dybmpIclhvYjdwZFBNZDV6VVNjclRkZk1MNjRhcEROQWZ5OWNxcjJ3SG1FNmdxcWJPXC9HWUlXVFBBODgifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: request-justification,no-action
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
X-List-Received-Date: Tue, 10 Jul 2018 14:57:39 -0000

Bmcweb will launch under one of two ports.  If launched manually, it will l=
aunch under port 18080.  If launched via systemd, it will use socket activa=
tion to launch under port 883 (to avoid conflicting with the existing phosp=
hor-rest server).

Another thing to recognize is that there is a debug html interface built in=
to the redfish interface, so the easiest way to test is to use a web browse=
r, and you will get the graphical interface with clickable links.  Try poin=
ting a web browser at https://10.99.241.79:18080/redfish/v1 and see if that=
 works.

PS, the trailing backslash is unimportant.  Bmcweb is designed to strip the=
 trailing backslash for you in either case, so redfish/v1 is the same as re=
dfish/v1/

-Ed



From: openbmc [mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.or=
g] On Behalf Of Hariharasubramanian Ramasubramanian
Sent: Tuesday, July 10, 2018 2:21 AM
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: IPMI and Redfish support in openbmc Linux


"openbmc" <openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org> wrote on=
 07/10/2018 02:04:49 PM:


>=20
> But I couldn't access Redfish API through the below command.
> curl -b cjar -k https://10.99.241.79/redvish/v1/
>=20

1) Looks like you have a typo in the URI : It must be redfish and not redvi=
sh ?
2) Also try removing the trailing forward slash : redfish/v1 instead of red=
fish/v1/
3) Is the service running in the standard 443 port ? If not append the port=
 number to the IP in the URI.

-Hari !
