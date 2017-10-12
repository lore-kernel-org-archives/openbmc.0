Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="UZCstGFk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OGexptO5"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCJqh3TvdzDqJ7
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 16:11:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C61B20840;
 Thu, 12 Oct 2017 01:11:57 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 12 Oct 2017 01:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:message-id:mime-version:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ND1iE019yxXiVnv59
 14qbvxOoifEj4WXzI7to7MVeYk=; b=UZCstGFkyNuZJlY+A1uKJ2kAl/AWGQOzs
 /ZUtvMi8QgbC6J02DcowRqnjlDIjkwq0LNbbcG0Ds1SJS+cGZ/1NaCSTZeDWD2eg
 pmYWuXJC7dsewHgps91peG8a543uJQHfEneXD9amfVbkwvpTsHr6/QbTodzPvYeT
 +u9U4Hru1nZ1uY5naFOi0hnBWQK2sJzDz7UjOS9Yf5Gv0mVy1lB/FrD+oHnE4i+Q
 ZVmT5PeGM8f4HhTScHpMyfdJTuPQnv6o657W7etm4gSzvMbFAlRx9v591rQ9SwqD
 lXcksppbVQDmAw8zGw0dw60hf61WB/31/SXpHpIqO49vVDKbi4MDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ND1iE019yxXiVnv5914qbvxOoifEj4WXzI7to7MVeYk=; b=OGexptO5
 VCOLCQkTZWCdclUwfg6wvetHy7laBdzmE3+LBZCiwc7ps5nTFpj2IuVKEgSd3apm
 1b9UdwN8VG842YKzMwLH9MX52TB3ZlRTu1uINOYqgWPZ6l24jN+PrsK/Ia9CDvYb
 NQsWXvvfq8k+0l2EmyRBqAe+H7z9jc/sUSUKNvfE38X19VoevTlli/GqtR832Tvg
 +Un9bv8WDOll693jcdSciJvnGf93O69RvpUamg7+ZRnCuPkQaIr+3X7hMOrBX+zl
 WT3McuMy3JFFVZ1zEVF/59cZkU8w4oPnesu7lKjs2mCVswHWAMRv/c+d8SRod5fr
 aJhklnZOx8qjtg==
X-ME-Sender: <xms:nfneWSjP-26MyquSpD0_VRvJ6gDiJKe5-b1PC2OXtLrsOO2WjAxYRg>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DDEB7E3E2;
 Thu, 12 Oct 2017 01:11:54 -0400 (EDT)
Message-ID: <1507785108.5452.185.camel@aj.id.au>
Subject: New options for `obmcutil`
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, Andrew Geissler <geissonator@gmail.com>, 
 gkeishin@in.ibm.com, bjwyman@gmail.com
Date: Thu, 12 Oct 2017 15:41:48 +1030
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-L+bKr0bncaTpHutW016P"
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
X-List-Received-Date: Thu, 12 Oct 2017 05:12:03 -0000


--=-L+bKr0bncaTpHutW016P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've got a patch-series that reworks `obmcutil` to remove some cruft,
use some more standard python techniques and also to add some new
commandline options that make it more effective (at least, in my
opinion).

The series does remove some truly esoteric capabilities, but I expect
those who care (if anyone) can do the job in other ways (e.g.
`busctl`). All the 'normal' commands are retained, i.e:

* {power,chassis}{on,off}
* {bmc,chassis,host,}state
* bootprogress
* power

If you're keen to review it, the series is here:

https://gerrit.openbmc-project.xyz/#/q/project:openbmc/skeleton+branch:mast=
er+topic:obmcutil-rework

The essence of the series for end users is:

1. `obmcutil` will now block rather than die with an exception when
invoked before necessary objects are available on DBus:

    https://gerrit.openbmc-project.xyz/7276

2. There is now a --wait option to make it block until a command is
complete, and give an appropriate exit status:

    https://gerrit.openbmc-project.xyz/7257/

2. And there is a --verbose option, which largely exists to complement
--wait, which will dump the journal to stdout until the command is
complete:

    https://gerrit.openbmc-project.xyz/7258

If you're interested, please review!

Cheers,

Andrew
--=-L+bKr0bncaTpHutW016P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3vmUAAoJEJ0dnzgO5LT5ooIQAILvFP9dASOAdYzYEQfb5qR0
D1vQ93D8KWLlO784u/Q4q2ZveJ241elUrRE2hfInqigYqMqkc2RqPe9XBDINNG9O
LB5L5c2/UmggCQmpZXkTY2XZtNOTVlPJE3eBcB3Po1Ag4STszwNlpOISpQeRU5uY
ygcx4ireaq1g6NHQzzwT9kicWxatygTtGUdL1X2sQXrquKWcSeAzydtOYSc5XA9S
g0tyrJToFL78ygfOvq+icf3BfMHjb6a1kJLsc9A/l1riW6yd+94msLDOKh7kCyUd
Gr3jgdV1H0Vw3MehJDoXvyPesAhplSdMNcqp03msE1xq2dsl2f65mHcXaJWR7AKY
jo6SRuGZihOGBwnwwx2VjqufvxB1bTfuKWCda2eUiqqpFF/feZD20ztfbFTpxJmb
sXJIBPs8KFaP+yeWLRqmWQe7uwq++2FUNUWPx63jQl/c+3RX/tSed7Pwcg2Z8onU
/1IP8HaFcFs4eVnTDoR8uhv3D0Y9vr3JbPWOn6pkxaa4L4wz9jN/bOX0eBcps2K8
tj4HQtbEtqa2VnROH1d8hNGj6uIofgD0IDrWxMdv3AmpEnRGPYQYshq62djIAoWG
eb6KU5bVMjc+5cA1lrrTTNvhFbTluaWGKPCPPGJjRXeO9G/w2PnC3bRNy6toJHl3
Jy4zjYK2SNbuXm/0MULW
=m81U
-----END PGP SIGNATURE-----

--=-L+bKr0bncaTpHutW016P--
