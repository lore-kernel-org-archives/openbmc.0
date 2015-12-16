Return-Path: <kenneth.wilke@RACKSPACE.COM>
X-Greylist: delayed 917 seconds by postgrey-1.35 at bilbo;
 Thu, 17 Dec 2015 00:59:06 AEDT
Received: from esg01.rackspace.com (esg03.rackspace.com [104.130.178.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DE4AC1A1174
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 00:59:06 +1100 (AEDT)
Received: from smtpout.rackspace.com (unknown [10.4.203.100])
 by Websense Email Security Gateway with ESMTPS id C315058BAF57B;
 Wed, 16 Dec 2015 13:44:01 +0000 (UTC)
Received: from 616646-IEXCH03.ror-uc.rackspace.com (10.4.203.112) by
 543881-IEXCH01.ror-uc.rackspace.com (10.4.203.100) with Microsoft SMTP Server
 (TLS) id 15.0.1130.6; Wed, 16 Dec 2015 08:43:46 -0500
Received: from 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46]) by 616646-IEXCH03.ror-uc.rackspace.com
 ([fe80::dc48:1dac:e8f7:7c46%24]) with mapi id 15.00.1130.005; Wed, 16 Dec
 2015 08:43:45 -0500
From: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
To: Stewart Smith <stewart@linux.vnet.ibm.com>, OpenBMC Patches
 <openbmc-patches@stwcx.xyz>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc] Added ubuntu dependencies to readme
Thread-Topic: [PATCH openbmc] Added ubuntu dependencies to readme
Thread-Index: AQHRN4baBT1Roz1sQ0erYCYzAcCgKZ7NeTQAgAAkJKg=
Date: Wed, 16 Dec 2015 13:43:45 +0000
Message-ID: <1450273434139.10801@RACKSPACE.COM>
References: <1450218041-11964-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450218041-11964-2-git-send-email-openbmc-patches@stwcx.xyz>,
 <87si327vzr.fsf@birb.au.ibm.com>
In-Reply-To: <87si327vzr.fsf@birb.au.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.4.203.65]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Dec 2015 02:53:08 +1100
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
X-List-Received-Date: Wed, 16 Dec 2015 13:59:07 -0000

I like the idea of having Dockerfiles handy to aid in the process of automa=
ting builds and stuff, and providing an easy means to test on various distr=
os. I'd like to see the dependencies and build procedures documented outsid=
e of code as well.=0A=
=0A=
Thanks,=0A=
Kenneth=0A=
=0A=
From: Stewart Smith <stewart@linux.vnet.ibm.com>=0A=
Sent: Wednesday, December 16, 2015 12:23 AM=0A=
To: OpenBMC Patches; openbmc@lists.ozlabs.org=0A=
Cc: Kenneth Wilke=0A=
Subject: Re: [PATCH openbmc] Added ubuntu dependencies to readme=0A=
=0A=
OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:=0A=
> From: kenneth-wilke <kenneth.wilke@rackspace.com>=0A=
> ---=0A=
>  README.md | 8 +++++++-=0A=
>  1 file changed, 7 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/README.md b/README.md=0A=
> index 49d4f94..0df0ad4 100644=0A=
> --- a/README.md=0A=
> +++ b/README.md=0A=
> @@ -8,9 +8,15 @@ OpenBMC uses Yocto/Open-Embedded for a build system, whi=
ch supports an=0A=
>  out-of-tree build.  It is recommended that you create an empty directory=
=0A=
>  somewhere to hold the build.  This directory will get big.=0A=
>=0A=
> +On Ubuntu 14.04 the following packages are required to build the default=
 target=0A=
> +```=0A=
> +sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk c=
hrpath diffstat=0A=
> +```=0A=
> +=0A=
>  To start a build:=0A=
>=0A=
> +```=0A=
>      cd <builddir>=0A=
>      . <repodir>/openbmc-env=0A=
>      bitbake obmc-phosphor-image=0A=
> -=0A=
> +```=0A=
=0A=
(not saying you have to do this)=0A=
=0A=
But i've been experimenting with including a skeleton Dockerfile in=0A=
projects to say "here are the build deps on platform X" which is then=0A=
programatically testable.=0A=
=0A=
Might be worth it here too.=0A=
=0A=
