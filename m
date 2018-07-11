Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C0eUpman"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aEs/RYBk"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QPSX71JNzDqyp
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 13:19:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA0E421B1F;
 Tue, 10 Jul 2018 23:19:37 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Tue, 10 Jul 2018 23:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=lo7N75bK5lV9cJg2DZ0hEJzZ6aWrP
 T5twahwBCdgdaU=; b=C0eUpman6288eGOQ9R5jwplEB/hY/JbQyHFRHiEJNvggE
 5tWSAu5KNn7pVcsAuFaIUYckSJAstOzRWB4/0UtFMdmkHUl0JIEc20h23rTbYgld
 QMtVMjVhYFb5PHxsnv/w8vluQck/rt8cVV6AfiXQQuIX6PPnXdlk3U17jrdFnLHe
 S8WBvut5v7QnPsYUMxLSiHVdvqTNFBJKT0lf4iN0iDSNNqQE+Ie7d5UjYW+XVLXi
 KKRpMASxHRBpFTwloWa01ZN0pdtCvigBBrYLEIOX/3qXmViXGqDeVmUkhJxNf3jh
 mOGY6vs1QMehWSby65QkD8Q2BEVqtc9bpowJhNsuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lo7N75
 bK5lV9cJg2DZ0hEJzZ6aWrPT5twahwBCdgdaU=; b=aEs/RYBk3/Sq4Gd0hPCSmA
 tEq1yI7UVUNYhtqZIhZWjhQnueLLzaa6KpgRrENXY3/FaYFTfvN+Nw8Xa4cSkawS
 KAcuuuR5d8/tFFYXYkNz45/aDHyS4GVOf339T1XbDHY7HnYfUhgZaXx29CIJQOaK
 j4uPpcipi1JF+boSSnqshWAfJ0Jt5efI8+5OO+T0N8Y3s+LWMaY3dnBeWj+3UKiL
 wmIRNxyUFbnwTxkaqWvJHiK1ne+CXSnr1pTUIN3Pq7Ng5Uqq6y4/s4RoGZp33qI7
 1KtO6av/dQGxMvSEmD+qD17zFl9Jduzx7n5/ZYf4azEhCFMHULRyoXjlIpWWEgeA
 ==
X-ME-Proxy: <xmx:SHdFW9Ndo7JDWUDuZeqlWMgUY2Im5Bl6e8opfLKMMuqNldOrHFCI6A>
 <xmx:SHdFW3qb_0BtjuXYQ2Tv7-sZZ097qena8eC05r_IIQpTgpU_Qd3x_w>
 <xmx:SHdFW-feqtVHPOWyy-XUlTVeb0kEX8WHLZ0lQwC1wA3pJ82lRdr5ig>
 <xmx:SHdFW4b3oRXocGTEKSggQXk3f1QNMQPiMq3iCPRq-fJRAqND8o30ZQ>
 <xmx:SHdFW5AxgEqFDLeaJvdSQ2i3ydaVot_CFLIVTU72eqYsaiCayRdhwg>
 <xmx:SXdFW0F7u9yYal0H_IwzaUxFmWpeZOl6OsewY1xFJO8gUXyqZoiZxA>
X-ME-Sender: <xms:SHdFW4QvhgrbimzSiza2yee7_1eUh7XVBo08eyeDjJIi9F2JSS6xeQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7DE819E10C; Tue, 10 Jul 2018 23:19:36 -0400 (EDT)
Message-Id: <1531279176.3103610.1436766272.6E940CAB@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joseph Reynolds <joseph-reynolds@charter.net>, openbmc@lists.ozlabs.org
Cc: James Mihm <james.mihm@intel.com>, bradleyb@fuzziesquirrel.com
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-957169fa
References: <56a8460a-543e-fe0f-9c1b-881f088f39c7@charter.net>
Date: Wed, 11 Jul 2018 12:49:36 +0930
In-Reply-To: <56a8460a-543e-fe0f-9c1b-881f088f39c7@charter.net>
Subject: Re: OpenBMC security workgroup status
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 03:19:44 -0000

On Tue, 10 Jul 2018, at 11:50, Joseph Reynolds wrote:
> Here is the OpenBMC security work group status.
>=20
> The OpenBMC security work has been partitioned into four areas:=20
> hardware, firmware (Linux, phosphor, etc.), OpenBMC development=20
> activity, and downstream development.=C2=A0 Reviews are out for three are=
as;=20
> see https://gerrit.openbmc-project.xyz/#/c/11120/ and 11164.=C2=A0 Work t=
o=20
> sketch out firmware security topics is beginning.=C2=A0 We are also begin=
ning=20
> to look at topics such as release planning and how to handle security=20
> flaws.=C2=A0 For more details, see the group=E2=80=99s agenda and minutes=
 at=20
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsD=
UWmAOI.

What's the short-term strategy for handling vulnerability reports received =
in the gap between now and getting some formal process in place?
