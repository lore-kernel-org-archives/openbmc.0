Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Can0xjsG"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YbS253mJzDqN8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 13:14:42 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id t13so2837489qtn.3
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jan 2019 18:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UpX+nXqCOKMIna60Cqq9VG/fdzcS3LJuJq+UGh0O8ag=;
 b=Can0xjsGrtk1MgUZNxX8p5NdfjGsZxNBU4amV87ECZVb8iAzc2GfyATQ791rKddGuj
 gmS3tM96vLERPtIaOdHCBv2uj2A3sigvfm6Bf+28rOeHnbMw6SjZGG7Z6XN74PaRAv3m
 A9Y+E+zVhipK6cpR1LSMZk1rRUSMS8dJiCe0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UpX+nXqCOKMIna60Cqq9VG/fdzcS3LJuJq+UGh0O8ag=;
 b=gVrX5Ltnelu11l2JP/YVCoQJqIfYrzBuCmstmJaSQEqKbJEcjmJYMBtV+GIlvSplD0
 HBDGOAPo++ae+kWRGGhzxhxB79flGHIn6+u6pvOaV86H7RNdMpQrvIRtWmYDgHYS/Xft
 matz6YUBOIefhBHsXx76H8BGAOzeJT5/WWRvWqsVhO8rmfa4thiYZOS5wM8zMHMRWWHf
 FSsKdb+FgTbub8usw5l6fmyfk8T2EQrccLdgNlJWdLkiotuxw/qzmkzTi+uVMKu1vwPQ
 SkoVWw1XiQgOQHIpkiD81XJbfGzJvhRhR0aGnVDxDYIVQHU7G7j+O1Bbz12gF07RyHPB
 gDYQ==
X-Gm-Message-State: AA+aEWblWipViEb6GXA0N4l8b9Q6HF4Zfl65hal6V+UYu2B9+GBfolpH
 qi2gmumyR3xyAfV4M7tO0tfdlKa6MDGnRmRQtQ0=
X-Google-Smtp-Source: AFSGD/X9MFdRkZqV5Gkp74WSvukFktEwGJAJcihESnMsGoOIeZJSMB3c1NtbARUNvJmnjIxoipapWWp/zlBujXCdItQ=
X-Received: by 2002:aed:2764:: with SMTP id n91mr62644049qtd.37.1546913680150; 
 Mon, 07 Jan 2019 18:14:40 -0800 (PST)
MIME-Version: 1.0
References: <1546552448-22621-1-git-send-email-eajames@linux.ibm.com>
 <1546552448-22621-3-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1546552448-22621-3-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Jan 2019 13:14:27 +1100
Message-ID: <CACPK8Xd5b13RunesBwKzH41K0xwL1mko_JGxhrb6R6v1isDNAQ@mail.gmail.com>
Subject: Re: [PATCH dev-4.19 2/6] clk: aspeed: Setup video engine clocking
To: Eddie James <eajames@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2019 02:14:44 -0000

On Fri, 4 Jan 2019 at 08:54, Eddie James <eajames@linux.ibm.com> wrote:

>  static const struct aspeed_gate_data aspeed_gates[] = {
>         /*                               clk rst   name                 parent  flags */
> -       [ASPEED_CLK_GATE_ECLK] =        {  0, -1, "eclk-gate",          "eclk", 0 }, /* Video Engine */
> +       [ASPEED_CLK_GATE_ECLK] =        {  0,  6, "eclk-gate",          "eclk", 0 }, /* Video Engine */
>         [ASPEED_CLK_GATE_GCLK] =        {  1,  7, "gclk-gate",          NULL,   0 }, /* 2D engine */
>         [ASPEED_CLK_GATE_MCLK] =        {  2, -1, "mclk-gate",          "mpll", CLK_IS_CRITICAL }, /* SDRAM */
>         [ASPEED_CLK_GATE_VCLK] =        {  3,  6, "vclk-gate",          NULL,   0 }, /* Video Capture */

> @@ -317,6 +338,7 @@ struct aspeed_reset {
>         [ASPEED_RESET_PECI]     = 10,
>         [ASPEED_RESET_I2C]      =  2,
>         [ASPEED_RESET_AHB]      =  1,
> +       [ASPEED_RESET_VIDEO]    =  6,

This is incorrect. You've already added the video reset to the video
clock, so the reset will be released by enabling the clock.

If this is the patch that went upstream then upstream needs to be fixed too.
