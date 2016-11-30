Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT2PW3dLczDrBx
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 12:09:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BDfKDUEM"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="t13WgMS5"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 71B8920689;
 Tue, 29 Nov 2016 20:09:17 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Nov 2016 20:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=FnI/7iRG8GzHBTUN1BHhXebKUWk=; b=BDfKDU
 EMpUSMFtO+tS/6KqDgn8r7jIf+k6ReUedNKXzBIe56KKZWg0lsO1gSIK7h3kktaz
 phgf0ZD16IqomOPedr1k4eYTRCFqhfwwz7MmtBSNeXoo33Fnd44OvLLwjWnHB837
 SlMbW3PYSrlqO7TkV0Y9nir14uDcidcZ9rImE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=FnI/7iRG8GzHBT
 UN1BHhXebKUWk=; b=t13WgMS59cMOhtDvZyzZQpn3wBQ+lIiUAEGkOoV16buLFJ
 OQxAwzPymDKeFg6MReCOfTiRs5WY/u4MqzZ/jjsPOY/aaXiywpnl89H9RcrbEbnj
 mhxnVjny+xdKRS1UVTiw2sPlJURHL/rE86rXHDSNl8KEXS3kkfXltFN2r5m6I=
X-ME-Sender: <xms:vSY-WI5Sf6DEzO4XM7ayhT1Rf4ArMGxUapEyE1K-jj-S4Eyzcx0U8g>
X-Sasl-enc: dcLMs87ur5DT3W+8coQj5fantS8sbXhvJBf9sAxRDhu8 1480468156
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B63842415E;
 Tue, 29 Nov 2016 20:09:15 -0500 (EST)
Message-ID: <1480468149.2503.100.camel@aj.id.au>
Subject: Re: [RFC PATCH linux 0/9] On-Chip Controller (OCC) hwmon driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames.ibm@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 30 Nov 2016 11:39:09 +1030
In-Reply-To: <CALpMbd=ORWLG-D69YBr-xZ_E1zm=JtWKjeWWuMjw+sLFX1NbQQ@mail.gmail.com>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <CALpMbd=ORWLG-D69YBr-xZ_E1zm=JtWKjeWWuMjw+sLFX1NbQQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-19jeV2Vsp24hvSn6YVeL"
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
X-List-Received-Date: Wed, 30 Nov 2016 01:09:20 -0000


--=-19jeV2Vsp24hvSn6YVeL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 16:58 -0600, Eddie James wrote:
> Hi Andrew,
>=20
> Thanks a lot for putting together this new patchset! On the whole, it
> looks very good! The split between sysfs, occ, and hardware transport
> layers is solid. I'm pretty satisfied with your modified structuring,
> although I had a couple of comments and questions. I'll send those out
> in the applicable patches.

I've just finished replying to your comments. The most controversial
one was the cap_names/num_cap_names problem, but we have some
alternatives there.

>=20
> I also tested this on palmetto and barreleye systems and fixed a
> couple of bugs.

Great!

>  I went ahead and put them in a new patchset, which I'm
> about to send out. For reference, here's my only diffs though:

Good ol' void conversions eh.

Thanks for testing!

Andrew
--=-19jeV2Vsp24hvSn6YVeL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPia1AAoJEJ0dnzgO5LT5NHYP/ROSihYGYVRTyiaoWPm8fZaW
IFMuoq1YRqFtDy801nEWayyl62tkfbHWSVVbhzen3GeMZMRVgm/1Z0yN9ockUX8s
l1cnFwhs+o4BvCW4HJfAclO5PkZDrwyoU572wDO8goySRle/SjuQt33PSfnLe1s6
Akyl4OOqBAg0FRMDHLcKv1Tjj3qKMBuI9w1OX+KP2aQYSrx97mHGL+vafGdiJkwA
NL1ARK2LSd6trQZhu653bjuwDgKePPNzXDIEoSjrANo6mq3dLv4bGdminV4rRuzT
nQbr0OjL5tXC4JIL1HARVPfvVXWXItZ7VuNFpdfgDrndw1of2J7RaYTbeDEU/6QY
LIccZFtacSOiYFinv6Aqbt+xJugi5ZUZyoplyolpv/Y6+2HGk1irY+CLkMNJIeKI
B70kZSQKux6Y6eKRnjzO8t0JFgPXy8GGxA2VXAJSsoskTrIYIRpEvjbu5vEW81BS
OU8+oTK4oUszioXurmfIjRz0fXA7HMwhJv4Nxnhdb7h9K3wmUi3ymBFJXA1pw5jB
7WtNMLG4GMb5Qwp5xOzYPcDYDoOJ6aPGANybOA9hc8bikxeJdSHEPpft8JRG+Kos
dUcUUj5Au7RbU+vofK7kRObFNFtkL1kMkXsK+M1hpP0AAZi8vRdV7CiYKSgBy3eq
D/mokp+ljShauoqJugKZ
=Jx05
-----END PGP SIGNATURE-----

--=-19jeV2Vsp24hvSn6YVeL--
