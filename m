Return-Path: <andrew@aj.id.au>
Received: from homiemail-a12.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFXDp1t2NzDqKM
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 11:51:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=l42Kj6Y9; 
 dkim-atps=neutral
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id B28501030063;
 Wed, 25 May 2016 18:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=JfhEV1GQAjTDu3VOd9eep
 UwYZf8=; b=l42Kj6Y9kZ6Ur1vCVsIxxTVecP3Cy2yksKeKCnu6eok29D0A59b4O
 zsx1mjBA36O/I/onT2BjkBg3aaiUjzICY6ww/LmYB+IhZF5i4/iooguBDiC3yeNB
 xNe60sWALsfz5c9Udz6epfrmGkE3ptW4BvomQqohpPzgREspr4Jab8=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 2863D1030062;
 Wed, 25 May 2016 18:51:17 -0700 (PDT)
Message-ID: <1464227463.8430.28.camel@aj.id.au>
Subject: Re: [PATCH] Fix i2c-tools SRCURI syntax
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Rick Altherr <raltherr@google.com>
Cc: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>, 
 nkskjames@gmail.com
Date: Thu, 26 May 2016 11:21:03 +0930
In-Reply-To: <CAPLgG=nmaLuLuF-xuMQbpjHaNg2b8eUZwQSoY2B=GpRHhWWX8Q@mail.gmail.com>
References: <1464223026-8881-1-git-send-email-raltherr@google.com>
 <1464225896.8430.21.camel@aj.id.au>
 <CAPLgG=nmaLuLuF-xuMQbpjHaNg2b8eUZwQSoY2B=GpRHhWWX8Q@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-qs7QmUz8sZeDr394bJTI"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
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
X-List-Received-Date: Thu, 26 May 2016 01:51:22 -0000


--=-qs7QmUz8sZeDr394bJTI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rick,

On Wed, 2016-05-25 at 18:41 -0700, Rick Altherr wrote:
> Shall I resend this patch as a pull request?

That's probably the best thing to do if it's not too much fuss for you.
Either Patrick or Norm (both CC'ed now) will merge it, so maybe they
can weigh in?

Andrew
--=-qs7QmUz8sZeDr394bJTI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRlaHAAoJEJ0dnzgO5LT5qrgQALikD5U75wR3QqMOZrs4jn2v
dMkXY4AXXsFQdW5XgGMGy1/X+Wp9+DUN0qn5UfT0xfKMiChjzQnkBS4xJcfFY+f2
B4v9JJymMhOXrbGrk7UvgJ53mcFKDRsoO5iza4AIMinidWxCUb2M4DY9yV4mPB20
lMeQTcvn35RRLwzYUO6rdL4yukfBGVHlLnChXILyFJaEWPdjZ7ooHksR6I8I6ZAO
98yOc1HHQRUtOs4831sNAilbGaxL9gxRTr9eqhff1tNvIryMBylZ0pWZb5O9ir18
CAS8WZsgcaSBzqqadyfX/EZbaKdsrz6DJhDURqsrmCFN9qP2aOEfZwkliRjFywRB
2b2FTeh5OrByW59OZlU55tLXx2XuBxSOZ4Bxn4vgjo7GylyVye96nPYSQBBtixV6
5zYJyCjU651/DwOW8qpPU9d77dZWxVK9yK16FvL1RyHfSEYIVNuHL0q42Y6TVukK
8owpxeei5zDu+o6XzU0ShC9gE4rhZq7wJ5Gz2xOwv0J9f6hX47d6oLufCW38DjG+
Afbzx/g/F83lm0QFyMY1mOeEwHF24a/r4tC+23EmBS8Q16DsC/49HVpZultAl47Y
Ws8Y/I+lOspG80QyhYO1wN5PJKbkmc5Yvi5Q4kzyfbh0K7WzEYKXqoME6OChV0BF
SYn6J+gOJAcJoqZISKAp
=lyfj
-----END PGP SIGNATURE-----

--=-qs7QmUz8sZeDr394bJTI--
