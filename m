Return-Path: <wsa-dev@sang-engineering.com>
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x83ts17SBzDqg2
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 17:18:10 +1000 (AEST)
Received: (qmail 14685 invoked from network); 14 Jul 2017 09:18:00 +0200
Received: from p200300cf5bc32e00021de0fffea0c865.dip0.t-ipconnect.de (HELO
 localhost) (l3s3148p1@2003:cf:5bc3:2e00:21d:e0ff:fea0:c865)
 by mail.zeus03.de with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 14 Jul 2017 09:18:00 +0200
Date: Fri, 14 Jul 2017 09:18:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 "David S . Miller" <davem@davemloft.net>, mchehab@kernel.org,
 Joel Stanley <joel@jms.id.au>, martin.petersen@oracle.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v11 3/4] i2c: aspeed: added driver for Aspeed I2C
Message-ID: <20170714071800.GA1498@katana>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-4-brendanhiggins@google.com>
 <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
 <CAFd5g45=O2_MgfZEkmbY-=ZZY+izxeWSuhZT+B2e08P=O+WEog@mail.gmail.com>
 <20170627090042.GA2408@katana>
 <CAFd5g449iu6DGvMuP8-n8C6GBbr62G6_ZYS6Lh9038EB0XO9YA@mail.gmail.com>
 <20170628074515.GA1550@katana>
 <CAFd5g45V0Ya0UdBZMCoazvE0Sh33F3_oMb84-kLXn1qH0h=b3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <CAFd5g45V0Ya0UdBZMCoazvE0Sh33F3_oMb84-kLXn1qH0h=b3A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 14 Jul 2017 07:18:14 -0000


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Basically what I was asking is whether I could use i2c_generic_scl_recovery
> in the case where SCL is hung.

The name is a bit misleading, I am afraid. Recovery can only be used when
SDA is stuck low. And to fix this it *uses* SCL toggling to get out of
it. And 'generic_scl' means 'gimme some SCL to control and I will toggle
it'. Compared to 'gpio_recovery' which will do all the GPIO handling for
you.

When SCL is hung, you can only reset the device which forces SCL low.

> I think I have a pretty good idea of what to do, I should probably just put
> together an RFC patch.

Sure.


--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllocCQACgkQFA3kzBSg
KbYLJA//eOt1O+Vx/SfQPxPJZvoe/8u/ntXbOwccem2evrB6yWqE2wGvGPrTfRgL
ulNj1Pjg6kGd3wpxuRp1paGzHpcRVe1LFXqqpqqr/2R4cA6tKvmem4fBYhSdSfim
4JxDTdl3OY9a6kFUoQPeY6N+Tm/P0fzL1uWDGfr/DeGYbjh0BP7ju68jgC0U+PPL
IQVW7P1WQbo5ha2/2hneWUk2SiqmVLERNFwyIMsNF9C7FXyvtdr2MvsSIqx/YPWj
bjaaPT1XG45+tBQFd9883sr/NK2b1AWSYY2HaOovxxkl/5XYUQsP4DaziH7Vo8j6
60fbZ5c7BgcyCwLFCJpIMomv+/HZiIAqeAqr9loWTKG0QVhdiguadceSj2ZzSkm+
yJOnCjRtTf9GwOVt38RIklcolWGtK62V3QzsIMzQH4RQIU8W5/8kihW7cM3ow4sG
+zoO3V7xTmODqRQ/SHj2emKIT9Sp95jR8fPio/FIbSuVx8vKAeXUZ0grrJbkr7nO
5bSviIOEGYZiUofjeL9JDEwkVs/3kH3Z2CUpH5E12YwlrOKT8BXdvRRDBWoyqHxE
0S+VLgIxYum+ODGL5EOCHEYui+ufQwDKtcg2Wlz+yuCozbvsFZzQdxrRCBAcwriK
Q54B9SouScJ1TKsdtStsu476TjTau9SM8oEvbOudxB/e/jrZcUQ=
=Ykr8
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
