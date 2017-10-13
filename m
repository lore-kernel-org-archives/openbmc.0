Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EsKMWGmr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dWieDBVG"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yD5bQ2l7MzDrJ6;
 Fri, 13 Oct 2017 22:49:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E71042099C;
 Fri, 13 Oct 2017 07:49:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 07:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YeAKb/VK757TYe2YcrgyGWDOO0I8egamcP5Tsk2K6DI=; b=EsKMWGmr
 p/aU66JKTNbNoey3QObVdQZqT2E4Txl6mGCKo6430ruYrKiWi864ihUpuZUBBWEq
 3O9drIoslbD48c/yoZbtx8qg3XejB7Yy08lEmoVJ+SMCaN9M5HZDjBmHLZKaNPAF
 uUgAJSOSA3s9wZA/cXixquW5bzPHUO1KKNZDUvy5EGRW2MAYITgDJWa2YAotLVOc
 SbTJPVEypyPkDCD434M2rMoMAh9xuK9gEosG5Hq1G1itnJwjOIKQ2s4pfm30xUHX
 ythaoPfZNfT8Pr2nAAIza314fmRFwxQQuWP0ocIPLnkVWGluJXaJYZqB98kOfozG
 J8sBEo6DVwTUxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=YeAKb/VK757TYe2YcrgyGWDOO0I8e
 gamcP5Tsk2K6DI=; b=dWieDBVGHyvBNGbgwVPK/rqklbDNXU6hTjY4UG4QBPTSy
 TgzsGuRcblngmYmlMnEVyO2XK4CH8uemjnqICO6HDvnTnisCEzl9T8kvItHZf2Wf
 9w4NlSoL242s54jKMCd4RZTdyuTA6o5L1BYdUz/QOG1RYClEFgCqH+r1P4/Kf8Os
 sGnXjgrUiXBys/H6zoGL6qwmArQnLi9mPqKUmVrS0m5jNbd+yAkB3jNubmFW04B8
 L8sUrnzFDdFxF7SPRn1NScJBmti9oVJbTX1TTQx5HyaGn3dMWre4RMRzWBaH76nw
 6QrNzUNv+zLGXW4cDf4VOQEuJ6Ps34ULdLAxBY0sQ==
X-ME-Sender: <xms:LajgWRMwIvMpT9NV5RmQcw2IgSlVtowSYh4buTiUp1WkaE8pT32EdQ>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id BEAB17FA80;
 Fri, 13 Oct 2017 07:48:59 -0400 (EDT)
Message-ID: <1507895332.5452.207.camel@aj.id.au>
Subject: Re: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>
Cc: Andrew Geissler <geissonator@gmail.com>, Chris Austen
 <austenc@us.ibm.com>,  openbmc
 <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Fri, 13 Oct 2017 22:18:52 +1030
In-Reply-To: <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
 <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
 <1507691558.5452.172.camel@aj.id.au>
 <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-l+QxS1MIgn/4olSQW6yA"
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
X-List-Received-Date: Fri, 13 Oct 2017 11:49:08 -0000


--=-l+QxS1MIgn/4olSQW6yA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-12 at 14:34 +0800, Lei YU wrote:
> On Wed, Oct 11, 2017 at 11:12 AM, Andrew Jeffery <andrew@aj.id.au>
> wrote:
> > On Tue, 2017-10-10 at 09:55 +0800, Lei YU wrote:
> > > Vote+1
> > >=20
> > > I always wanted such a repo to put common/shared scripts
> > > together.
> >=20
> > Great, it seems there's a fair bit of consensus on this. Did you
> > have
> > any scripts of your own that we could pull in?
>=20
> Yup, I have "upload_and_update.py" that do the code upload/update.
> Though it only works on non-ubi-fs systems.
> https://gist.github.com/mine260309/21ceff0f69b42df0ef12a85c83ec01c3

Can you please license this under Apache 2.0 and submit it to=C2=A0
https://github.com/openbmc/openbmc-tools ?

Cheers,

Andrew
--=-l+QxS1MIgn/4olSQW6yA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4KgkAAoJEJ0dnzgO5LT5plsP/1QwXOLILtGWoZaEKKHe6ZFx
f5Uny8UtC8mcwnWGk6j23fLvyNVTCunH2ZjoQu+7yltleosc67v/f1wDLbW0a5v8
5ar7C2p76XMVskI7YMzwIDJoeK0i7IKdjEyrUMgFPX3hJeqpfSudphxIuoykfEnE
4vgmksVTmX3Gri5usu3YWRfhG2hLAUgiz665a9FOEDsC5dTRkZFZblFrE8z/LFyR
y7Jb3sAijNIP5uGGKV8QG1tRBAxt6LR8PkO/CVlqNLxJmThhB5tX5zdtxvwWwEXR
+PE3HLd4wY7b4c1/VTqjRSR8iNQxh2d6jG7umFzUk3S4tQy+a7JbHWqlhBmK8MMO
2+5TtIensZAtNgf6lCa3MTQG7h6yuhKzg7dAmd+X+kbLgSf8VbFFVM+XAL6nO8w8
adgdN+iyzs2DFCORis2fRiA8Q6KcetMdnLzd/md+XF8os9R58yNBNN40XqlxxDWl
t4bZQ9c3ptEDLtspkO+hV+PT/k1kfDMsanCHjiA9IU0OaVdBP7Q1qkceL4OT26Cj
80nWrFXdSWXm9e5iztNp/emQfQEvDi2Oxh9b9DrWwm22wZN3JzWEP06IZh/D3grn
ivKSQpkRJVvrHLLn5SwaSQuN110PVE9iaNa/08GW80CVvqXrTrMbUE/XhEX3FtKH
rv+NtLd1PBsIGfMvH+dP
=QJPE
-----END PGP SIGNATURE-----

--=-l+QxS1MIgn/4olSQW6yA--
