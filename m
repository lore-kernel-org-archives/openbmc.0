Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNl7w5nsvzDwC6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cZ+CSX8N"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WG66nuhM"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6872520483;
 Tue, 22 Nov 2016 20:27:38 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 20:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=1pDNshccjMZFUsWFwC4WIp8mDk4=; b=cZ+CSX
 8NnZ8Di+6AmeidPknIY+FBfVkLF5f++F7YzjLbUmdZnSf1FZcYKqesauuC0XTEF8
 0htaQL3tZzSQFCfGcKgE6Ypr1hVWLyWU8meFb1Ue9nhoYDH4BudsIVwpSk7Jz+aT
 R7mvV8s1DBUjvSerdRvIoLgLEc784j48j2r2M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=1pDNshccjMZFUs
 WFwC4WIp8mDk4=; b=WG66nuhMS1iruPZI2ebMUMoF1WDyEJd2RWQNsW7xMwGm3c
 hnqGV9CAdx2BF91Zx5N2foLtQVZWXJCgMYdv393gUXPRh4p3LE8Y/mHerKev+y9k
 1Wzcb7zisK0rmsW3xeIoTBn7DyYuM72WlGEexjCoN+xZfAYB/M0pH7gVI31NQ=
X-ME-Sender: <xms:ivA0WP8N4eIWNu30OlrX9FkDKBMZtVsS92ZKV8vLzT62o4qd7k6iIQ>
X-Sasl-enc: SbLBJQe/pU67/jo4yncIVWqPwwN88WSVmWSmXHB38KTG 1479864457
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 227CF24066;
 Tue, 22 Nov 2016 20:27:35 -0500 (EST)
Message-ID: <1479864451.2503.46.camel@aj.id.au>
Subject: Re: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>
Cc: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 23 Nov 2016 11:57:31 +1030
In-Reply-To: <16ff25a6-dabf-0075-684b-37799ed5abab@kaod.org>
References: <20161118081221.19651-1-andrew@aj.id.au>
 <16ff25a6-dabf-0075-684b-37799ed5abab@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6Bg8pT8gzavRYEXGNE3g"
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
X-List-Received-Date: Wed, 23 Nov 2016 01:27:41 -0000


--=-6Bg8pT8gzavRYEXGNE3g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 17:45 +0100, C=C3=A9dric Le Goater wrote:
> The palmetto I use runs v1.99.0-275 and I could not boot the system. Unfo=
rtunately,
> pdbg does not see the P8 chip so I really don't know what it is up to.

These were the symptoms I was seeing with the tip of master on Monday.
I haven't looked into whether or not -275 is ahead of that, but have
you tried fetching/building/booting again today? Some fixes were
applied, but I think Joel said there was still some flaky behaviour.

I don't (yet) think it's directly related to the hogs patch.

Andrew
--=-6Bg8pT8gzavRYEXGNE3g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYNPCEAAoJEJ0dnzgO5LT5H64QAKX9oZ6tNHWHduR7sQFtI+yv
9fl6eUztNNthILO8Kp/ujBs3eziZdG7hwnKOedzuWle2gIM6cVNBqS+FlKSqzvRo
875Z35Nz8PD1X2WHSUP4jKXz5ZjvUbS5UnKt9MfMlZLbswnBO9NbkzTp/Efr500v
C14S2dvQ0SIyywBxjVMCLeg80ds8j7WYvQrWpbxOZmxg+vOIKGluvBs2BMXZBa5f
EWGTdCRdohwSxbSx++/oxV2xfWoErEgp7WtRK3S3Sku32vgwmxbAgGn/mayH+vFq
xZ2doCjCol4oeu/YE/UnMyIkXlKFgecBG3rN6uOL19mTaW/RU4juvQHwckvox37A
KAT5tka5/y3L1BnNqgoIW6nao9dat+7HZ90oP1ZXitX0gr/45MIT3mSfuoXyssYZ
jkVquavpsPc6pK7wTsVMN/RT3pWqFe1FNAsKyTBu8pbkDfq3goiak3A+PMOFkLZb
Ja1NA4ssbQ+adJ85BT0Wuz3sehhcCNXDoeHbpym74EDH3AxH4rnFZThRH9JF+O2s
iy21OmVXYyJpQHpSzCYII2ft4+FEiyviEPAM1JO748jIg73SMb9R6T/NfQgBkewb
hrWu5iaAWGOdw7zvv6gCUsHKXHLV/f1ZlCd/gmyRICg02c45Gyh3TmwjP/M9V0lS
QGCbw2RyZoFi16L/p0Jk
=Uz7a
-----END PGP SIGNATURE-----

--=-6Bg8pT8gzavRYEXGNE3g--
