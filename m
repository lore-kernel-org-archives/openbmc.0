Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV9Pc3b9qzDqjl
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 01:27:48 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1466004457553759.9126141623595;
 Wed, 15 Jun 2016 08:27:37 -0700 (PDT)
Date: Wed, 15 Jun 2016 10:27:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Subject: Re: [PATCH] aspeed/ast-g5: Simplify default bootargs
Message-ID: <20160615152735.GZ19968@asimov.austin.ibm.com>
References: <1465932059-5531-1-git-send-email-raltherr@google.com>
 <CACPK8Xfe+pVLwniWd9Nm3pemfrnVTZpS1twttN-aUGjQdPG-aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LvlcLv3JjFtLV6y2"
Content-Disposition: inline
In-Reply-To: <CACPK8Xfe+pVLwniWd9Nm3pemfrnVTZpS1twttN-aUGjQdPG-aA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 15:27:49 -0000


--LvlcLv3JjFtLV6y2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 01:49:12PM +1000, Joel Stanley wrote:
> > New arguments set default console for DEBUG_UART on the EVB and allow
> > the kernel to choose init path, root/overlay, and memory size.
> >
> > Change-Id: I919f7e4027968ad000c4283f8bd80cca1b17e2eb
>=20
> I normally ask submissions to not include links to internal bugzillas
> when submitting patches. Do you think that's a reasonable rule for
> gerrit tags as well?
>=20

I don't have a preference personally, but...

Neither upstream Linux kernel nor u-boot trees seem to require Gerrit
Change-Id tags to be removed.

--=20
Patrick Williams

--LvlcLv3JjFtLV6y2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXYXPnAAoJEKsDR8wtAMEZmA8P/inbmZX8NCGsVulyHJCw76Vi
0QCUp+9xQ+BSIVdk2Nd5Ul5lHclP+cfB0a/YZG0MNOudCSgLh+q+TXk16pSoSJYX
Uq6rjjvW23uLULNF6Dkumi+D9uwHmkdx5cNFxPN9W+aak/ONph/RHv6ZJg/V7VZx
/qPbqO7/g8MyNl+SI7TJNDaOxDXmFBOAEEYzKA7vh22PKfcFbuG3cksQeM4GAF+J
bv0ZiIu72wsVClxJFWO7KJHPgqVO+ig1kqS2njloJHjQkqznUWNMB7GxkL9NWnAz
wi0nCmfE0/vSMYvKAQYA889wza4NVf4YLBZrPUpZSDdjoddapnki29I3NaR/RQCT
6TFmKI4X/F2TzJM8iVuaXEdSnHNNB3pHEgg+lRDPfzyTxS8AOBrjVxpjl3qMcO8E
JM8lzGVBeTVPQt4fm0wiOpH1RX2dzw3gySiin7fDK6gkocuGiL2mC7ZtPJ56xTK4
yClXlJKtetCNQn/NzSHxYaUylWgVSr4hKVjzu2BQp3bLOidYzly+W2/iM6Ix47FZ
vUP78FbJxf/fPvB/HmleHd7UTKEYTSHj1XHgOQI/p1EfKOlKtdiXkj0XZpabS/W8
8ewRhtZ8klQ7pKJ+KleyY2Fts6Ep7ohlTUuvosP87oBSYm0y2lIITXCcrE8CZvHK
+MiBlOU2k+/5n3yXwwV+
=A/GU
-----END PGP SIGNATURE-----

--LvlcLv3JjFtLV6y2--
