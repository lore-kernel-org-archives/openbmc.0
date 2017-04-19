Return-Path: <sjg@google.com>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72WQ1bKwzDqBJ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Yk+jfqxp"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="OBZBm5Bc";
 dkim-atps=neutral
Received: by mail-vk0-x230.google.com with SMTP id j127so4563759vkh.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=i8o1C+bIGJwZqn2HtSb9jhbj85hSMVLFGxuLruaZxYA=;
 b=Yk+jfqxpcVmfTCMF5YW08HEkRLmKWZQEWIpSjjbfbQA41+h+/mSOuuxC+x5qS4pmll
 oK8UZQPdNIICanhfALp7uUbczUxfnjLawfx7djrQEfHr+eQ/hDutYakI2ulsh0yq1Ciy
 pWJBSd2otd3YaDAQEBVS0YkVzi42taE8RVd//ddT6pOEBC18fS2TCvXrzYlgRN8+d86k
 6gon1A8yGSWkfMX+jdbiUAdpRpHLpAxFu2tnARWbdDEVYPV28SV8Sm/rQYHlGo1Hxv6a
 FO2yW+KRTJjzz0X/LP7rfuDPy7Ku5gmf+1rWTlmGkvKaA4XKk3ksZ3y0bakwCDeHNF+D
 bo+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=i8o1C+bIGJwZqn2HtSb9jhbj85hSMVLFGxuLruaZxYA=;
 b=OBZBm5BczBtuvqmQ91UINnYrbLLGuTmeKNE1RAuUOGS7f2wdgrPB+C2uXA7ZlZ39b9
 YK0z4x7l68A9sgmR45szD0nTiNgEpN9qRtq05gX3dV9WwRzwwxAMj5fvAnElwkPExFL7
 n74/9rC+m0IVfZxhKKCUuytKnHaMFOVho8vVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=i8o1C+bIGJwZqn2HtSb9jhbj85hSMVLFGxuLruaZxYA=;
 b=FE1gmMb3EnSF1I2WiQfZin9lz/QYkOkUT3sRDIc4k61+OSbKEM/E9gojlAZOaM2SjQ
 SMdOYJx8FbXwWP3+aqN4EYlRXIe/7eLFnrb4tGAxMJQ4t7MzPh6UF0YeskeSve9f+UUb
 fo2D09AiuEuXUcndLo60imDUKoblY1JG57sXZZJ17Pif4dIeykFyxI9yYHlrx3WbrVzC
 ZjLjtPWx2gpf9F/AzXz4Jr32UhSvA/4kqdWz5hFT/SqDc31gdyXL0DDwOLwygAHkMh2t
 LLRvvZ0ISRWs5GxyZuEkzkPAvpEHNgCC83Ebybr7gAB4Jh3N0ce1tj8/VrnSZHbzDrEB
 wGzg==
X-Gm-Message-State: AN3rC/7UpshTEF+Zsrxiyq20DgglIaX0nay9riO2Etxnq4sAQVp+bkLp
 4Yj2w+n8bAEDzah+JESU732ZP6Hg7/nx
X-Received: by 10.31.195.5 with SMTP id t5mr32944vkf.77.1492560751744; Tue, 18
 Apr 2017 17:12:31 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:12:11 -0700 (PDT)
In-Reply-To: <20170417190034.71945-15-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-15-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:12:11 -0600
X-Google-Sender-Auth: IGw7ltID0MFrWNkrxuBteer8HQg
Message-ID: <CAPnjgZ2gSXjp1_8jSbkKvpKU-YQqxF792+qMe2u+Bsk=8MYTOw@mail.gmail.com>
Subject: Re: [PATCH v1 14/15] aspeed: Refactor SCU to use consistent mask &
 shift
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:34 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Refactor SCU header to use consistent Mask & Shift values.
> Now, consistently, to read value from SCU register, mask needs
> to be applied before shift.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 12 ++++----
>  arch/arm/mach-aspeed/ast2500/sdram_ast2500.c   |  5 ++--
>  drivers/clk/aspeed/clk_ast2500.c               | 39 +++++++++++++-------------
>  3 files changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

OK, so ignore my earlier comment about shift/mask.
