Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKKVs23w7zDq5W
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 04:02:44 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494007360192163.76609877381247;
 Fri, 5 May 2017 11:02:40 -0700 (PDT)
Date: Fri, 5 May 2017 13:02:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: phosphor-hwmon bottleneck potential
Message-ID: <20170505180239.GF25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
 <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Fri, 05 May 2017 18:02:46 -0000


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jaghu,

Can you comment?  I'm looking at the version that was merged into Linus'
master for 4.12:

commit 2d7a548a3eff382da5cd743670693b7657327714
Author: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date:   Tue Apr 4 17:52:41 2017 -0700

    drivers: hwmon: Support for ASPEED PWM/Fan tach


On Fri, May 05, 2017 at 10:48:39AM -0700, Rick Altherr wrote:
> I can't comment on the driver implementation choices.  They have been
> reviewed and accepted by upstream.  I'm not sure what version of the driv=
er
> you are looking at.
>=20
> On Fri, May 5, 2017 at 10:43 AM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
>=20
> > Rick,
> >
> > On Fri, May 05, 2017 at 09:48:01AM -0700, Rick Altherr wrote:
> > > I've chatted with Patrick V. separately about the driver.  AST2400/25=
00
> > fan
> > > tach hardware measures only one fan at a time.  I think we can adjust=
 the
> > > driver settings to reduce the measurement time but it will scale with=
 #
> > of
> > > tachs being read.
> >
> > I never looked at this driver before but it looks like it is doing an
> > 'msleep' in the hwmon read path after resetting a counter register and
> > then counting rotations?  Two comments:
> >
> > 1. As it stands, it doesn't appear that this driver is actually
> > multi-reader safe (either thread or process).  There is no locking or
> > queueing to prevent one reader from resetting the result register while
> > another is performing the msleep loop.  Multi-threading might "go
> > faster" but it will give entirely wrong results by my reading.
> >
> > 2. It seems bad to do a long-running msleep in the hwmon read path to
> > begin with.  Should this driver be restructured to have a kthread read
> > the channels in the background on a polling interval instead of
> > initiating by userspace action?
> >
> > --
> > Patrick Williams
> >

--=20
Patrick Williams

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkMvj8ACgkQqwNHzC0A
wRlEYA/9E6mEU9/70Cyb56a7+nJ7jCu++g/RabT9NKFCjmZkbI5fda1HwOpw+b/b
Go0Hx4aOnd2XgFkKMNBCIRGQUQYpiiBIvkf2hBpNfxWkWavTYlr88xzw27zhDG1K
q178GXZoOOQEGBu1pF0OKVtL9HGFgcQ6JDuJmEeeBQxoKV7cDYLToi0eMDy3UT5T
3clT2i88nHb9L8dh4VberHIGFX9wc8rOZD4FDGhUldv2AU47ffKlZRkrVQJn6+Q2
L0DtDt+7FzaoHKp2cshiUyNG6LS8RJvNl4T8kEGatabDlJpn155XBSWOlgOaETyy
L3/hM+gLkZ8phapQLid/A/P5DrieUiTeoY8bc8+GgV5P7KP6bS5MBEepPF7isjRf
+6ERy7xosPZSF8YQedwgFRbZaBEVV8OhCeufe2Uj1ijVbuS8a7L14dH3EIAMWLv8
7JIu6I0AulbbpupDT1kv2ypDHOwW5oJBcqgCPY74PY8n4AVuNomSmYLaV0lSCjIs
D95vQH0m2Yn1SWyYzIyfaVgWNFg1HF4n99/CSOkrMjGbQsD3Z3ou+rAMz42D5BuA
hbrTNWDO5E7y8AzWfSpJe2FqlkEKoo9xF6QMEs5o1sUikXlMCfAkNuoz1bbbIIsT
4NsYX9b67XT7y5lDzPLSsywY4zzsBj9Y+pSRev1s6GFlSUNVs7E=
=c5yH
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
