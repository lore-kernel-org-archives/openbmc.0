Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdMxs2KkNzDsMT
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 09:47:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=jnvgUnaA; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Frdvqqzr; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 252202079A;
 Mon, 19 Sep 2016 19:47:27 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 19 Sep 2016 19:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=CJyTx
 6JwIvCpOcwTBthqHZY6qRU=; b=jnvgUnaAeRpNq5xCKls6WDyLG149wDLmC80aa
 CGodVCnD9ALTqMg1blwzR0azYZ/i3sV4cQOgyz8WweZcQOzqhp6HJ1UzZqrDDqaQ
 VGiCjS3bAcs5U8SLMPUqiDtJLfgS9sLVLW3ywJmhScBJFN02vtpR5OmjmvNX+hkS
 4aCZvE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=CJyTx6JwIvCpOcwTBthqHZY6qRU=; b=Frdvq
 qzrdIA6pnMAHkY5evZgu7xL1luVWta/tdO9gXKGCg6yZ9mAp2Ye9ATkaMC7jkfpC
 ZBQAwgi24kpZcfzS2bdK/pzZdZ7vhFcISnUCjhGji6lmXFW3p1opAGoYNYzH+99o
 wwltMIG95susadpmsUGGwsqRJrrffoZZmMtGoA=
X-Sasl-enc: AGpjGSzIRCby5dgjkOD9KqyQHd331DqJQNf9vUxmjbGI 1474328846
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id EA8A4F29D1;
 Mon, 19 Sep 2016 19:47:24 -0400 (EDT)
Message-ID: <1474328837.13249.61.camel@aj.id.au>
Subject: Re: [PATCH 03/17] Ensure that the old style MDIO interface is
 active before registering the MDIO bus on Faraday style MACs. Without this
 patch the hardware may continue to expect new style commands, yielding MDIO
 timeouts and general lack of communication with the MII.
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: openbmc@lists.ozlabs.org
Date: Tue, 20 Sep 2016 09:17:17 +0930
In-Reply-To: <57E01A37.7060103@raptorengineeringinc.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-4-git-send-email-tpearson@raptorengineering.com>
 <1474246308.13249.46.camel@aj.id.au>
 <57E01A37.7060103@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9zdKmGoLSWShStSDlvJ2"
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
X-List-Received-Date: Mon, 19 Sep 2016 23:47:30 -0000


--=-9zdKmGoLSWShStSDlvJ2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-09-19 at 12:02 -0500, Timothy Pearson wrote:
> On 09/18/2016 07:51 PM, Andrew Jeffery wrote:
> >=20
> > It looks like your entire commit message went into the subject...
> That's what I get for using git format-patch and git send-email.=C2=A0=C2=
=A0I
> can't wait to find out how those tools managed to mess this one up...
>=20

Are you generating the patches with `git format-patch`? If so it
/should/ spit out a well-formed patch ready for mailing, and it seems
surprising that patches would be mangled this way.

I'm curious about what the cause was; if it is one of the git tools
please tell!

Andrew
--=-9zdKmGoLSWShStSDlvJ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX4HkFAAoJEJ0dnzgO5LT5XXoP/i/rcSAF6NYJN1mGtf5LVcKr
wAM0PVOzjgebG5NsrkIkLvUlYCH3/QYETlfls4UCUnVjVcLogByh7Y1vme8Rlx5b
WTChEiDzZJ+WfgWhJu2BcUucJ7G7+4y1rqOw1krOycUPFAX781D/LB64OOyc7iCx
nr7VdFLegMg4dWkbZ3PPNQXokrNHEQsxwnZHi1QMUEeKjk8HKFg1AhsjIO+50UAx
Cu2QftMRnaH/OY2jveCKuzMOfyeHUsSfZK0PkVo9I7nPGWPhWVjT2wUhbiMYPtO5
CNm9eXl4KKG60ynGwjUpHnjFhwfNwnXlSKVKBaY1cGR6PqDE/V/1yAibaoAnsnRd
7P5JQ1kZgB3tWGqh7oyXYbOQuUdxFz9jS8mTpV2DuMw0BynjNy7PFlUx+B5k0QCA
h7RRN4dqAL2yur7191dSV/mFrABla9qYDr1EKE7AEXQaSveJf2qPbJN/102pYAHd
Y4cczcIHGMf6AG16g82KfaLtMMViVoMuPbB1ha2/aV4Ys9kW9P16cP5Ch5dqvGB/
9yStN+1n0lH6o2Rg9bN7+XFxrtaXYuGdiHUSgni2UDWxyzaqEEKIOdD3XlfXVXTs
QOdJUXT7ztPb0rNQK8GV7z7ZVoMwxABCzwqvSfbv19JIQQCVZcP+Tdf0yvMEGXX+
Zq3rDVun9bX+yRUOr4n7
=SV5W
-----END PGP SIGNATURE-----

--=-9zdKmGoLSWShStSDlvJ2--
