Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqm80n96zDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:22:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MJgJkuwv; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 10so3663557ual.1
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=bOoR69gfvrghTtSHJSfPUHZdHQZ6KsSlVSvpEE0JUko=;
 b=MJgJkuwvhxbvsL6XSKk5k70Glqobp98p2YuAH4am44ozdbykEqgEV6VsOxh8IYWN4j
 bu+pcD6eYffqRHYtbR7+/0D+qO7PMQF1K6IjqhCmNksvbcqijQfPwvglAZKdyP7mpK37
 Rd49Id3KROG4ZDdw0BK6UYq4Wwbzya6IFKaXEWN+eeBX3sZLhiphKtQag2i0TL5SPOC9
 oFNHyeP8DCa895LdnJro8DYJEFY4PZw1U+xMWR4DswOrYEjB1iRyll4z1X8AKORWEtPM
 oMbbj+ifR2bEY8SnL4iWg/I86BKGrM7PRI79SkBniolNBeWxC/FdoySeejnmcI1aPydW
 sVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=bOoR69gfvrghTtSHJSfPUHZdHQZ6KsSlVSvpEE0JUko=;
 b=iPv0Ph5BRYiX4Jg9UFV2YBeKAROfA0p7OZ3zgifkyfQIvMY7rKOL9iWYHSx6T9Zut5
 mnv2FrVxv1NPtfb2kg5f+78Dye53AQNXwg106fU3vE7kWeR78GrIWcrEfrVasmRt76QZ
 QfC+IKljsTA1Yx9kYg/+MCECxwlAPH3MXFw4EdBHxuW7ixWZhEkwZBCYZ5UhNRiH+MqU
 IF4qirtbkcr1WcmG/e+dku9Pe8GhtyZyWhWmPNaG16VoZuMbVzAIyuwI3fkIrAHwSQea
 0u0RZrDY/Pv3PPBtTbu6mnGKmi/A6oWKVO9sGCUFC+K42mReFlHSrNWTsrhz3IkR0lFO
 1xyg==
X-Gm-Message-State: AA6/9RkFm8v9ARDtstd7jk8FlGOCWhUyrYcJNmGO1FepqZitORWJHXLGisKsBZjmesZVScU0k0ZXsPqYz02rVQ==
X-Received: by 10.176.85.21 with SMTP id t21mr5198289uaa.161.1476080532600;
 Sun, 09 Oct 2016 23:22:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:21:52 -0700 (PDT)
In-Reply-To: <1475789205-19618-2-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:21:52 +1100
X-Google-Sender-Auth: sCPxvRbvxFLEN1Ti_YRbIcPxZUw
Message-ID: <CACPK8Xer48+BNHnHbooVGfrg5Zx8iB3wddZ_YkB5m=QPC-Pk2Q@mail.gmail.com>
Subject: Re: [PATCH u-boot 01/12] aspeed: add CONFIG_AST_SPI_NOR
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Oct 2016 06:22:16 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> also remove some useless code related the host SPI PNOR
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/Kconfig             |  2 ++
>  arch/arm/mach-aspeed/flash.c | 18 +-----------------
>  board/aspeed/Kconfig         |  6 ++++++
>  include/configs/ast-common.h |  4 +---
>  4 files changed, 10 insertions(+), 20 deletions(-)
