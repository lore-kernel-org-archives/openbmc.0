Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYRJc53HqzDqLL
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 07:05:35 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14883987268669.661339568099038;
 Wed, 1 Mar 2017 12:05:26 -0800 (PST)
Date: Wed, 1 Mar 2017 14:05:26 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: add reg field to pca9541a i2c mux
Message-ID: <20170301200526.GB837@heinlein.lan>
References: <20170228214823.3696-1-emilyshaffer@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline
In-Reply-To: <20170228214823.3696-1-emilyshaffer@google.com>
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
X-List-Received-Date: Wed, 01 Mar 2017 20:05:37 -0000


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 01:48:23PM -0800, Emily Shaffer wrote:
> I2C mux pca9541a@70 was incorrectly configured, preventing hotswap@10
> LM5066I hotswap controller from being configured at startup.  Adding
> the missing field results in the hotswap controller being present
> immediately at boot.
>=20
> Signed-off-by: Emily Shaffer <emilyshaffer@google.com>

Emily,

I would recommend referencing Zaius in the title and maybe the commit
message body as well.  As is, there is no indication as to which machine
this change is for.  You can 'git log' the file and follow examples of
others.

Looks like this is the typical pattern for Zaius-only dts updates.
    b40fcf1 ARM: dts: aspeed: zaius: Update EVT2 LED GPIOs
    7390d9c ARM: dts: aspeed: zaius: Enable UART1
    6fcd70b ARM: dts: aspeed: zaius: Add 1-wire buses

--=20
Patrick Williams

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtymDAAoJEKsDR8wtAMEZkqYP/0Ullzue9RkLU+QVNjpsI9xW
/IBRt0PgHGQdafMUTg6xvJveakw89JM+7uzsN6m4lvLizU+GMlJ1o7uSqiJf0pg+
l7vE9DEhUmhoDiMLQKg1qdfUtCmH84dcf0BzekoQXyJakLg7Vl6jIabpnOH3iqFL
9HTKcoJEl3sbvMRtNHlgNSNmp/5IGqUSm1Lh6svRXvyCGLSQVGJIngdDWR5+7b+v
Lv/sOKrmTOtLEeECho/R7DDcEY3fQVJebHWaP5QEjSULqO9/JTY1AhRud+VmrpTv
W4U7zyqXTQsYOTFSkoRXSVg2efbORb8B4YkxhEUPs0mbzuHL+jpCDAi9zvK3jhic
aMFvotu+kpNaVoSQtuYNTiQu2Hr5z2h7o7zT0hivXldIJ8WFKl/qDgR4z6KTMaw4
JYCdJKJ0or2QbD8QIphEpf7gTSaeST9P0DY4vuq48YP6MZWjdWihqPUc/iijCbbv
RwpSBB0YH22hLys2UQ8wCk1JQr1J8JfdFcs1Af2sspVV96pZjd1+DXII1O+0GxpZ
fPKJtLiddiuFzn79nGmjnXBypMbZMCFOdc3IwJf9IwUTIC8Y1QZtXMrcwKEeDdk9
7VekiMVDoYmabMW18Y9+ZN9DHLk3CukkUa9hlkeaTKne1BFp5xrsKGFeFJVhmclM
mtp7aI/+6WbtVG0JgCML
=345h
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
