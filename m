Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttWmX6BdQzDqDx
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2017 11:25:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UlelFcQN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TLXE5naa"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C6D920DFD;
 Tue,  3 Jan 2017 19:25:14 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 03 Jan 2017 19:25:14 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=PTZIhFdLFMaq44yDkMYXXumfvKU=; b=UlelFc
 QNDKNF7g3rjXaSEY/0nFNDZvyUIf+JoVHtE58I4hXjPrrDkb0ddyAfER+pKl2tqK
 oA74YZrB2GPJ6rtOhGCgmYMS+8nkX3bo1z8dRVskg2TLTwnHXPZp59tze/pGZ4wM
 UjKSmScNcM8N/dlIBxBFUE1UW/UEqIjoLDIls=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=PTZIhFdLFMaq44
 yDkMYXXumfvKU=; b=TLXE5naantus70M/NCYYuxkGeR8nugHtNG8ScRD9wda48f
 mO3xPIOOGAm4haq58Er1tatCMuBvyiil1loafEq+cDwTjbdbDc32jl6PU8dpQjwu
 l9m+AXjPmeHdQigWnIv+oyf+8aXSLjNBCYsqW5hA+TeLFHznCmcVR5aqpj3Sc=
X-ME-Sender: <xms:6kBsWExQ8-IsqrZ3QRMazg25Ekna28Yw2Tg-w02XcvqW4rq7G9BoQg>
X-Sasl-enc: nFHecy1n9kFAJ1yNq9tgvsS2M10MxdaxPobYSW4pam4n 1483489513
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9CB424421;
 Tue,  3 Jan 2017 19:25:11 -0500 (EST)
Message-ID: <1483489505.22609.1.camel@aj.id.au>
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames.ibm@gmail.com>, Jeremy Kerr <jk@ozlabs.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 04 Jan 2017 10:55:05 +1030
In-Reply-To: <E8AB41DE-BABF-428F-9F12-5F4FE5DD5BAD@fuzziesquirrel.com>
References: <20161230193404.GB8516@roeck-us.net>
 <42C2BC60-5F46-4632-97D5-E513FF8F3DC8@fuzziesquirrel.com>
 <CALpMbdkw1QQZfDQ+NA5WbxrjCRLh0C32Z5eWjuzbk4sZXxQHPg@mail.gmail.com>
 <31B08FA3-465F-4C0F-9332-0FAE909BD706@fuzziesquirrel.com>
 <CACPK8Xfam48UvwggUuWGD-hRAay7hndnTocprE5Tyw=+Lpd3Og@mail.gmail.com>
 <E8AB41DE-BABF-428F-9F12-5F4FE5DD5BAD@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Z47h7T/rj+mONTAT0st7"
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
X-List-Received-Date: Wed, 04 Jan 2017 00:25:18 -0000


--=-Z47h7T/rj+mONTAT0st7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-03 at 19:13 -0500, Brad Bishop wrote:
> > > > On Jan 3, 2017, at 7:06 PM, Joel Stanley <joel@jms.id.au> wrote:
> >=20
> > On Wed, Jan 4, 2017 at 10:49 AM, Brad Bishop
> > > > <bradleyb@fuzziesquirrel.com> wrote:
> > > What if the driver is built into the kernel?=C2=A0=C2=A0Is there such=
 a thing as module only drivers?
> >=20
> > Our kernel is build with module loading disabled at present.
> >=20
> > modprobing the driver when userspace is ready is a neat hack that we
> > could use for now. However, the driver will need a mechanism that
>=20
> Do you happen to know if =E2=80=98a mechanism=E2=80=99 is something that =
needs to be invented or=C2=A0
> if Linux already has something?

I spoke with Rusty about this and by his response there's no existing
"event-bus" mechanism. His suggestions for the problem were:

1. As userspace is coordinating the host power-on, do the modprobe in
userspace

2. Push the power-on logic into the kernel so it can trigger hotplug
events to probe the drivers, and expose a power-{on,off}/{soft,hard}-
reboot interface to userspace.

Andrew

>=20
> > tells it to bind to the hardware when it becomes available. The same
> > mechanism would be useful for the fsi driver to initiate a scan and
> > bind it's client drivers.
> >=20
> > Cheers,
> >=20
> > Joel
--=-Z47h7T/rj+mONTAT0st7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYbEDhAAoJEJ0dnzgO5LT5GRwP+wSXGun7VRRVFGJjooJKHl5q
KoaSy/4BdZaBkPAcr+T5IdWtzBfXiC/SzPlQzKiB2MVRx3MmRi1+yRLzyS4Wguas
O4bcHI6GmGSzFTypHRZT312lMuZ/bqL27NAXusSQ5dxtiW3RY2zl/sDhiRl3mUXR
8cXpZBt0OTBuWzEz/P2IFv3/WMzKJkX5uWq93RAszehYdrmkXnhA9varuq5dcrsq
V1ikSaHKZHn5eOw/NW6G+fYI4tZek6NK6xPNTw1B7nIIojvCS+eF5yN+ERcYOh0x
MnDSvOV8PnJCA63veZpSmVNHf5kj6jNROxcvmWyzixsBMHqQjlzr6eH7Y4qau/GF
SCj9XN0QzP0Rud8V2kKXSWcj+mGOu1sZBS7GTXVv0LpTYx6yaGZ+wQTB6IXnNYuE
trErTf3NV6pIrC2voZN80XKu5n8tdXAwYG9Hq03pwxOGL24fVIhHExRoVg92ET39
QOEd3G0rh1aLQQQ9zoSdxlrwGpj44S5Bbto2Cx1qX6nWYh37peNYxLJcfvTeX5bZ
hosf50642vn29EzWzMnLxpnKYHb8IcyNGCGPbPMOhyfrUoRofyQMZSdvYnYWVoFD
EBY1aEwH2FTTkjc2VFMkmTNGbZnZgrwTOKY8EqvomAdAWGKBy4iNB0lTJLQJ5TTk
auzzFiHApZTpv6AbFsmg
=7cpe
-----END PGP SIGNATURE-----

--=-Z47h7T/rj+mONTAT0st7--
