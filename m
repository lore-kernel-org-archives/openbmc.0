Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BEA4D1A03BC
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:48:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445370530197227.4097370509303;
 Tue, 20 Oct 2015 12:48:50 -0700 (PDT)
Date: Tue, 20 Oct 2015 14:48:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 00/20] Adding IPMI Parser Library.
Message-ID: <20151020194848.GM13316@asimov.austin.ibm.com>
References: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8kI7hWEHMS8Z+7/0"
Content-Disposition: inline
In-Reply-To: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151020194848.GM13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:48:55 -0000


--8kI7hWEHMS8Z+7/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Something is severely wrong with this pull request.  Please run the
following:
    git fetch git@github:openbmc/openbmc
    git rebase FETCH_HEAD
    git push origin HEAD:master --force

On Tue, Oct 20, 2015 at 02:19:38PM -0500, OpenBMC Patches wrote:
> https://github.com/openbmc/openbmc/pull/25
>=20
> Adriana Kobylak (1):
>   Add skeleton recipe
>=20
> Brad Bishop (18):
>   Rename host-ipmid/files to host-ipmid/host-ipmid
>   Remove S and SRC_URI from python daemon class
>   Remove S and SRC_URI from c daemon class
>   Start host-ipmid on boot
>   Add PROVIDES to all provider classes
>   Add host IPMI DBUS to hw provider class
>   Add recipe for host IPMI DBUS to BT
>   Add recipe for host IPMI DBUS to hw example
>   Make host-ipmid pull in host IPMI to hw package
>   Move palmetto configuration to openpower layer
>   Add palmetto recipes-bsp description
>   Add stubbed barreleye/foxconn layers
>   Skeleton makefile updates for OE build
>   Add skeleton to phosphor image
>   Add recipe for https://github.com/msoulier/tftpy
>   Remove tftpy from skeleton package
>   Move host-ipmi-bt from palmetto to common include
>   Bump skeleton revision
>=20
> Hariharasubramanian R (1):
>   Adding IPMI Parser Library.
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--8kI7hWEHMS8Z+7/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJpqgAAoJEKsDR8wtAMEZoTAP/1bLbsRpSvh4BsM5q5tB/s4k
YmAZVRkbnsNofB4eWG+PiKJj3bbtnFsDhhMSNyy3tk6KQXwToyeJxfqeevaM9t21
xalx2cuwVJH+UpmM8uRCYr1rQK8IPUT5xlsOtcQ1Tcak9d9vaIJ74BqAR3kfG4Yh
x6icgmgXXGuS3dbsyaFJ3hcsSOwv7J4LmDKnNkLnZo3ff5MzcXG44/r7c3jaP+jd
NLb34UuBE+OcS1oSeWdlTxHZcN34USDuZARrZCk5yX+ZgCG7QKRKcyBrv7xJ97JU
z03ewCYnN7S/mHLDuKSy6I1+WkhXH/wy4HgHioFX4zTrGW/GfU7O5esPP54+ejf9
yrX8nIdmEMG7yk/OmBzXBDf4ADnj8ud6w1YHgpVQOJTCcyT7bNQj1/VVmz5T5HvD
nj29N/+afXR2qJYHcFp3dee9xQyhe4s+hjhdS2iaShgfqhXUpUOQrt+AogfQBnQc
NoBiPgA8bjhCruYWgn6UwUmzkcY5VCbxqfYfWCkiTXQiq5Fy0YzJxSH4a+aFJL2i
EkZMhNYXhDdr6bq1N75hHN5f2RagVEFAYI2jt27DKCThiyteUl1bzHjvwC1ApiDl
k/IRwREO/NAPZcG+PTCig7yJUk8lRpDRZclCoawBJhaz0VziZyKTVe2Eku41ZJgo
PayiUO+vzEeMJrX1X9hg
=/GBm
-----END PGP SIGNATURE-----

--8kI7hWEHMS8Z+7/0--
