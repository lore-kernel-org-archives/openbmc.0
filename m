Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="idDsR6W5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sTNuP8z6"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwZvJ5lmszDrct;
 Mon, 18 Sep 2017 15:54:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 85012204B0;
 Mon, 18 Sep 2017 01:54:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 01:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=vobdKWxmq5PQoGCQyWqVVyNeFDadtPFNboIZvXHm9
 FA=; b=idDsR6W5Wr86oa0XslHOK5cjOGyeAyDk71PcYD12NTWJThSYNMu3zi0qB
 FNJz7Bz5egVral3Fxw298kF5F9jn8vKZL3H0b18f/ppbPe/JrUrCtMXvgAh7wLyd
 R3h6Oqr7W0n+NQfvR5gugkH9TFvzttuhlndBjQnizPDk4OZ/Md0B1RomDoCvjjDF
 SXDD9gwLkBDJr14nSmzDxIRsnNM2KiibZbJgtYAmUvyZOK12bvmzXGDaA4X6sfnw
 VGLvltL1qFf3HbHqxivyLTrl7nw8bL3PCySMjrNIaN9o9xQbt3Rch6Unj2lsge1C
 vHVXCtzi1CJm0scZZwAfqJgA8JEag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=vobdKWxmq5PQoGCQyW
 qVVyNeFDadtPFNboIZvXHm9FA=; b=sTNuP8z6x72iqhEvXZKPmzor13fxG+snCb
 606PRAotfk9qz53pY0s5fzpdJd3ReNmLWuQEJ9Cmnt3GxNZq57lBgxiHuX+EAM4n
 ibYvUMKGrKow0Vx2OXKiqLD5MKmYk7qjP1JLXKQTXerYc2twilBdSXKDGh2aY2qx
 v3vljGsvnkyzR7entAFe6q3NGau5vwuqRCgVv9aYmtstvPkyV2rAwpfx6jupOKit
 jivRFPNHYmOwWdGmk8M5VAHoCeUmCZ0d/r7mv4HiBVz6q/+EGwYi8OY4MFcL7890
 ZAWgPVzEbT3ra1iBrV64uI7qsGSIRcpJ5HaKPe/uRPj9btQ2iruQ==
X-ME-Sender: <xms:el-_WUbpatMFQlS-2EmTgvePc133rg9RTGiPSea4nTa2dG5ohELJrA>
X-Sasl-enc: 26MVcsWU7TUT+tKLK7/Cim+VgTP6gRkgxXGJukwBS8WV 1505714041
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85F317E1B1;
 Mon, 18 Sep 2017 01:53:59 -0400 (EDT)
Message-ID: <1505714034.4080.16.camel@aj.id.au>
Subject: Re: [PATCH 0/4] watchdog: aspeed: Retain enabled state and move to
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: wim@iguana.be, linux@roeck-us.net, joel@jms.id.au, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Date: Mon, 18 Sep 2017 15:23:54 +0930
In-Reply-To: <20170918054905.16470-1-andrew@aj.id.au>
References: <20170918054905.16470-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-uD2mYu7Q2COBPhEVL4W+"
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
X-List-Received-Date: Mon, 18 Sep 2017 05:54:05 -0000


--=-uD2mYu7Q2COBPhEVL4W+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-09-18 at 15:19 +0930, Andrew Jeffery wrote:
> Hello,
>=20

*snip*

Ah, my subject got truncated. It should read:

    watchdog: aspeed: Retain enabled state and move to arch_initcall
--=-uD2mYu7Q2COBPhEVL4W+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZv19yAAoJEJ0dnzgO5LT5giAQAI8k0YudAOlkIKMzMzPzbphW
PxM2fwlZFul0wfDwXxvagoXfhqCu009h+HVotUilxAZarxvCxjXGmx9Dfc+mlw61
QXMdsNAHP2UkK8IEPbvSlk6hAqDaG05qjMLRQ31whj70oHw8POu0z349rIAErlvU
KHesli4MEGG5H1zzg5zHpcF8gRlCeYxIE4UnTG6kY5csBqaEXtahi+vbNgzj+3CI
fu6QCrZrNoDK+wDKng3gLhnQKyFOgnpr97ZkxZgdbNS67bq0zpSVDyzx08KLgOQy
shpDpRkwAGzAkNQD0673/4bVfs4uqBgkravR3g97Av7t4V6qhX9sNuP58G6oUdV4
vklvlLn1IHuYxEkYF+2Vq8upexnC4sJul5DjRhLP/wp+0B71Xpr5Q0I2ds9iR31A
dZdjTSRzJzuKJketartbPUoFYS9XSQn1XtSZ9HsRx2fcjYiiqdW9kD0JL65f0HPz
DDLMJ/mONA1UFzFm0E0CJ1BbKXiLkJfpqoU0/5Y48XX3IWfGu56MvdwNfxk0q6lF
RKrom1pAxCTP5rQb+xtqtJ8FPpbsJx+2t4Kgx7UvoHjF0MS81NJU6WdVO3ulrHVh
4KwMHoxi+d1qp2e9JZRh9xYjkmSU8aR3fQYO3u3Xn/9o1aa8ClrW46/no3qy2Syh
yCe25riFyk93e0lG+56H
=RZK0
-----END PGP SIGNATURE-----

--=-uD2mYu7Q2COBPhEVL4W+--
