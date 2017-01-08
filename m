Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3txZrs613WzDqPG
 for <openbmc@lists.ozlabs.org>; Mon,  9 Jan 2017 10:54:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NIcaWjHj"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C2iKFpLP"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 863E1209BF;
 Sun,  8 Jan 2017 18:54:31 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 08 Jan 2017 18:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=SG1qHJsLLzZoCxDjSBtej9JTxlU=; b=NIcaWj
 Hj6EqRUkLbRRgjSPY8xcgyWzKuirdJNun91oBggdBdUanl6K8XUTtMyQA+xEM6er
 Fkz3Aaafyy4x2UYkCIYCv6+DTB2UFFRTn7joimJJqeS8rmCaErbtKk7GBZm+aOjM
 cZC48YwF2BA8d69wh2oVu0QUmJqQS5UWXoY/4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=SG1qHJsLLzZoCx
 DjSBtej9JTxlU=; b=C2iKFpLP7FZgMCFtFHC/afdSEHAC34cZispBIl0Ua0gVs5
 1U3n2c3VKxMRPkbrl5Rwd4c7oconQHACIRX60+tyCLqorrmX1kMJncOcK60QlMoo
 URsYwShWs7EIbnLmgE2ElFYQkBEEPol59EGS0K9tNyWB5lkHTc9ikEzFMwtB8=
X-ME-Sender: <xms:N9FyWP_B4LcHrrHlLTXukykbo7z9pEOqfiVuOv2iUixgLTgrmY-TQg>
X-Sasl-enc: DSFeZswMlpleak0WKns8geePc3atpskxxe26yatFagQl 1483919670
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DA7224462;
 Sun,  8 Jan 2017 18:54:28 -0500 (EST)
Message-ID: <1483919664.2950.3.camel@aj.id.au>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: benh@au1.ibm.com, Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Mon, 09 Jan 2017 10:24:24 +1030
In-Reply-To: <1483911846.15843.60.camel@au1.ibm.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
 <1483406661.7801.1.camel@aj.id.au> <1483911846.15843.60.camel@au1.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-N+8szvZQr8rP+MEAj/Ri"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Sun, 08 Jan 2017 23:54:39 -0000


--=-N+8szvZQr8rP+MEAj/Ri
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2017-01-08 at 15:44 -0600, Benjamin Herrenschmidt wrote:
> On Tue, 2017-01-03 at 11:54 +1030, Andrew Jeffery wrote:
> >=20
> > regmap_update_bits() will just write back what it read for the
> > untouched bits, which should be 0 in accordance with the datasheet.
> > It's not really a change in behaviour as we will still be writing to
> > reserved bits, but I think it makes the intent clear.
>=20
> It wastes cycles though...

True.=C2=A0

That sways me towards leaving it as a regmap_write().

Andrew

--=-N+8szvZQr8rP+MEAj/Ri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYctEwAAoJEJ0dnzgO5LT5VSwP/j38Wvn8xn8BKl80uv4anl8d
uz8VVSrLnaYLzauwbEWgbi8CJUuOvPeoFVn5C3jsSZlsINS31q7l7CGZmT8SEtvu
3f/TYADmmEt0S1Q9N6auBs6ttoyYr0vFjKwUh4KXbhG7vlmYiIcjDp/ZRPXoaDiZ
xvupo5Z+3G6flaRw5KUqxZP1QmJYqkYhkR+49GzTP6yWjU/x4fD9LHeQuNy+znYm
47ShXx6WtQTjSrqKnIoGrc/PuWeUiOtX/+sNUPedrtmylUfhycKNVVWH6Wi/KQ8Z
cvqQCQaC1eB9zqrS2DNbRY7hmQm/I5jDpNbKqmgU+m7CFMh7oYhHPvBf2YogaWMq
FpTlZFdpWAav6x7Hv/3lq9Xo9LnCVE1hoAoC93FCNddOUWj5bdE2y6WibkL5/PF5
jlWG+udlJ+RSmlVF15Zv3gcboHml8RT9Q7iHJVNGaCVk039zK1pCBAKe3QKUPPRf
CGn+Hku2IZ7hZSYcarpRY/4xg6uaXk9zCaOX5V9t/vsFKVeeFC38NI9S0B3b/Lgw
BMYdDeJRpWe9+ABguOJ0nUvsDXcYwOvvPv710nOEnwxlReUpvnfpLdn3EopAZbtv
zxwSt9tAHiLq5GFOxldLNFzzKhq0EDMmsccItmuZWc0sBnHu7UKK3b+bGiDu993m
+nrU+Brk7V8bvhVggI9b
=bvaU
-----END PGP SIGNATURE-----

--=-N+8szvZQr8rP+MEAj/Ri--
