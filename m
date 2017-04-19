Return-Path: <sjg@google.com>
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com
 [IPv6:2607:f8b0:400c:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72WM1pr3zDqC6
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ku5Zm2vK"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="UmAQtJ1K";
 dkim-atps=neutral
Received: by mail-vk0-x234.google.com with SMTP id j127so4563374vkh.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VjpkFsTEVaQIEOZXyLUn6NbeMEqTCCHhafYLxei3gjA=;
 b=ku5Zm2vKBxHQ77gBBU4gectxNvOFSEB218Ok3fJ9toHWieuX/AydTm8pUcl43Fc2dg
 KIMMcACK4eW/r/EtrIetY0N+ejaY8eBEPDuqCiN/wEQzSaimJBqmfvfGnAbSkvoLYFmd
 EFiGz4F1B1JExaSa8Vnnn0AnNxXm2GhyM1CoczR+f1kLO4/YAAgAnin2EWHNd6lPKq4E
 tV7n6+OIdCeIp2kpyqBlazukHRplTc6DlmU6NZFTQ0QWxLhAHpma/YZ9+CPTtRHoPIMi
 fgu/q+vDSl1nORnyedbMsav4Epw/Amt63pdUu+YrNJ2HDOBHHKEIG6SoTQ5YdoKmslui
 Ag0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VjpkFsTEVaQIEOZXyLUn6NbeMEqTCCHhafYLxei3gjA=;
 b=UmAQtJ1KeIS0yUMGhcRATVsVO7fNO6z6rrYJfZt/pAblYokYNP+X0RLccAQI0nFkdI
 BFqnt69G0Lw0ZuUCQ/MIX9fa/gWrNzW+CV4bsHPGK6gEtBXw0ysErxTl6tFnE1bLKQIe
 AVPAMGnwlcwBAaRz8zrJ1X9UKALdlxSO5LfaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VjpkFsTEVaQIEOZXyLUn6NbeMEqTCCHhafYLxei3gjA=;
 b=Mkw//Z2RCb3PnNF/bvqnPJM3V4rDy/UjrWb7uy5w6Js5hRVfwhpklykdGRJPPNbfwY
 yHVkI/UUoR2JCC9Qb/k9YAzJ8W5N1maTAnLFQmREbeSepUwIaOkQ2n/arufQBMC+wb25
 j54vKdE1kUFinJ97FCumV6oHiIO96rkvWu5jTHP7Z6kyIppiAkMui9wT5u9IQ+2L7h1m
 HPG4i8ruLfTwws5NSDKsUUZbHqUpHN/D7TrOZRviH001ZOVO2q4xqyvI2KOx8/xogoVZ
 G48IB7E8ZLUy20Lfcp+ktaX/om6+2uM6OclR+EDIqT/LagFx18fn+AjTp2RtMh+tk0d5
 fKMQ==
X-Gm-Message-State: AN3rC/4YIzCnPTyiiKk3Iz6Iy+0D/8zsExQrsUVjPQqYWy4cZHSDkZew
 oquz7wEPzgUQy06DLoXJ4JVTlxlI2OU0
X-Received: by 10.31.190.17 with SMTP id o17mr31689vkf.71.1492560748788; Tue,
 18 Apr 2017 17:12:28 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:12:08 -0700 (PDT)
In-Reply-To: <20170417190034.71945-14-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-14-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:12:08 -0600
X-Google-Sender-Auth: 43a_eEZLXfXcAtVv4xSvQm6qmNc
Message-ID: <CAPnjgZ2CcNYiktqPC3V9eEj=1uiR_cDvUQ60RmBpMwt1esn7wA@mail.gmail.com>
Subject: Re: [PATCH v1 13/15] aspeed: Add support for Clocks needed by MACs
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:31 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Add support for clocks needed by MACs to ast2500 clock driver.
> The clocks are D2-PLL, which is used by both MACs and PCLK_MAC1 and
> PCLK_MAC2 for MAC1 and MAC2 respectively.
>
> The rate of D2-PLL is hardcoded to 250MHz -- the value used in Aspeed
> SDK. It is not entirely clear from the datasheet how this clock is used
> by MACs, so not clear if the rate would ever need to be different. So,
> for now, hardcoding it is probably safer.
>
> The rate of PCLK_MAC{1,2} is chosen based on MAC speed selected through
> hardware strapping.
>
> So, the network driver would only need to enable these clocks, no need
> to configure the rate.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  arch/arm/dts/ast2500-u-boot.dtsi               |   8 +
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  62 +++++-
>  drivers/clk/aspeed/clk_ast2500.c               | 265 ++++++++++++++++++++++---
>  include/dt-bindings/clock/ast2500-scu.h        |   2 +
>  4 files changed, 304 insertions(+), 33 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Wow that 10ms delay is pretty unfortunate!
