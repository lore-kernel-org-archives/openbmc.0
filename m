Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w06Zc4zDNzDqJh
 for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2017 03:51:20 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1491587477044667.9477498995046;
 Fri, 7 Apr 2017 10:51:17 -0700 (PDT)
Date: Fri, 7 Apr 2017 12:51:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Release v1.99.4
Message-ID: <20170407175116.GB10151@heinlein.lan>
References: <20170406203333.y44jjya7zmb4hg4h@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
In-Reply-To: <20170406203333.y44jjya7zmb4hg4h@asimov>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 07 Apr 2017 17:51:21 -0000


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2017 at 03:33:33PM -0500, Patrick Williams wrote:
>     * Support BMC reboot while Host is kept running.
>         - The systemd target support for this was completed, but some
>           systems may still have trouble successfully coming out of a
>           reboot.

As I reviewed some commits still in Gerrit today, I realized this might
not be as complete as I thought it was.  Look for this to be fully baked
in v1.99.5.

--=20
Patrick Williams

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAljn0ZQACgkQqwNHzC0A
wRkr8Q/+PlVUahV1+Swbe7lPfjvaBkNGeyXlHo8FgpzyGcHYrysjekAX9QyKAoqs
4Vz9V2nMn2lohAV2NxS/UE4dqPhDYIbYGVotxMkHdkHN1SLe+5f3wExGTL6wCTSd
p26y9PDLNEyynWtdc5UN1Ll2mF4wqawnJO9IVMNRBgV9/Njj/jAoojFqQhdToki1
Q9Vz0QYuTWAEboNBsU1zXse/XEFNl3hvShgXGFCPrk5lYcJ1f0VvtOlLyD9GV8H3
B7KInNrvbLipPiQve6sfaqcN75mw0d5HApKokrMe7YOEH6kKektl5qhewjQx4pBN
nxoI4saQHoYJuB2kyM84GUwGDHeahmVIxBTMm70vncKBwm3xvYRFNUE26gdqG8MG
iF4PnLdWVt3zLwsNHmLx5S2sd6hVE3sr2ZNOm4eH5ZLtZVLKjFCLbAgE+hpQfcM8
/NCdscCeD+NT6ZvX8PmeSmk3LkY0mxFlaBiX9IVSptgVYSic10Y+2Nht4CH2j0SD
R4jjoHYHX3Nd4U4Iz6cQtJI3sRN2nVzeThQIfQxTRVJYfcbALJGs2Drs/ioBExH1
1gSOTb0ykXqkebgYf6y1kDOxGeWloM12JNHq1lUrUOxS2tfzzXmWkAR8God1AbLX
IF0TVwGfsbv0dgpAirAsI2fKvayuATeibP9MVUqs4rTRZaZU644=
=Dyta
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
