Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNJKz1fZdzDq64
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 12:19:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=SHmSpbll; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 6D0744B006D;
 Sun,  5 Jun 2016 19:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=4C1Uc3CxB6YsCNhyidKVB
 amgz2Q=; b=SHmSpbll/qblgmhZgOsjUA8lQ2fMeXOU7B8SjZMjq45uEvH+BzOCs
 ZwG/4VIOmEnIIlBe2CmlRzDSfzKepGKQ1VO6RnGCUc0Or+yoSPuEpM68Qx9wBIvF
 I+f6r1a3BwFec5zfLf46/1WMDvEjUnQAOXZJlnTL+H4whHR3Wb2epM=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 713824B0063;
 Sun,  5 Jun 2016 19:19:16 -0700 (PDT)
Message-ID: <1465179547.16048.7.camel@aj.id.au>
Subject: Re: [PATCH openbmc 09/10] AST2500: Initial AST2500 BSP layer
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Mon, 06 Jun 2016 11:49:07 +0930
In-Reply-To: <20160604052039.6581-10-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-10-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-00XUCxwSBITcHAEqHnMN"
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
X-List-Received-Date: Mon, 06 Jun 2016 02:19:19 -0000


--=-00XUCxwSBITcHAEqHnMN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2016-06-04 at 00:20 -0500, OpenBMC Patches wrote:
> =C2=A05 files changed, 132 insertions(+)
> =C2=A0create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/l=
ayer.conf
> =C2=A0create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/m=
achine/include/ast2500.inc
> =C2=A0create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipe=
s-kernel/linux/linux-obmc/defconfig
> =C2=A0create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipe=
s-kernel/linux/linux-obmc_%.bbappend
> =C2=A0create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipe=
s.txt

This might show my ignorance of Yocto, but what drives us to structure
the repository this way? Specifically, why are we nesting meta-aspeed
under meta-openbmc-bsp? Whilst OpenBMC is heavily centred around the
Aspeed SoCs, in general Aspeed SoCs are used by more than OpenBMC. It
feels like the OOP inheritance vs composition problem. Is that a fair
analogy? If so, should we try to flatten out this hierarchy a bit?

Cheers,

Andrew
--=-00XUCxwSBITcHAEqHnMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVN2bAAoJEJ0dnzgO5LT52dIP/RsVJVDv26+O2rexY3ilWLxG
nP7Bw7ZNgbTb+fxdE8r6nzk7WPe6zozxy1F0pdJ+ZKiu6avN2OH8n2NKCxE/Efiu
p6JqQt3mAo0Wi39lzkRX4JS/O56tr29GAXHz2m8lVF0WEx9f23wrKPWsWcVhsxFr
1zyHyhS4XgZJfMLdePWzaDPBOVEggnMOLrEr7q2Sx1/XyzTnXisxOcfPw/p1uU4w
q5pXmb/Y5YLq7TtAMfm0W+MCxkaQ9oe36w+KQZ5XZ5wJpOWdVTL9cNGUuS0Jy9A2
/S7e4I3HUGvprWWVEeF7CHdC/6C7CpVorrRI9p8G34ijdrI+hkzRqOmBZQfSAq6R
ertk43NOVznlEGvI8oVtv9uzqaIt1F7KRqMgjA3qdp6JKgZrSAQJpuUFOsP8jCQH
eRC1tQ24qtada2Q7yZtUbJvnoaA4ffKC3ufKqRzi58/Ftxwq4lhtt3FvI8YmWE4k
OgJjr94UNL1aJvkglwwo6HGS1+R9asAH3phls8Paak51iHe4tzqoAjogjkTfhz6A
45bvjgXZsBAPr2znXmS9uW1rXSAMo0f9qR9YPVg/YvF9TaIV5vLG9nLfMWasP2TM
H7ETk50vsCgI7lUpWTWWfUo9ZBKZ5qktByJv21xXQ2qK7MNqAJyp6C+bitmt9IFn
eh7YMPsQphtCWDu5ItxE
=mS+E
-----END PGP SIGNATURE-----

--=-00XUCxwSBITcHAEqHnMN--
