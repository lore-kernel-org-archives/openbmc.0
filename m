Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t53Zf2drrzDvPd
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 23:52:58 +1100 (AEDT)
Received: from localhost (170.225.9.144 [170.225.9.144]) by mx.zohomail.com
 with SMTPS id 1477659171277147.5504051083808;
 Fri, 28 Oct 2016 05:52:51 -0700 (PDT)
Date: Fri, 28 Oct 2016 07:52:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit emails
Message-ID: <20161028125249.esdyeqbkpk6nedc2@asimov>
References: <CACPK8XeEiMremm9nbKRMxr3G6GmR4OTHjb1DHOxLjPqQ3WNBkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="meziv3e7mwfchhbb"
Content-Disposition: inline
In-Reply-To: <CACPK8XeEiMremm9nbKRMxr3G6GmR4OTHjb1DHOxLjPqQ3WNBkg@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Oct 2016 12:52:59 -0000


--meziv3e7mwfchhbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2016 at 05:06:18PM +1030, Joel Stanley wrote:
> Hi Patrick,
>=20
> I think you mentioned that Gerrit emails broke a while back. A few
> people have asked about it recently, so I was wondering if you could
> update us on how that is going?
>=20
> Do you need help?

I haven't had a chance to work on it.  Plan to get it fixed next week.

If you know a good / easy to install localhost SMTP agent you can point
me at, that would be great.  I need to get that installed and update the
TXT record on openbmc-project.xyz to enable the server to send emails
again.

The mail host I am using for my personal email is what I relayed the
Gerrit emails into and they limit sending to 200 per day, so we end up
getting rate limited pretty quick with how many people have subscribed
to all changes.

--=20
Patrick Williams

--meziv3e7mwfchhbb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYE0ohAAoJEKsDR8wtAMEZC9EP/AoPOfMBCfRIqBNLNJomAKN4
0OsFo3auB6e4aSbPsolArCxtc1j4YtOxPSDvTESyHTQeXpZSSBEbthGXO6OKgTvx
y/+N477LPUu3yHCbdD39fOHamaV026BYuhlTvMOOKhhNUD7WGXDuBbRpzKAFs99C
ID7RRUNSW3OUpt7oBQ34/CwCsO2yKaInHV0dp7lI9Su5o1y6h+htjQ4g4ZeQDZvj
Gs+yeFxgotQzE+PgEZMnmiggjaITefmtJQDdNZoAYf7YmwCKsIXhApPKUBsfgrCo
yYDYCl6LKrtbje3ibV9Fnh+FNLh5tdNzxUcFpvMUp2ZfGzcQIJtroz3DkPVQXJWQ
3+FaaEpElV71P4P4u/64QD27GU0R091/H9LnCS8imj7TCpf9sRQS5tD035J40F0Z
T/5K68cBgBw1kga6W/zaDY4BwECkmoSKDE/lDcZVQCAn7faxp9drHYYndA/YJXFu
1gARScEIaaJ1riTFz0SXoITAEfcK3ssKBtUOS04Au7bCvEUCs3TlqV1bwDUeccJc
BzjPpcj+OJUpT774OwZ0ZowrMlxtL47BODljYbPiP6XOl83zFaFiXrKDzGomrnTr
LdAmoccnMVCt+jpfZwISmoOXPSKgvEFArVTBiHPhmZ3LgquqfM8DlPxJ6P82o5sj
EHYgEkxzI893J05/MCkB
=jN/A
-----END PGP SIGNATURE-----

--meziv3e7mwfchhbb--
