Return-Path: <prvs=0336C8ADE5=adi.gangidi@rackspace.com>
X-Greylist: delayed 908 seconds by postgrey-1.36 at bilbo;
 Fri, 16 Jun 2017 13:20:45 AEST
Received: from esg01.rackspace.com (esg01.rackspace.com [192.237.132.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wplxn3TwdzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 13:20:45 +1000 (AEST)
Received: from smtpout.rackspace.com (unknown [10.4.45.22])
 by Websense Email with ESMTPS id DCF241092253C
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 03:05:34 +0000 (UTC)
Received: from 616646-IEXCH03.ror-uc.rackspace.com (10.4.45.23) by
 543888-IEXCH02.ror-uc.rackspace.com (10.4.45.22) with Microsoft SMTP Server
 (TLS) id 15.0.1293.1; Thu, 15 Jun 2017 23:05:34 -0400
Received: from 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46]) by 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46%24]) with mapi id 15.00.1293.000; Thu, 15 Jun
 2017 23:05:34 -0400
From: Adi Gangidi <adi.gangidi@rackspace.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Brad DeBauche <brad.debauche@RACKSPACE.COM>, Chad Somerlot
 <chad.somerlot@RACKSPACE.COM>, Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
Subject: Changing Power Button behavior 
Thread-Topic: Changing Power Button behavior 
Thread-Index: AQHS5kzZ56kcTSYdvkq56bWuu4yknQ==
Date: Fri, 16 Jun 2017 03:05:33 +0000
Message-ID: <1497582330728.74747@rackspace.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.12.51.4]
Content-Type: multipart/alternative;
 boundary="_000_149758233072874747rackspacecom_"
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
X-List-Received-Date: Fri, 16 Jun 2017 03:20:45 -0000

--_000_149758233072874747rackspacecom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Nice folks on the mailing list,


In our testing on Barreleye G2 server we noticed that:


BMC short press:  Doesn't effect power state

BMC long press:   Reboots the host (instead of poweroff)


Is that what its coded to ? Where can I find the code that dictates this be=
havior ? Any tips on how to go about changing this would be helpful.

?


-Adi

--_000_149758233072874747rackspacecom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi Nice folks on the mailing list,<br>
</p>
<p><br>
</p>
<p>In our testing on Barreleye&nbsp;G2 server&nbsp;we noticed that:<br>
</p>
<p><br>
</p>
<p>BMC short press: &nbsp;Doesn't effect power state<br>
</p>
<p>BMC long press:&nbsp;&nbsp; Reboots the host (instead of poweroff)<br>
</p>
<p><br>
</p>
<p>Is that what its coded to ? Where can I find the code that dictates this=
 behavior ? Any tips on how to go about&nbsp;changing&nbsp;this would be he=
lpful.&nbsp;<br>
</p>
<p>&#8203;<br>
</p>
<p><br>
</p>
<p>-Adi<br>
</p>
</body>
</html>

--_000_149758233072874747rackspacecom_--
