Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w4Lfj3154zDq7c
 for <openbmc@lists.ozlabs.org>; Sat, 15 Apr 2017 01:09:32 +1000 (AEST)
Received: from localhost (170.225.9.144 [170.225.9.144]) by mx.zohomail.com
 with SMTPS id 1492182561847152.58422184585197;
 Fri, 14 Apr 2017 08:09:21 -0700 (PDT)
Date: Fri, 14 Apr 2017 10:09:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Maxim Sloyko <maxims@google.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Running tests
Message-ID: <20170414150915.p4jdh753kfcpvamt@asimov>
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
 <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
 <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
 <CAARXrtmFhWN3FhXnWD0AH6U1pDZcLM_K66L28PMZWQKF1J3j1A@mail.gmail.com>
 <0a092fda-9523-b33c-8879-314cfabc7a3c@linux.vnet.ibm.com>
 <CAFR_W8pr6i4q0kma2eLTkGNG+Jzha6_pAFUqsnt5a+jJ0e7y_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xnzpspbdv5l4w2jt"
Content-Disposition: inline
In-Reply-To: <CAFR_W8pr6i4q0kma2eLTkGNG+Jzha6_pAFUqsnt5a+jJ0e7y_g@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Fri, 14 Apr 2017 15:09:34 -0000


--xnzpspbdv5l4w2jt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Maxim,

I think you have two issues:

1) If you are running on an x86-host, you need to have an x86-target SDK
in order to compile and run on the x86-host.  Typically, we use the
qemux86-64 MACHINE.

2) When you run ./configure, you need to pass a set of options that
OE-SDK has set up:  ./configure ${CONFIGURE_FLAGS} --enable-oe-sdk

--
Patrick Williams

--xnzpspbdv5l4w2jt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY8OYbAAoJEKsDR8wtAMEZWhcP/iH99057ejMIsmCycWj4IXgo
ycbvsMKv2aIc2lqKW7NgPIKyhi01ulPKOUddwMv5PMIbHEOl9stYAynLf+Up4YxO
z3tGP3zOQRnRDPffae2X65pQIF6DC7BTKwBjyyAh7xWiPA0SoH2t/W3+rfmhlWfd
s94SX8/1P9evDZTcUAcvftJUCfBumfHQbKMQc5ZO/SQBiuvzg7PF7Q/fGY9CtrWa
sh3xxzqfm2Y1h4mlKbLfRYX6hXR5de6PwTy4xi+0WPwNZk7vtUSHrg2PeDFgJkSM
U134MqukGdJkUoxr/+xSbLlI2xrOoOp4ODIEpLeRRLuL8puHMD8xuagnix7nCLqC
7jkis9shgpLmS1crv/8A+TD81ewpo4jynBJZQCKsjO9bTXVWLY+jXHJIJ+iSShry
LHfxgMGI+IYUwlvy1JxBvefdmcgekfa/jsEbA6cj1dB037rc0geVTPlqF7mQEXWZ
gHNhqYgqkzh3f23gUOpk46PwqNjxzOJNpYcFZ7ytx8hWccynw9T3itez53HCqVF/
rUUQYhHqihHjj/wO8J7KeBddXFTJeDUVvMgUBUT9uwIQK30HmObVeeeAKE9yduzn
Sy/YAWTRoY1uzATSq0JwdHdJYfx7siVzEPikWuX4B5vSOGIJk3xiu/WsBPiXbmkc
AYabRjYTdbBYVJO7e1QD
=M3mz
-----END PGP SIGNATURE-----

--xnzpspbdv5l4w2jt--
