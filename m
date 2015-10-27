Return-Path: <patrick@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.158])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 243071A0C74
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 09:59:35 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445979520602863.0734535257437;
 Tue, 27 Oct 2015 13:58:40 -0700 (PDT)
Date: Tue, 27 Oct 2015 15:58:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v3] Add get sel time cmd
Message-ID: <20151027205837.GC13316@asimov.austin.ibm.com>
References: <1445639992-11906-1-git-send-email-patches@stwcx.xyz>
 <1445639992-11906-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Gv4AD2GulCTyUAWX"
Content-Disposition: inline
In-Reply-To: <1445639992-11906-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_6
X-ZohoMail-Owner: <20151027205837.GC13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Tue, 27 Oct 2015 22:59:36 -0000


--Gv4AD2GulCTyUAWX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2015 at 05:39:52PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add support for IPMI function Get SEL Time
> ---
>  storagehandler.C | 75 ++++++++++++++++++++++++++++++++++++++------------=
------
>  storagehandler.h |  5 ++--
>  2 files changed, 54 insertions(+), 26 deletions(-)
>=20
> diff --git a/storagehandler.C b/storagehandler.C
> index 659fff5..cccfa56 100644
> --- a/storagehandler.C
> +++ b/storagehandler.C

> +    // Get current time in seconds since jan 1 1970
> +    time(&currtime);
> +    uint32_t resp =3D (uint32_t)currtime;
> +    resp =3D htonl(resp);

This should be htole32.  htonl will put into big-endian but the IPMI
spec calls for little-endian.

--=20
Patrick Williams

--Gv4AD2GulCTyUAWX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWL+V9AAoJEKsDR8wtAMEZrEQP/jfy5LHPv3p7XwD0bTvIMIP8
7srU09XZ1c4wVC3dYn9nTj1lsApdrmb/8bDFQ7uoah3995iHYc504cz2WvAhYaj8
4AgjpOmG7Hti0/MktZqE+U2MXNnFQpj7yDi3vereymWXlpL1NmEUTRvvW+H2UJzA
22E7Ox7KSg36igrNG0nWz4dCuBHLptF0FFJJgPxFaYyfSon+kosu8gtuXlcxtD47
D0SO1DaN8jGsLfDjrhrjahpq7rM7ihLQZJXQ80qt8pwO/6/eSzfBafPAHG+J4dq3
161wcFbbSsqGIAmmeBNl3U9RTQgYem7uNtUGSL/3H/dAAD3nZWGc64GlRoM4tyUx
QhnSWuiULrTBu+3+TGgg+KGTZlojUiSRkgxolnb7ZlO4wawy0vL/qNhDtQf6/Dq0
uwHAiNxFnvDHL1ijNPx35rps9LyY8WtK3ZIPToVhNnurhY40YDO+X6eG2TV6AffQ
ybWMGo5mrFN+8XDtg5cvb87MVKq3E/1XqHzXAB3Fav1yohiP6hjhyfYK/TP/bXV9
B6H2azXqNAWfeKVJkssy2LiZZb+xowlvkNk1T8+9j5ZR6Gfg/YvfovYmT2D79xQA
y6o0VIZ1Qzjgajdq96q6kpL0UYS1IPqk8WWBnepK0Q0fH6OOmi85w+gFEVCWjIJJ
wNG/K9PuvfPUfxMmXm/0
=3R5C
-----END PGP SIGNATURE-----

--Gv4AD2GulCTyUAWX--
