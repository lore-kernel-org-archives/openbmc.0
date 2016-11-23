Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP3Jd17JHzDw6b
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 00:36:16 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1479908168201649.0764611216484;
 Wed, 23 Nov 2016 05:36:08 -0800 (PST)
Date: Wed, 23 Nov 2016 07:36:05 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Abhishek Pandit <abhishekpandit@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Refactoring skeleton flash control
Message-ID: <20161123133605.GQ15757@heinlein.lan>
References: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
 <20161115113954.GK15757@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oDto3OTLsk6uOlQH"
Content-Disposition: inline
In-Reply-To: <20161115113954.GK15757@heinlein.lan>
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
X-List-Received-Date: Wed, 23 Nov 2016 13:36:17 -0000


--oDto3OTLsk6uOlQH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2016 at 05:39:54AM -0600, Patrick Williams wrote:
> Interface modeling:

Abhishek,

As we discussed last night, I refined and uploaded these interface
models to Gerrit:  https://gerrit.openbmc-project.xyz/#/c/1291/1

I will go through your proposal on Gerrit and try to give you a
comparison between your methods and the ones I'm proposing.  Also as
we discussed, you can decide how much of the ItemUpdater aspects
you are able to implement now vs leaving your proposal as an
'Experimental' interface and we refactor it as we implement other
aspects of my propsal.

--=20
Patrick Williams

--oDto3OTLsk6uOlQH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNZtCAAoJEKsDR8wtAMEZogQP/AkMb89VlH/uNwGHYCkKpCnA
bhZ3tCsJIBZzizTp0Dvsaa0LC1lHxHqzjzuvQURvo8xZyP3Pp/aAxxYoI+vijsYA
LZeQrq6UqAfkR4lYt0fyaoggdDl6RPHJkV0axZyTo8cakARIl6XFJXqQkRzTiSA0
O5KIJtidaMQx0l+t4mLmd8SlW8H0yuG9Rv9Tqgh39EBGtQTmWnR5Hy71cYWN3bYr
GQtUYefUWrzO6gR00yUuZhGHaxkJ000hmeHj0FVohPEyPQzXNm7gVcH2E4oh6pdn
6VopKMyDssuZc1R4VJs+xSLLgbWykPOoG7G5qXhZxX+MsAP6kJIQdvnRWYcgcydQ
QeyxZSFDfCQt56BLeQxygy/Ye/Z28ayXWNeMd9NVLboLokOPpGtox6qefLUaJ16J
ZxfwWuFawu8NPOwnXYunYJwZh4VBMa/0+xsmrPzIb4hhS6/St2s9qTUpvJA1BN2j
q9h0CTb1zcU6TtQIUvfhdv+08x75m8VOKZ10UMYg/qkcreXB12y/RvTrEamGmUb5
ze7vqdHXEvU5hdZ/S+OPD1eDOs+Q+2Kjy7eoHQXgokb9oUDHSIgr3/RO0lA9cpvU
8mWSSWPb1zpXSW+JCqoEyXEuqLOwN35pQI8IwOi1oswEc+eZPAYwD4VAZOucm4nN
jclH1C36tkhyNpz3ZjU3
=S5Up
-----END PGP SIGNATURE-----

--oDto3OTLsk6uOlQH--
