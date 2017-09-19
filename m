Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gob1FrGL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fU4Ib/IC"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxDpg01SBzDqNh;
 Tue, 19 Sep 2017 17:22:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 65BD420DA5;
 Tue, 19 Sep 2017 03:22:16 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 19 Sep 2017 03:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=YDWfKuPEiq2IeGcb7RoxWmJ8IJYvLs1ZRcUvmRPcD
 Zs=; b=gob1FrGLi8yN66HphzmIzRASbxIqZb6b0crl+pMqGC6Zj/Q85qyZQTM0S
 2m+paSD+ZEUgpYBsnqtsZb3DRmtL8Tq2cKs0t3oYCEpq1ONwf5PDQPQG4+/DAgda
 301AfJsR71kR3qq6OlNq8LGKsXdss/WKWJi99RuIlwHqkXvdPa7OdPPYzGP7FDBz
 Y833F3QCtQ/geWKsvI0+4wS2EezDVJw6yxwr0NsgYI2ecADvkj84quJApfax4d1S
 WhoWNR6i7J5fsBvDUcauiR8+dcEDnNNYDQYzrM01YJNG6LwPa6uEvBkQvsyiYcFD
 dWHd3xSTVECTd1FSXaSKp4qrGKbzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=YDWfKuPEiq2IeGcb7R
 oxWmJ8IJYvLs1ZRcUvmRPcDZs=; b=fU4Ib/ICDS1+cOooCj7RzeJWOaSrITS1vJ
 vO63IDCJBnbX7WRkZaZ1Y0UHBJcMRip5MpJMqn6cQ+HK7MXoooBdjwvB/lSC7p7k
 ZIIoxmx+yAe07uilmhLhZd1b4b5FdJ9yn/1r5xgRGZ4PYOHuVfXC5dWwWhI957Qn
 DXMh78AfjrGGGWstCnnSoTjgaHx/4A4o1Ey5DSVtpUxRXz+DUCFoqr6npSBgBEDy
 G6Q2T6gUk2qJx/1wXoieJbB358EEcATzD5JuAsA2R6fjxewUkiwVxVFtlWib7SI0
 tIkZJFs3j3BeIdp0lZbyZ/37m4zTRkw5xgZgtA4BSO5le3uyVvQw==
X-ME-Sender: <xms:qMXAWSTXOK1WhkArAfY0INsl5qreNLwmvWuNvGQuCL6aNxmC46JAHA>
X-Sasl-enc: +k7eWC/UU5QPmceucFNY23mdExRHxiie9jJ4g3OBZY5u 1505805735
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18A8C248D1;
 Tue, 19 Sep 2017 03:22:13 -0400 (EDT)
Message-ID: <1505805730.30138.1.camel@aj.id.au>
Subject: Re: [RFC] docs: Specify V3 of the mbox protocol
From: Andrew Jeffery <andrew@aj.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 skiboot@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.com, stewart@linux.vnet.ibm.com, 
 joel@jms.id.au
Date: Tue, 19 Sep 2017 16:52:10 +0930
In-Reply-To: <1505796357.30609.1.camel@gmail.com>
References: <20170907071409.7163-1-sjitindarsingh@gmail.com>
 <20170907071409.7163-2-sjitindarsingh@gmail.com>
 <1505113305.4080.1.camel@aj.id.au> <1505189782.2222.1.camel@gmail.com>
 <1505354227.4080.11.camel@aj.id.au> <1505796357.30609.1.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-N/DVUc1cviKznLDSe2O1"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 07:22:19 -0000


--=-N/DVUc1cviKznLDSe2O1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-09-19 at 14:45 +1000, Suraj Jitindar Singh wrote:
> @wak:
>=20
> As per Andrews suggestion below, how do you feel about making the first
> arg in the response for get flash name the length?
>=20
> @andrew:
>=20
> Since your comments regarding flash integrity aren't really relevant at
> the protocol level do you think it's something which needs to be
> mentioned in this document or is just common sense (unless you're me
> and didn't implement it that way :p)...
>=20

I'd say that the fact that you didn't implement it off the bat means
that others won't either, so I think it deserves some attention.

If we choose to do a host alert on the BMC detecting an error then that
obviously needs to be specified here.

But winding back a bit, I'd suggest it's important to *specify* flash
integrity, even though the spec shouldn't enforce a particular
implementation. It should be enough to say something like:

    CREATE_{READ,WRITE}_WINDOW must provide a window containing data
    that is known to represent the state of the flash at the time the
    window is opened.

Maybe we need to make provisions for implementation suggestions in the
spec as well. I might do some reading around to see what other specs do
in this regard.

Cheers,

Andrew
--=-N/DVUc1cviKznLDSe2O1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZwMWiAAoJEJ0dnzgO5LT57KoP/RiBPJkpLi6Dz0CpaIDNNVJn
NNHn/kvotVZWIpz04cmQeHON1XxfUZ4VX92nzcB+tUKaF5N6Hcy9zoWxtEsffYDA
70sEoufyHF0oFhJ6jgFj8esbYgBTFiFUIJAnsSNC86oe0jZoDaxHHIlcQtv+unYh
UKDCX42c5R0qcoBmCVBk4pENWgkIFAZLAfmKgkDBR2ba1vMPJH3HJ6FhMy4WtNb+
s+0eromNkiHt9yWCh3iTf2dv3SlynFwucdkJdlgbuWfhpy3O6vOE6p5TUBgQfn30
mm3ZTi2uKuKp95O4r9GzMQfGBWTRa9jCkPkHo3/N+0CW9JSTivoPdbAT9RY+0+2c
7Ebr/lrOWOP4aOuNyHt6ZZOnuXi7TJDamngXcRGb3SVNE5uKfOZF1XuKE2KXNY2s
TLdtiDq4i98CAkqF1nlVI1dATostu/56Sx8hDROAvxflSl0dk6HjjtNs+7JuHUsg
XM+w1ooMveHYUFlSjITPo6ii6IFNbVjiVwVuPYXhZXS0+KSufEbsGFsO2vfEX6Se
xNf4HFWqDd2SRbDzhrZl1ZXiAfANxWrzVR8z3GsObYSs+M9TFKQiEWTHqxjl20nb
OjVsoBfXkHulPFp7FeNE56PbZsZ6/u2sJq5kM3drLLsFATqcKgwEWudQq24pBppE
BtG3A8NudQ72yX4/N5db
=iL1t
-----END PGP SIGNATURE-----

--=-N/DVUc1cviKznLDSe2O1--
