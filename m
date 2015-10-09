Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 85A7E1A03AA
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2015 00:13:22 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444396398108377.0963509269311;
 Fri, 9 Oct 2015 06:13:18 -0700 (PDT)
Date: Fri, 9 Oct 2015 08:13:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Use SYSTEM bus instead of SESSION
Message-ID: <20151009131316.GJ12084@asimov.ibm.com>
References: <1444396270-14585-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3U8TY7m7wOx7RL1F"
Content-Disposition: inline
In-Reply-To: <1444396270-14585-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151009131316.GJ12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 09 Oct 2015 13:13:23 -0000


--3U8TY7m7wOx7RL1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2015 at 08:11:09AM -0500, OpenBMC Patches wrote:
> Use SYSTEM bus instead of SESSION
>=20
> https://github.com/openbmc/phosphor-host-ipmid/pull/2
>=20
> vishwabmc (1):
>   INITIAL CHANGE

Need a better commit message than this, but otherwise code is ok.

The title of your pull request would probably be an acceptable commit
message.

>=20
>  ipmid.C | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--3U8TY7m7wOx7RL1F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWF71sAAoJEKsDR8wtAMEZij8P/1gAYze7V2WNOlNTA0j9fnqd
TkErIjquL3abaCAaYlVnJk7KWMSLNEVLGdAkeTCKXeo7iea8heAdloODW9cTh/cN
HqYa4AT8WbcGMzArauIA9aF5k6CnB2AV8Fafg2alSrf2OvBxf5LMY9YzrqaqVw9A
kSpWRWAt3sHkVJOmH55i822UPETUGHLeerhNq6pyhB57SV4nVyKZIcJV0j6O5rsN
uBIEnA4Jk20EcA80Vrx01GPlmLx40wkSQpLBaQ+bvRme+OSvOa9Qg7AJwOOFRjRU
7tkhjSHeBBax8sU/Hks92q1k0OXjZIjLTsxIVfkjrQGkbYh8LAoAcW2zCX014qAC
vNGUC3qYLpUBmIOQblJ5YFG5n60el986Sflb51I0YfaXRmXrbNTCTeh/vgNySr/i
X0wIJuPTmF7Q0FnsBNy6gYQRIQ2tn2/j2RZ44O8bIJyCfruzSHwbYpe9vcYAX28U
SJlCASdWNUWrlB0dRX9nNZv8GtRHLxGSfD9RFRLKQx4mO5lXvHaqNtuPvWFf4tL8
XdYeyRyIiHZaGCJZZTajvAN94szpToi6lZdDNfXyNNhbnY5ur3ng5tdDjTlLomOb
xHZfv8/Z0+D1H3qFZ8LgXk8m73Gpjrhh9DgNLrazh52XMBHctzlvt106IYDTSGLu
klBo2vkxqrwg/CtA5oXy
=5Oyt
-----END PGP SIGNATURE-----

--3U8TY7m7wOx7RL1F--
