Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.13; helo=cpsmtpb-ews08.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="MOj1/kwH"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews08.kpnxchange.com (cpsmtpb-ews08.kpnxchange.com
 [213.75.39.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 405l983R1RzF0wG
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 20:38:15 +1100 (AEDT)
Received: from cpsps-ews23.kpnxchange.com ([10.94.84.189]) by
 cpsmtpb-ews08.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Wed, 21 Mar 2018 10:38:11 +0100
X-Brand: +YTO/YbK+g==
X-KPN-SpamVerdict: e1=0;e2=;e3=0(e1=10;e3=10;e2=00);EVW:White;BM:Clean
 ;FinalVerdict:Clean
X-Brightmail-Tracker: H4sIAAAAAAAAC+NgFvrALMWRWlGSWpSXmKPExsVyuJJZWJdZ
 Y1OUweuuTUYWp1pesDgwepyfsZAxgDGKNTMvKb8igTXj0oMZLAX3+SouP5/K2sD4jruLkZ
 NDQkBdYsmXk4xdjFwcQgLLGCUOPW1jAUkwC4hL3HoynwnC1pFYsPsTG4StLbFs4WtmEJtF
 oJNZ4tcxIYjmnYwSK5e8h5q0AWjShpvsEM5uRolZF2ewg7SwCWhI9KyeAzSKg0NEIF5i0m
 UTkLCwQIDEsYlTwbaJCARKzH/4H8q2kjg26TQrxDZViWN3NoPZvALOEhOmfGGDmN/LKNG8
 +BbYeZwCIRIdT8+ygMxnFJCVaHkN9aaAxJI955khbFGJl4//sULYyhJLu88yQswUlDg58w
 nY90ICChLTFi1jhKgJlvg0dzv7BEbJWUgBMwspYGYhBcwsJKMWMLKsYpRILiguKNZNLS82
 MtbLLsgDMvRy8pMTczYxAqPuqreG5w7GCztibzFKcxxgEuJISywuKUgsLhZiycvPS5UCKg
 kJLQqTamCcekbk14y9PO/7RZpW2HxdfIszP/27a+ajN5snHeZtmih24oTzvDU77fK/vPpi
 r31US/TZ34P+k56wv26Iat2YNW3B0by8whM/W1/Hs/CkzrKSNs3L792/rVO19afme4OpL5
 9biXy9E/vqyqb9bw6vTAmMnC34y/Up0864vFU93vuz2v6+vb7rohJLcUaioRZzUXEiADJb
 DemDAgAA
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT103.kpnxchange.com ([195.121.3.19]) by
 cpsps-ews23.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 21 Mar 2018 10:38:11 +0100
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1521625091;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=a5URbOFlxYak15uvco4GvzfVwun4s5a452xizeCxDPQ=;
 b=MOj1/kwHZxyXWbwOH/CQfaRUR8qFrZ3EEX5uvWCmsQE0FIBT4r45NqR1GumYZQLABPWH0BZTNSU
 HR2fQWls8qgMVg+tz7uiRayfkA/YkPRZUI2qj72hTV9ll+zLQ+WqD8YA/2WHQ3bjDuTSy8w8oeOrW
 prb8LE4yFJ3stsbuGfc=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT103.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Wed, 21 Mar 2018 10:38:11 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Wed, 21 Mar
 2018 10:38:02 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Wed, 21 Mar 2018 10:38:02 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: can't access openbmc-boost-dbus when building openbmc for s2600wf
Thread-Topic: can't access openbmc-boost-dbus when building openbmc for s2600wf
Thread-Index: AdPAPOfRWU+eF0mXQfOdH9039C7NuQAJPwRgACWEUjA=
Date: Wed, 21 Mar 2018 09:38:02 +0000
Message-ID: <093c3fd944f849d2a1b4edf4f85c8d51@Eltsrv03.Eltan.local>
References: <89370cb4fa8e4235a9272035ddbb3263@Eltsrv03.Eltan.local>
 <7E9441B1E5EFFD4681F54958E82169932F66E4BA@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F66E4BA@ORSMSX114.amr.corp.intel.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Mar 2018 09:38:11.0016 (UTC)
 FILETIME=[538EB480:01D3C0F8]
X-RcptDomain: lists.ozlabs.org
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
X-List-Received-Date: Wed, 21 Mar 2018 09:38:24 -0000

Hello Ted,

I tried this. The bcmweb seems to build fine now.

Unfortunately I am now ending up with a build error in the phosphor_state_m=
anager.

I don't know if these are related. Please note that I didn't clean the tree=
 after applying the patch. Should I do that?

Also I am building on Ubuntu 14.04.

Best regards,

Wim

-----Original Message-----
From: Tanous, Ed [mailto:ed.tanous@intel.com]=20
Sent: Tuesday, March 20, 2018 4:45 PM
To: Wim Vervoorn <wvervoorn@eltan.com>; openbmc@lists.ozlabs.org
Subject: RE: can't access openbmc-boost-dbus when building openbmc for s260=
0wf

Please check out this code review and let me know if it solves your issues.=
  There were some disconnects between the recipe and the code checked in th=
at would cause it to not build.

https://gerrit.openbmc-project.xyz/9624

-Ed

> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+ed.tanous=3Dintel.com@lists.ozlabs.org] On Behalf Of Wim=20
> bounces+Vervoorn
> Sent: Tuesday, March 20, 2018 4:24 AM
> To: openbmc@lists.ozlabs.org
> Subject: can't access openbmc-boost-dbus when building openbmc for=20
> s2600wf
>=20
> Hello,
>=20
> I am trying to build openbmc for the s2600wf board.
>=20
> During the process I get the message that the "boost-dbus" module=20
> can't be read.
>=20
> The issue is due to the url referred to in the =20
> openbmc/bmcweb/.gitmodules
>=20
> [submodule "boost-dbus"]
> 	path =3D boost-dbus
> 	url =3D ssh://git-amr-2.devtools.intel.com:29418/openbmc-boost-dbus
>=20
> The message I get is : "ssh: Could not resolve hostname git-amr-
> 2.devtools.intel.com: Name or service not known"
>=20
> Is this a matter of a server that is down? It there an alternate=20
> location I can use for this module
>=20
> Thanks for helping me out.
>=20
> Best regards,
>=20
> Wim Vervoorn
