Return-Path: <KFTING@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=kfting@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zsln6kfXzDqC3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 12:15:00 +1000 (AEST)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w7S1iqXY004030
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 04:44:53 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML02.nuvoton.com
 (10.190.1.47) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Tue, 28 Aug
 2018 05:14:51 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Tue, 28 Aug
 2018 10:14:48 +0800
Received: from NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8]) by
 NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8%13]) with mapi id
 15.00.1130.005; Tue, 28 Aug 2018 10:14:48 +0800
From: <KFTING@nuvoton.com>
To: <ed.tanous@intel.com>, <openbmc@lists.ozlabs.org>
Subject: RE: [IPMBD] ipmbSend handling
Thread-Topic: [IPMBD] ipmbSend handling
Thread-Index: AdQ7bBJlB9GQFmgMREWcf8iZ/yaUkwAV2hnwAKvQbKA=
Date: Tue, 28 Aug 2018 02:14:48 +0000
Message-ID: <8c76f8bd57ae4ad2afb21959f1c01ac8@NTHCML01A.nuvoton.com>
References: <4b1131fb4e684bca994c5456838c028d@NTHCML01A.nuvoton.com>
 <7E9441B1E5EFFD4681F54958E8216993458353AD@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993458353AD@ORSMSX114.amr.corp.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.4.42.63]
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
X-List-Received-Date: Tue, 28 Aug 2018 02:15:03 -0000

Hi Ed:

> Not true in either the spec or the implementation.

Thank you for your description of the ipmbbridge design.

Now I get a better picture of it.

> It would help a lot if you could add your comments to the code in the ger=
rit review.  It might help track down where you think the issues are.

Sure, I'll do that.

Regards,
Tyrone
-----Original Message-----
From: Tanous, Ed [mailto:ed.tanous@intel.com]
Sent: Saturday, August 25, 2018 12:08 AM
To: CS00 KFTing; openbmc@lists.ozlabs.org
Subject: RE: [IPMBD] ipmbSend handling

>
> The direction is always from the master device to the slave device.
>
Not true in either the spec or the implementation.  The IPMB bridge was des=
igned to operate two ways.  First, requests could be made from external ent=
ities, like an IPMB header on the board, or the Management Engine (On x86 p=
latforms).  These requests first require the BMC to be a slave for the requ=
est, and a master for the response.  Second, the BMC could initiate a reque=
st (Probably to the management engine).  In that case, it would be an maste=
r for the request, then a slave for the response.  In theory, both scenario=
s are supported by the daemon, but only the first case might be enabled at =
this point.

>
> It seems to me that ipmbSend behavior doesn't get aligned with the descri=
ption of request/response protocol in IPMB spec.
>

What do you refer to as ipmbSend here?

It would help a lot if you could add your comments to the code in the gerri=
t review.  It might help track down where you think the issues are.

-Ed


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.
