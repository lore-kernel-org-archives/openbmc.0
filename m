Return-Path: <sjg@google.com>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vp90b3VkfzDq7Z
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 00:05:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="U47ihqGk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="RkgM03yD";
 dkim-atps=neutral
Received: by mail-vk0-x233.google.com with SMTP id j64so109611230vkg.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=49Pi/yBtGaonWVcSIJCayDRIDtdP+V09MC9+gvHedQU=;
 b=U47ihqGk/k5gRCynltIkDgC64vkSua8TxotwshPgamcdvtEcWyWoV91x7saHPZWLW2
 YAG8YGjMAPz/teZSSXZrM0qP3098bAORNQU9DPZ17Z4M7fWZJeCspLLQEhVgl8PR2bX9
 u9XnZiDBnvPIWhDIM302KnuHo4XGLFC939ByqZGc8e48EbrP6KeZ+050qa1YICiaVBzb
 qgca99WlrF1zdY98DokEU1kfP/kzioX9jf30A5E6Em3RkwJYzWcRQqXLG5xcw31nCMoP
 u/+41yhdKvPXcl2Y9EKAvhRS4HtPSkF6W2jZFfgEWWDBHFdvTdXCL3Uh0SBKQdo2Lm8c
 hZ9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=49Pi/yBtGaonWVcSIJCayDRIDtdP+V09MC9+gvHedQU=;
 b=RkgM03yDjANPyvBONF5peV1V3H++awGpB78VLjgnaG4D3drhS2a/pigxWO62j3cSLI
 yVlIVSdmuHE6HmutfpKppGcjQZZIrFTDHn/1a0xEykFcB9H6Wd1IZhqk7l6Ywnaz7Rh+
 gn4yKuF9bCZKDoiq4YKzG9RAGnnfbRucotZCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=49Pi/yBtGaonWVcSIJCayDRIDtdP+V09MC9+gvHedQU=;
 b=AW7ZFqdmikGEApzLGIUr4mv6HIpCuiQSwrFn6clpEXXSxR6sID3EADkwVF86RmewN3
 1XTTllIUxJEaUl8KsdXlkxKWSBs39PHeSs4HiQp9Y4j+R8zAwL3O79mc1wgX41usplRK
 m1+tDyASrK7A+op6LHs06+aEcfxUZSVNu42kIG0nZwyXF76pSdLINNEPUQsUtrznvjQg
 lIeVPf2/3Ilhxel8c/JI4/UAeqR/qLSkBZ1Y/BjrMNFnkJ/soy6bUsLBP7emHG3nblj1
 sx04gBMP9eCuvlevPmwRIpHlXso3n/dKNex6evuGAnhC30kNmNpKiLwgCJVpUvzjk1YM
 8u2w==
X-Gm-Message-State: AFeK/H1YVOe0TooPrDc1ixw6cfV7oQbhFGSunU0YcFC5uq8u/msdVAymSalB3txcj+ZkEA0sHNpCSNtmBavdZ9ia
X-Received: by 10.176.7.10 with SMTP id h10mr17900118uah.46.1490187948385;
 Wed, 22 Mar 2017 06:05:48 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Wed, 22 Mar 2017 06:05:27 -0700 (PDT)
In-Reply-To: <20170316213624.140344-12-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-12-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 22 Mar 2017 07:05:27 -0600
X-Google-Sender-Auth: gtW2ALzxTp_xo6aXPdjYg3Sda1A
Message-ID: <CAPnjgZ1SJQ82hxbcKg3PLvJ2RdbvsON9W_tvyVhRM7+-BnbDTw@mail.gmail.com>
Subject: Re: [PATCH 11/17] aspeed: Add I2C Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Heiko Schocher <hs@denx.de>
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
X-List-Received-Date: Wed, 22 Mar 2017 13:05:52 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Add Device Model based I2C driver for ast2500/ast2400 SoCs.
> The driver is very limited, it only supports master mode and
> synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  drivers/i2c/Kconfig   |   9 ++
>  drivers/i2c/Makefile  |   1 +
>  drivers/i2c/ast_i2c.c | 355 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++
>  4 files changed, 497 insertions(+)
>  create mode 100644 drivers/i2c/ast_i2c.c
>  create mode 100644 drivers/i2c/ast_i2c.h

Reviewed-by: Simon Glass <sjg@chromium.org>
