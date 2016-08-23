Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJjbT1BXdzDrcD
 for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2016 07:03:48 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1471986225632413.5970754131888;
 Tue, 23 Aug 2016 14:03:45 -0700 (PDT)
Date: Tue, 23 Aug 2016 16:03:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC v1.0.5 released.
Message-ID: <20160823210344.zhui7fneal5ffch6@asimov>
References: <20160822175734.ljnnyghwioar6njr@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iqe6i5iyjpp3yxm4"
Content-Disposition: inline
In-Reply-To: <20160822175734.ljnnyghwioar6njr@asimov>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 23 Aug 2016 21:03:49 -0000


--iqe6i5iyjpp3yxm4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Due to a major regression, I re-tagged v1.0.5 with the kernel updates
removed.  The change log is therefore just:
     * Cache all inventory properties and preserve inventory during BMC
       firmware update (openbmc/openbmc#487)
     * Update the power button behavior on Barreleye to:
         * Short press: Only power on. Remove the power off action.
         * Long press (>3 seconds): Hard power off.

On Mon, Aug 22, 2016 at 12:57:34PM -0500, Patrick Williams wrote:
> Another fix release for the v1.0.x stable tree was tagged today.
>=20
> https://github.com/openbmc/openbmc/releases/tag/v1.0.5
>=20
> Changes since v1.0.4:
>     * Cache all inventory properties and preserve inventory during BMC
>       firmware update (openbmc/openbmc#487)
>     * Update the power button behavior on Barreleye to:
>         * Short press: Only power on. Remove the power off action.
>         * Long press (>3 seconds): Hard power off.
>     * Kernel version update:
>         * Stable release 4.4.18
>         * Ensure the LEDs stay at the same state on boot (openbmc/linux#9=
8)
--=20
Patrick Williams

--iqe6i5iyjpp3yxm4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXvLowAAoJEKsDR8wtAMEZjKgQAINaAqw4ervNCHVCkHvJHXbg
YkFSlOqLWxdAFLwOpCD6/fwZXRmQImT9En619Rgm8VL45rmp+FHE2EjoXaWM0pXe
0flEbkARpetJ+WoooO28GVbxpurYYzya1rHL+86e3lHi/XNtVlf3JEb2beGl3Fg/
E/UpGNgpAsuHzDhvw6ZoceTwe2yBX2NKDylK/rNGDCRDOAHyktCwmoW653OCmQ4q
yzjkuInhiNROb2lhldq8aVtM+eqM//nHfiXBkcEHzSg0Ur2LLA2F5aScoPWO0EJh
6CYYrMdBPuA5kmREneXOo1a85Vi3HjVyuzzihaNlSqgeZOrasyIlPSji+Hf+JrNC
BYhN1/+ag7kapxcaK/ThXuI1/cky13SqfQRSQg6boiMVjfSZHer4Y+t8LbzT94eY
DurhxDdCKUlT8TNKnsEb0aBkq5jdpIo+iBGIn1ld0SGSkBXBUbY61dOIt5jDhPWi
ugdplkPUmxVZFFMGS0oDFHovwF1kOW9FXAa/pcoa/uF7qiM/1cAsU3HqvoMJVtQq
iAO6e8eRTvcOIZ9WTUMsKJArRyRQFnpy6KgFq6WLFF3w3hAVT23eKZfXPtaXkH6P
APSJMRyMMrHsrasjECmNM6lY0ETBJ93/gzgJDSdbWyKAFwoIVgnTAyxYx3U2gLVR
Oa6tMeXl8PNKklxHTV4/
=Demt
-----END PGP SIGNATURE-----

--iqe6i5iyjpp3yxm4--
