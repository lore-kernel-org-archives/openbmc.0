Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x243.google.com (mail-qg0-x243.google.com
 [IPv6:2607:f8b0:400d:c04::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQwbm4z61zDqJ1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 18:40:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=kZHek5SE; 
 dkim-atps=neutral
Received: by mail-qg0-x243.google.com with SMTP id z67so4759012qgz.1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Vstv/rxRB5pTWBzghrM5gLy3qb4uugNCUTSKI7LwybQ=;
 b=kZHek5SE4xIb4Fq37OXK9+EBOq38lt2Oce6QbYO8+zcfADlgRTT/6P0ckJhtVaV8mu
 adfMbKu4JCdMigTgPCp/VItzNPganP8UoOoUHm1HWfwhXzNCCFo+SQXeL129/k7cqMaL
 wAAvb3Qoc1CQ4uc6cynRRDW3xXLVyPgWY67kRtr95jKeCqJs9HBNRak9vaTwSFoFS3g/
 5vgdwgy7x4Vze4Dztznpkc3Kk24kntvsfVHuwnvIVIhzlwFLQNv4zeyPvk0eVyVAFj1H
 TErBOXAKXfMqL1EEAFyD5WirtwCsAb9o4Xup8zdhSCPcpJc1ibphxTn9dj9a+DoV5Mjv
 ijKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Vstv/rxRB5pTWBzghrM5gLy3qb4uugNCUTSKI7LwybQ=;
 b=f//0+l5OlortjH3YfGFVTUck8qczRFGfgSm5MR8XyLSLbhPq1RiUD/Y3nDeYRU+On0
 VbSkEtGEjPYP3mQA0KBhNaYhCKvmLfsq8bvrd6QVWD6NxdobOf5oHNybUKt8eV0WCazW
 lIibar2UwAAkgVFbNm+pqEob6Au+VEg+jxh8eFeKaNsQDUMmdJ7Ex5PD9jMvxC4KLneH
 vOlN+MTLJctDz9lzfVyPiGPl2rX+3pdmEa/jkLpY0mWxEtgYLir+33DYnUUt9L+ncjFP
 q9DH3IyIZuUKu2tqr0lxbXE/QEX0zg6ZsOamB4djX1Msea3gMv6KNbH+zM2DZH1N8AKp
 PUyw==
X-Gm-Message-State: ALyK8tJJr1nLLnybDEXqNd6kcTFfHM3/io+ijcwk0FW/4YHFjxo5D/chJun1V1HOohlFJyRnibfLi2r5Pd5VVw==
X-Received: by 10.140.228.134 with SMTP id y128mr644879qhb.81.1465548017858;
 Fri, 10 Jun 2016 01:40:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 10 Jun 2016 01:39:58 -0700 (PDT)
In-Reply-To: <1465533869-3218-2-git-send-email-andrew@aj.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
 <1465533869-3218-2-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jun 2016 03:39:58 -0500
X-Google-Sender-Auth: 0RmKba7qiPYMqyXKRAEoHT-MTfk
Message-ID: <CACPK8XdbCCH3oOYMDFNNfhApyVwyTQ2NMkOoaZbh95iZjN++5Q@mail.gmail.com>
Subject: Re: [PATCH linux 1/4] aspeed: Use old MDC/MDIO interface for
 ftgmac100 driver compat
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 08:40:21 -0000

On Thu, Jun 9, 2016 at 11:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This is a work-around, and we should aim to move to the new interface.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 90c541f32ee8..12f3a044a03c 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -82,6 +82,7 @@ static void __init aspeed_dt_init(void)
>
>  #define AST_BASE_LPC           0x1E789000 /* LPC Controller */
>  #define AST_BASE_SPI           0x1E630000 /* SPI Memory Controller */
> +#define AST_BASE_MAC1          0X1E660000 /* MAC 1 */
>  #define AST_BASE_SCU           0x1E6E2000 /* System Control Unit (SCU) */
>  #define AST_BASE_GPIO          0x1E780000 /* GPIO Controller */
>
> @@ -186,8 +187,15 @@ static void __init do_garrison_setup(void)
>
>  static void __init do_ast2500evb_setup(void)
>  {
> +       unsigned long reg;
> +
>         /* Reset AHB bridges */
>         writel(0x02, AST_IO(AST_BASE_SCU | 0x04));
> +
> +       /* Set old MDIO interface */
> +       reg = readl(AST_IO(AST_BASE_MAC1 | 0x40));
> +       reg &= ~0x80000000;
> +       writel(reg, AST_IO(AST_BASE_MAC1 | 0x40));

I think this is common to all ast2500 platforms. We should put it in a
function that matches on aspeed,ast2500.


>  }
>
>  #define SCU_PASSWORD   0x1688A8A8
> --
> 2.7.4
>
