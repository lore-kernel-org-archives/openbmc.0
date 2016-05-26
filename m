Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFXJz0jQ3zDqZG
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 11:54:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=IN5tYdkb; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 456C77EC063;
 Wed, 25 May 2016 18:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=j+Wch3MiLDD6bB9xx2+Q1
 pGzM6w=; b=IN5tYdkbgf2u3nFM4701KfJGcyDCZJ2K9dtfy4xc6fv9OgPKX5Rhx
 Rzr8KHNkhIUotIZlNDyiShPWgMuqjYGQ22KS1HiC6Z1+qItrX12jd7dR66DiUdiJ
 bXpYgua7T/HLQF8l5WaACbYCt7ass9Dh5SIOlI06I+Enrjz45Sxqw4=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 0AD4E7EC061;
 Wed, 25 May 2016 18:54:55 -0700 (PDT)
Message-ID: <1464227686.8430.31.camel@aj.id.au>
Subject: Re: [PATCH] Fix i2c-tools SRCURI syntax
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Rick Altherr <raltherr@google.com>
Cc: openbmc@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>
Date: Thu, 26 May 2016 11:24:46 +0930
In-Reply-To: <CAPLgG=n45AdUV6M=DfFkwjK5zt4vtMT=L168=V6M9GPEXATr7A@mail.gmail.com>
References: <1464223026-8881-1-git-send-email-raltherr@google.com>
 <1464225896.8430.21.camel@aj.id.au>
 <CAPLgG=n45AdUV6M=DfFkwjK5zt4vtMT=L168=V6M9GPEXATr7A@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Bj0xAOfd4gddpOTpTbdM"
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
X-List-Received-Date: Thu, 26 May 2016 01:54:59 -0000


--=-Bj0xAOfd4gddpOTpTbdM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-05-25 at 18:37 -0700, Rick Altherr wrote:
> Thanks Andrew.
> =C2=A0https://github.com/openbmc/docs/blob/master/contributing.md wasn't
> really clear on what was preferred.=C2=A0 I'll pass along your explanatio=
n
> to the rest of the Google team.

Yes, unfortunately the docs haven't caught up.

Andrew
--=-Bj0xAOfd4gddpOTpTbdM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRldmAAoJEJ0dnzgO5LT5J8gP+QGGCbQ6aIzJ2EQ/V5hqdNTH
tAZRe0+yHfMFYR3TWOnPWs5iBybwUdxrLfCvoDT/n/xyH1tEM3gNY0thtApKNkLu
StR/+VI3a4BLMv/r1icEaJVMXqNZxFiA9CZTnwueL6pUBpnhir+gBwMESOQ/6ga5
9pWB6Mc7gqSERwZR1HH37/QcmmEJZgT24dCcASPEF4RcrSrVQ25GHs+4iZtpOiCe
Nzf3ZJc7VGR5iXdwugMKa2RDZGys65JoQsTvFGzb/bUBKdr7fUoMXO9cmFJRwiUV
pWkVLjILm1/OaLxa5p5A7PDqZsc/QDupZEVIR6YOZZJx+FFU0bBjXQXk+su49L4T
rT+9/f9dNM+IEmIt9oEYchnz+ueh6CNlmuNv1KcFStSfPlEsnvDjtimD3CktA3vO
lDuWMrXpQT4VgDu/Uxbhu723UJ+/KFzYDzXRJE/QTH0Z7hvbGImD3DKJsb8qIhTX
raOhNilBklC6lNY78EoxWAg+scAr8FhdhG8H/bOZzW6fyho0bmexRV9lZJXhBFkG
kIHKgvDH4yM6k8Xypo96QWz7hM4yCTZZysycNVJHp9raRj0EU7z/ZwjnFQ+Eyr+d
Zyhy1igtHKCrOgEt/C92bGh/NWajOT8ZdAvDiY4FyyxMQ5BwxFyPRm4sbvvjLONU
VtZjDe/Eqj3CbDF/Lp3y
=kuYe
-----END PGP SIGNATURE-----

--=-Bj0xAOfd4gddpOTpTbdM--
