Return-Path: <andrew@aj.id.au>
Received: from homiemail-a22.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPgjG2fLrzDqGb
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 17:55:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=EC4doAV4; 
 dkim-atps=neutral
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id EB765114067;
 Wed,  8 Jun 2016 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=7vf/QTUYhWhyREOQEmJYw
 nn9Bfg=; b=EC4doAV4gf7T1TTPK03k4PRl0dBVjyyHVwE2ZfqcpwzjcZwtmJY90
 bIXqJXD1NKdSYeMuRZTtR/0lXdV/pwTJ3cpVNjdt9MjFrWhcRFU7lJ6A/AGbVIHp
 HfitITia8YTPjdTwI9ShaJZWPLeBiosTlRSbpKLtnoe82DDa7hAPcM=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 832FD114066;
 Wed,  8 Jun 2016 00:55:42 -0700 (PDT)
Message-ID: <1465372529.16048.136.camel@aj.id.au>
Subject: Re: [PATCH openbmc 09/10] AST2500: Initial AST2500 BSP layer
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Wed, 08 Jun 2016 17:25:29 +0930
In-Reply-To: <1465273557.30053.41.camel@fuzziesquirrel.com>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-10-openbmc-patches@stwcx.xyz>
 <1465179547.16048.7.camel@aj.id.au>
 <1465273557.30053.41.camel@fuzziesquirrel.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-762c282WPjxxYadnXQTs"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 07:55:48 -0000


--=-762c282WPjxxYadnXQTs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-06-07 at 00:25 -0400, Brad Bishop wrote:
> Another thing to keep in mind as you contemplate this is that at the
> moment meta-openbmc-bsp and meta-openbmc-machines are git subtrees in
> the openbmc repository.
>=20
> In my head the endgame would be some SOC vendor repositories hosted
> upstream @ yoctoproject.org (they already do this with intel/freescale)
> and OpenBMC just pulls those layers in.

No worries, sounds like we have the same goals in mind. Thanks for
clarifying.

Andrew
--=-762c282WPjxxYadnXQTs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXV89xAAoJEJ0dnzgO5LT5VxEP/1cmoNl74sdhIY/opYw9nijS
BwF2lwmGiROK490v1mBR5sr4y/jNwxFdZYwEkEvJoqGJ0SKjGI5cjDItPsfdfDIL
qwY4+8NuEcsa1TKzGp7Jz6cO0QAj9eDhcvP9AMtfNiTZHqzphzYW5rHusn8ex1DQ
P4Q1KJxAVrxkmhRfRycPeKNBGfK15Vv2UJlQ/rdii29v4bGfwVJt0RQeVIXbh/wA
q+VzmI0cmcssrUFk7hJqHZBfYkXCLEB374GH+21ExvtFZuChDPxTxgtLrVVkVrkh
+nJPgt5bmjrhH0+KwV6ngVCws25UAd6vyOm1cztgZrqNzd1BeiJl25pFYzqFHq4e
S3k29ayTZTDLglGwf6fmAwaKEkHwd9KUCNN8l6RtCuOFoHEx0NWYQJBrfPCwXQaE
UMl1P9gvbVZt3bl1lDv0r5A/LbNwrEsbwzzSj0XlBzwoBp1XWcEdQ/epD/p/Eo1e
gKZdKmDKBALea5GlunobEPjTaZYWo6RnbgKJQGzZ98+f6ojZt8KYYPXJ6XR/wMQm
MSdnjHDKKASOrR6VYNz9b8DR2FgetIYZO1wMrpnjW7T7c3JWRt0+1vQPJ4t3DxTd
otCagOh/UmUOusnstv5yGGp8E/CecTinREpIzOwlWuvvcQ7uceGqma4UIbN1PALn
86bBVXOnFBs5nq8zr8C8
=4XiP
-----END PGP SIGNATURE-----

--=-762c282WPjxxYadnXQTs--
