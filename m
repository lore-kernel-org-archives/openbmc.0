Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vzZdK6KnxzDqHV
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 06:51:49 +1000 (AEST)
Received: from localhost (32.97.110.50 [32.97.110.50]) by mx.zohomail.com
 with SMTPS id 149151190488740.98155025863366;
 Thu, 6 Apr 2017 13:51:44 -0700 (PDT)
Date: Thu, 6 Apr 2017 15:51:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Release v1.99.4
Message-ID: <20170406205138.zqxr4ljgp775wohx@asimov>
References: <20170406203333.y44jjya7zmb4hg4h@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w5jow6d7tzbopf5u"
Content-Disposition: inline
In-Reply-To: <20170406203333.y44jjya7zmb4hg4h@asimov>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Thu, 06 Apr 2017 20:51:50 -0000


--w5jow6d7tzbopf5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2017 at 03:33:33PM -0500, Patrick Williams wrote:
>     * Upgrade from Yocto 2.2 to Yocto 2.1.
>         - This was a major change in Yocto/Bitbake.  They upgraded
>           all bitbake scripts from python2 to python3.

This should have read:

    * Upgrade to Yocto 2.2 from Yocto 2.1.

--=20
Patrick Williams

--w5jow6d7tzbopf5u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY5qpaAAoJEKsDR8wtAMEZ+BYP/jN0jgy6f7A6HiMKdERCf5zP
A7DxJXYAPoOpocUrc/nq1RtigvJI7cDDblj+AJ+NGngNz1tPjM0Kbc7BAhdE0j/c
czuiVm7o75OyqQ1Z9yrbc6uWFWoLcuEvlAEc8TaUqUaIygWqs4Rdh7FLiMGr8I5b
uJD7EAJC34g82E/LKRBcHQU2qnDqDiU4kZtBXnz9kAJeNCzLoq2xtdEu4Zs63bhp
BVQPPKUZ9kOXjYWEFuCak0jhZ8Xlex00Lv3n9gLwe1CjNQa9UtILvoUjfsUw3pWX
YOims2KzuWLiI4aB3UHe9J2QyV0gr+hsEDGjgtWnUDNm5vpf3gQtOZi20m4UyYZf
BE/GgcKZSxXdcLQaOZGz2eBZkg5nn9ld5f5UAdRWqFbAc6+iA90QmMHjXxMllKMh
9vxMEGylDDCSuRghaew8srmSjSGrPN7N/UbPE3gkXM2/6nfbGU/GKu4d1GX9gjvq
vN+cxpzqffUHM7RwAH2BwMaK7I2ifKRcxH8DjeGmeG+kX+hJEBncXpxrVEAicQ+c
xQ0fRVKp0r/5u0U1rqa5kxSs02Ej1MJUaWay8PhVDUsxfzhrxoBviZoz+4RrK1Te
HOTbxKugJL3DDDUb3ehe5P1r4GA1tIiGLIhKibmDsH5D9xZai8qhEQ/1NMFb6unL
Q5G6fJW8QEb/i6DlrHke
=buWG
-----END PGP SIGNATURE-----

--w5jow6d7tzbopf5u--
