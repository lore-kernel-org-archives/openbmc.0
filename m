Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8gpH6hptzDqdr
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 05:15:19 +1000 (AEST)
Received: from localhost (32.97.110.50 [32.97.110.50]) by mx.zohomail.com
 with SMTPS id 1470856515713471.7999441540021;
 Wed, 10 Aug 2016 12:15:15 -0700 (PDT)
Date: Wed, 10 Aug 2016 14:15:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC on the OpenWRT
Message-ID: <20160810191513.fdpyo36eihkqg6fx@asimov>
References: <97341470823017@webcorp01g.yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fczp3leyhm72yq2r"
Content-Disposition: inline
In-Reply-To: <97341470823017@webcorp01g.yandex-team.ru>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Wed, 10 Aug 2016 19:15:20 -0000


--fczp3leyhm72yq2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 12:56:57PM +0300, Anton D. Kachalov wrote:
> Hello everybody.

Hi Anton.  Thank you for connecting with us.

> I'm working on a separate project for rack solution which utilize many po=
rtions of OpenBMC:
>=20
>    https://github.com/ya-mouse/openbmc-target

I would certainly be interested to understand the use-cases you are
solving.  Our intention is that this OpenBMC code base can be used not
only for typical servers but also storage / network controllers or
blade chassis.  Right now we are focused on a standard server but we are
trying not to design ourselves into a dead-end.

> As a system base we choose OpenWRT (flexible kernel-style configurations,=
 package manager,
> wide and experienced support for embedded systems with limited resources).

Is there a technical advantage that you see by using OpenWRT for your
project or just a familiarity?  A few of us have worked on another
project that used Buildroot which is very similar to OpenWRT, but
settled on Yocto for this project.  Yocto certainly has a steeper
learning curve, but it has much better support for "overlays" than
Buildroot/OpenWRT; that solves a major problem we had collaborating with
others on the Buildroot-based project.

> 4. LuaJIT + Nginx as a HTTP API backend instead of python/micropython.
>     We're on internal dissccusion of the API as a mainstream replacement =
for IPMB/IPMI.
>     We use local memcached for fast serving data.

Our current API is REST-based but it is a simple introspection of the
dbus objects presented by our userspace applications.  All interprocess
communication is done through well-defined dbus interfaces and we simply
expose those out to the user via REST.

We also intended for this to be a replacement for IPMI, but there seems
to be a lot of resistance to that due to Redfish being very similar in
goals.

We are not necessarily stuck on the python implementation, but would
need to understand the CPU vs flash space trade-off.  Most server BMCs
have very limited flash space (32MB of NOR flash) so that is our largest
constraint.

Your use of memcached does spark an interesting optimization in my mind
for our dbus-based REST server though.  We could do something similar to
cache the state of internal dbus objects and flush the cache based on
the object-changed dbus signals.

> Just for reference.
> We've compared performance of the several dynamic HTTP configurations suc=
h as
> python/micropython/lua (LuCI) and embeeded lua within nginx and discover =
that last one has almost
> maximum RPS comparing to the static pages serving.
> Static is about 350 RPS while dynamic nginx+luajit with auth checking is =
at 220RPS.
> Simple python's http serves at 40 RPS. LuCI variant is 4-6 RPS.
> First request to authentication service occurs via https and the result s=
tored in the
> local nginx shared memory storage for the further use (configured for one=
 minute).

That sounds significantly more performant.  Do you happen to know the
disk space requirements of this config?

--=20
Patrick Williams

--fczp3leyhm72yq2r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXq31BAAoJEKsDR8wtAMEZC6wP+QGZmSUgKgq0LlKwhZXcZr5f
tleLgl0jjXQiDL6WrLRK4XU+hIFxWXaJT6HTDTgqJXI5TN528916/+4mAg5G+fHI
PC6a/18e0f3VYW3qyoWatVUlNQ7AF8cb7tVypvOfUf6Pi73jps3AhSobAI8suez4
+cmHbKOoLl5so9vSCIJgKmmSOD9/ZEMRot6hRHbVfxVXyx0RhDQClYAyIl+Cdi7m
DppsiI4mzVRECGeDpgvQU3Eof5T2IG4+d8lyq/djH/jnfoWakK5OORHyqPUr8u8K
74oiD5wJfZDvcqkKKZ4NHH/w8wd3dunIMQv9J2/NKVRYKauG5jTRL8BKSHpa7vz5
/c9ymyg4VweAuIF2VSJNEbcSZ1H5BkomlMzo0IXNzhbVqfE+ZLJXZQw57Mfmtlq2
ojI2nlQjf5Pz7DImBBweOUmmj7S4jWB7XyQ6kYLHQG/X1p8f5Y+hsfXaHlQ/KlQE
+4q2AjSNNynumpW+hwPYb6+CdtFXUhfNrfJfS0hMhD7YR46RPygF3de01GmBJ5SE
u79G8codnE75stFf3GMPf09REcL+pK42JfWG3Ff/TN1IkvIlnlvb0UnMgALgcImC
LPzogRJkhG3hyZolaYBrh1puMwBRG5VxnAcxGFuEx2bH2RvSLrImm/uUy7qLD7xa
4tel3saijxcqa7STAUlf
=aJfN
-----END PGP SIGNATURE-----

--fczp3leyhm72yq2r--
