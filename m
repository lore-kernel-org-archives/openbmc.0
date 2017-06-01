Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdSJ25LPHzDqCv
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 10:04:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fhC0qIsV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fg3D2QUC"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D01520A20;
 Wed, 31 May 2017 20:04:13 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 31 May 2017 20:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=n/naClqm6XK6O00EeN3N5E8JXEGgv/Sr6n0qHTQma
 wY=; b=fhC0qIsVJL2wuVuSRU2y1mv8tTrOuDTps9l2ihkU20O+QDCfNu8yuRiM2
 /MnTb2mIsC+iTLevQOVGvYGU3+JbNX34K4SZ6t26XBD1vx4kjjNILFpnnX0QKW4Y
 IH/onjfyaXomJFwv/8HMc3KaW8JKigQDH0UDOmR7VuheYTB8VOWowP51NCFr3DgE
 En7qGOL2kuY7uBeKoUhGUOgQprkDMjI6SQ7WfU60jMtJUjQWh7miHKv946aW7Y3A
 SgDbM9fhLmso9QdLl1p8SamXxLxfi7wCyh//5wTPJXi6d0UyffMMQ1xURmZHh7+5
 q9FSt9aJ8pJhyWN7qqkMaJ7h6EDew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=n/naClqm6XK6O00EeN
 3N5E8JXEGgv/Sr6n0qHTQmawY=; b=fg3D2QUCQfCe2Jab2GQefkJT7oUGVahCAG
 /Xw/ljcDWAEObUIOS6EE0Wdhy8SuHeUMjQZN90XbLvbfSq5sEHIAsTsrz2EndEt4
 5vKvinpgNzUhYiWEg0ysWYVGQcRxlwSOR1Cg3EbV3LD8oUNMm3DbiUUSaxGI5irP
 /fRWQbS5AAr/eJ5Izn5MFXf5S8I5QPXs1oTwmQh1LcFQmT3gTx+FQdB6AOehFjV1
 jqtEgtk+G+GZJ4cEPVLZoeB1aF5PTlgkEuiUnaXBRN57Aebd/Lwhz1+MhlMIun5b
 9CyQ0yw/66gepFenbUI8nq2twz+HZihd1aGKM8nknpbfCYx2m81g==
X-ME-Sender: <xms:_VkvWWPiWQ1aAxZdGCs2JXHhmhH0isTrrQnDywf0KWKgcbIaqnyLCw>
X-Sasl-enc: gOzxQXkB6eGrXSGkjXqCpLnL9pmCG9NanmGwF6fluDGe 1496275452
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F71224009;
 Wed, 31 May 2017 20:04:10 -0400 (EDT)
Message-ID: <1496275444.8159.13.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/3] drivers: hwmon: Add OCC driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>,  "Edward A. James" <eajames@us.ibm.com>
Date: Thu, 01 Jun 2017 09:34:04 +0930
In-Reply-To: <CACPK8Xcajw_TgVAEYp4XY0UP0SRrgUROAVN+YBW-H49z8e=wPg@mail.gmail.com>
References: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xcajw_TgVAEYp4XY0UP0SRrgUROAVN+YBW-H49z8e=wPg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gAlJRE0akLyEiFVVxWfq"
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
X-List-Received-Date: Thu, 01 Jun 2017 00:04:21 -0000


--=-gAlJRE0akLyEiFVVxWfq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-05-31 at 23:59 +0930, Joel Stanley wrote:
> On Sat, May 27, 2017 at 3:16 AM, Eddie James <eajames@linux.vnet.ibm.com>=
 wrote:
> > > > From: "Edward A. James" <eajames@us.ibm.com>
> >=20
> > This series adds a hwmon driver for the POWER9 OCC (haven't tested for =
P8 yet).
> > The driver obtains the OCC poll response and exports all the sensor dat=
a as
> > hwmon attributes. This driver is intended to operate on a service proce=
ssor.
> >=20
> > For the POWER9 application, the driver communicates with the OCC from a=
 service
> > processor using the SBE engine. The low-level transfer protocol details=
,
> > however, are contained in the OCC "fifo" driver, in order to arbitrate =
accesses
> > from different users on the service processor.
>=20
> I have merged this series to dev-4.10. Do you have the relevant P8 bits t=
oo?
>=20
> Lets sync up with Andrew on where we are at with the upstream review
> these drivers.

My understanding was Eddie was going to do a wholesale rework to
simplify the design now that we have the bits required for P9. It
sounded like some of the abstractions could be removed.

Andrew
--=-gAlJRE0akLyEiFVVxWfq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZL1n0AAoJEJ0dnzgO5LT5kkYP/jI++beIzXX9+U7g67cdnz+r
9spAx+pBhR1GI3to+BZ8Sc0l79tOcsgKSCtMzTfr95JkSznYaxFTQhtLStPl8tty
9YoR/9diimWmna+lSyU89bgRmZJmEdqyZQ+fcXypC5B0QPPv1S/9S988NCgAtH2Y
6+8tCiqNYDmPwyl37BcG16XM4EKymJseD2asmKjOdsc5fK2PZgnaDsDbQszirqSk
/BecxaozEU9yh1lFRHeuu9eeq5sZcxnlorJ+iJIkPnwhPy8Fgj7QiQ0UiHMMviE/
xivZ4QDHiDYurLwbUFqFx2aEsHHRgsDjdUlaMoAahDXVRNRL979IDxUBYhxjyXLJ
NQhWasmC8eSn7BB4g0A3X9VHrDq790q4nvdFF2kzfdiQuq4ZcKN0KPzWhojfmHC8
kpgkq0gW+iSaBjYg4JCaymOf03yc6iFM3OaHSTxyTZQnxGEoqV1NbU4FTNpsewe+
xjxAdaRcS1M+/uPjTknuZ1l5/1fbu10F19l3Vg0rED6iUg6JVQYQh48RKnPJkyeu
BOQM3Z+jxj8D6Oun4hcxa1s123dG46ihVUvXI6zAjlZAfzasaQzI2d3sYdKuQC27
1zk8Yj5LnmHLhGOy23L1WCmLQ28jpLkuvmURW6u/uI08NFdCGD0pBlLiMFCFrdIz
h3RxaaLl9tGskUy0f42N
=ZHAf
-----END PGP SIGNATURE-----

--=-gAlJRE0akLyEiFVVxWfq--
