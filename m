Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWL4T1wbNzDqs9
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 02:03:20 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1502726593774628.7599996582378;
 Mon, 14 Aug 2017 09:03:13 -0700 (PDT)
Date: Mon, 14 Aug 2017 11:03:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: minyard@acm.org, benjaminfair@google.com, clg@kaod.org, joel@jms.id.au,
 andrew@aj.id.au, openipmi-developer@lists.sourceforge.net,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v1 0/4] ipmi_bmc: framework for IPMI on BMCs
Message-ID: <20170814160312.GA20526@asimov.lan>
References: <20170808035301.1980-1-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20170808035301.1980-1-brendanhiggins@google.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Mon, 14 Aug 2017 16:03:22 -0000


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2017 at 08:52:57PM -0700, Brendan Higgins wrote:
> Currently, OpenBMC handles all IPMI message routing and handling in userl=
and;
> the existing drivers simply provide a file interface for the hardware on =
the
> device. In this patchset, we propose a common file interface to be shared=
 by all
> IPMI hardware interfaces, but also a framework for implementing handlers =
at the
> kernel level, similar to how the existing OpenIPMI framework supports both
> kernel users, as well as misc device file interface.

Brendan,

Can you expand on why this is a good thing from an OpenBMC perspective?
We have a pretty significant set of IPMI providers that run in the
userspace daemon(s) and I can't picture more than a very small subset
even being possible to run in kernel space without userspace assistance.
We also already have an implementation of a RMCP+ daemon that can, and
does, share most of its providers with the host-side daemon.

--=20
Patrick Williams

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmRyb4ACgkQqwNHzC0A
wRnu8g//TJ5PqULihwLz2d72rtFvmdI3ZBE8AQcEwdSj3zxtmFedqDSvt1Nh5AVg
6yQwLi1vFyhNJ7VS4BgswXkWbQeWDViJvQPqfuNSCKb6Ohwg6ZYicKlV8YEJHAP9
1T5GnfXfF7EeukrXWtUrhbcsif28BKay4spD11CuQlvN77DvFGD9+UCFGfzksRf+
f261JSMhROTIKavQ2qeWNO99uniibq1hHnjzTZlD3V/V37I/75aHsAO1kIysKmjv
BUknjelcL2WgvNM+E9OalCL8flRsznm5gY3udG88i9PvCsB/x+/+h29v1nx/OVjM
Vi1+umtJo58+zn5tPH7gpR3OF6kwsTChltM0ewtExQxcdexrGjcNvKyaVvxdqWOd
LJ2iaQGRtskYo2a1+gXSli8opaMprrlEHZX13FXrIIUwKJPnQpN6Ae9EdAOE0UHG
lLPjZg6PsaD3pE4tbzWBIH2ptAr6M/96vF9Ir4ggprcH6uVZzXbOqzPksxIBRLuo
Jab+GfLKnHrEcqaMvQuZVX8HN1L28/ykU1Irobrj5YOSyJ0l3zeWZUdV5n6lJFt9
rmCC5+Os7BKfexWjdhJOBJKl5xCu48ixqxGxY5DihFxAWV9IPMjMUhbdXg02pvNY
EunvhBRoOws4j9Mwpw1EUlKD0zdxV4eQtCstKh9M5VelAHg0qRA=
=dKGD
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
