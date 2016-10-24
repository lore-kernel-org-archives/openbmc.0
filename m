Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2sr93cMCzDvhT
 for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2016 10:27:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=iU/ODbfj; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=mOmI9Kmk; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F88320836;
 Mon, 24 Oct 2016 19:27:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 24 Oct 2016 19:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-sasl-enc:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-type:mime-version; s=mesmtp; bh=uWoQX6uGV2Sb
 rWZ6AXersOw8wW4=; b=iU/ODbfjwcSPe1eWKPm1vKEpmRlv3WKjm+OXvT+Sh6HX
 kzCtt6vVJHpGm/oCYjXAdW1z5eEHQzY1XbPMHC2wN2OD5ZoqcGuxemqGrUFPfj5T
 5Sj+FxbzpHIami85OuTmADytjGYPLNAmEfNTr8QymDb0Dy2cJQFs06mxuWvjjnc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-sasl-enc:message-id:subject:from:to:cc
 :date:in-reply-to:references:content-type:mime-version; s=
 smtpout; bh=uWoQX6uGV2SbrWZ6AXersOw8wW4=; b=mOmI9KmkqFa7QB3iDS+o
 VYwws3rDfSmJAKHwk+TP9afMq05qS5l1q7y1EOpXZas2/xpQeUAayxr7FI1Cj/Hv
 GZ1bIiC0vjcBT5SIWMzruYBL3rXcI5HGgzfvHHzB21w/Oqq795udlNr+/CRnD5br
 qrEUObZhhvB+4lK/HO6XLJ4=
X-Sasl-enc: UViae2cudeNDlg/tQlSyfGJpRze8trEmZ4rjxmpFCHch 1477351622
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B1B4F29CE;
 Mon, 24 Oct 2016 19:27:00 -0400 (EDT)
Message-ID: <1477351614.6373.64.camel@aj.id.au>
Subject: Re: [RFC 0/2] spi: aspeed: SPI1 mode control driver enabling sysfs
 control
From: Andrew Jeffery <andrew@aj.id.au>
To: Kun Yi <kunyi@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brendan Higgins
 <brendanhiggins@google.com>, Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Oct 2016 09:56:54 +1030
In-Reply-To: <CAGMNF6XdMYX3ZTxtna7ueJcBfpvi=aEF8kaStJgz_pwY0jP2XQ@mail.gmail.com>
References: <1477097158-139095-1-git-send-email-kunyi@google.com>
 <1477278307.6373.52.camel@aj.id.au>
 <CAGMNF6XdMYX3ZTxtna7ueJcBfpvi=aEF8kaStJgz_pwY0jP2XQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-iCrNKwKv+LppauF3I8QY"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 24 Oct 2016 23:27:06 -0000


--=-iCrNKwKv+LppauF3I8QY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-24 at 14:22 -0700, Kun Yi wrote:
> Hi Andrew,
>=20
> One question I have though: I think pinmux/pinctrl driver is supposed
> to be a boot time static pin configure module and parses DT and
> configures accordingly. Is it possible to use pinmux to dynamically
> modify the pin states?=20

Yes, see "Runtime pinmuxing" here (at the bottom of the document):

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docume=
ntation/pinctrl.txt

So you'd need to patch the FMC driver that Milton and Cedric have been
working on to (de)activate pin states, likely at probe() and remove()
(this implies you'll need to somehow orchestrate a remove/switch,
switch/probe dance). Alternatively, provide a way to suspend operations
on the MTD and switch the pins between master and passthru in the FMC
driver. Some complications are that this functionality is only
available for SPI1, and you might need to do a bit of work to guarantee
sensible outcomes for operations that might span the mode switch.

Cheers,

Andrew
--=-iCrNKwKv+LppauF3I8QY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYDpi+AAoJEJ0dnzgO5LT5IJ8P/REzg98NjjwDeS/WSXciDCiA
53IAQs1+2fI1nADT+ToNmjxNnxGUdaxysf3K5j7ECqKf7+YC3Dg+PJTkilWSVM09
jTE9C7iJ8FfrjToUK22Vwk0lWcbBTFpJ/A8oAD9zAhIlGd6JB72X6sxcIjYd9SHA
d/Mk239Qf2RArAGnKMh9ix6Vn4KqMBjXS2C60coQTPZ+KP/JODChF/RPmYpNKzd2
zGbn382JJVHEetb8fM59ApOz3JQ7Q13Y8+AF1sFb2aFhchr1ASyorSVOGOJ37hny
+toqSuZ7Xhf/RBsIbJ8KM7ko50F8LPaOPqJaz1i5GME222d9qKXClWpoTbpaa5aj
qa6uSpk+we2jVMhR1nRROkGRYgTCWLM1xRL74+yLuZrDExa+exZrZW41jhTmbixV
sZ2jZV1vu+yII7vMyy+hBBZA2GDilJLeta1UpVMTuvvEXFI5gYtoGQ/7hdOVnIO2
oUxn/Bre9Ngx6oqO+xtQa0Vplib9K0s0fQTraB46COv3LiuinaH7mc7pkMf0tVTV
c7tcT04M0smwUWSuZHBI4upkDFdiwEn9N1zHM1iGnn78hfSWpLsDdeZKqKNooD/+
qostZxge4wbKufU22GUV2hB4cDcUyjPlNWS+dupdcM0Se3kVaYiQ6kaT+VnBQ77K
PEdThCnYEGJYybCx8YXb
=xCAl
-----END PGP SIGNATURE-----

--=-iCrNKwKv+LppauF3I8QY--
