Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SQqHwGf5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q92+nPnT"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9yXt3jg3zDr4T
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 11:24:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B7CB20D78;
 Mon,  9 Oct 2017 20:24:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Oct 2017 20:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=p+IqjL3uU4PxWF9NW4Mt6+2xj5V1Y4SIfy1BIaJ1D
 U0=; b=SQqHwGf5GfDineZ/T++Htrvl6tIwNG7qIy/x73PnxF//Ue474Uf5NygeN
 AFd2/Ye8zR4A/S7vNgVRxbajumR/jNYAUvgDGRdKli/HUiUMgNsmd63N3Rxxt8XV
 bhx1cCZ10pkGj+C/TNWjeSR7qvMR4vBR/237EbCtjY59XdnC/6nQ6fSq0ppaPtRI
 /e9PlmsaAeUmr0rrO6sVghnkKhSxAelcHfSIJ4Rdh0e24BTrqDgpWFVM/Qn650jm
 9C+YteY8kJ9jImNDJmmKLlGeZqt1f0YHFiBm9wrw0Umpjn0NBuKTkMUTdvfxN4mh
 uzyjMxsxX0h7Q0Vi3AP2rZeI4pddQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=p+IqjL3uU4PxWF9NW4
 Mt6+2xj5V1Y4SIfy1BIaJ1DU0=; b=q92+nPnTQ43j4meuH3yPo8dgeJKdNmr/Hb
 UyZUDI48GgFC5hj+jul7amIF7lj5wXetU2ssq8GJkEkng5mRrRyFmHcsQ9eS9J32
 Un8uZRo7VrYuDm/3S9bmyABZy5D+Dtjan+x2S00hKvY2Nm5PKuF7Xa13qc/ClWJ5
 twqa9/aHpZT9R0tZgUePYi7JOoeDT6n/PUWJqw4/vt/g8V5o9UziY5AAAHiN9rg7
 tmg/Ahpx/RSSA5NW7+kN1sEeXB3aV8vOBzJlVBsA1kqREGP8FPzBseldY7FoFH3g
 KKav/boCBQaGIQ4a+bOMwboCQLOz1GfRDFUCr/JnVvITy0DerWtQ==
X-ME-Sender: <xms:PBPcWVoBfqRZYLaJ7gQc_eWwhnjvg4IJIs2_s1TO9QfCT8iyEwbP9w>
X-Sasl-enc: 5w1gFY91cYU8QLo5gFZlsMsjt6y6rLR401JKtZLzX2PL 1507595067
Received: from keelia23 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 384D17FA6B;
 Mon,  9 Oct 2017 20:24:25 -0400 (EDT)
Message-ID: <1507595062.5452.160.camel@aj.id.au>
Subject: Re: Moving to kernel dev-4.13
From: Andrew Jeffery <andrew@aj.id.au>
To: "Anton D.Kachalov" <mouse@yandex-team.ru>, Joel Stanley
 <joel@jms.id.au>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
Date: Tue, 10 Oct 2017 10:54:22 +1030
In-Reply-To: <525151507548094@webcorp01e.yandex-team.ru>
References: <CACPK8XdfxO5y3DHfBeZgvK=jUCM4noh2YFmX4w0GxEH8UDD+9A@mail.gmail.com>
 <525151507548094@webcorp01e.yandex-team.ru>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PxUH0Ydr5r6KrMkxD8J1"
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
X-List-Received-Date: Tue, 10 Oct 2017 00:24:31 -0000


--=-PxUH0Ydr5r6KrMkxD8J1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anton,

On Mon, 2017-10-09 at 14:21 +0300, Anton D.Kachalov wrote:
> Hello,
> =C2=A0
> I reported a year ago critical bug for aspeed timer (race between
> timer disable/count register reload with "reload" register's value):
> https://github.com/openbmc/linux/issues/107
> =C2=A0
> Since that driver was rewritten, but keeping the same error:
> https://github.com/openbmc/linux/blob/dev-
> 4.13/drivers/clocksource/timer-fttmr010.c#L135

Forgive me if I've forgotten, but did you send a patch to fix it? From
reading the issue it looks like you've got a clear understanding of the
bug and what might be done to fix it, and I think it would be best if
you sent a patch. However if you don't have one or don't feel you can
make one then Joel or I will look into it.

Cheers,

Andrew
--=-PxUH0Ydr5r6KrMkxD8J1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3BM2AAoJEJ0dnzgO5LT5CBkP/1kkGoTufX5BLNfZvYqdanf4
hGsFpBJsXaMjyjWJzMYesU8yYcZbQ4ivt6ZcCB23jrKPDJZN95x8yiEhFjoruA8M
XYIMUwTaD2YVjRN1UD8Q8ZaHFBU50vtHCaYFd31AQnRXMXtyKmRjsJdpEY9geJi+
9ehiYAf9lOmfqsQxSh5EbU9JLtJsxf/zg0EcKfEpmT/HwF6Z7UCasT9uey0I6Hxo
QU9f0olPf2rbBjcKVF9Bj4iHSYs9GeN6pp/f4NgjCcrGxWFUi4skbhMXhxZ6+/7E
A3+B6n3NeIk2GTpjOvDoGuXEIzEgIGdJMo66qj7iwjwzek67hZrH85HKa2OcgYit
z1ltvoMxDDriTjaMmraSsSi0nvj6Ue6DmpEgZEHLvIXt81aVztGvsIw2ZlX6ondi
ccgPsRKfDRa9X+uXRH66oARH/PsTCJpcLnjxJ+eEb91hZYjkpRX14dqmL61J+/s6
NA5GtLlNqTC2ZGiq0JnS47c0g56Hq1KZmgPmlyyCFFVz1wPJsXE3RRfH6/broHBg
t4LGMznvIPxuvWQoZ0n5/ZYg1l+3UECSsIKwkxiXx5XAFg77FNwS4SpRYPklT2UJ
847cP5ozXQlOxu7T1kttiPqAZs6HbEUabpAMm1vN5VjiRd1aCTH+MlOJxXlEK51r
XVrIf2jQeG3mkZzcHXyJ
=keyU
-----END PGP SIGNATURE-----

--=-PxUH0Ydr5r6KrMkxD8J1--
