Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rqPPr0C8DzDqFq
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2016 02:27:43 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1468427254605323.3913867121431;
 Wed, 13 Jul 2016 09:27:34 -0700 (PDT)
Date: Wed, 13 Jul 2016 11:27:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: David =?iso-8859-1?Q?M=FCller_=28ELSOFT_AG=29?= <d.mueller@elsoft.ch>
Cc: openbmc@lists.ozlabs.org, Teddy Reed <teddy@prosauce.org>
Subject: Re: OpenBMC port to AST2400 on Piestewa Peak CRB?
Message-ID: <20160713162732.GB12735@asimov.austin.ibm.com>
References: <57863637.3090405@elsoft.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <57863637.3090405@elsoft.ch>
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
X-List-Received-Date: Wed, 13 Jul 2016 16:27:44 -0000


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, Jul 13, 2016 at 02:38:15PM +0200, David M=FCller (ELSOFT AG) wrote:
> Hello
>=20
> Does anybody have plans to port or have already ported OpenBMC to the
> AST2400 BMC used on the Intel Piestewa Peak Customer Reference Board?
>=20
> Dave
>=20

Currently, the code tree at http://github.com/openbmc/openbmc only
supports full functionality on Power8 systems.  The AST2400 itself is
host-processor agnostic, so it probably wouldn't be much trouble to get
it running on that board.  It would be the userspace apps that interact
with the Host that would need work.

Facebook has a different code stack that does support Intel processors.
I do not know how close any of their systems would be to this reference
board.

We are wanting to work with anyone who might be interested in extending
our code-base to support non-Power architectures, but it just isn't my
team's focus.  We have been discussing with Facebook on how to get parts
of the code stack common between our two efforts.  Our main areas of
focus now have been on Linux kernel and u-boot support.

Cc'd Teddy @ Facebook so he can forward this around over there.
--=20
Patrick Williams

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXhmv0AAoJEKsDR8wtAMEZXBkP/3ycFa/puaWDwyuDAkR0OeQ2
Rw1copn/cc5RLZc3bU1k4EBgb399y0sRwqD0HF4ha7rdEs63uVk7CYOGn1OKKLvc
TI4gzYL0gvX4pZKe3svQ7lqKEH4Kdcg6/AOjz5QwlBU3aoUTyJGdFkP9pZdeddnY
fNQAuhIrfhDP8ojH6bLhA9ErJaTV5bivOo0TmD+9MfOAczn2rjqMPk3sHue2Ymlq
5OISyDuiNNdGrt/FiBf3FV7KVWuQHKbA0iHxGdbrIrj7AjN1A2wRKpjFA4rgCuqt
HFyqp3uMJt2CykZs7r2ZX51AKZzZyWailimXiinQKLKHKTBVGLEZa/dxWFz6T8wt
LjjURhUu5pjZ29SpW2i30WxdgBsRyKdzJE0GHz64IOCj8FV5Ix2o1uLio/7g4Evy
ed8TsakuW3J/cKZd33WKxzheC0JzCR4oAr1nxYOR1VBz7kb2styOD0dZ6YF8I2ud
e82yyoa6RT5wuDl7809GQ3tQVvk8Bk2pIJh8hOw/XN55FIywFKiwwg6cH2eE0ohR
Fl9kgU055f204zjFNrLE9MWe/6S4GZVz/zJqC320FeLAeFJ3sRW3m/1YL0OynFDL
tnEseFsVAppnuXZy9AqbzAW15vBqbWMS8Sv9RSanRnbMerXw4ls1EutN57lFtlgH
k016XcpbsiM3gfvXyW32
=TcKP
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
