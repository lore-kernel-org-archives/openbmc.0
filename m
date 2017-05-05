Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKHdF4Ck6zDqCL
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 02:38:09 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494002283306474.23419697104305;
 Fri, 5 May 2017 09:38:03 -0700 (PDT)
Date: Fri, 5 May 2017 11:38:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Venture <venture@google.com>
Cc: openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>,
 Matthew Barth <msbarth@linux.vnet.ibm.com>
Subject: Re: phosphor-hwmon bottleneck potential
Message-ID: <20170505163802.GD25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline
In-Reply-To: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 May 2017 16:38:10 -0000


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 09:11:49AM -0700, Patrick Venture wrote:
> Without multi-threading to remove the timing bottleneck on my platform, a=
nd
> the inability to provide other more direct interfaces for controlling fan=
s,
> I'll be unable to use phosphor-hwmon as a primary source for
> reading/writing sensor data and will be unable to upstream any effort i
> make to write a pluggable thermal controller.

=46rom what you wrote earlier, it seems like the constraint has nothing to
do with phosphor-hwmon but with the hwmon subsystem for your particular
driver?  How does a "direct interface" avoid the hwmon latency?  I'm 99%
certain that it isn't dbus itself contributing to the 8 second latency
you are seeing here.  Are you arriving at a different conclusion?

--=20
Patrick Williams

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkMqmoACgkQqwNHzC0A
wRk7gw//ZFwaiQ9eijiadfydXllc+uxbH/n1vruWovBrMWXoFpGRy4CoQEVpbVzs
5xvxQ/963eOlzvgxsKt40DcSyEOwdRzxEHaJ6WcHBIVoTx1HbmTER7NIooMQP+vS
/2TlHaPg1+hEYg6JS1+t+noRljem0gMgZkxgkpkbOpA0Xhs6xoAZpzAz58DVFpZy
J1/0iBZPZKGx8VgE+SfrN0oLx6hjyPXHQJF85fjF1KwGWL0Ril/hCA2qyJSEkyWt
nTFARJt6OVQSjb+JQtLGMgNz91Y5s5ojGIRH1+mLSKPpHs30SiCNFiS+y/l3B7Qq
1OmCvHEVogJ3eyy3+Y7X6E7Iu2HCXtCDy3SsDYvQyqAmX8jYAliYcLMr4ZwtDkws
87lAR+d/LeICTIVcTsyqbTJZqo110WrbTfpj7UeG6ElaMhvgVYERlvtDkaJPNA8L
deyLgbQIN5EOrNwT9qpF47dBMuLH+yDe8t/x6TUR790wYxLfjYrhMlbnAdtei3VD
Sl2aUBKFNB7zmSci0M2M2AdOsZmK8fo5eb53VukHKGPIKQyYEmDc+CrauKkfKbaQ
aHYXHRbAwq6OWfjcaZAeM6iVVbfiCW/rbX8/bumvH4p3xQgnXcRvcf15+CCVhRdB
lqeexjFlF+037tEfX43iscqpnSqm72x7fs7xUYyDGFIWK8+4gnQ=
=l4D6
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
