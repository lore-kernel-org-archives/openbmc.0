Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sCgkM1S5tzDr3S
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 02:22:18 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1471278132000731.7250583434596;
 Mon, 15 Aug 2016 09:22:12 -0700 (PDT)
Date: Mon, 15 Aug 2016 11:22:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Chris Austen <austenc@us.ibm.com>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Power button behavior
Message-ID: <20160815162210.smw5gq3yapgszkxz@asimov>
References: <3743F858-80C3-457F-9B3B-86ED896FA16F@linux.vnet.ibm.com>
 <OF4836B2E9.9E723D7F-ON00258010.0057EC23-00258010.0057EC27@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ed5esxi3pm3upozw"
Content-Disposition: inline
In-Reply-To: <OF4836B2E9.9E723D7F-ON00258010.0057EC23-00258010.0057EC27@notes.na.collabserv.com>
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
X-List-Received-Date: Mon, 15 Aug 2016 16:22:19 -0000


--ed5esxi3pm3upozw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:00:20PM +0000, Chris Austen wrote:
> Following the industry norm of "Short press triggers a soft power off, lo=
ng press triggers a hard power off" makes sense to me. =20
> I vote for Master
> Will need to get an opinion from the users of Stable in their product cha=
nge there=20

Entirely agree.  master -> standard behavior; stable -> ask clients.

--=20
Patrick Williams

--ed5esxi3pm3upozw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXsewyAAoJEKsDR8wtAMEZ1dwP/0X0kkSu4p54czhFFzk3FOqm
mxYAlUZYWdZxVvs2NixB1bdUrH85dtulDwrxeYIGLypJ0qVjxN/UO/wv85Za0g9B
ovWTd5rOnPBptVfTDNpSbUQnAhJ2/DL7w3ZTCc/+xytLzeEbFwURZCfgFhjnLMuj
CuZ9TVsETOVhrN/VdwsURu/u7ubFmGsx1ARRGwTshDPTmxRfj8EWbxK+0enKptdL
AHQJIa9EOKrVhq2uEQn4HrVDdTxkPiNFmIjS56qe/Mc7+HA7NGHELuIBe/TpzG3o
rIwianMg2sgwNqfmdrHwfhAQHMC31eKB5puelnsVMBgv+qmHhQ5eGhvtUEQijTcn
/yEJC1dgZ60f9Ay4pyNeHcLqjFiW4H3XCCCoTZ1N3E9580nkROZgVGuC2NM2TRdN
o5LQ4/ZzkWC61qPif6eQ467VrpE3za3B22VaZU837aU1Aau8p6GHbmqfaLOEmVAk
y5UTeC7hy+GyQL6CTkYKkYczVmVwwqWKdVyi4INXbWHeSoOICdvxawLQvcMmcfUb
EwVovw+xKoL1Ccqmor5DN1C+23/xMznyBtEgoX/hJfR3SNhig5QnjqTHjvlqH/2q
oucOvTd0hsOGT2RJqaTk9WrPZAHsdI4SjjjRKxHLLtNfCNh2wZdxSnjPe/AWupUt
sbza6vPR51cSBWzA2Pg6
=9HEO
-----END PGP SIGNATURE-----

--ed5esxi3pm3upozw--
