Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qbfJy3H2wzDq5y
 for <openbmc@lists.ozlabs.org>; Fri,  1 Apr 2016 09:27:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=lw94TER7; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 464CF76C069;
 Thu, 31 Mar 2016 15:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=6iftcdqoIAxjQoOdq/A2/
 bTNa+8=; b=lw94TER72L4jnudSIPkXipk4l6v3VV9VCGZbRCpxIkL5UAf/4Y7QM
 zBxytSybR/ON9A4ub4TH8AIrLIt2b5umouM4Ma4zITSXh8GTQB7oWsElCBWb3ZZt
 t2GiNEh54vlE9Um2zqzhp967pa9wWZGsBP7X6vlotgfB1PiGPUF75A=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 7DB8676C065;
 Thu, 31 Mar 2016 15:27:26 -0700 (PDT)
Message-ID: <1459463240.2457.13.camel@aj.id.au>
Subject: Re: [PATCH phosphor-rest-server] Add support for serving jsonp
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Fri, 01 Apr 2016 08:57:20 +1030
In-Reply-To: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-nqEXvyXaB7HEcrH59rhX"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2016 22:27:31 -0000


--=-nqEXvyXaB7HEcrH59rhX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

On Tue, 2016-03-29 at 10:40 -0500, OpenBMC Patches wrote:
> Jsonp adds a javascript wrapper to json responses.  It allows client
> applications to work around cross domain restrictions imposed by some
> browsers.  For more information on jsonp:
> https://en.wikipedia.org/wiki/JSONP
>=20
> To get a jsonp response, an application adds a callback url parameter
> with the desired name of the wrapper:
> https://192.168.252.1/list?callback=3Dmy_callback

This description covers the what and the how, but I'm not clear on the
why. Can you add some words describing the motivation for the change
and/or use-cases this enables? Maybe it's my ignorance of web
development shining through :)

Cheers,

Andrew

>=20
> <!-- Reviewable:start -->
> ---
> This change is [<img src=3D"https://reviewable.io/review_button.svg"
> height=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](
> https://reviewable.io/reviews/openbmc/phosphor-rest-server/17)
> <!-- Reviewable:end -->
>=20
>=20
> https://github.com/openbmc/phosphor-rest-server/pull/17
>=20
> Brad Bishop (1):
>   Add support for serving jsonp
>=20
>  obmc-rest | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>=20
--=-nqEXvyXaB7HEcrH59rhX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW/aRIAAoJEJ0dnzgO5LT5rG0QAJfn73UE+OP0hM6bCtClfOZx
G5lGrLDXq+DStzNDnX4F0nmBHI1U+QtfAf789F+9Hc4du1MyCmIUuZnuCWZfMhvd
Z4vP59lrX1+RNu8YY973sq55ssi/OKxJyIohROpsEiuD1lhqJNSUu5xHg11jMbVq
GtN9A/wDbo6oKOgmMgi/C/4HFvf+NnKwQLF/UsR2wW6cD/W2qKdjI4QUy4uS8kek
nhuBfPPPD2NiFJer4LN5frc8KlN/ddlPEEDzWkBoppKvSqg/oIiCTlNlyzqV9SSN
KhibkFLk5VlsYbaGwkyUQZp4TzyVliQMTfDqLY5fGhn/5R7XtnEO0P70gAeM8l1M
KZU9hoMJHUNgKubUG+wdGEOKUM1Q0zoR5x7m2A3P8MmT8Qx3Vr2tZTpm+oK7rYzY
r4tAVK7vQ3k8Bx1Iz36fh5+slPebXhAp2/oqlR7nsEqk96u0AJG3exipOIsPqVEI
66KCTz3sWmnWzta7H3BrdwzIENAHxIL15NNvU4cJJpGKoZwD9eEorAj7EDX8GA+A
tUJNUsUwgBO9SDE+80MfoBqrUqwlAsKgwWyAFBRmeFwg4ZgJnZ460Ai/b2WC7YiX
wTdq//OYYvICYxLj34I29QMQehFpf8lutXdcj5guCIeGgaH8tbsd6RM0ukMGv2eO
61xBxo6oHZlmmi46wW2E
=IDMW
-----END PGP SIGNATURE-----

--=-nqEXvyXaB7HEcrH59rhX--
