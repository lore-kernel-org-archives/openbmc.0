Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3MtF0B7RzDr3x;
 Fri,  7 Jul 2017 02:01:24 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 149935687727251.07627881806718;
 Thu, 6 Jul 2017 09:01:17 -0700 (PDT)
Date: Thu, 6 Jul 2017 11:01:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sivas Srr <sivas.srr@in.ibm.com>
Cc: Michael Tritz <mtritz@us.ibm.com>, stewart@linux.vnet.ibm.com,
 skiboot@lists.ozlabs.org, cyrilbur@gmail.com,
 openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@linux.vnet.ibm.com>
Subject: Re: [PATCH v6] pflash option to retrieve PNOR partition flags
Message-ID: <20170706160110.GB22100@asimov.austin.ibm.com>
References: <20170705191603.33311-1-mtritz@us.ibm.com>
 <OF3159A207.F3097B82-ON00258155.001E57BA-00258155.001E7947@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline
In-Reply-To: <OF3159A207.F3097B82-ON00258155.001E57BA-00258155.001E7947@notes.na.collabserv.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Thu, 06 Jul 2017 16:01:25 -0000


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2017 at 05:32:51AM +0000, Sivas Srr wrote:
>    Btw, Can we use pflash any time of host state, right. ?
>    Or is there any restriction there?  ( We were told that pflash may go
>    away ).

You can run pflash from the host at any time.  I would suggest not
running it from the BMC while the host is running due to potential
conflicts with the mbox daemon.  You can certainly cause unexpected
behavior due to timing between host firmware, mbox daemon and your
running the pflash tool.

pflash being installed on the BMC is going away very soon.  We are doing
bring-up testing of a virtual PNOR implementation that will cause the
PNOR chip to be a BMC-managed file system instead of the FFS layout.
Running pflash directly against the PNOR will not just show a corrupted
FFS and if you do any pflash updates you are going to corrupt the UBI
layout.  Adriana can discuss any details with you if you need.

--=20
Patrick Williams

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlleXsYACgkQqwNHzC0A
wRkJcBAAmvNVbFACVNrBZdbauniuamLFRXj4uURivBMEvfpCFpYUv8/8kSsEIU91
fJmEU+69jZxc3E9NUeDSqw7eS2vxBdt9mlPOGpfjBc09y8NFJh5lGXicQWsHUqE7
fmjt9Ffc8uxVPYGhszngBY7yiHDxLxBZHhOE9Xf4ilz8KDCeHXDxPCgBIRKQmori
6mCLUu4RNOxVliEHORCM5O4x7Kbf3QnYI32Cjh12QwPhNFLya59j3yI4xpw+UAkZ
8X3/VbS3pnYv4Ia3qxZjSJt/xeCVzYOu1/8bog3K3zQMLJz8gjrHKngFAtX3kL4p
2VU6Z1lmWc96n/ljFIya4uFX5nPGTOd6ALB+SMOGWLZ9nPtM5zT0VtiZXyH7a/pY
751wfornwcnVVJOOOF3G9smEFsAdYpa1yu0ZaeFCEJ+d8W801jVufS7wx5K4qETX
gOAjWJ2H3qbzx0V5SoKvXMKkGYMhad8AQ7AQbvZBI3VcQ9CIRpupdndXtMcztkuh
Noyk9r/Aq96rHo2/lyirk0nSCXCDqXgPXZHaHodXIXD323cSPefMtsS4i2L9wswL
7pD4JfmtwqhdmCNANfa6SACp6GXyEU2vfE1VTw5xRdtvW9i5DUBAZU3YYWqy0Oqw
Eoa8wc8X8hUewoPm8UVHaivhUuuU5MO7NUYwj4/9uWMoal3Nd6Y=
=Lxzi
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
