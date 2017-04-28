Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDhgp6bkHzDq7Z
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 15:09:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Wr98vJQy"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HZcwsBw0"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BFA36207B7;
 Fri, 28 Apr 2017 01:09:24 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Apr 2017 01:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=XjsKMcOXykXCN+T8Pvx27/oZqJ5VduKjpsBF6af8k
 TE=; b=Wr98vJQyOq2kWzZMIIkYyp285/LoNVTVOY5eDGuP4AgYf7/arsavOsOEV
 yheDzbGW8MfoIZQuA/02yc1e1CNHq1TvKMPjaNI0rFy9YWeihYojDMpG7OGgEhbb
 J4fdq1b5Cb2nVVGT8QNyA1kSF/bCPmNT9/0jlAXJRfOXS7VT1hyuDhy+RZlLcR3w
 9HcFVgT+5GyIVojweNuZ3A5CAAKTdcGtnc6QbRtVREoPO0ZTCnHyYoFAL31kASO5
 kNnROv7lPZvSihoSSaWxxZeaoj6WnOxdsWSlhdgT/7ajFLsfLnjAruOfHBmdKL42
 /vUmjyUo9bLHvfxnFtr6VQ1wrR2jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=XjsKMcOXykXCN+T8Pv
 x27/oZqJ5VduKjpsBF6af8kTE=; b=HZcwsBw0usSYEij+bw8+tsmDssXG/oFpN2
 TR3cIjDpCbnomd3ZAwhl+00c4o1fZPUGCCKC9tgfshAYyOgvUnw5jPQUl0mWmMOF
 5TL7u6SBqEuspeLFnOIUbXmysaYP3lt00T9Vm8CYjW/bL16e/tMmK+gtahC4HTDd
 V45C2FkAa6xuG2kwJFrZ4p22BhTHmLqjtxkKtMlIjM7fMDQmCmdEoir6bA3VkVj4
 klOGkAd2D+jfxjF1Ab6T1PxALTgGZEYkYfKe3ijuPnTPbfWDohZomaohJEZgmFOj
 kYKLM/38u+xIHcLtzIGddO75zypTxlhv/ltZuu+L0RJb9A5MQF0Q==
X-ME-Sender: <xms:hM4CWfBpErY6IoOCQBIDA8-I1wi19DjjjzjX25dKDRPNo1vf0ZaP6A>
X-Sasl-enc: locapaKIMz/dNFCQ7SWrvzlANDcScuN73TdkfTO0Ix+y 1493356163
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 082A87E2E2;
 Fri, 28 Apr 2017 01:09:21 -0400 (EDT)
Message-ID: <1493356158.4433.13.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 04/10] aspeed: garrison: Request RGMII
 and MDIO through devicetree
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@kaod.org, 
 raltherr@google.com, Xo Wang <xow@google.com>
Date: Fri, 28 Apr 2017 14:39:18 +0930
In-Reply-To: <CAARXrtkHZW9t7HSWk2cgBggSAZx+0hVO3TVk0FA66=ZMrh5BHA@mail.gmail.com>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-5-andrew@aj.id.au>
 <CAARXrtkHZW9t7HSWk2cgBggSAZx+0hVO3TVk0FA66=ZMrh5BHA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Ahlsqh2yoC6LMVtc/grs"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Fri, 28 Apr 2017 05:09:28 -0000


--=-Ahlsqh2yoC6LMVtc/grs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-04-28 at 09:26 +0800, Lei YU wrote:
> Hi Andrew, Joel,
>=20
> I was working on a pre-GA Garrison machine which uses PHY as Firestone.
> But later it's found out that GA machine uses NCSI.

Ah. I'll fix the patch

>=20
> I had some patches related to this sent to OpenBMC, which is now abandone=
d.
> So this patch can be dropped

Not so much dropped as requesting pinctrl_rmii1_default I think.

> , though the lines should be removed as well.
>=20
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* SCU setup */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0xd7000000, AST_IO(AST_=
BASE_SCU | 0x88));

Yes, these will stay removed :)

Thanks for the feedback,

Andrew
--=-Ahlsqh2yoC6LMVtc/grs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZAs5+AAoJEJ0dnzgO5LT5l1kQAJYfQaaiGpM7+Z51sYP3UxlL
OZ0mZ1zTZVVCWMj7DVmLG3rqlDrUJiII+dOwM0obXIdgtifjJuU96qSUtX2H1QsO
VXJtZtzFbUWU9dkSzckkkwVTtmg+KwAzeBflnY2W9UbkYt9Rl8rwkIZ9ILpAaBt4
3LDh0FS3Vq7dS6lrDuVxibV6e7rcgTKFV0xcPlo/ShL8ueZqIkVkYg521AIDm2BE
BEoiKpHRheTftf+0ydQ7cj1DuWMS0hO2/pwKMSAFM9db7jjGMfpZaZ0orxjgv+QV
xtcBkzjb481C3xOCpyqhd/+evNOneO8xKLCQ3tPcD9HmKcFBQG9CBsGZh4Xx0kvF
KdK+VP6DGzx393SKhINqsQhKVoP90Mq/k4bQMNsXSiqYBidJcvqyrZFvRqU3q1YC
ufdoRcTyPpi/9/p2vnBbNRf30PuHrfHFKC1mZHPwGmfAWpMcy7L6JQ1aG0WjIseO
7ENQPOIhmMmAuVmuHUmMdSMWTbzsoTiqZvcpPcRI8W2Xpb36rxHYbJ/7XuTilXb2
F+UJspoXV6HTPe9kaqZmLgZmOfeFrFYtJo9NFwg0anC0mxUw9eS0/7rAoOuWyJmB
Ap2FehLxDP78/8nOIr89EdYp5uixkQXiotxcsCuhMyEG99XHh2/Y82aT1rspbI87
E5s1Q5AhiEkL4FUEKcUZ
=kf3F
-----END PGP SIGNATURE-----

--=-Ahlsqh2yoC6LMVtc/grs--
