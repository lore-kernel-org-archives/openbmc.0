Return-Path: <ezequiel@vanguardiasur.com.ar>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=vanguardiasur.com.ar
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=ezequiel@vanguardiasur.com.ar; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=vanguardiasur.com.ar
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=vanguardiasur-com-ar.20150623.gappssmtp.com
 header.i=@vanguardiasur-com-ar.20150623.gappssmtp.com header.b="UpozgOT5"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4213rJ2pSczF35s
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 10:53:00 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d19-v6so3090499pgv.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 17:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8+EEe6Fw5F0ObP3yokdb/YCnQIcXrtVXrmbnvXvPMgw=;
 b=UpozgOT5lpvuKGlrwt2oTi5opw2BRr65Hw02XbKm1Y6wl8OX435eJRg9GylkB+lXT6
 0EVvc9q7NktSl770ZXDL67afRNq5lpzIOajwb8GI59rWVscfueEyeG004CBOExqddoRW
 80+1KDUn/lTDyOnYZnNnJ9saevwy1XC9sgGp0N8AXbWN58efKppXpjjexq+yPeldj9UJ
 62rhRrUkeDXRg/FGYbdO8aJha2e+RMJPmQY5yKdsOJKvcA60+ieGdJXXrE5qG8xii6YE
 b5Le1qo2WnOzRR0yuOrdBPN8sa8SwXMtrwH5cdaAFotVFg2MLf0W5uk/LvGCVuEiCkWj
 eCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8+EEe6Fw5F0ObP3yokdb/YCnQIcXrtVXrmbnvXvPMgw=;
 b=qzuecCTRw9Mof0WoiTvlXy5NqPnj+mCWMHjsSKoqbBmp77zwDx4zSutMbTAZKvXKQQ
 WJiLwEOAtvl1y1g/QUMhlkAFhNleXpTNmzgGuUNl1MG6PHaQ9ohFrRKHNvgPoco+1y5f
 dun7xyZH9OhDA10NRCfXE3d58l1EBXBKmdT7tNGTfAVbTkElkCFyG1M/B/Z/bGxiKqWR
 zS3aMF2Fq8X9CVFNuQ2uvWn3uJToaMO8wCbVSnVrN+fLJ56FeqF7AOqUa+P5eWgJeqYZ
 l7kCFp4+kX6itAO1aXcdJY/BFOkHB7MKtHcSOnlCZ/a2Y5fQfJqPcJB5yc9JoPUovrdP
 5Bxw==
X-Gm-Message-State: APzg51Dp+3nf3d59QDPHEg+k7MeWSyM1B5HKnoZkdf0RR7IehnpplBcQ
 ETGfyuV1s1AM+xyjNlZhB312pnVd30S9wMMBgs0hMQ==
X-Google-Smtp-Source: ANB0VdYj2v6fVPIZcBcd46d5Y/9VTCgdGSspyqisz1qxPTig4Xi0rgPKAb52Fv1XNrY3brjp8l0kvAZw8Gi6uyrxV6Q=
X-Received: by 2002:a62:6781:: with SMTP id
 t1-v6mr8174358pfj.200.1535590378313; 
 Wed, 29 Aug 2018 17:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:5d02:0:0:0:0 with HTTP; Wed, 29 Aug 2018 17:52:57
 -0700 (PDT)
In-Reply-To: <1535576973-8067-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-5-git-send-email-eajames@linux.vnet.ibm.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 29 Aug 2018 21:52:57 -0300
Message-ID: <CAAEAJfBpmFPLTMAr+Azc-53JXHPkCU4bjtwqE6nDWUvm=J_x-A@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: platform: Add Aspeed Video Engine driver
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, andrew@aj.id.au, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, joel@jms.id.au,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 31 Aug 2018 08:44:59 +1000
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
X-List-Received-Date: Thu, 30 Aug 2018 00:53:05 -0000

Hi Eddie,

On 29 August 2018 at 18:09, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs
> can capture and compress video data from digital or analog sources. With
> the Aspeed chip acting a service processor, the Video Engine can capture
> the host processor graphics output.
>
> Add a V4L2 driver to capture video data and compress it to JPEG images,
> making the data available through a standard read interface.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  drivers/media/platform/Kconfig        |    8 +
>  drivers/media/platform/Makefile       |    1 +
>  drivers/media/platform/aspeed-video.c | 1307 +++++++++++++++++++++++++++++++++
>  3 files changed, 1316 insertions(+)
>  create mode 100644 drivers/media/platform/aspeed-video.c
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 94c1fe0..e599245 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -32,6 +32,14 @@ source "drivers/media/platform/davinci/Kconfig"
>
>  source "drivers/media/platform/omap/Kconfig"
>
> +config VIDEO_ASPEED
> +       tristate "Aspeed AST2400 and AST2500 Video Engine driver"
> +       depends on VIDEO_V4L2

It seems you are not using videobuf2. I think it should simplify the read
I/O part and at the same time expose the other capture methods.

There are plenty of examples to follow.

Regards,
Eze
