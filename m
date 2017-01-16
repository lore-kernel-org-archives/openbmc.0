Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2Q0y38nHzDqRN
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 07:33:22 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1484598797728379.0083830472273;
 Mon, 16 Jan 2017 12:33:17 -0800 (PST)
Date: Mon, 16 Jan 2017 14:33:10 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: New per-repo CI job
Message-ID: <20170116203310.qeksdrqc7ikqdujz@asimov>
References: <CALLMt=qDOBvCQO2T_=FS87oQ46WYnKWEE+PrCc8F6gTw9jwYmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wjzzbttiec4xff3t"
Content-Disposition: inline
In-Reply-To: <CALLMt=qDOBvCQO2T_=FS87oQ46WYnKWEE+PrCc8F6gTw9jwYmw@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Jan 2017 20:33:23 -0000


--wjzzbttiec4xff3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 04:36:08PM -0600, Andrew Geissler wrote:
> Matt Barth and I enabled
> https://openpower.xyz/job/openbmc-repository-ci/ today.  This job will
> eventually run against every individual repo, do a build, and do the
> "make check" test.

Great work!  Looking forward to us:

    1. Eliminating the need for human compilers in code review and no
       longer catching compile errors only after we update the openbmc
       recipe.

    2. Having a test foundation for later adding static code analysis,
       code style checking, etc.
--=20
Patrick Williams

--wjzzbttiec4xff3t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYfS4GAAoJEKsDR8wtAMEZu4wP/2sU2ePCb0elH/gWsF3QMCqM
ooHnOL5eQw8wtBx46mwWILuy54riGay1tQHlBvj3zcC3k6PaGv/xzcZrK3GY7YI6
JqS34BRmCtV9eSxf13EQFmrVxQln3uDVHeENA5PSX6b9IQDTBAu/mvqqY5E6WVgy
BwyIeEl2tyDDsNzmCgjqJVQYiXzD5BMRDfGzy89gtiUNhWTJKl9q+hls3ZIpTo+c
Pg2NLJnSNqwNOHRwwcjOADD92TzQCquUMCRPhlINULhKNJEHK5FUF28ycZKE1Kc7
ax8kOiYjDKsDGTgH/65n1mKW2BifeB1dTvLfnTc1joUda/EMEYPEr3NhbFDTIJ94
SgbJkfTNP3CN+cfXKDHkEUXoVCZWR25iAMDVyVZfxua+LVEIDB7O15rKZJT2jpP7
r5jCR3G5oPY4PSrt9oSMrkI0UBZ2esQBPbyo9kt7uLX0/Il9QBtTfnGG0c79gCNO
zH2j5vlzNFTM9Ob10h6/w5w4jZJf/teT50nxF8javnxvHczXL93B5cGKV8LwaTbc
8lvDAAYOIsZU8Zxoz2G8Ke2WVuDuQrjy5FGz3WvOuxQ46JiTOYV4bllsiDmLFqAL
t4fIu7VI29DlnqRbRybkR2lrcSxe/Q9BXHErDN032Pzn/jyhQ+5bcePFKWWPj5aD
h30SgwLatxOhckS2UTf5
=Y4sU
-----END PGP SIGNATURE-----

--wjzzbttiec4xff3t--
