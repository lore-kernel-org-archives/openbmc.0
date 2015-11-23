Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 967CA1A029F
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 07:05:26 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1448309120265810.4645372321249;
 Mon, 23 Nov 2015 12:05:20 -0800 (PST)
Date: Mon, 23 Nov 2015 14:05:18 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH phosphor-host-ipmid] Initial autotools support
Message-ID: <20151123200347.GF21764@asimov.pw-on-the.net>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
 <m3vb8yslyo.fsf@oc8180480414.ibm.com>
 <CACPK8Xex_u+CsJk1VX1yLr7J3A-BZuSM6eBskT7OdQUV2CGKJw@mail.gmail.com>
 <m3r3jmsfxs.fsf@oc8180480414.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <m3r3jmsfxs.fsf@oc8180480414.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <20151123200347.GF21764@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Mon, 23 Nov 2015 20:05:27 -0000


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> There's also the odd thing at the moment for host-ipmid where there's a
> shared library that depends on symbols in the binary

The shared libraries are plugins for host-ipmid.  We happen to be
providing a set of common plugins but those can be overridden by a
particular machine.  We also provide a set of openpower specific plugins
for the parts of IPMI that are not specified (OEM commands) and those
are in another package.

We should have a discussion on the call about autotools vs (...).  The US
side of the team has zero experience with autotools and so it was easier
to just write some simple makefiles to get started.

I don't consider autotools to be the "defacto standard" since cmake is
also pretty popular.

--=20
Patrick Williams

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWU3EjAAoJEKsDR8wtAMEZuAMP/iXpeJZyTon/jWoQB+B3T7sl
k4l/7DW1ohvwOMMEP+16pSxS8tvMPZUJE+Rrfr/fxqsaP+pmVCon8Sv0QQNzKcvY
w6jkdw48XTnIbdc9Mmi60KNIe1HyF/WZcu5Gkwtt1sZT8NFE4tF/5/n552y+L9Gn
YJOFpZ891EGOK52AaE4tYfEnUXRuVzvF3lacZ7x16T6dbcJMvIQHKKAY1b18Gok+
ywV6GWYOHUAUDhQlvJSIv7Hpxmc0UtIq4StDMzzxTEryld5/A/E9DoZL2yBUGIFe
b25IJBMlXQkGV1EG9hA7TxQ/Y6dAH7I+oVTE8VI4wLNkuTeHTl7/gb2tRxHptD33
ZdNGEYoS6ylf+4I4xcC3Qf0kISXBeexUoOuiD0th0scxleQ308XKxvOnuVDbvykN
qNdjZHQx9+KFxEurct8trQv1imbkvHA9BHlvC+9f88FmPMKAEj6MGa6xmP6MPzEl
C7Hs9mVLmPNaZzm+uO3k5W3z3XhA7IS6tnMlpEJ6Ef7N0gcI6wMXNMp6SnZ3A9io
2Vz0ZB0yvvj2lZj4VtnKOi2XUALyDPUQAv58VXI2SgQZySpTVHvyL0goF+9HXeS4
Vm5DXYuNvEcjLSm4pJ0Agp3TfE4vxtzRz34ThArvgVK/0tc6CdUW0yg3fXjZJplQ
991c8ZD3TVANNij7JNo5
=LqpX
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
