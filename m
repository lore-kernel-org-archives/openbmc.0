Return-Path: <kenneth.wilke@RACKSPACE.COM>
X-Greylist: delayed 959 seconds by postgrey-1.35 at bilbo;
 Sat, 27 Aug 2016 05:34:27 AEST
Received: from esg01.rackspace.com (esg03.rackspace.com [104.130.178.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sLWSz70C2zDrdq
 for <openbmc@lists.ozlabs.org>; Sat, 27 Aug 2016 05:34:27 +1000 (AEST)
Received: from smtpout.rackspace.com (unknown [10.4.203.101])
 by Websense Email with ESMTPS id F2A356650A4B8;
 Fri, 26 Aug 2016 19:18:24 +0000 (UTC)
Received: from 616646-IEXCH03.ror-uc.rackspace.com (10.4.203.112) by
 543888-IEXCH02.ror-uc.rackspace.com (10.4.203.101) with Microsoft SMTP Server
 (TLS) id 15.0.1178.1; Fri, 26 Aug 2016 15:18:24 -0400
Received: from 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46]) by 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46%24]) with mapi id 15.00.1178.000; Fri, 26 Aug
 2016 15:18:24 -0400
From: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Patches
 <openbmc@lists.ozlabs.org>
Subject: Re: naming conventions
Thread-Topic: naming conventions
Thread-Index: AQHR/8yj3G7hSQiI7USm2lb+q7t/SqBbnVhc
Date: Fri, 26 Aug 2016 19:18:23 +0000
Message-ID: <1472239103290.78011@RACKSPACE.COM>
References: <2EB33EE8-EFD0-4EA1-A54F-8C6A03FDEBDC@fuzziesquirrel.com>
In-Reply-To: <2EB33EE8-EFD0-4EA1-A54F-8C6A03FDEBDC@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.66.66.31]
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Aug 2016 19:34:28 -0000

Makes sense to me, seems like a good way to quickly identify the scope of p=
urpose for each application.=0A=
________________________________________=0A=
From: openbmc <openbmc-bounces+kenneth.wilke=3Drackspace.com@lists.ozlabs.o=
rg> on behalf of Brad Bishop <bradleyb@fuzziesquirrel.com>=0A=
Sent: Friday, August 26, 2016 1:53 PM=0A=
To: OpenBMC Patches=0A=
Subject: naming conventions=0A=
=0A=
I wanted to take a stab at standardizing our naming conventions a little be=
tter.=0A=
=0A=
In general, applications would be (loosely) named after the layer they are =
associated with.  For example:=0A=
=0A=
phosphor-foo: application that can run on any card running OpenBMC=0A=
op-foo: application that can only run on OpenPOWER systems=0A=
ibm-foo: application that can only run on IBM systems=0A=
palmetto-foo: application specific to the Palmetto system=0A=
=0A=
I chose phosphor-foo rather than obmc-foo to draw attention to the fact tha=
t =91Phosphor=92 refers to a reference implementation/distribution (ideally=
) of OpenBMC (similar to Poky/OpenEmbedded).=0A=
=0A=
When naming things or filling out description fields in recipes, etc, pleas=
e avoid the overly redundant name or description: obmc-phosphor or =93Phosp=
hor OpenBMC=94.  Given that Phosphor is the reference for OpenBMC you can j=
ust say =93Phosphor."=0A=
=0A=
thoughts/feedback?=0A=
=0A=
-brad=0A=
_______________________________________________=0A=
openbmc mailing list=0A=
openbmc@lists.ozlabs.org=0A=
https://lists.ozlabs.org/listinfo/openbmc=0A=
