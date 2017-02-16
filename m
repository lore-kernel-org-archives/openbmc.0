Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPHxG0cLLzDqBs
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 01:05:37 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1487253925055204.09115029000202;
 Thu, 16 Feb 2017 06:05:25 -0800 (PST)
Date: Thu, 16 Feb 2017 08:05:24 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for zaius
 and witherspoon
Message-ID: <20170216140524.GA5077@heinlein.lan>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20170216054922.19722-1-cyrilbur@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 16 Feb 2017 14:05:38 -0000


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 04:49:22PM +1100, Cyril Bur wrote:
> -		flash_memory: region@94000000 {
> +		flash_memory: region@98000000 {
>  			no-map;
> -			reg =3D <0x94000000 0x04000000>; /* 64M */
> +			reg =3D <0x98000000 0x04000000>; /* 64M */
> +		};
> +
> +		vga_memory: framebuffer@9c000000 {
> +			no-map;
> +			reg =3D <0x9c000000 0x04000000>; /* 64MB */

Do we really have to allocate 64MB to a VGA framebuffer?  We can store a
4K resolution monitor with 32bit color in 32MB, so why is it required to
reserve this much memory?  Between this and the PNOR memory region, now
1/4th of the BMCs memory is reserved.

--=20
Patrick Williams

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpbGhAAoJEKsDR8wtAMEZF1QP/1N7yHsVqBCaYjp97X4g4L0i
VZM7DgCHJ9Bf+i0Y9stNjQoyT4WjWWUlRIe59jOW9szsIKg3Cko9ampwxthMP2sU
BeCTKIZJGyeG9X8ypE4BBM/WhBanIi4FEZFAz07nsqCWYdYflEYwHnAaLiRUcDnW
caVOqmh/97OSdfy6mbAKUg5Yzp7hut6HptHsV14UA1C2kkto7k7DqVkCZDHVi0ht
O1pOb6gC1GyT9UWJkHHTZ5F9IMMsPh5hrCDbL+hhw4OMZrZphL/oVMOqVDavqNgx
hJdvqHnK16yMbSDO0awrqws+pRROQ8iB34+/yENoPKmc6bl0cAhYMadtgqJjmjYA
BirmbNeyhbzjxll9oaayriZYN2/c9SwX8eOvbYqazO6StHSmagYXNK1Vg7sFnoRs
a98JOuRz6gmfkcY8KZkdta9AT4EPZEQi3EL/xlzMDo18OsGPda3HCreGba9j8L6y
WL1KnyYty/uQ+7KuaVZnwPzhDmy92a9ipcqgjkO9RxCCBKPPmTlIpVLa1H09UHeh
hQfS/Wdepxa0maKO1VIuDK0EM90jt4xTTBTdBJku0KNvbvVjlxC4mO2w3/G8MOkE
APJ2QMm1XB/e8hft7PEoeHJ3l0121D75kwulIO1yEwqCkl6l4HPwP1nSGnIbFyln
aVRwT+5BFvDbcGLfy03U
=XDzd
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
