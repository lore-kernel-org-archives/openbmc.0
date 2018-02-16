Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IZc8J94i"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BO5wAFpR"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjFK12sj4zF1LT
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 12:04:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4483F21031;
 Thu, 15 Feb 2018 20:04:03 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 20:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1bguSaXQpfclE+4Lbwbqv3/1xVXzkykep7CtF8WJO4c=; b=IZc8J94i
 I5PP97JIyeG/dm3N5OyOQDUWUenhL4W+pBXgMf+iR5kuLWdmY+tcbDlsSHAavE3u
 sPSD4AkEES9m2YnK0XNVzehmPMrL6DjrNNmPdU6ANKl1onZIT+ie2IldgJojNh14
 PC7YT39qE/agH1WtFta9knbHV10dsHrZ32eOv+ZelLUeAgQ0qbkDaV/JWfNlA8gD
 XRhK+/BoUkjed277UIH3SMbGwx0t80ihYTg19bp3jn/x9QGP2eDAGctDr5oSwCNK
 H38TVlhW3IB0IMu4mldJ7FLq4F5Av6VlCSAWqbPZ1LYHIULOzbkJb4NX+lsUMxKZ
 amef+gzlM2CzcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=1bguSaXQpfclE+4Lbwbqv3/1xVXzk
 ykep7CtF8WJO4c=; b=BO5wAFpRFAX+ZGA5yn/H0haPnx4vNxT/W+y1YmtZjHgns
 +H8xAI7dd4Y1PqLmd/iOTtAGG3SONm2UHqD5o9MA5GCvak+KvL9Ut5j5Nm+f9Vzn
 VDsieKP/nSlGZmZrTnOQE2YdLqnJrom9lzKrp0pV/QPmlErseeHWIv5YvJVuabIg
 vU7Q79Mf/E4lF7Sscr2ZNHWGw3mPrESBFEtY9qaG3CIjgc4CD1gge9LOshESRFCT
 Oze/Yz6nB9e9FXyw59dC3exzHgkmo1BZzIW9Bov6+kN8MS7hAow/y57ZrcP9NS8y
 HH/6ih/CgmrR8TgOwEAVUgqilAli8+pCSJ5xXuTBQ==
X-ME-Sender: <xms:Ay6GWs8QTmwlQ7lTnISeHJJwEJ6V3M19IX5pdKrRmKissKSX_r7_Cg>
Received: from dave (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39D0C240DB;
 Thu, 15 Feb 2018 20:04:00 -0500 (EST)
Message-ID: <1518743037.10440.22.camel@aj.id.au>
Subject: Re: Proprietary task references in commit logs
From: Andrew Jeffery <andrew@aj.id.au>
To: Alexander Amelkin <a.amelkin@yadro.com>, Stewart Smith
 <stewart@linux.vnet.ibm.com>, Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 16 Feb 2018 11:33:57 +1030
In-Reply-To: <06aeaea6-cee0-8f57-654c-5d34f5319905@yadro.com>
References: <560ecebf-d449-b7e7-675b-03ec3c6f4212@yadro.com>
 <CAO=notw8DrRUP7MiFmDcQ9jqypeFqs6xmwXxPYt_jPf+dtP0DQ@mail.gmail.com>
 <87o9ksfdso.fsf@linux.vnet.ibm.com>
 <06aeaea6-cee0-8f57-654c-5d34f5319905@yadro.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-oJRDCfyDdttn0PryFMRi"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 01:04:06 -0000


--=-oJRDCfyDdttn0PryFMRi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-14 at 11:07 +0300, Alexander Amelkin wrote:
> 14.02.2018 06:30, Stewart Smith wrote:
> > I've been poked at this for other firmware too, and I tend to dislike
> > non-public bug tracker IDs in public repositories.
> >=20
> > I have an idea of using git-notes to have a local tree of `fixes` (even
> > added retroactively) that could then be queried/modified that would sui=
t
> > this kind of use case.
> >=20
> > Of course, finding enough time to write the couple of hundred lines of
> > python to do that has been elusive :)
>=20
> Exactly! This is all about extra work to do, no time to do it, and=20
> elusive profit of that effort.

Stewart might not have the time to do it himself, but I agree with his
direction and disagree with taking your suggested shortcut[0]. We
should find someone with the time to sort it out properly. Please open
an issue against OpenBMC where the details can be hashed out if you
feel this is a significant deficiency.

Cheers,

Andrew

[0] as someone who wants to see the issue tracker free of internal
identifiers as well
--=-oJRDCfyDdttn0PryFMRi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJahi39AAoJEJ0dnzgO5LT5AdoP/2W0U8vgw7ePmOTrivhSersl
3lljrDLiJCnrHjvmltorOkZgvUX76zdQxiAWK39qtpkv57E4lZKz2QL4ptFQNZG0
GBAEyvpI4FSsBCLIY15UDIy6W62q+iltl2l5aASsHr+6T9nteHDOStIzCZFfWtEf
K+1IwfZcZj6Rq8/I2RET4V49OXjeHGWg/cRRDahbbzc0s2y2LTCoNwC4FeEgQ0pp
XleLqQTvnghqLuziru0tLxomaP4lHIUP34SMMCewS9NpvjC7uPTWf/px8ZnAtmV3
HHzFEL3N3XQZAHY0HP3RtZVj4i5ZCGI1g6TuTytrHOCp/TZkUw3Z5a/EuzPWu9cv
SlBhfPe8IGH/d6j5YNDusCe5JoPb+LpB3v8PQf6gnF9pV43hcXn8nGKZHVJeYUmp
f49GuDTnoqJBYOhnTjcUO+O09VH1ILvGvPVJhfrHKSqGq6VQAwz+9hfpYZWf8+nB
rnz2SVGO8z5Napmt2m4M4E+c+iDWwBI3opHwFOdYS3CGubZP9pjJkJNaEyyMU/dM
zkmkxDJM97U2F1lZYYrUe47j/2a0/l8/frrdd1Hee0hn7K5JIbpXIrien8Z73hRr
oH9I6EWN0NQcaJRSlIttGR5ATv3Z44S7bdPwX8ckc8GMEZj7xTlvmE6bV1ExPalu
OFRr7ZGh93Rth8u3xlbK
=QoSq
-----END PGP SIGNATURE-----

--=-oJRDCfyDdttn0PryFMRi--
