Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mm65eY3q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NGrkYnao"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gtDg0CCSzF14j
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 11:41:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 85A7221BF8;
 Wed,  1 Aug 2018 21:41:04 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 01 Aug 2018 21:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=u0v827Z46AmnehuG0E37IpHOl9DKp
 +j03sSLMR4Ikwc=; b=mm65eY3qDoiHs89oWeu2fugN/6VC01cwjw604TCxOyLAa
 Bgq8o1D3xWRqSzkJmz4C0yqlkqpqOHpvSpUoAc7zzLjg8XWHUPjmtEargSnVvQyu
 hRqjGWp2rLP9ynLT5bfuK7HKnJNSmtTfzMYLnQ6Sg43gyn1UlmtCC1yPNm6iVdNW
 xNn2rZdJqvxVMWqcquBxWLmRkbyNUGfZswtMX5xulcR2bcqfqLsOPrDoDc4V5aii
 ec8isji6fABxSxt6JJc0loMKFzuHcy9b99+eW9zcenPtm4Mo6Nqh2PsV8yrmbyLY
 LvTQPiIap0cRtQ1k48Vrt8x678Lt2d0idQFFKYT3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=u0v827
 Z46AmnehuG0E37IpHOl9DKp+j03sSLMR4Ikwc=; b=NGrkYnaoUPl8w4ceFYtbkJ
 Y52MhEEFWLC7mgRIvEqsMvuel5R4/K72NBbG5QURuHMDfbNnqJOyboFNIxE+zWVi
 mQ6Hg3DhN8pL85ZMqruQ53ZTPD1SWzqkQg8v5CREZ9SuNKS6XQApCQww9APeWiFV
 J0Am7Xq0ZA9SLhSIS78ks0aCRJQcXPpfZ6DcR7OJrz/QI417/PDAoYlhoO9RSfhv
 ZL5nZd8GMeVH8zMWep/YhvjQyNtTCJPk49AWmBZexli00bNB8uL3iOx5N+VwkJ3v
 HAQaVg4TzGNydtrBzV1Csu0CXI67rwZh+Fn93RWKgQE9Qy0256jJTW/3JHJmIB6Q
 ==
X-ME-Proxy: <xmx:MGFiW5KXeN67tT0XDB83TEiR0cQT-P7P9wjpV_hudzYFe-bvDN04tg>
 <xmx:MGFiW1WrZpzy7uWEA4ncmrRRdamURzCVr0H9Z6eI5b36AMB1KNt_uA>
 <xmx:MGFiWzia26VgM0CpgTkpkD3CxTSVk-8LzD2giYFz5v3YpTZtV2HyHg>
 <xmx:MGFiW493dZAV-DmkVhd0VHj-pnaaGXCLR5D8OaqZSifyJOdV8d9Grg>
 <xmx:MGFiW1BN2uJLBRPzRMhKmsQEdk-TP3S7gg-cGzt-ktWMkLQa4l2Y0Q>
 <xmx:MGFiW4P-M0QxCItNq3PM8dckjFV-Ks6tedtHUy7gY5pLF55pwKBQcg>
X-ME-Sender: <xms:MGFiW93QcK7YQdtPoKTsF4rhSx_RPZoCJvsZf8RZmJ7qwM8uIJSQNA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 274549E498; Wed,  1 Aug 2018 21:41:04 -0400 (EDT)
Message-Id: <1533174064.793946.1460645152.741D3540@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2be8cd1b
In-Reply-To: <C04B2AA7-9D6E-4D23-AB86-E793E0A676BA@fb.com>
Subject: Re: ast2500 reboot got stuck in timeriomem_rng_probe()
Date: Thu, 02 Aug 2018 11:11:04 +0930
References: <C04B2AA7-9D6E-4D23-AB86-E793E0A676BA@fb.com>
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
X-List-Received-Date: Thu, 02 Aug 2018 01:41:08 -0000

Hi Tao,

On Thu, 2 Aug 2018, at 02:38, Tao Ren wrote:
> Hi,
>=20
> I=E2=80=99m upgrading facebook cmm-bmc (ast2500) from 4.1 to openbmc linu=
x=20
> 4.17.2, and when I tried to reboot linux 4.17, system got stuck in=20=20
> timeriomem_rng_probe() function during boot up. Did anyone hit the=20
> similar issue before? What would be the recommended solution?
>=20

Can you show us your devicetree patch? The only things I can think of are
if you didn't specify the 'quality' attribute (if you don't the quality def=
aults
to 0, which marks the device as disabled in the hwrng device list), or if
you set a really long period (but I assume you could have sorted that out
yourself :)).

Cheers,

Andrew
