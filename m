Return-Path: <prvs=0336C8ADE5=adi.gangidi@rackspace.com>
X-Greylist: delayed 962 seconds by postgrey-1.36 at bilbo;
 Fri, 16 Jun 2017 13:11:17 AEST
Received: from esg01.rackspace.com (esg03.rackspace.com [104.130.178.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wplks19t9zDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 13:11:16 +1000 (AEST)
Received: from smtpout.rackspace.com (unknown [10.4.45.27])
 by Websense Email with ESMTPS id C60A6B4086B7C;
 Fri, 16 Jun 2017 02:55:12 +0000 (UTC)
Received: from 544258-IEXCH13.ror-uc.rackspace.com (10.4.45.26) by
 544261-IEXCH11.ror-uc.rackspace.com (10.4.45.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.845.32; Thu, 15 Jun 2017 22:55:12 -0400
Received: from 616646-IEXCH03.ror-uc.rackspace.com (10.4.45.23) by
 544258-IExch13.ror-uc.rackspace.com (10.4.45.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1034.23; Thu, 15 Jun 2017 22:55:11 -0400
Received: from 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46]) by 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46%24]) with mapi id 15.00.1293.000; Thu, 15 Jun
 2017 22:55:11 -0400
From: Adi Gangidi <adi.gangidi@rackspace.com>
To: Rob Lippert <rlippert@google.com>, Adriana Kobylak <anoo@us.ibm.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adrian Barrera
 <abarrera@us.ibm.com>, Brad DeBauche <brad.debauche@RACKSPACE.COM>, "Chad
 Somerlot" <chad.somerlot@RACKSPACE.COM>, Kenneth Wilke
 <kenneth.wilke@RACKSPACE.COM>, "ryan.dc.yu@foxconn.com"
 <ryan.dc.yu@foxconn.com>
Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius
 )
Thread-Topic: Switch up eth0 and eth1 to BMC shared and dedicated resp. (
 Zaius )
Thread-Index: AQHS5klwctZYn+xaiUajd6L+zqrWQg==
Date: Fri, 16 Jun 2017 02:55:11 +0000
Message-ID: <1497581711523.17322@rackspace.com>
References: <EDE9FA85-CF2B-4B72-9974-1E92EE9EC676@rackspace.com>
 <1497022202970.71679@rackspace.com>
 <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>,
 <CAFRv3wzS2TtJBom-tfSnfOTdc=6rHsvQ5ZJqFbgZUT609i-g2g@mail.gmail.com>
In-Reply-To: <CAFRv3wzS2TtJBom-tfSnfOTdc=6rHsvQ5ZJqFbgZUT609i-g2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.12.51.4]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Jun 2017 03:11:17 -0000

Thanks Rob, this helps.=0A=
=0A=
We're working with Broadcom on Link flap caused by the NC-SI interface on b=
oth the interfaces. We tested bringing down the NC-SI interface in BMC (wit=
h ip command) and link flap won't occur at that point on dedicated connecti=
on. =0A=
=0A=
And if it turns out that Broadcom can't resolve this, we will consider disa=
bling that NC-SI interface via device tree. =0A=
=0A=
-Adi=0A=
=0A=
________________________________________=0A=
From: Rob Lippert <rlippert@google.com>=0A=
Sent: Friday, June 9, 2017 12:13 PM=0A=
To: Adriana Kobylak=0A=
Cc: Adi Gangidi; OpenBMC Maillist; Adrian Barrera; Brad DeBauche; Chad Some=
rlot; Kenneth Wilke; ryan.dc.yu@foxconn.com=0A=
Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Za=
ius )=0A=
=0A=
On Fri, Jun 9, 2017 at 10:03 AM, Adriana Kobylak <anoo@us.ibm.com> wrote:=
=0A=
> Looping in the community for feedback.=0A=
>=0A=
>=0A=
>=0A=
> ----- Original message -----=0A=
> From: Adi Gangidi <adi.gangidi@rackspace.com>=0A=
> To: "anoo@us.ibm.com" <anoo@us.ibm.com>, Kenneth Wilke=0A=
> <kenneth.wilke@RACKSPACE.COM>, Brad DeBauche <brad.debauche@RACKSPACE.COM=
>,=0A=
> Chad Somerlot <chad.somerlot@RACKSPACE.COM>, "abarrera@us.ibm.com"=0A=
> <abarrera@us.ibm.com>, "ryan.dc.yu@foxconn.com" <ryan.dc.yu@foxconn.com>,=
=0A=
> "Rob Lippert" <rlippert@google.com>=0A=
> Cc:=0A=
> Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. (=
=0A=
> Zaius )=0A=
> Date: Fri, Jun 9, 2017 10:30 AM=0A=
>=0A=
> Sorry for couple of typo below, corrected them now.=0A=
>=0A=
> Please read again if it didn't make sense before.=0A=
>=0A=
> -Adi=0A=
> ________________________________________=0A=
> From: Adi Gangidi=0A=
> Sent: Friday, June 9, 2017 10:06 AM=0A=
> To: anoo@us.ibm.com; Kenneth Wilke; Brad DeBauche; Chad Somerlot;=0A=
> abarrera@us.ibm.com; ryan.dc.yu@foxconn.com; Rob Lippert=0A=
> Subject: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaiu=
s )=0A=
>=0A=
> Hi Adriana /.  Ryan ( Foxconn )=0A=
>=0A=
> Right now on openBMC=0A=
> BMC Shared      =3D eth0=0A=
> BMC Dedicated =3D eth1=0A=
>=0A=
>=0A=
> Instead, Is there a way we can make sure the BMC dedicated comes up as et=
h0=0A=
> and BMC shared link comes up as eth1, in Zaius / Barreleye G2 ?=0A=
>=0A=
>=0A=
> In how it works currently . you could have BMC dedicated be eth0 or eth1=
=0A=
> depending upon the hardware config ( Whether or not Broadcom 5719A is pop=
ped=0A=
> OR de-popped ) . That could confusing to support operators who don't=0A=
> understand the nuances .=0A=
=0A=
The eth0 and eth1 on the BMC map to the BMC hardware MAC unit #.  On=0A=
Zaius MAC1 is connected to various NC-SI stuff and MAC2 is connected=0A=
to the dedicated BMC MAC.=0A=
=0A=
So the eth numbers should not move around even if there is nothing=0A=
connected on the other end of eth0.  The only way the dedicated BMC=0A=
MAC MAC2 would become eth0 should be if the devtree entry for BMC MAC1=0A=
was removed.=0A=
=0A=
-Rob=0A=
=0A=
>=0A=
> If you guys are busy with other things to make the change  , can I have y=
our=0A=
> thoughts on if this can be changed ? I'm guessing this is a u-boot change=
 .=0A=
> Any thoughts on how we could make this change ourselves ?=0A=
>=0A=
> -Adi=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
>=0A=
