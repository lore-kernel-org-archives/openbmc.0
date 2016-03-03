Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 15BF21A0B5B
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 09:30:58 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1457044254831334.4356194008419;
 Thu, 3 Mar 2016 14:30:54 -0800 (PST)
Date: Thu, 3 Mar 2016 16:30:53 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux] hwmon: fix occ hwmon driver compile warning message
Message-ID: <20160303223053.GH6601@asimov.pw-on-the.net>
References: <1456743642-23362-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456743642-23362-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline
In-Reply-To: <1456743642-23362-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_2_25026_9
X-ZohoMail-Owner: <20160303223053.GH6601@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 22:30:59 -0000


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 05:00:42AM -0600, OpenBMC Patches wrote:
> From: Yi Li <adamliyi@msn.com>
>=20
> Fixed warning message when compiling occ hwmon driver.
> The issue is tracked by: https://github.com/openbmc/linux/issues/44

You can instead write 'Fixes: openbmc/linux#44' and Github will
automatically update the issue.

>=20
> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
>  drivers/hwmon/power8_occ_i2c.c | 54 ++++++++++++++++++++++++++++--------=
------
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW2LsdAAoJEKsDR8wtAMEZzjEP/jGouSCjwdW6m6qO6dYPMnpa
5y6eaxPWJLatkGtI1fkxXAulo+EOHhqa0fbPD4Szp9DUM+/d94iisqyvFqL4U7ov
dXDnCszKy9qFLB4AiWAazspnT4w2fwqfMJULjCWD0HU/2H+4IWAc8V2oDLU6pxUC
xI134EY88pYj0FG5x0oLwtNfuosOnTidxoCy9UP1euKHVKa+w63CFb551oHL/fy4
hyUMuocjIMqDvgiDhGT2HBhl3Lal9utKxZTNVGo+oIjElKrXViUYiwaYsQ3Iy3RL
RnU3iE9HLIJ9TUPmDQUjHYThJ5bgXMvTYxGjs1geF0Y3Pa49TgvwkEW5nNjx0doy
jiTkJ4RU9tOd2/itioB7XpkZNwNOw9d4hBCsXw0yPhBux1X4z1Y8q/eFdBM08jdh
s1PRgUmLCeEEH/Dp1aKvnXlWFkPpEkGqpPYEjC6lEQWY8EgJq2x3JeekM+Mm+tt/
7TTVcHDa25y5irgQvcjFqzcafhqA4wg/zp3yLD6EcCRzWvfgnfN7NNSavo28m6fh
wYXU7HhSnu5FNP3d9F0piT8XFsi6J4z21L2eCSf82sYTFhIq2jyAky983f2Zx6uh
GLGaQs84wp0ryXmgr9w4od9XplfdzM1Rpj41xZdPRkblYs2iHjsYEI6pDgNZPNOq
7496PP5mQKbCVVe3aVyO
=KdKe
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
