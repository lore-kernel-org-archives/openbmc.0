Return-Path: <andrew@aj.id.au>
Received: from ipmail07.adl2.internode.on.net (ipmail07.adl2.internode.on.net
 [150.101.137.131])
 by lists.ozlabs.org (Postfix) with ESMTP id D707D1A0342
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 21:16:31 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CrBAAEDthW//fVestehHm4E4QIhgkEAgKBfgEBAQEBAWUnhEIBAQQjBC8jEAkCGBwOAgI5HgYTiCCQRZ0XhiGJGAEBCAIBFQiFIIU0gTaGAoE6BY0tiW6ORI4Wjk1ighAggUcpLohgAQEB
Received: from ppp203-122-213-247.static.internode.on.net (HELO
 lasair.aj.id.au) ([203.122.213.247])
 by ipmail07.adl2.internode.on.net with ESMTP; 03 Mar 2016 20:46:30 +1030
Message-ID: <1457000176.3938.31.camel@aj.id.au>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400
 AVIC device model
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openbmc@lists.ozlabs.org,
 qemu-arm <qemu-arm@nongnu.org>
Date: Thu, 03 Mar 2016 20:46:16 +1030
In-Reply-To: <CAFEAcA_YcF1zYY4brY+Wxc95-fn-WYN7TGMU9A4_YfPH=SLjeQ@mail.gmail.com>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
 <1455622497-25966-3-git-send-email-andrew@aj.id.au>
 <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
 <1456982069.10265.11.camel@aj.id.au>
 <CAFEAcA_YcF1zYY4brY+Wxc95-fn-WYN7TGMU9A4_YfPH=SLjeQ@mail.gmail.com>
Organization: N/A
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-iNxU6MmPKfK11xi95vNt"
X-Mailer: Evolution 3.18.5.1 
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
X-List-Received-Date: Thu, 03 Mar 2016 10:16:32 -0000


--=-iNxU6MmPKfK11xi95vNt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-03-03 at 08:39 +0000, Peter Maydell wrote:
> On 3 March 2016 at 05:14, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
> > >=20
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0case 0x20: /* Interrupt Enable */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->int_enable |=3D=
 data;
> > > Are you sure this only ORs in new 1 bits?
> > As in, am I sure I only want to take the newly set bits? If so, yes, as
> > the the following register serves to clear the field's set bits:
> >=20
> > >=20
> > >=20
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0case 0x28: /* Interrupt Enable Clear */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->int_enable &=3D=
 ~data;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > The 'int_enable', 'int_trigger' and 'edge_status' fields all use the pa
> > ttern of separate set and clear registers (the remaining registers may
> > benefit from the extract64/deposit64 helpers, I'll think about that
> > further). I'll add some comments to help clear this up.
> >=20
> > Otherwise, can you rephrase the question? At face value it seems like
> > you're implying that I'm doing more than ORing in the new 1 bits?
> It was just that the register name didn't imply a set-bits-only
> semantic and some of the other registers looked like they were
> also incorrectly not handling updates right.

That's a fair call: The comments I added were the documented register
names, which don't provide huge insight on their own. This is probably
a less-than-ideal approach given the datasheet is largely unavailable.
As mentioned above I'll add some comments on the different access
patterns and where they apply to try clear this up.

Cheers,

Andrew
--=-iNxU6MmPKfK11xi95vNt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW2A7wAAoJEJ0dnzgO5LT5nLUP/jREiAX7u9vEziI1ocW8Quh3
4nsvrIYP+oW078ITP6sdoHUDGTlpj68oO3JfqX25H3zIjsLB6cKqR/s6DQL/ahmk
HU8kLefpNxaGE319ORD6BrNkiLHUkRdttXVycYTowCucxrIfGgiE+fXUsdKs06d7
qiFs3b19RPdDFVmYtN6FEDyPw2KgS7qdeqAw7WYCj+xuG2P0o51/ZYpe6r09Rlin
+8YG+EiV+h99/KNtFubFw70pgL/m4XZj+TeUaXKcVreMbVXb1BaMFAiR6gGH7l9J
R8lbOUFPMJ6D4TCxeTdomsKClsZhczetGHj/7X2GYAnAgnvG2X6s9hTOylZCuoOq
7O43FUa/pJg6TefUKquncoR/w2wWrVCYWuPm7+SXtoBEePKtIEJd5p5BdFHcuqxo
PEtoX86rfmTSWDOWbG4PXyRBpA7IXjnAnmr4A2Kshe4jH8/QsVPeCTFcFcribp9O
00V1zwvHvsNDIDMmtJKGpcZSEW6RxGhkmlanromZJWfXt0Z57B39wxzlBiOvLaHK
w/RmbKJzoxBKTa7mrhyeRtJwqRDvlu0RVjXvNKNS/HIR/NJmy4Sj2KeAdPK3nA3y
mwxRvOSf+DRJXWeMgwVCo2SWrW8fqdmtWK3iJ40HohHMVAAGsxrlckWKTBM7owSe
hXr8l9+8fMih8UmZXJi1
=Sdom
-----END PGP SIGNATURE-----

--=-iNxU6MmPKfK11xi95vNt--
