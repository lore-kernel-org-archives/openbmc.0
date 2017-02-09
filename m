Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKB756FpKzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 08:29:53 +1100 (AEDT)
Received: from localhost (170.225.9.144 [170.225.9.144]) by mx.zohomail.com
 with SMTPS id 1486675777348516.0461129684404;
 Thu, 9 Feb 2017 13:29:37 -0800 (PST)
Date: Thu, 9 Feb 2017 15:29:35 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Rick Altherr <raltherr@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux] dts: aspeed: merge initrd into kernel in flash
 layout
Message-ID: <20170209212935.i52zqkd6mltdm33m@asimov>
References: <20170131183927.30887-1-raltherr@google.com>
 <CACPK8Xf7qFw-LgnwTyJH3fMme5w_c99JuJ1LVA74VmFGkBMDPg@mail.gmail.com>
 <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bqtauvrvi3ogemz4"
Content-Disposition: inline
In-Reply-To: <CALLMt=pHyZhj8W7i7qWgM6ppf0a+4aUp8+zxfx8QFSuZ_xNpnQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Feb 2017 21:29:54 -0000


--bqtauvrvi3ogemz4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 10:36:39AM -0600, Andrew Geissler wrote:
> Ack, we just went through this with the last update and all hit
> https://github.com/openbmc/openbmc/issues/1030.  It was pretty
> disruptive for all of us in the lab needing to pull the chips and
> manually flash each.  This is would be fine if we can just flash the
> <system>.all.tar and all works ok, but that was not what we found in
> https://github.com/openbmc/openbmc/issues/1030.

In the issue you referenced, Milton mentioned rewriting the whole flash.
The <system>.all.tar should be that.  Is this simply a problem with the
REST API or manually putting the <system>.all.tar into /run/initramfs
also not work? [1]

[1]: https://github.com/openbmc/docs/blob/master/code-update.md#update-from=
-the-openbmc-shell

--=20
Patrick Williams

--bqtauvrvi3ogemz4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnN8/AAoJEKsDR8wtAMEZLMQQAIbjlPyPs3k3wv0KfRGQ9BpA
LdozOQz2wxsmzcVzNgmSuNqbv2o1f5wzqvTFkWEUVXKfF2ql6AR9WN0fV97Q6LQi
f3IKioGPm8iRkEnp5yKy4iVbDXOrwDFY1ibPk2tYqPH/dN4p66hnOmPHQv6jMSfW
Iusz8LrVHCr+6CfmB+OCja95/5t5J81jB/AmtFT3ltsE6i2x62a9H75FulwT9gyr
quGFHMFSeDAqQ+6yEapzHBMdIHBJMsrrQS4Y8EQuckC/KJMZbFML5jXRxYZuVNgc
M6De/GZrxNU07/Zr07AwpfDVrKnYPqHN9I14aFta7QxpbNT186Weytdpp0+9jgQv
w7GejLtORWAvGW7JbKuyWI5j0Nh3KD0eB2EMeSXdk3IAlOfJLpudoJxaj7ApxnZn
IjRpRSQpglLUX4SW/ssoHKMewbzX1wigwrhOISKsp58sp/024naELQaiA8wTfW8w
uummJp9IlW6+OY6J6v+qqxFOmZqkoQCxklIDPIYXUdxbFNZhIfPlNS8uMFkARaIS
e3CIs/ypXNwZSRBDAlh5mFm7Qq1Fa8wflQnhqektg3iKZELjKtl9UIBJrxC1+csA
993c1CzmXSk5e+NEpzg+tg1YnZS7ygq3azmE0VxlAsAFqBI4rY+xAEo/JbYMxzHj
Hc7bcmISWLyuvX6SShgn
=r2aS
-----END PGP SIGNATURE-----

--bqtauvrvi3ogemz4--
