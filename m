Return-Path: <wsa@the-dreams.de>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 42DWss6BQBzDsQB;
 Tue, 18 Sep 2018 02:34:06 +1000 (AEST)
Received: from localhost (i577B9641.versanet.de [87.123.150.65])
 by pokefinder.org (Postfix) with ESMTPSA id C74422CE416;
 Mon, 17 Sep 2018 18:34:01 +0200 (CEST)
Date: Mon, 17 Sep 2018 18:34:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendanhiggins@google.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: Acknowledge most interrupts early in
 interrupt handler
Message-ID: <20180917163401.GA1082@kunai>
References: <1536895810-28903-1-git-send-email-linux@roeck-us.net>
 <fbf54ca6-16b3-5e35-eac8-b3dab8118543@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <fbf54ca6-16b3-5e35-eac8-b3dab8118543@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2018 16:34:10 -0000


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Looks good to me. Thanks! :)
>=20
> Acked-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Does that mean I need to revert "[PATCH i2c-next v6] i2c: aspeed: Handle
master/slave combined irq events properly" in i2c/for-next? And apply
this to i2c/for-current?

(and please quote only relevat parts of a message when replying)


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluf13UACgkQFA3kzBSg
KbYc6A//RiNyl613ea1eiJWQ6IlD3nrmnEox+ACiqAlq4Hwv5nJIdNS7RvmaVkS2
RkwPpr9PC/rMJ+OUBJMf73HpnHtAkKt0OExd5CGjUjohJPKRKIAhGzMWFO9k1kfi
MidIgxKhk6assBFO+lRms2X8iHWfpHzA1m+6bn1GDYhCmgnilc6ua/tcWutdPyjb
1qRvw6ZmTKgOcDKnck8LfxoUPlvuhqQxy0nL/bANFpTmC3nCydaSpPfdZIg+TzvI
rhBSdyxR12ZLCsHwGiJEhUpyeHiaxlN/nc0/dRI3F9mxCqKFzcnJXrLTf4T3KaOn
8e5PAxSZI/omdTLq6cNiHUhUaN3XLc1fb5U7EWSjS4/wi1EVePjYdjqRRPb2am0i
n7QFP6WDxL27AE4baPasCLq1fDvM59VjZBjftKCcwVn0a+gj5mJ8mFI1NS/CtjCw
qHIlQRsEnh1taOATGcoTxzmrpiEeb5G+7+BlZYYDVEqs1H0eDBEmD6wy+dUrieXo
P3DY+XFFpuBpqaLA01G8ImGpd9uP2czeMxD6kGuedutqbd2+7tmq8eL5eyjXMD0u
aI6QTa8fiMzIADrKBGWbprMPILXaRxn2hyFUvQtwAWgxmdRrdrPsoi1tH6WeJpFo
NQm+VyMgINQmsBJvxi5ReByjzaXD6odCJ4imLeYFSlNesr6ApSI=
=l6dV
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
