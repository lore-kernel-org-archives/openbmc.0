Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHyYp0BnHzDrFD
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 13:45:49 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1501127143410629.0368175626845;
 Wed, 26 Jul 2017 20:45:43 -0700 (PDT)
Date: Wed, 26 Jul 2017 22:45:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: FFDC tool?
Message-ID: <20170727034542.GA14987@asimov>
References: <87bmo6sp6k.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <87bmo6sp6k.fsf@linux.vnet.ibm.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Thu, 27 Jul 2017 03:45:50 -0000


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 10:23:31AM +1000, Stewart Smith wrote:
> So, I spotted https://gerrit.openbmc-project.xyz/#/c/4881/ (well, an
> associated internal bug report), and it appears there is a FFDC tool in
> existence?
>=20
> (FFDC seems like a bit of an IBM specific term, First Failure Data
> Capture - i.e. gather all the things when something goes wrong and
> attach it to a bug report)
>=20
> I'm wondering where I missed any announce/info on its availability and
> use?

It has been around since January.  Not sure we announced it specifically
anywhere.  It was something quickly thrown together by one of the
members of the automated test team to help them facilitate gathering
some data for automated test failures.

Jayanth is working on a fairly large revamp of this so we can handle
capturing different data for both core dumps and user-initiated data
collection.

He started a discussion on it back in May but did not get any feedback:
    https://lists.ozlabs.org/pipermail/openbmc/2017-May/007654.html

>=20
> Perhaps an idea would be to put it in the motd and/or /etc/issue(.net)
> so that it's prominently documented (we do this for petitboot for
> OpenPOWER host firmware, and I think that helps)?

We should probably revisit this after the new API is complete.

--=20
Patrick Williams

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAll5YeMACgkQqwNHzC0A
wRnB1A/+OLi7VRV+xQNE1UIqj1iriZr+aHz4QKTYB/ewJ7Im5evHW4Yj9fhp46M1
MPDVGDqs50TjOYvoJKGspIN/FigcynPF3CA0NAkA9oNMnpk+sLk68dywI4DGJ7UX
PAlNHMw2EOhKq297KBX7XbN4Ksk7TFxmaI34akxGm8MGF3UM9eIao39MgIjp63Da
T0wwhCkwkuoEMCTqgdwtPSQA7jPXyMJ/eAsUt0ntxaljBMNEPN+w8Dp3n/v5B9Vw
ZGyJ3Zvmv0cV2zQ+oBD0CAJoC5vn4SLTDyo3M+sxXCi6lxnL6zdyyccSWctGaTk6
Fn8jijHhkrVsRWAejj+FrTIqJeP4nyna5E67MDOWFZXFiLJJTnSa/ZgtIkRy2tp0
q6YPkyIbf//9CLyWL8D2c3p89sDTSgxo3ioJiLAsY1ME5Fee63LLCX+lSZz2uFVx
wTOjhV5KKMQRNFSkqEZ7xnFbGA85ga6VhVULT+aeAIPrPToYRMiuspRreP3xO7sn
6UgMZvT8DB5H5zxETUMToLgfBperF+iw0zUzZAQtIiooCTvwjUCrGNRKOMwkod7H
Ufa8K1dm6tROyGSnZvMnOoZaoyWEM+Au9yhAkA3Gm0gWVOlgXeF+CDDyNehLDKfv
64/sTj36EYtjpqhoExnGNriKu3yApd/Kh3ZC9qfQvqin3VP8mMU=
=z7/S
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
