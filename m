Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttYk51cn7zDqGS
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2017 12:53:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ANO37tDt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JJNbtpUX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EE8F520872;
 Tue,  3 Jan 2017 20:53:14 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 03 Jan 2017 20:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=c5myNjE4+R3etk2ikEy8WcIPdrg=; b=ANO37t
 DttBbDkXNmv6H9QP++mXDZENpLxExF+pzVKSM/wV44S7e10XOV6Lxj2IPqKTQsZU
 caKLqn9fTXo+bYXBoG7CxArimxmo9cJeKyFMPZpqEFZ58i3hFxwYjqTBs/czQih4
 mJERmLK7HIndgAePgRjZw4yp+xOiu/M7QxpVo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=c5myNjE4+R3etk
 2ikEy8WcIPdrg=; b=JJNbtpUXGeaWc5om4bEJu5Ps9nf8biyjhYyodkuiFUKp0k
 WIhxqvHvCnqCGIKbfRFzL2NI3OtGCLo0MMz01MdZ3Ym4xKAsucjZttEN3g6rMLo9
 nX3S6WKmRXAvtQqQpiyGJzEtVQ0ljWXjs1vQJK4Ld3Ix6NUGaRph8bDLrPxbQ=
X-ME-Sender: <xms:ilVsWAuWrdnLCPMZgHSCzlMe8G-UCfGO-hbHLPBtByu9JMB5pEhlZg>
X-Sasl-enc: 4UV6CZJEuXEaWGU0LDPEtpV+LNdRSIfgbM9Ws3id88KC 1483494794
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1A5767E050;
 Tue,  3 Jan 2017 20:53:11 -0500 (EST)
Message-ID: <1483494787.22609.4.camel@aj.id.au>
Subject: Re: [PATCH linux 2/6] hwmon: occ: Add sysfs interface
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames.ibm@gmail.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>,  Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Joel Stanley <joel@jms.id.au>
Date: Wed, 04 Jan 2017 12:23:07 +1030
In-Reply-To: <1483489505.22609.1.camel@aj.id.au>
References: <20161230193404.GB8516@roeck-us.net>
 <42C2BC60-5F46-4632-97D5-E513FF8F3DC8@fuzziesquirrel.com>
 <CALpMbdkw1QQZfDQ+NA5WbxrjCRLh0C32Z5eWjuzbk4sZXxQHPg@mail.gmail.com>
 <31B08FA3-465F-4C0F-9332-0FAE909BD706@fuzziesquirrel.com>
 <CACPK8Xfam48UvwggUuWGD-hRAay7hndnTocprE5Tyw=+Lpd3Og@mail.gmail.com>
 <E8AB41DE-BABF-428F-9F12-5F4FE5DD5BAD@fuzziesquirrel.com>
 <1483489505.22609.1.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-r/VfWnOWKLrZwS7VAtQr"
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
X-List-Received-Date: Wed, 04 Jan 2017 01:53:18 -0000


--=-r/VfWnOWKLrZwS7VAtQr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-01-04 at 10:55 +1030, Andrew Jeffery wrote:
> On Tue, 2017-01-03 at 19:13 -0500, Brad Bishop wrote:
> > > > > On Jan 3, 2017, at 7:06 PM, Joel Stanley <joel@jms.id.au>
> > > > > wrote:
> > >=20
> > > On Wed, Jan 4, 2017 at 10:49 AM, Brad Bishop
> > > > > <bradleyb@fuzziesquirrel.com> wrote:
> > > >=20
> > > > What if the driver is built into the kernel?=C2=A0=C2=A0Is there su=
ch a
> > > > thing as module only drivers?
> > >=20
> > > Our kernel is build with module loading disabled at present.
> > >=20
> > > modprobing the driver when userspace is ready is a neat hack that
> > > we
> > > could use for now. However, the driver will need a mechanism that
> >=20
> > Do you happen to know if =E2=80=98a mechanism=E2=80=99 is something tha=
t needs to
> > be invented or=C2=A0
> > if Linux already has something?
>=20
> I spoke with Rusty about this and by his response there's no existing
> "event-bus" mechanism. His suggestions for the problem were:
>=20
> 1. As userspace is coordinating the host power-on, do the modprobe in
> userspace

After some discussion between Jeremy, Joel, Alistair and myself it was
decided that managing the problem from userspace was the way to go.

The rough approach is to describe the devices in the devicetree, but
mark them as 'status =3D "disabled";' so they are not bound to drivers on
boot. It is then userspace's job to trigger the binding as necessary,
but exactly how it should be done is unknown.

Eddie: Can you investigate what we might need to do to make this work?

Andrew

>=20
> 2. Push the power-on logic into the kernel so it can trigger hotplug
> events to probe the drivers, and expose a power-{on,off}/{soft,hard}-
> reboot interface to userspace.
>=20
> Andrew
--=-r/VfWnOWKLrZwS7VAtQr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIbBAABCgAGBQJYbFWDAAoJEJ0dnzgO5LT52McP90mrLXdKpOZ7q/Q1FzsWsUUP
k3N6+tXMgiBidE/Zccw2S2WgQ7EIPHg1fUnC86ccICcUFBKZG6azr34m7RpHs8oK
pjY8WKdkvhDWxogxIULKwDIWCMXkV2Lx/bhuaXR8thHdWQrho6HQmduoU1nn1TJ8
YRbpCP1A/A7EzXa9Thdm7ZRqOxm6NaH5h43V1GTACnzn/ooUlbh91AGIINH5W4Uk
QhYZ4Q/fl9EHbVGA0d5eD7bFHWY2PDjb66PHtri81zkmkwo0C2FxfThAC5rjBM3h
sD7FPn0zRAtMw9iR2e19fdyLBtVo5h6q9C1p08jnokJKTiU97tyCcyvDPwt4Bm9p
WDlbpgd/N5xq0HDuCxH5NeB3Abw5b61/NJhVr6RhbqnBPfk/Q6k+WlAIIExKD1zZ
7FbdiBgpNmG/t/yJYWivLAtDoft3OPo4CDb0DEgrIBAY6LEds9Ek9/FV+wt07fwU
37VU48xBFBdKksNdjmPCx4+Qoqb7VtH6TG5NP3NGUPuGfTCAif4+AM8qZxXD2cIF
0GMU9Lo3U+H2ktmT6HxwoFH8bmIRXY6qQ9/QihtYvpiReOe4NGR5wBXPmAayfy1r
ztK7x7WpYBIXjFw152/fAUU7DiDFEmE5J5VoSiTR0kF7NGVwmmiNPLqi8vahwiYK
MXUQxE1rGFiWFISY8YQ=
=2EXY
-----END PGP SIGNATURE-----

--=-r/VfWnOWKLrZwS7VAtQr--
