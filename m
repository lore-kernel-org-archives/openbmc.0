Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh47h2FNrzDqGr
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 16:06:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="YFv899nj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eVEr9Sfo"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 902D520C59;
 Mon,  5 Jun 2017 02:06:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 05 Jun 2017 02:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=JtCY1TOWvOCSC161PqQi1QdP5XIhwGz3k2T02HR+a
 Ho=; b=YFv899njSxediojXvl2QXlYeU31l07tCgfWOxG14RyihkBxpWxW6Xs717
 CmZYdCuQWExCBd0cM4NYI5IwMi7ZDcTcBgLZv3aopgERsYbbu4ehhy5vmdg3P35Q
 KJNlS6L3PDl8mfyYpYTqpN+InfcaR575dPidOKUnVUYLFOvvxShRVYE6Rx7uoUc2
 ZCtcaXC12Lvnjx7OSvGAJ5VQqpcoTXdcEaDlJ3mC7yPYDJb4zajoTFDXTTmzX3oO
 biNs2Hh3lwNQoxY0+FjdBB4ZSCg79OfureQ1xrWoImdTLFiisECy/XFnMYpKJyUo
 Vy7kngcXfH9eotND6De52mWxnFVcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JtCY1TOWvOCSC161Pq
 Qi1QdP5XIhwGz3k2T02HR+aHo=; b=eVEr9SfojGMMnU+N5CVGLC8OQWtCKfnBrn
 3ZhlOqUmsrI1cMicrc/3uigu8sQ/ItjZ9A5W2tRssZMdTiTE7OJTeykP5OO/uHds
 b5vLZr/Ex1xaxxcZk2dR2Hv8hE7DrTLl+Gwm6gkrggejx7v0WQLW7BbrzcnHRLz+
 FFuH7vsbTdoVio9DOdtWQxSQTKBcno3v5ZGNkmj5vkEWSsLs1gVfy7XuoYwsmcIY
 oBwgzXuNvwBGFk5Rk0I89X5/a78Gj2KQug8geBHVe1evFZsfMhJFnuRQ3FUDpULG
 vcTH1KtKw4TpIkjdYR4vsoUdyf2GaTxGqdKRPUaGAwG0DjysIsbg==
X-ME-Sender: <xms:zfQ0WXIQJsZlenxpVomlkZBRQ3vUAr7Mit_Q8Obqut-2jkrGNlWbyA>
X-Sasl-enc: Ks8v51cWivsQYTpxDBtraiIL6HFEIXnJH8cM34Onl1Jk 1496642764
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7840624407;
 Mon,  5 Jun 2017 02:06:03 -0400 (EDT)
Message-ID: <1496642757.8159.22.camel@aj.id.au>
Subject: Re: [RFC PATCH linux dev-4.10 0/7] Add fast rotor reads to MAX31785
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>,  msbarth <msbarth@linux.vnet.ibm.com>
Date: Mon, 05 Jun 2017 15:35:57 +0930
In-Reply-To: <CACPK8XcGGbbsTZ+pv3xhA=ZRUPeoZgp28U3DvvnMpxtqEhrQkA@mail.gmail.com>
References: <20170602062208.15999-1-andrew@aj.id.au>
 <CACPK8XcGGbbsTZ+pv3xhA=ZRUPeoZgp28U3DvvnMpxtqEhrQkA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ATIdOLHcxoELwVvTqS/+"
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
X-List-Received-Date: Mon, 05 Jun 2017 06:06:10 -0000


--=-ATIdOLHcxoELwVvTqS/+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-06-05 at 15:31 +0930, Joel Stanley wrote:
> > On Fri, Jun 2, 2017 at 3:52 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > Hello,
> >=20
> > I've dodgied up this series with a patch to the i2c core to make the fa=
st rotor
> > read documented in [1] work. Thus, it's an RFC series. Further, the fas=
t rotor
> > values are zero on the machine I was testing against. Maybe I need to b=
roaden
> > my horizons and test against more machines, but I figured I'd send the =
patches
> > to get some "internal" feedback.
> >=20
> > Timothy's original patch is reworked against the new hwmon kernel APIs.=
 The
> > rework made it easier to support both the 0x3030 and 0x3040 firmwares f=
or the
> > approach I took, though maybe there is a better way with using the hwmo=
n
> > attribute visibility modes. Further, it's still not a pmbus driver, so =
it's
> > probably not yet acceptible upstream despite the fact that upstream sti=
ll
> > doesn't support fan control in the pmbus core.
>=20
> Looks good.
>=20
> I suggest we send it upstream with patches 1, 3, 4, 6 squashed into
> one. Make sure we retain Timothy's copyright in the header.

Yep, it doesn't make sense to upstream the exploded series. I'll squash
things down and rework as below.

>=20
> Instead of using your i2c DWORD hack, use i2c_master_recv to do your
> four byte transfer.

Yes, I'll give this a go. Quirky (I2C, not SMBus) code for quirky
behaviour seems reasonable, and less hacky than inventing non-standard
transfer types.

>  Call out in a comment or your commit message that
> the smbus spec doesn't define a 4 byte transfer, but the device needs
> it.

Will do.

Cheers,

Andrew
--=-ATIdOLHcxoELwVvTqS/+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZNPTFAAoJEJ0dnzgO5LT5Lg0P/3pK5htO9K3L19dQK7LU+ZkP
WZC1pFIYrD/WZG/6qwcWdLZ8dobh8cAcBvBxedEZKPIQGSmYEpuksICG8oe0hlF5
mcWLDUuLGN+R+HJ4Q0568PFU9Dd0Cs6zfpfcjdfCqd39XhIrIgnH0qoXvQUXBd9i
6kQQ96HfbgYOvgqOiewAr4RVhtxGHi0spgs+SxKkNf1ehxu5x3eMd9eqEd95bAPB
Vk3/JmvOVvnStgzwGQslzUFVaX7IWGtU4WBF2DY95UBXFSmFk711YqbEzQuHHcrC
YTte/0MR1KEWfcJfOBBIncH5LF5x7IquMOgGtQyCxbebMZNlv5JP/38FIBs1NO0O
0VvU+PpE+Ra/ZLKRbGunhB7Orvn+DVl5dPLYbZSoKNQVk+M8nBmKepcbJFRKgyr0
/d7Tpooj+FlxIhD5yUGOt6T6cdPGvwONFSLTlUlxXMQQHxqcSXFMDkl7TXdQ5vz2
LebMa/Hqts/nlWEUYHB4ZwdVPDyf5YwKJ13Ca7aUwnduk/5PoE6nrQAPMfhcXZJK
ZD3w4FC4GF+GP73/DOyHEJtl0ZiQBSsPlIW+dA1Tu0ljE6xTbJbvj8UWgz0O8aRJ
C8PfThIxii2Alire8P34ZJGNqe1iz7OqLqupDQIqG73YaHYY2Z6ERanZmh4wAv3+
gKIj84OLi/IzZqUol00W
=ftsq
-----END PGP SIGNATURE-----

--=-ATIdOLHcxoELwVvTqS/+--
