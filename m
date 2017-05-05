Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKK535PkXzDq5W
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 03:43:49 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494006222643149.35846275502308;
 Fri, 5 May 2017 10:43:42 -0700 (PDT)
Date: Fri, 5 May 2017 12:43:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: phosphor-hwmon bottleneck potential
Message-ID: <20170505174341.GE25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline
In-Reply-To: <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 May 2017 17:43:53 -0000


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rick,

On Fri, May 05, 2017 at 09:48:01AM -0700, Rick Altherr wrote:
> I've chatted with Patrick V. separately about the driver.  AST2400/2500 f=
an
> tach hardware measures only one fan at a time.  I think we can adjust the
> driver settings to reduce the measurement time but it will scale with # of
> tachs being read.

I never looked at this driver before but it looks like it is doing an
'msleep' in the hwmon read path after resetting a counter register and
then counting rotations?  Two comments:

1. As it stands, it doesn't appear that this driver is actually
multi-reader safe (either thread or process).  There is no locking or
queueing to prevent one reader from resetting the result register while
another is performing the msleep loop.  Multi-threading might "go
faster" but it will give entirely wrong results by my reading.

2. It seems bad to do a long-running msleep in the hwmon read path to
begin with.  Should this driver be restructured to have a kthread read
the channels in the background on a polling interval instead of
initiating by userspace action?

--=20
Patrick Williams

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkMucsACgkQqwNHzC0A
wRmzFQ/8DgCzhAsyjMVl7Y2JN8AEIhvMUDf2M6w1bHfWsLEX0pQgLZAEERrDhP2G
J6GVcJi2/eUjNGVyWY3zJmQTr0bsRd6jlmbRvXXKCVf4SRZDj2YSFIh8qNKlL1gp
KAXRyj7OWCV6ieRk6CkPdmAt0Bc2WAfyl4jKt23zPDXbfaRy+GtH5w56XGdhEwsK
SNQeAq0GFkssiGH4E1i3JzVMq3jdbIG7kcFEjMhcfZPUvKQ2M4OMz4cLQ1X7DNJr
ijozdSWSuqRChXol4DXxC1n8HKh7Q5ldbK5DfXfwCiX//PrM2UW9ZZ5bz4TLLYyV
YrrJdBpWLU1VkgCFm7Yeis3jyIJC6JqgVUhi+YIHjVL/bey96O37gX23WaJZrzGi
h3ZrgURYk8KVjxD8lMbzjINTlm86NDOJzbNG+AmSn7M6gz8o2THRdvJds/e67zfi
63RU3uwHIzAr3QBCmtxD+Py7GITOWXgodPJsEk8yAS/3md7/t81GB5GF5ef3JD2g
iQPL1zsxFtvd1HG4NftuTTpiHmkSyTD0MPHl/TO4EsW7rJgKhczsqVvml2z4TKyt
1UxcuroXh5OxEAzt3DZftKokLEqTlbRtmAxHCj2yCedz8+nFw9nQqyNARo3Wwihy
eL9zYR9w2Q45b2LKHdCOd6we9B6ssPrs63rzLQ8COZivT9jSET0=
=dcJF
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
