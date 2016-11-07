Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBzR43PkqzDqVC
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 15:06:56 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478491610979453.540293970124;
 Sun, 6 Nov 2016 20:06:50 -0800 (PST)
Date: Sun, 6 Nov 2016 22:06:44 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: How to handle GPIO differences between P8 and P9
Message-ID: <20161107040643.GE15757@heinlein.lan>
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline
In-Reply-To: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
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
X-List-Received-Date: Mon, 07 Nov 2016 04:06:57 -0000


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2016 at 11:45:02AM -0500, Mine wrote:
> Hi All,
>=20
> This mail is to discuss how to handle GPIO differences (e.g.
> functionality, IN/OUT) between different HWs.
>=20
> I went into a case the P8 uses two GPIOs, but P9 does not use them: in
> skeleton/op-hostctl/control_host_obj.c:
>=20
> GPIO Throttle =3D (GPIO){ "BMC_THROTTLE" };
> GPIO idbtn =3D (GPIO){ "IDBTN" };
> ...
> rc |=3D gpio_write(&Throttle,1);
> rc |=3D gpio_write(&idbtn,0);
>=20
> In P9, BMC_THROTTLE is renamed to N_MODE_N, and changed to an IN GPIO;
> IDBTN is changed to IN GPIO as well.
> If we keep the above code and overriding the GPIOs, writing
> BMC_THROTTLE takes no effect, but writing to IDBTN may break the
> function of its related front panel button.
>=20
> So I think we need to distinguish such cases to avoid issues.
>=20
> The question is, how to change the code to support different HWs that
> have unique GPIOs?

The current GPIO names are "Barreleye-Centric" in that they are named
based on names that were on the Barreleye board.  We need to move the
GPIO structure to be "Function-Centric" instead so that it is more
generally applicable.

That is something that will probably happen over the next few months.
Joel is working on a proposal and we'll schedule some of the refactoring
work afterwards in the userspace code.

We might go the route of having dbus objects for GPIOs instead of having
direct access, similar to what I believe the current proposal is for
LEDs.  We'll have to see what Joel proposes first and then discuss it.

I would suggest for now we simply do the minimum we need to to "make P9
work".  If this means using GPIO names that continue to match Barreleye
naming schemes, rather than Witherspoon / Romulus, I think that makes
sense.  You can always keep a comment in the System.py file that names
the "real board" name.

In cases where they have different functionality, doesn't using a
different name solve that?  Having a different name means the lookup to
"BMC_THROTTLE" or "IDBTN" will fail on Witherspoon and thus this code
will no longer function, right?

--=20
Patrick Williams

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH/3TAAoJEKsDR8wtAMEZwgkQAJDH0mjnEtnPm2ozelb86HcZ
B3QgUaIZ1K0FU6CDLQyexbTJdkorOVEBZ+jyTwL9k7/WDEMGM9fLqczX6hQCX4CU
rNTwD92dgT52sgBzw0kW0yPKc6FOP2IaE89J825E2tqNSsBZwVIXd1rCgAkcfOrR
VFM5PzwUctd+FQXI+mrY0RAfc1bfffmD+BPRp3yXt2KnO//kORCwjyBN7JD9BlmS
Hjla/PwFFZJy7qGwILb1AuwLa951KDU/fraSnfONunovbGvSqAeKEuQob0bxzvBb
JtXnxtdWnTx/pc7PCWukuamwdozhN7MEQNJyD6OPMHG8IYVkC83yh1fKOW/IJ0Cg
BLFbVblxnjLRaNv0ibYZJlKyLqlilkvllozycSjNUBK40H0lbnOuCf3il3jpXRQe
DlbMOPysaPcd17RSgV052ttnUpBbYLRJQrA5s/kK88QiJty4s1Dr2GSozriS+48y
kmcc6xV6Bkww4z1jHm8O9ffn0LuPx2UBl8vwui0UAIc84brg68bi4/KhamvTvOFc
OtxaIYFxslDV2BGWMDgLcfoiMg04J3SvrpYF4HT2/VZGleqmqQN+rC2+2nACmcee
gk46mhaSq6BtVlQ1q8zN7e8DL90tyfv9H5Fzd7rb7aDbsHtptLifGVKOh6HYRUP9
tEguu/aF/qpe4xZkJitP
=PR0Y
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
