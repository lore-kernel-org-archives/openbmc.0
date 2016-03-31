Return-Path: <kenneth.wilke@RACKSPACE.COM>
X-Greylist: delayed 947 seconds by postgrey-1.35 at bilbo;
 Fri, 01 Apr 2016 01:35:15 AEDT
Received: from esg01.rackspace.com (esg01.rackspace.com [192.237.132.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qbRr31Fv8zDq6W
 for <openbmc@lists.ozlabs.org>; Fri,  1 Apr 2016 01:35:14 +1100 (AEDT)
Received: from smtpout.rackspace.com (unknown [10.4.203.101])
 by Websense Email Security Gateway with ESMTPS id 9F53C229FCE29;
 Thu, 31 Mar 2016 14:15:24 +0000 (UTC)
Received: from 616646-IEXCH03.ror-uc.rackspace.com (10.4.203.112) by
 543888-IEXCH02.ror-uc.rackspace.com (10.4.203.101) with Microsoft SMTP Server
 (TLS) id 15.0.1178.1; Thu, 31 Mar 2016 10:19:25 -0400
Received: from 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46]) by 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46%24]) with mapi id 15.00.1178.000; Thu, 31 Mar
 2016 10:19:25 -0400
From: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
To: Stewart Smith <stewart@linux.vnet.ibm.com>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: Re: obmcutil is slow, nonsensical output
Thread-Topic: obmcutil is slow, nonsensical output
Thread-Index: AQHRixQA0qWZMwZDQUCiBB1jywv0Cp9zmaAo
Date: Thu, 31 Mar 2016 14:19:24 +0000
Message-ID: <1459433964519.44939@RACKSPACE.COM>
References: <87wpojtcb4.fsf@birb.au.ibm.com>
In-Reply-To: <87wpojtcb4.fsf@birb.au.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.4.203.65]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2016 14:35:15 -0000

We see the same behavior on the Barreleye servers, the obmcutil is quite sl=
ow but we've gotten used to it. The poweron and poweroff commands usually r=
eturn either this message or a python backtrace if the backend dbus service=
s are still warming up.=0A=
________________________________________=0A=
From: openbmc <openbmc-bounces+kenneth.wilke=3Drackspace.com@lists.ozlabs.o=
rg> on behalf of Stewart Smith <stewart@linux.vnet.ibm.com>=0A=
Sent: Thursday, March 31, 2016 1:02 AM=0A=
To: openbmc=0A=
Subject: obmcutil is slow, nonsensical output=0A=
=0A=
root@palmetto:~# time obmcutil 2>&1 > /dev/null=0A=
=0A=
real    0m3.301s=0A=
user    0m3.030s=0A=
sys     0m0.230s=0A=
=0A=
root@palmetto:~# obmcutil poweron=0A=
 =3D None=0A=
=0A=
The above is really confusing as to what is actually going on... does=0A=
that mean success? Does that mean there's no power? Does that mean no=0A=
action was taken?=0A=
=0A=
=0A=
--=0A=
Stewart Smith=0A=
OPAL Architect, IBM.=0A=
=0A=
_______________________________________________=0A=
openbmc mailing list=0A=
openbmc@lists.ozlabs.org=0A=
https://lists.ozlabs.org/listinfo/openbmc=0A=
