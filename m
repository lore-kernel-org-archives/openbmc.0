Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7glT3nRPzDsxq
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 06:09:41 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1478027375073105.97402184422629;
 Tue, 1 Nov 2016 12:09:35 -0700 (PDT)
Date: Tue, 1 Nov 2016 14:09:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Adding a MAINTAINERS file
Message-ID: <20161101190930.gkr6bctv6iejbfj4@asimov>
References: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
 <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xe3gdfvkteytapng"
Content-Disposition: inline
In-Reply-To: <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Tue, 01 Nov 2016 19:09:42 -0000


--xe3gdfvkteytapng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2016 at 02:35:26PM +0000, Rick Altherr wrote:
> Thanks Brendan. Given the projects usage of Gerrit for most of repos, wou=
ld
> there be an advantage to using Gerrit to enforce the reviewer and
> maintainer roles? How will we prevent MAINTAINERS from getting out of sync
> with commit privileges?

The maintainer is effectively managed in Gerrit today by Github groups.
Those are private, but we could certainly make them public.

    "name": "autotest-maintainers",
    "description": "[Gerrit] maintainers for repositories associated with a=
utomated testing",
    "name": "bitbake-maintainers",
    "description": "[Gerrit] maintainers for repositories containing bitbak=
e recipes.",
    "name": "c-maintainers",
    "description": "[Gerrit] maintainers of packages written in C.",
    "name": "cpp-maintainers",
    "description": "[Gerrit] maintainers of packages written in C++",
    "name": "python-maintainers",
    "description": "[Gerrit] maintainers of packages written in python.",

I'm not sure how you can enforce specific reviewers in Gerrit without
yet another config file per repo that we need to maintain.

--=20
Patrick Williams

--xe3gdfvkteytapng
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYGOhqAAoJEKsDR8wtAMEZLhoP/3jZvY+VupN+sGL51uNbAAP8
jrFAPsKMMb2Q9JqGAN21Yfd8Kn11ATFLCaG4Hh1Lu0QFjRrJiO/2NLiLHUhr4NHM
mLJoUl9n37CUrW9lFVd5hiZqJLOfhXAIU/Yf0l4b3p15FmbbpuVg3zACDxTucSoG
n+W3o7X6TXv9bhL7DZO0i8s7zx5DXWwgRXE/ESD87BQzxHYiIzaJDW9tDEgQbY8J
fHBXtyuKEfXukyF/zXO3efpeISLsJJntxLz7NaNY6vruV4X3Dqxh0AoLXTtAqlch
OOP5C32BM6PPkbWuMb13mtvKRVQHouUJZcxa1KZPtsdfjj1v/GrtBJ/AsTzUUNNP
FUsWh9vCjtWt/c7ri55AyByVgftJOb/EE8RlfHnY7Moq1V/gJaiH65/xx2FUnLeS
f6ryrORWDNCZrnJ8DHyJz6LLWMjeN9AyTlsH0athsB9uko5Nmy7er1WxNqjIxwka
VeUuraYFh8nknsBTdzFRRwwwcYsHq5Yomjbiip+9W8sCVSt9+Y/XW0LWtxc4GARG
DLUTEnlmKrbYuJi8x7Djg7htjnwIn1UEWucPVVF6JAHlM60mYKyJe/hcnmN+v4Wb
LstWOmJ3TS7Gdjp1VlZkkT4cQ8CrEcgbaKVnTJ472HLsoJHouNPN0zD35YglFgev
q1+xcHR394mHdJ7uMJPJ
=Xt6V
-----END PGP SIGNATURE-----

--xe3gdfvkteytapng--
