Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZbrw0bbTzDsfQ
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 21:33:35 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1473939206813499.83034612848815;
 Thu, 15 Sep 2016 04:33:26 -0700 (PDT)
Date: Thu, 15 Sep 2016 06:33:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH linux dev-4.7 4/6] misc: Add Aspeed BT IPMI BMC driver
Message-ID: <20160915113320.GD25351@heinlein.lan>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-5-git-send-email-clg@kaod.org>
 <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
 <38b843b7-24ec-7089-154c-262106afd50c@kaod.org>
 <22bc13ba-5bf7-3e94-6df1-62d33b50c7cc@kaod.org>
 <20160915105129.GC25351@heinlein.lan>
 <a376797d-bb53-678a-be60-3c7188f0d3cc@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline
In-Reply-To: <a376797d-bb53-678a-be60-3c7188f0d3cc@kaod.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 15 Sep 2016 11:33:36 -0000


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 01:22:50PM +0200, C=E9dric Le Goater wrote:
> On 09/15/2016 12:51 PM, Patrick Williams wrote:
> > On Thu, Sep 15, 2016 at 10:36:46AM +0200, C=E9dric Le Goater wrote:
> >>>> I'm not sure there. When I open /dev/ttyUSB0 I'm talking to the USB0
> >>>> serial device. When I open /dev/mtd0, I'm talking to the mtd0 device.
> >>>> So when I open /dev/ipmi-bt-bmc, I would expect to talk to the BMC
> >>>> device?
> >>>
> >>> Yes. I went a little too far in the global rename. /dev/ipmi-bt-bmc m=
akes=20
> >>
> >> I meant /dev/ipmi-bt-host ! :)
> >=20
> > Does it make sense to have these numbered?  I thought Brenden proposed
> > an emulated bt-over-i2c.  We could also conceive of an SOC that had
> > multiple LPC (+bt) engines to facilitate multiple nodes, or an off-board
> > FPGA to do it.
> >=20
>=20
> If we expect to have multiple btbridged process running, we will=20
> need multiple device nodes. How we should name them depends partly=20
> on the driver I think.=20
>=20
> We could keep the prefix 'ipmi-bt' because it identifies the BT=20
> interface described in the IPMI specs and use node /dev/ipmi-bt-host=20
> for the original bt_bmc, (used be bt_host) driver. This one will be=20
> unique.=20
>=20
> The others could use :=20
> =09
> 		/dev/ipmi-bt-lpc
> 		/dev/ipmi-bt-i2c-<bus>

I was thinking along the lines of /dev/ipmi-bt-hostN.  Maybe we do this
through udev rules though?

>=20
>=20
> ?
>=20
>=20
> C.

--=20
Patrick Williams

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX2ocAAAoJEKsDR8wtAMEZiGEP/RLP/6+VnY+McNhW75mfFYXe
Xwqq33UODvXXoOCW0Rr4vImzPzkY+a2y4UvLqXRFVVxNZDpPy0whbMfMk8gkJInK
ZNs5/QsuPw41S7GwC+4FbIHJJyh5hZkGYE6BkLKWtohUKUHWossmT2JkZvrTp8O8
3xwVBKm/eOjkry1mEtsk0UB5Y649ahEPGsg8VOWkqGXGu8rIyDO+O8Hovffnbx6X
xt39omGd1AaOMGPJcuKVb7RuuvGeNO5CND+ArbueVUIKnUzvME0M2io39yPIT+Y5
V1iMC003ca9vukVV6aoAVnoD1XMadMlA/J3Ix8cBEfM6fMZs586uMzb+64vTOPfc
NLmLRxg1LG4fYCCGNDSXncGNDlUp61tQEYSMSKQdNOs8wiZc/h4SDYskJ1kAWmo+
DQWb3HjzxMP1GIsEMpTX6Kd6me7986prl9Q2L623LrzPYl10d1cxgANcoEXYcUJU
q5rD80Om2YP3wOYRIWsEOWUK27E2GkXgDhjHmi2elyzIluclYFjANs3iKFJj75d1
lGaQ6gke7+jY5FLU93R8T7jdEaqlPqHOBR6QYxeWuk03wuhCLr7LLF/vGiRcYNMi
ePK3dn2km6C5EHQeygjCCDnJ+p4DCrTii9j1E7KtIBQkd8pZk6v/9H4E4min/MOQ
GNkuL+H2g7Cg6wpYLUHy
=wIVU
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
