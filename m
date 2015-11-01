Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 242AF1A03D5
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 15:32:36 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446352348136836.1665684258405;
 Sat, 31 Oct 2015 21:32:28 -0700 (PDT)
Date: Sat, 31 Oct 2015 23:32:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Norman James <njames@us.ibm.com>
Cc: OpenBMC Patches <patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux] added i2c busses and devices for palmetto and
 barreleye
Message-ID: <20151101043225.GO31364@asimov.austin.ibm.com>
References: <1446231145-31066-1-git-send-email-patches@stwcx.xyz>
 <20151030193439.GJ31364@asimov.austin.ibm.com>
 <201510302214.t9UMEbBu030513@d01av02.pok.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8WA4ILJSyYAmUzbY"
Content-Disposition: inline
In-Reply-To: <201510302214.t9UMEbBu030513@d01av02.pok.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151101043225.GO31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Sun, 01 Nov 2015 04:32:37 -0000


--8WA4ILJSyYAmUzbY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

https://github.com/openbmc/openbmc/issues/56

On Fri, Oct 30, 2015 at 04:07:44PM -0600, Norman James wrote:
>=20
> Fine with me.
>=20
>=20
> Regards,
> Norman James
> IBM - POWER Systems Architect
> Phone: 1-512-286-6807 (T/L: 363-6807)
> Internet: njames@us.ibm.com
>=20
>=20
>=20
>=20
> From:	Patrick Williams <patrick@stwcx.xyz>
> To:	OpenBMC Patches <patches@stwcx.xyz>
> Cc:	openbmc@lists.ozlabs.org
> Date:	10/30/2015 02:34 PM
> Subject:	Re: [PATCH linux] added i2c busses and devices for palmetto and
>             barreleye
> Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>
>=20
>=20
>=20
> On Fri, Oct 30, 2015 at 01:52:24PM -0500, OpenBMC Patches wrote:
> > i'm not sure compatibility string is correct for barreleye
> >
> > https://github.com/openbmc/linux/pull/10
> >
> > Norman James (1):
> >   added i2c busses and devices
> >
> >  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 333 +++++++++++++++++=
++
> ++++++
> >  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |  28 ++-
> >  2 files changed, 354 insertions(+), 7 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> >
> > --
> > 2.6.0
> >
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>=20
> In general where should we put the devtree files?  Seems like these
> belong in meta-phosphor-machines instead of directly in the linux tree.
>=20
> If there is no disagreement I can open an issue to track moving these.
> --
> Patrick Williams
> [attachment "signature.asc" deleted by Norman James/Austin/IBM]
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>=20



--=20
Patrick Williams

--8WA4ILJSyYAmUzbY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWNZXZAAoJEKsDR8wtAMEZL64P/0w4Uj9A0Ys2l2gTFx/pp5o2
QOXIsCqdicAosZW2/KesM9ZuLKdI8S2eVF5I05FnkokWtGyX+TknE31ec/a5bcWB
JocokW1KyBYPvc1SQO3kR8M6sZXaZ9kArXHVnlGxHU2WZPfP9r+wCS79pLAzqQfi
SSN3B8dkTss4OYuqC7aQCXe6OVoxF0LefWXvfmTB3p2IFwHr2Gl0J+pFHCI1Rypx
qczN23xAcGfoDNeArszXZCb1Ev6dSVUhbhQPEcAC4NBIlP3mj6umUsD3XQ+hGKoa
Lmh6LFCDGDhNe8JSgiSbkwCJQ94JDa9awWaWYUUD4nYGUqasYKqjcQNPnwOS1Ogy
kvez9lqGNeITlCswCCp5d30MVeunNNkXU0pAJ6CiRn07mn1JcyQJ9+WeMolv/PIt
WsFgh7EpVsoUjfk96uiuGdnGkH9PLghYBgTdfR1qRDQXPc+t8EN+Laoq7/KO3LBh
NeTBa18R3zgsefIHHSO4w+14seHD4RvG2LktVBaokkuCQ4X6H0nhhad/g6yHTSHC
31JOuhCPXaTIXbO3xtuSBtcuPJJeaYpwvNZ8SKFNVeEOZrHTd7zS6A6RwVD8mZ4B
gcOWHb1bplgp5vc00wZWZAoljX2cjbcgH8yd/sIQiq4s/zFQXwzloWEe/d68sMDT
ng2NMJ6hR+fXF6eBG5X9
=CPFW
-----END PGP SIGNATURE-----

--8WA4ILJSyYAmUzbY--
