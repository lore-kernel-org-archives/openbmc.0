Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4lXR4NGwzDvQC
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 11:49:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ejeYrMyl; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=RmrHkO8I; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E484820963;
 Thu, 27 Oct 2016 20:49:54 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 27 Oct 2016 20:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 tJw18jQGHR3gORUrmTOS7+w64K4=; b=ejeYrMyl6nbMNDXTyIRa53ddQ+o0IGLg
 3kvA7DYxMRLEfr7EK6gUpDHIB6l6b5iSHd+WCq9r19gKepuQ1fanfhwpX/f4kUK4
 Sk1YhQ9/A+NFEErTuLwejOHrNC8pb8JFo+7C/x80D1hN2DbH/KNhmi59/zfEFy7F
 4zF8u6yRSBE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:cc:date:in-reply-to:references:content-type
 :mime-version; s=smtpout; bh=tJw18jQGHR3gORUrmTOS7+w64K4=; b=Rmr
 HkO8IUMYTpCFCb0BeNTZkHyiGvgJRjJIEd/gFCKDEG+HlskaN7Eihi5fTym5Msuq
 I0HpiS6eiD3QuRWkUCTbpjOdiRymHCMJpyERnkBc21Gj/2eKOaoftKpz/x5LequT
 QUvq9+YJwSoneb+os5XFB+JDBbl5/7BDhIiHduk8=
X-ME-Sender: <xms:sqASWKqpX097mfSFUqd0JTF8BGaTQi52HUgKOImTWREpVhQ7aw0TDQ>
X-Sasl-enc: Jy1UqtXhycD+m00iSq2Arrelgl4I/6rMtXBHuFk49o5L 1477615793
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B207ACC027;
 Thu, 27 Oct 2016 20:49:52 -0400 (EDT)
Message-ID: <1477615788.6373.186.camel@aj.id.au>
Subject: Re: Aspeed PWM driver support
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>, Jaghathiswari Rankappagounder
 Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 28 Oct 2016 11:19:48 +1030
In-Reply-To: <CAPLgG=mLquJBFOCvxgCWmtOxaFUBB4Tw-0p9rj=3t947xDPJoQ@mail.gmail.com>
References: <1477611622-28120-1-git-send-email-jaghu@google.com>
 <CAPLgG=mLquJBFOCvxgCWmtOxaFUBB4Tw-0p9rj=3t947xDPJoQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HPDGgXglSAR+qO5S34+O"
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
X-List-Received-Date: Fri, 28 Oct 2016 00:50:01 -0000


--=-HPDGgXglSAR+qO5S34+O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-10-27 at 17:37 -0700, Rick Altherr wrote:
> This cover letter doesn't have the normal formatting.=C2=A0 Are you using
> --cover-letter with 'git send-email'?

Some more words would be good too. It would be nice to have a
description of the relationships between the drivers, the state of the
code, the amount of testing done, and any hardware oddities that hamper
the implementation for example.

Andrew

>=20
> On Thu, Oct 27, 2016 at 4:40 PM, Jaghathiswari Rankappagounder
> Natarajan <jaghu@google.com> wrote:
> > Included :
> > Aspeed PWM controller driver
> > Aspeed PWM device driver
> >=20
> > Todo:
> > Aspeed FAn tacho driver
> >=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
--=-HPDGgXglSAR+qO5S34+O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYEqCsAAoJEJ0dnzgO5LT5eY8P+QFUNE2f1oEYNs0fgKjXlOpV
WWqFo/+FK9iWciUz6URATwgCJnnmyD5JGW54n+egP/RXIsJ2xTU8Ay71w9XwrRlG
CfTT2TVA9VaJl2I4DU93otw6zCysnZRcoAC5HUb3aMGDT7edqf4eV05hSsWz/o12
6qL5Wto5gGoFiUVUd/BrZNp/4/xdguSTQXl+zKcr+OWfWHkNdNsIU8KsiXaIeI4w
OLEZPVcNFIZKQmzS+PE0h7AmG4e+NdWaSQ+qu+V+8z1B7d5ja6Rgut5uaeWF0mgY
No4Yxl8j1gsiuZmJC88lTjqvgKaD7MZJBnEGBlhAL9XiU2omGwk+9au+oe+NT0AL
S0l4iI9y6pER3LSNVgvFNWQ4Em9BY1IL/hRRtBiPiq2GFykEq0BACRhWDrrpJcNY
lGvsq5mvs14urXmyv5xs5Qvpx30m05az7HILS1W6zCE6UTFgnDeMOMwDwz5KB6Yz
4LQXDBG3vc/I7AhUkTlR+diUZeb3wt0b70eYJbfKv1DB0tzDydcTginKh2VB4FHG
0+xdkIKOchbVl7JTbrN+L5apTS8XS0/uMmFZwlR3+JOBp+5ioJsFHELDfVxfRN4Z
KXAveEPkbCgeN1f7M5QnGdCXDnkdFI+0UXrV3fplKXHjmNAGv9gB12TAW95U5YJ7
AseA0EEx0DZX0MF1+tl0
=5+1T
-----END PGP SIGNATURE-----

--=-HPDGgXglSAR+qO5S34+O--
