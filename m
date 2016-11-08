Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCnT13cq4zDt31
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 22:41:24 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 147860527775727.548073472603278;
 Tue, 8 Nov 2016 03:41:17 -0800 (PST)
Date: Tue, 8 Nov 2016 05:41:11 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: Li Nan <william.bjlinan@hotmail.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
Message-ID: <20161108114111.GG15757@heinlein.lan>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com>
 <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com>
 <20161107035006.GB15757@heinlein.lan>
 <5821ACDB.5040607@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline
In-Reply-To: <5821ACDB.5040607@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 08 Nov 2016 11:41:26 -0000


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Tom,

Thanks for tracking this down.  I created an issue against xcat to
discuss and make sure they are happy with our direction.  Hopefully this
can also be used to track any changes they need to make.

https://github.com/xcat2/xcat-core/issues/2108

--=20
Patrick Williams

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIbnUAAoJEKsDR8wtAMEZJR8P/jxPhKY6TgptnF/8pJLFiWca
90/cINcMGgS3zvmkhCxoNez3mDP4RGxXCtPeIcwkfTtFQ6LU36zvScJwUw1/0O0m
Ftt3AY5HZMRHjSIh8uBQzU/nVV7+86FsQD5Pp7xKmFN4VKoKeyi7xYEpxKcvwFNh
oSAHd14i7dro1gi4E553ys/46H6fbZRPKz2Hdu95V8iG8iZpx4l19uir5pH3xUfW
JsKrPy7dVbh+9EEeV+C5zXRQ0XXRe4EuZsbuVr6XmI6XH9P5KoSDCi8MJQS7E598
wuksQqLyfANG1VIi2M9KjlCtwIyGv5NG5H6ivD51Dqvn3gA8aeM0MapVsDzhhJRC
abP9yfunUfGuXr+jejiZKBVnF5I/vOw8reix4p+nA1IAhXhJ3whVPxeTLighlf/W
xv+z7iQRBe72TjqcBvM2W75il8h0mysQx/ktxSZl/cSi83sx5kJvIIXjYHdh8h6u
ShCpEg6j45ksyT8QhvAtswQD5cMNJppSDMnvGcDE4UxHgTHgHWV74swy3WwAgw6m
vCjT4XoeZsAMpCSOzIyEtQi7AX4Dqe4KVrCHhg2XYyxzbwgBj4wJijXguHHjp66F
HkHlpgSSOFEPNoMI9PL0OHuuEss7wTNBpwb69fMhtWgU1hxy+I6ld/HRH42F20ey
0ENuLRP9SiyiTk0QZe+W
=74Y6
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
