Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5hw4mx8zDvLY
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:04:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=DXbwFZ+u; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 2so7335450vkb.1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=9xXglyezHOKnAEqpTbLYLl2xCwuQVuWlceQzgeAi7cc=;
 b=DXbwFZ+uihlV4q+pGo4BLGAQnx1gTr/F1Y42JWATkuHqjZeBVD/yVAuiBFCgm2YorV
 8hsyZQOSLNUono8YRIq3crzSFlcF3J6Ir3N3EieXsVKbtW9IOuBQZ6nSPfzA3Uy/qyEW
 cDCd3koN6ZKhmMsgasRxgmbztaXt/29AVL0GVa05qXoxMmV/YH7IG1UUsP0gHrP75p+h
 FK+GYJAB9xtyCF5e/5qyphhh4tq7emijM4Ge01+6NL68/ocmVt8jy0gELmmGFieb6FlU
 VW+KZqO2zBjVDRb++7A5mkcq4SyX2xsdtUaB+csIZo0D639lToTZ3zhrz7+LLqt6zzX6
 zxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9xXglyezHOKnAEqpTbLYLl2xCwuQVuWlceQzgeAi7cc=;
 b=X8HGBtk4410ZBCbzQ1psJlGhpteaQWaXzFmxGWl8eMZFrfgCuyhTwnkQK/GZtiVrKr
 pTlKTN8rKiMjRn8aCiXK/vxYSeYb2T16mCgMM9rZ9yvpIqynylVeivcUPNmwQwTpwsVF
 WzFv8HaF0T+AP2kyg7r8WLF+XeR2Mq3yC3Tj/3PjGL3sykWyo7SS2XS89Tz2AG5XuNHH
 x6a/BQarz/pKZut126bW1vqTnTfvZGiyd1E62yzqBtdedBRyt9KBkf1s+fU/bFScvBEl
 C8Pgy/mQs7uUbNshL8Mpt1LwGsa3qdKQoJNQ/V6roxWw544fawHzl3U0C1XFI8cMVD0z
 I3Og==
X-Gm-Message-State: AA6/9RlRulz+K5Kxlxsg2e0G2r+jFXxTX64nNYNLSD75pkIHgf+d4UxuxV78RTXsvMjbn4/NylSoGpTxPKY4gA==
X-Received: by 10.31.102.6 with SMTP id a6mr13662525vkc.151.1476680654596;
 Sun, 16 Oct 2016 22:04:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:03:54 -0700 (PDT)
In-Reply-To: <1476448684-6149-11-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-11-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:33:54 +1030
X-Google-Sender-Auth: Ge0i2uZFA3nr_DbuIs5LgSjd4_Q
Message-ID: <CACPK8XeEpJvbg=BgZGQh+McN2QDnZNntwHzYMcJOPBdseMogfg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 10/12] ARM: dts: aspeed: update SMC
 controller nodes supporting DMAs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 17 Oct 2016 05:04:17 -0000

On Fri, Oct 14, 2016 at 11:08 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/mtd/aspeed-smc.txt | 4 +++-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts        | 2 ++
>  arch/arm/boot/dts/aspeed-g5.dtsi                     | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
