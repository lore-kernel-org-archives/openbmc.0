Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rUv6Yb8u"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C3QTOabX"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xn2d61csVzDrHr
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 09:15:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 45305217B0;
 Tue,  5 Sep 2017 19:15:32 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 05 Sep 2017 19:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Z9YvidWIQ6x2ZPYH8UpGIe88TZHu+kBAV7cTSrRPf
 Tc=; b=rUv6Yb8uInqiER/d+PehbHb4oTi77c1PenY1dykS6z3X6/Y6ADObEis7h
 rJnj0JpZQFn+pFGKtJr6SlrIGp/HRhQYWVBuSMUKvu0O73/C7Aho580wzjQAYvfW
 1zvaLn2Zxh6p+RDrAMUeRW/Ln8Ngo5c5FaHmnFLxvsTD/AYX0Q1cucD0loX4+SR6
 1+UCXNLsghcY+zob01ieoLTwpZS6+bVpcaeg6/ai4cQdT0fzFrpJJIDH7o+K34g0
 9T2WSz/DT0QVEtUtLWZNsf+FgG3xac6Ofm0p1FH0uYIsuI5yokIV2eTozEYuY0K0
 0u560A0Tf1imrwL4c6wNBxpl4xuLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Z9YvidWIQ6x2ZPYH8U
 pGIe88TZHu+kBAV7cTSrRPfTc=; b=C3QTOabXmwV6frSNg8a8b3sL4TzPRaI2Zu
 1R1WqG8alFt1bAb/yhlZSSopsLF7EWfcyIPW83aSlOKgkWkShh6a4trAdY1jnb0V
 PJjIGo56VN8l6+gR0mlmu8nAV0yxx0e0OfJMy37VzW0+BCWFwaTLkMmvuQ6Zkxnk
 f9x+YljOnh84ash9r4/ZLQDiAV4QYU16cvQ2mnTcOLOAM7Tku/K/vSSDWgAkOdzD
 1HnDfgkQfsVxpz1SYtM2dzMnjx3WOBHfmuP0W8IICXVlx2oM6GBcO3VM1cDnRqCj
 e5JIRS7iVCkptB/eAsk8sasj1h+FykORWVBGU04Dn3vF0z7bLGnA==
X-ME-Sender: <xms:FDCvWbcJ5YHdA2dcyb5ziNN427FGYgmXx5k0pmLO-O9tvjoAEnOfHw>
X-Sasl-enc: h5PlwhmxN2Kd6I6aei8tO6WMX3X/etTm/F0xvyA5IjTr 1504653331
Received: from keelia (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7317F7E6DB;
 Tue,  5 Sep 2017 19:15:30 -0400 (EDT)
Message-ID: <1504653215.28363.5.camel@aj.id.au>
Subject: Re: RFC for event logging mechanism
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>, Deepak Kodihalli
 <dkodihal@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 06 Sep 2017 09:13:35 +1000
In-Reply-To: <CAPLgG=nhGsZ4_TEz0RoG9cxBs9=L796URuYnpL2buBA8ciVFgA@mail.gmail.com>
References: <066b3313-6516-2c05-6c67-4b8d26b50401@linux.vnet.ibm.com>
 <CAPLgG=nhGsZ4_TEz0RoG9cxBs9=L796URuYnpL2buBA8ciVFgA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-UZWFdh52gSAn8ijfI/Qr"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 05 Sep 2017 23:15:39 -0000


--=-UZWFdh52gSAn8ijfI/Qr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-09-05 at 15:46 -0700, Rick Altherr wrote:
> On Tue, Sep 5, 2017 at 4:24 AM, Deepak Kodihalli
> > <dkodihal@linux.vnet.ibm.com> wrote:
> > Hello,
> >=20
> > I'm working this sprint on designing an event logging mechanism
> > > > (https://github.com/openbmc/openbmc/issues/1856). I have a couple p=
roposals
> > below along with some questions. Hoping to hear thoughts on which might=
 be a
> > better proposal. Any other feedback is welcome.
> >=20
> > Potential requirements
> > 1) Applications should be able to log events of interest. Events could =
be
> > used for purposes such as telemetry, analytics, debug. Examples of even=
ts
> > could be changes in the power/thermal domain, such as operating temps o=
n a
> > server, boot related, user account changes, etc.
>=20
> My experience at Google is that telemetry and debug, while both
> event-oriented, have vastly different usages which lead to different
> designs.=C2=A0=C2=A0Telemetry like temperature, voltage, current, boot co=
unt,
> f/w version are primarily collected, aggregated, and analyzed by
> automation systems.=C2=A0=C2=A0To avoid complexity in the consumers of th=
at
> data, it is ideally self-describing, easily parsable, and in the most
> intuitive, primitive form.=C2=A0=C2=A0Our internal systems use explicit t=
ypes
> and generous metadata for _each_ piece of telemetry.=C2=A0=C2=A0For examp=
le, a
> voltage sensor is encoded as a float with metadata describing the rail
> being monitored, units (mV or V), time recorded, etc.=C2=A0=C2=A0I expect=
 these
> to be consumed as they are generated, either by local processes or by
> streaming off-machine.
>=20
> Debug is almost exclusively consumed by humans in cases where a
> problem has already been found and the relevant data for identifying
> the root cause is not in the telemetry and unknown.=C2=A0=C2=A0I think of=
 debug
> as being comprised mostly of unstructured logs.=C2=A0=C2=A0Off-machine
> collection can be done infrequently and in bulk.
>=20
> All attempts I've seen to mix the two has lead to a messy API and/or
> data model.=C2=A0=C2=A0Even if the data model and API _can_ be shared, th=
e
> higher-level consumers of the two types of data will be different.
> Instead of requiring the client to know which are telemetry and which
> are debug logs, separating that into two APIs makes the consumer's
> life simpler.

Having only briefly skimmed the emails, I support Rick's position.
Having recently tried to debug complex issues with OpenBMC in its
current state, the structured logging made life pretty miserable. It
lead to vague error messages that gave no chance of diagnosing the
actual problem at hand, whilst the volume of the conflated
telemetry/debug logging was large.

Andrew
--=-UZWFdh52gSAn8ijfI/Qr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZry+fAAoJEJ0dnzgO5LT5NwQP/jYy2sayJ+SFwefg/An69pyW
YOqbh3QimSVNt4nye3HjSoy5Q87fx6kAsACJrZoW4jnfzTGsFWfhofVNvRPgNMHW
9mfKwEutfTvcpGQBjk7O7JvVgMQSjMLTtTsgcrb0LOkIQ1Ibm1mOWQYgNDhPv4Zs
yptjZML1PV74YJXT17NQAaUb16enOKS1hroMOPDCHhoagCqY13KnG7wpyTvDuSsO
EYJMGGIOUufPqxjc0h4p+/1n5Gmw8u9mrM6ToQXinJq4p1T6FgkAn+j6Ks88xX6B
6LtZKZLiR48a/x3qGz5zgJdV1ckb3f473ChMzvv9M2m4HNsXxDgoTISzpy/H/Jvh
tek5v08ndHgwXp8sZLdGYVu5ZXBLT6SyWZhpGBNBenx7qtsxR+v9yuqAFeTqlKQj
cD+R7q4nVwc720RppoUB4/NdO7KipdLFu/WiDOqiNoOQsOz0joCfl8/r7WWIzCqz
InCbHchKhEqYJl/PfGRjNOamgauHw16KVSLIiB1PaVkBmej3S1UBegqmY4yhycuW
iqTdGuPqtan9m3N6JljEBsOf1VAmq5wPy9buaFXQtHyzzLZZGwZmGMN9qo/D4FP0
b452GQmobAcEiiizeCDjMbNWJ4jiZR10VyNgXE106UThQAM4xbc4oOA/Ds60ad0S
eeaZlXFdGfMnGxY54Fai
=ShBZ
-----END PGP SIGNATURE-----

--=-UZWFdh52gSAn8ijfI/Qr--
