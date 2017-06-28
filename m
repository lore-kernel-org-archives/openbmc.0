Return-Path: <wsa-dev@sang-engineering.com>
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyFFd0vfczDqyV
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 17:45:23 +1000 (AEST)
Received: (qmail 24898 invoked from network); 28 Jun 2017 09:45:16 +0200
Received: from p200300cf5bc54600021de0fffea0c865.dip0.t-ipconnect.de (HELO
 localhost) (l3s3148p1@2003:cf:5bc5:4600:21d:e0ff:fea0:c865)
 by mail.zeus03.de with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 28 Jun 2017 09:45:16 +0200
Date: Wed, 28 Jun 2017 09:45:15 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 "David S . Miller" <davem@davemloft.net>, mchehab@kernel.org,
 Joel Stanley <joel@jms.id.au>, martin.petersen@oracle.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-i2c@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v11 3/4] i2c: aspeed: added driver for Aspeed I2C
Message-ID: <20170628074515.GA1550@katana>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-4-brendanhiggins@google.com>
 <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
 <CAFd5g45=O2_MgfZEkmbY-=ZZY+izxeWSuhZT+B2e08P=O+WEog@mail.gmail.com>
 <20170627090042.GA2408@katana>
 <CAFd5g449iu6DGvMuP8-n8C6GBbr62G6_ZYS6Lh9038EB0XO9YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <CAFd5g449iu6DGvMuP8-n8C6GBbr62G6_ZYS6Lh9038EB0XO9YA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 28 Jun 2017 07:45:26 -0000


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> the struct i2c_bus_recovery_info. Is i2c_generic_scl_recovery supposed
> to be part of the user interface, or is it just intended to help put the
> main recovery function together?

Sorry, I don't understand the question. What do you mean?


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllTXocACgkQFA3kzBSg
Kbaeeg//SPK9le+UeP5TF7ffb7my1IPiug4r8BHGZncLLQyS/FLmCp8yai5KpYWV
oGFWrBnfnc/9kaHkrBXeyooCdyHKxIvYVarWiIoQsidM0Q9j4AD5J7edB9T31rGh
2PJvhLt5tKKK3G/W73rWa2a+SR2fRPbMKGnJffJjJaUXoVMtzO/b/gBrkuWJTTie
0UUlYm8TRDSW8IqtAJSxM10gU7a4lV5z9GGPrW+TmPm8/ezcqNjCZ483S+5+5izQ
vEtPJXIbeAxZcOGb0NhLmJVE6SQnh7aYBIMGpgbXzSuTEQzL20e+RuBUEJUOI9vP
C5kekSZzZHq7bTXg4pd1znCAnwTTvRb/OasqaeUZyj14N9LNWsDdZku3apLMauPU
nnsfdmihimfbcECcaaxXMkSTVzP00Biw7Pn+Wtu6H8ESnuswy0YrSq+16C0SR1E9
L5Wwvy5yyGGk2QCMpqgFfiCoRCgLhuHwN86qx1XTBBTe62PNqBiQIvn44pPykLQU
Uoj5azB2xM956j0bzTxN8AXcWUDPTRABe9HkG027KsEqgqisgOq7dmEG2rBcx2jE
cW2yCb+LawJQiR2XcSB6wen1dpYCOeQesDx8fSd3WLyy8Ln8aB1ftPT++Y3qmJG2
KkskjrjWfpEDa6fi3xBbrcQ+F95pBZNv2PDS0bCAZ81rCtq01i4=
=yvxZ
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
