Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ggQVhBt1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H7t9d4/C"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHF3s3g61zDrG0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 01:36:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F3CF208AB;
 Wed, 18 Oct 2017 10:36:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 18 Oct 2017 10:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=l4yRUoFdty0ovVawzP/2zqGIwFilieOfn+nP92HTIGs=; b=ggQVhBt1
 wyS0MFINNLulJgtAdlXF+AI0+XKCG64Wv0srQYBLnSkUr0u2NfC4bMRUouFGkMCA
 xyMiRV9jS0//ZQl9Ok1RfUscoxO2lPdH3ughCGu/jG/ukay6sKdLLtsHHxmRE6Nr
 0UXUs7TgaC5DIm7850RdIYokzs3aiA8FexYcJZJ8Dbn/L/33G7GHuOHjftHCuMd4
 6WsZdkQqBrDVibuVHqGwmyrNNZGVe71r+QqQ6e5qhsJonITvPGUF4P2b0NJtd5aW
 0b9+saHOxqsXeO3TnjvTwhiiPUhGxGVg+rkGJ1Zv6n7P8HzBTUivVvKLDC10SqCJ
 flw2uOGmODGfHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=l4yRUoFdty0ovVawzP/2zqGIwFili
 eOfn+nP92HTIGs=; b=H7t9d4/CqumshEIKOwSJwOyx3TOt6BUDZi/ajhu70wIxs
 2RKlYn1J68FeQCKKq1HxPLT6fgGm6vS5VEciVN67JHUSXuL24qnEFse1Sgq5uqZP
 72wq/G77NHhRJ2MQGOy1TOy0l5ZhadE6z8LGH291W+3QUgdyMjZzkCosEVlIXCVs
 /G1T8/CL5GY3zOEDga25I1UpzHkzApL+FATxBtlEhnVM9sRhY277H4IcUimmKYuV
 qgojZL3UrAbnwPTvrdqckR8m/rm6KFWrMkQ196nntHoglwr1oD6wjPSTaIcilMSI
 RKivUgFFCEasGzYHe4qmoY0fiaBvl4VGlkV4jhC1A==
X-ME-Sender: <xms:1mbnWfDYtz0Zl1ya34Ygok_BeZtIs_0rzVr-5038G9Zx6Oqlz99rlg>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE9FC7F980;
 Wed, 18 Oct 2017 10:36:03 -0400 (EDT)
Message-ID: <1508337357.24322.28.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/3] drivers: fsi: sbefifo: Fix race
 conditon, memory leak, and probe
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bradleyb@fuzziesquirrel.com, "Edward A. James"
 <eajames@us.ibm.com>
Date: Thu, 19 Oct 2017 01:05:57 +1030
In-Reply-To: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gTAAHXwVZUJGJmh/rLgC"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2017 14:36:11 -0000


--=-gTAAHXwVZUJGJmh/rLgC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-17 at 16:35 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> This series fixes some outstanding issues with the SBE FIFO FSI client dr=
iver.
> The most important fix is preventing a race condition in the remove() pat=
h.
> The second patch is to fix a memory leak that was happening on most trans=
fers.
> The third patch is unrelated, though it will add some robustness to probi=
ng
> the SBE FIFO, instead of failing immediately if we see some data already =
in
> the fifo.
>=20
> Edward A. James (3):
> =C2=A0 drivers: fsi: sbefifo: Fix queued xfrs race condition
> =C2=A0 drivers: fsi: sbefifo: Fix memory leak
> =C2=A0 drivers: fsi: sbefifo: Attempt reset request during probe

Applied to dev-4.10.

Cheers,

Andrew

>=20
> =C2=A0drivers/fsi/fsi-sbefifo.c | 97 ++++++++++++++++++++++++++++++++++--=
-----------
> =C2=A01 file changed, 71 insertions(+), 26 deletions(-)
>=20
--=-gTAAHXwVZUJGJmh/rLgC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ52bOAAoJEJ0dnzgO5LT50j0P/i6L6w8DLafCTmuMUFhSo2zZ
4p1rV7OESaSGrByHxN3G0ZQvcwVYQ/PD6FWDGIKT98dPB3+1bKkwqZ3i6+alAFyb
VaiFh/uyK0FnXS4GDR9PYUpD6qZQsxrfNrwFYcP7xzKJnkuB2eELb7ksQsaoC082
dt+y7fHqSmiUzUVc/p7r9ysunkwUiv9P4O84wYzzmy4hADbIgacVpGB+qCbInjIU
6T8YU/SRwzavsVZySNLuGa9oz0PITZljUo6DSOLog38V8ZWQBCSH4QXddnbIeJRR
YSlL/C4S2yWYgPeqRtGQUv14eTwQ4ZsKlPWn1GyJ8nc11td+5EZuOjQFBhh7xKy5
m/Mg0Gz2Yg9UX1+w6q073S4WJ3Nt1x/ZQP8RkDDXGyFSXDBog0tzE313FBfEk2+c
/2o5ULUiuDGI4uh6J1OGuwNA7GLYygshBTXOJ2SCpR71Y5P4k9wBbCSMT0fywuhh
URnHdac+z3Cr3FRDBwaJD6BJ/WJg8MaCFjcd/tva8+24YfVWEL3sEkpOrUJaOEH0
Hu7ipgn5PrM08toxF/xI3iBqtudWafbfbpocCLFK+JlMSaRruft9LEEP75qj9Oci
mGc5fbZuuVdZ+BqO/R5qVeWX3FpYnsHirck/E9kcUIrKnuC74fmQ4RkLw1kPMuuP
hq4v5Va6xdYsHiEgZ0BJ
=nD+h
-----END PGP SIGNATURE-----

--=-gTAAHXwVZUJGJmh/rLgC--
