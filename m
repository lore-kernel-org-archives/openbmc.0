Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tLCxC3Hq3zDvmj
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 09:54:38 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1479509670630691.675366178179;
 Fri, 18 Nov 2016 14:54:30 -0800 (PST)
Date: Fri, 18 Nov 2016 16:54:29 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Jenkins job for per-repository CI
Message-ID: <20161118225429.6mytshalgitazutd@asimov>
References: <CALLMt=oTDrjn5BsFpxfiJX=AKN65_dqWi=bQMswunbwaNxe_0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bu5qttl35mbdwtwf"
Content-Disposition: inline
In-Reply-To: <CALLMt=oTDrjn5BsFpxfiJX=AKN65_dqWi=bQMswunbwaNxe_0g@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 Nov 2016 22:54:40 -0000


--bu5qttl35mbdwtwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 03:39:24PM -0600, Andrew Geissler wrote:
> For initial prototype work, we created a jenkins job to trigger on
> phosphor-event gerrit changes.  That job is here -
> https://openpower.xyz/job/phosphor-event-gerrit-trigger/

Are you going to convert that over to a template job so that we do not
need to create (and manage) a new Jenkins job for each repository?

--=20
Patrick Williams

--bu5qttl35mbdwtwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYL4akAAoJEKsDR8wtAMEZ2BEP/3QM0bGF2Mu/rZavFo8AFMpc
v3xw6ATpMQMPnjfM1xKOZ1OGTHet+6QKP7lP6xWkE/0eVlgAbsg/MxquT0DbZxt1
xssK9WWeZuvN+52JzXGbf82/PLUeH8cUxneF8TiQB4A2NHrUINYCXjZwR+uIJE/X
pM4MlhZOIxbtYbJENP4/+m2Jq3rtb8U1eiuyWxA0WFCm+DM4IkI/xF6SQ9x3S/qm
jsn/+2ZxTfWQX1N02xDa4u3GRbJC5iWIjSLnKzVDnYl69/q+/qaevMpQvNHZ7PZa
StU9aV8XJ43tWifRITsnfQavWo6L/E2mNXmRTFIOvpE8U8B8eIqERhmPSU/GRZW5
zINPqwP8IKgoacKLw13Bu+C79s/MZv1wmeyNO56Mt/SPHbxwlsvUXkTk88IkkafH
9tnPD8UyDl3Xov0DpRZ99tJjhI29Iug9YRUhI7mRm9y64qT3i1PTUPVrwc+C/3qN
AMnprkMyTZ5m0QwfD6I6qVGAypdKCUN58lQ37U8AnVf/JLm7TxT5th3hsfItRgnc
I6tfqiw5yWe2AEskWMHNS1VhvxCVU2zCi/3Ksql84nS8fle7yP8d+SXRzhGk1ciS
us4B7FrEbU64/riqlcrVVbE6T/BMQcMx0J6UwVhSGH8Jtpi0cAMuWrR/MttUBufg
qz6a7Ewo3BNbPynO5e5t
=buxw
-----END PGP SIGNATURE-----

--bu5qttl35mbdwtwf--
