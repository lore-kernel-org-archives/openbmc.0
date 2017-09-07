Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cjMjNjHs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N1y6bjKD"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xp42y0G3YzDrW9
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 01:23:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F3FC1206F4;
 Thu,  7 Sep 2017 11:23:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 07 Sep 2017 11:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=7WcXC+oESbJd50tckYwa0+V7giRCWe6m5bimiPDa7
 qs=; b=cjMjNjHsxQs9gUbGd1cGVfGwKKBGlaPzIL+sU5oRwMFmRwwWGdDk/T+mn
 Gq93UOYoccAclLszjCr8V+czNjTIOnVg6KWUOf3tfhPTOwjgEImAV6puk6QbwAss
 F6gbF61MBwHazy+ySSaBqzIZ5QR6VhgfiRJmE07pHcFliS6IUSzX+fNPtY50/B+4
 DJYXisg4ZJRaSCqt4umndc76bqN6etjk1U9dOJvuE3MrNLIlOLdHSGeB4+SjcenN
 Mg+Z4FCZliE/XkHWEswPUzjdNfReR8DHwzgpuasgrqT7c2AlVgSwNYOt/GcLfNI+
 lrUzTQXnVYxe/gQcugr+KplDCfxLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=7WcXC+oESbJd50tckY
 wa0+V7giRCWe6m5bimiPDa7qs=; b=N1y6bjKDRK22mX3tq4yFDofcZhd4bbvNi5
 dzwYdzUAqXp4vG0xq+UM8Fvs/6UGdeNS25aZ3c++SF/iXpxQuLoHbTvKkspJ/72f
 5XGTlt+v+jAes3Z4C2L7/t9hIvpme86KbgCBxLxCCp8AuRWyN9iC9KrYFPjXDiCy
 aojNa4A7iklGfTm+FgjpwyDG4K23lqexL1eM0pp5gtR3DQmFS1QMsrjJzSNyatCW
 gANpDwIrX7tTWeSDZ9ocMqVqX/8WD4ZUA4F8jB+emcsrLrs1ysI815sjv90IPlnq
 MqKi6473Ig2GSlBz9BCr6xZaFjoZxK1EYPrYsUcRonVRUOHy0Stw==
X-ME-Sender: <xms:VmSxWcs9rrQ2Y-rqwBwVPHdjeg0ua-edv8v2nDR5yB-t8qCsF-W31A>
X-Sasl-enc: SKUs+QiTAB1KIBU2MbwFhdMIS6ll+waYqklyElWcBIQh 1504797782
Received: from keelia (unknown [180.200.129.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id E083A7E426;
 Thu,  7 Sep 2017 11:22:59 -0400 (EDT)
Message-ID: <1504797770.5105.7.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Fri, 08 Sep 2017 01:22:50 +1000
In-Reply-To: <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Ora1ViZxeJ8Db5G7TexF"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 07 Sep 2017 15:23:07 -0000


--=-Ora1ViZxeJ8Db5G7TexF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
> On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
>=20
> > > =C2=A0=C2=A0
> > > Guess I need to dig up my eval board and see if I can reproduce the p=
roblem.
> > > Seems you are saying that the problem is always seen when issuing a s=
equence
> > > of "clear faults" commands on multiple pages ?
> >=20
> > Yeah. We're also seeing bad behaviour under other command sequences as =
well,
> > which lead to this hack of a work-around patch[1].
> >=20
> > I'd be very interested in the results of testing against the eval board=
. I
> > don't have access to one and it seems Maxim have discontinued them.
> >=20
>=20
> Do you have a somewhat reliable means to reproduce the problem ?

It seems we hit a bunch of problems by just continually
binding/unbinding the driver, if you don't apply that hacky oneshot
retry patch. We can=C2=A0hit problems (in our design?) with something like:

# cd /sys/bus/i2c/drivers/max31785; \
	echo $addr > unbind; \
	while echo $addr > bind; \
	do echo $addr > unbind; echo -n .; done;

It should hit issues covered by this patch, as the register checks are
used in the operations used by probe.

Andrew
--=-Ora1ViZxeJ8Db5G7TexF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsWRKAAoJEJ0dnzgO5LT5a6UP/Rvb2e4usgjlEBtXI4XJpTXd
lLtEQ9xnaJa6o6+XAnfNIqmH9baCE5sA1jY7oWAlnqDe3+u3lpFVPlSQ9CLu8zol
78ca7RXOgt5XE36ImZVIx59/LAGhVu2+6GKrgzLo9/PSsNlutkAHb1kT00SjjBhU
N00XKVHuJazGT/W1z/DRF+xOb0Cq9BnwebVwmoWuFvE6I4q/fb6O86TY4bu2CY2e
OkPlLN3xZtazVTHXEdtgoeB1nvHClJgx3js9I3L8eSq72YW6dPzMM0RWdxlNq/Vo
EIyEX0OzmNb+4J/yuSj81bAyLNwoQykP6TKoa0NoI9hoz+QPO+U6AMdLQsOyp2Ur
1zphLXIllHocHMTM6JO8jLHsBPSKLBRfJ7KlB3D5iawsOYaF9ovc1rgCtnCMuKPb
hEzuZwmavf5HupWetDgR1mUPTipF0im2nfHvavDgrMdkUHLz8sEWhvRv7cYzaHIG
h5UVZOulRxHpcxy6bMOA1OwzXBCAp7gq3+LJNRpII4NweD6l08Th6aEO96KC7SKs
Z4SgKDB2KEbmJy4Tr0+IZa97GaKNtTXJsfVDRbbgmX8SN5xn3/YHLrkOQxCU5KuB
6tfSH+JinuUBY//TgZ3EmMWTC3S1d1fb8qWG8QgziMqqNA/7ibMgH5UO3uPqXzkN
rZp+83EkW1uboBm4jt9E
=9fWk
-----END PGP SIGNATURE-----

--=-Ora1ViZxeJ8Db5G7TexF--
