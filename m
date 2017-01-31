Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCZ5d21t8zDq9r
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 05:09:09 +1100 (AEDT)
Received: from localhost (32.97.110.57 [32.97.110.57]) by mx.zohomail.com
 with SMTPS id 1485886137106648.0009108301737;
 Tue, 31 Jan 2017 10:08:57 -0800 (PST)
Date: Tue, 31 Jan 2017 12:08:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: David =?iso-8859-1?Q?M=FCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>,
 OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: Update strategy?
Message-ID: <20170131180850.mwbrp5les5h64vqm@asimov>
References: <0b4e0ee9-c10a-a443-f2a0-8f5a26f5c63c@elsoft.ch>
 <CAPLgG=mZJ8b-A4u1PKj-Gt0=_3rNCAJwiU=em4rJ1-aR7OtAKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ztg2igkir7tngmvz"
Content-Disposition: inline
In-Reply-To: <CAPLgG=mZJ8b-A4u1PKj-Gt0=_3rNCAJwiU=em4rJ1-aR7OtAKQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 31 Jan 2017 18:09:10 -0000


--ztg2igkir7tngmvz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 09:10:39AM -0800, Rick Altherr via openbmc wrote:
> https://github.com/openbmc/docs/blob/master/code-update.md
>=20
> On Tue, Jan 31, 2017 at 2:42 AM, David M=FCller (ELSOFT AG) <
> d.mueller@elsoft.ch> wrote:
>=20
> > Hello
> >
> > Is there an "official" way to update/upgrade an OpenBMC installation out
> > in the field?
> >
> > Dave

Dave,

Rick's link is to the current working model.  It isn't great.

Adriana had an email thread a few days ago titled "OpenBMC Image
Management" to start the design on a new implementation.

--=20
Patrick Williams

--ztg2igkir7tngmvz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkNKyAAoJEKsDR8wtAMEZuLMQAKeTWqV7zgNdHFNU9XhK42CG
saRnrWm05xFk1XIxLpsRsMhGkGF/vLItPYNXZ1mI/rRUqNRpXp2EvHsiCxLjQJMO
IPovXxg//HR6pjLPtm6yP4oD8QAUdQtL0zzbFSirGyIyUyVW8w8yAW6nokBswim8
Pzi47di3XQncSXsnni0apQ2TguwMT1aM57IW7FO90WrhiXiMUD+SGlrsmg5NaXWb
3d5cyh/KbYbXN9Pd0u0xaFWBYiWv7cJX3AIPkN4lDvENpg7dodj5znWQfWl7RrmZ
rdRCWu3Akl4aSzm1YB7X+puCRDsqcROifrXvhACHU6bR3/fqNbKeQg8rI42YYjFA
WInNcTF48KB9He5oE9hrgsNfCyFBW0yXKNqY8h+QrLd+NpYubcVWrAcu8ZDwfPLm
yI0uYXqeMa1b4/D4sNZSuxCIuVfxh1pFsYr73AsYCqa6135gu/Ff8zpoO5X4ATAl
9daMt6XG2s1zb7ZjMzPtyHZ7GdHd1UKstLX1ruW2gf7cBb38eP3G7DZHvnWIq++P
3AVypz7Rpb1/ol2fnb7tg3nkNJXpFdryIBDiJ4hxXhc66/2zBnW/+S3AhaKysS0T
5HZFItAtf98cjNcSrtIj+PWey0Eg0MpMBmb2a7lJulmF87AONJbG8sUZdE+I5coV
pKsXYggDV/YqdnbKoCAv
=6hZr
-----END PGP SIGNATURE-----

--ztg2igkir7tngmvz--
