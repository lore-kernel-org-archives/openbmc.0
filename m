Return-Path: <sjg@google.com>
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPDQS2MdpzDvyt
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 07:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kGp2GGFC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="MT/GkRSF";
 dkim-atps=neutral
Received: by mail-oi0-x22f.google.com with SMTP id v84so28571517oie.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=3CAkSgV+GHDKuArX0wjcW3fRDmCgeVtT2Otc6+lgYCk=;
 b=kGp2GGFCc1B4JazpGe6A1V6wSDXUjfNjK6WUAc8+pHDcH5EGkyUIBnq1h7c1ZGrszB
 EXMMnzRZeSU/4+vvPcKRDDGB1ar3e31gzOYuTkwYbRnzBd0QBBZhQUx8864cG+oEPkx0
 PktbtQuz1Ot6yzbFI2+UyG17sKVMgOld4+ibjnM80i/me/KKyKfVi0fJFUscFYilX4is
 Y37C6mjF7Vy+xYoUq8V3eDRbXSx8DtT/vlXWplpg8kpmnUh4imysNVThsl9O1tkr1C3Y
 L5IBvQ01jWXb9ZavnerZHXOmxpaIlAIBqAVU8LsZTlcxYpU27YvNErsD3r3v+NO1yJWp
 mhqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=3CAkSgV+GHDKuArX0wjcW3fRDmCgeVtT2Otc6+lgYCk=;
 b=MT/GkRSFpuZXgkWElEo8+Dj/bNqT4HdRSyAFGvtUB1GlmLUtrs6gHkNb0j7QiG6KnN
 3Am89Unl8oMA/zCi1gekfTDOWHIby4jXra8c8EJoNNQnuIwX1iNqBk+HLTrPPJ/VNeW+
 upLY7S57FFcb2IayTMh8lv9p0Juf1C5y7KCJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=3CAkSgV+GHDKuArX0wjcW3fRDmCgeVtT2Otc6+lgYCk=;
 b=b5zARpN985nrc9tKLmxdIK3WphPm2pRLpIRGoVrNfsbsKQSrp1lsRRENyYUGZRwXsr
 98PqlcOoW71XtzJa1p6D3sKYBre8FzdyadLT37aDY6MLmI6CMFjB63sbbbxpOzxLfWiR
 +TP6HaIv+4orS87fkNtUkK9QSg/jyPATh2MMQtLYpfPzQBgNAzVxMzXkGb3Of3z2H9hr
 0orefpmJGrlTWjrmJRHDAhZN/A7lfsPDQxV1fveWEJs3jOUiNVc9M31B9Xn97/77FDWM
 AW9cxGff1zbZtiRlXNc7KH8/Xl3U46m+qT66dsTNJlvZJ1FpcwK7ghDIYq6dMQk9nayI
 lm0Q==
X-Gm-Message-State: AKaTC00XQlQK1SaE/17FWbSnZtkTOJgaRiBdsJn9DqcT63zt0Hu56uaK0o2cWjHkWOK47yzoQTEZauz7EtyYh9NW
X-Received: by 10.157.16.14 with SMTP id h14mr3019714ote.120.1479932814123;
 Wed, 23 Nov 2016 12:26:54 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 12:26:33 -0800 (PST)
In-Reply-To: <1479930602-91012-3-git-send-email-maxims@google.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479930602-91012-1-git-send-email-maxims@google.com>
 <1479930602-91012-3-git-send-email-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 13:26:33 -0700
X-Google-Sender-Auth: CenNMceV8d4jdyBs_2b_ojKWtq0
Message-ID: <CAPnjgZ0KVNz0G9fshFqZHRj74evCzQ+RVn7wdMFOxu=osLGuUQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v1 3/6] aspeed/scu: Add definitions needed to
 configure pins for I2C
To: Maxim Sloyko <maxims@google.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 23 Nov 2016 20:26:56 -0000

Hi Maxim,

2016-11-23 12:49 GMT-07:00 Maxim Sloyko <maxims@google.com>:
> Add missing definitions for configuring I2C pins
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>

Please add a change log (try using patman!)

> ---
>  arch/arm/include/asm/arch-aspeed/regs-scu.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index 5445023..6cb4d0d 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -844,11 +844,15 @@
>  #define SCU_FUN_PIN_I2C5               (0x1 << 18)
>  #define SCU_FUN_PIN_I2C4               (0x1 << 17)
>  #define SCU_FUN_PIN_I2C3               (0x1 << 16)
> +#define SCU_FUN_PIN_I2C(n)             (0x1 << (16 + (n) - 3))
>  #define SCU_FUN_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
>  #define SCU_FUN_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
>  #define SCU_FUN_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
>  #define SCU_FUN_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
>
> +#define SCU_I2C_MIN_BUS_NUM                    (1)
> +#define SCU_I2C_MAX_BUS_NUM                    (14)

Please drop the () on these

> +
>  #define SCU_FUN_PIN_MII2_TX_DRIV(x)    (x << 10)
>  #define SCU_FUN_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
>  #define SCU_FUN_PIN_MII1_TX_DRIV(x)    (x << 8)
> @@ -914,6 +918,11 @@
>  #define SCU_FUN_PIN_ROMA4              (0x1 << 18)
>  #define SCU_FUN_PIN_ROMA3              (0x1 << 17)
>  #define SCU_FUN_PIN_ROMA2              (0x1 << 16)
> +/* AST2500 only */
> +#define SCU_FUN_PIN_SDA2               (0x1 << 15)
> +#define SCU_FUN_PIN_SCL2               (0x1 << 14)
> +#define SCU_FUN_PIN_SDA1               (0x1 << 13)
> +#define SCU_FUN_PIN_SCL1               (0x1 << 12)
>
>  /* AST_SCU_FUN_PIN_CTRL9               0xA8 - Multi-function Pin Control#9 */
>  #define SCU_FUN_PIN_ROMA21             (0x1 << 3)
> --
> 2.8.0.rc3.226.g39d4020
>

Regards,
Simon
