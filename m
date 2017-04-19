Return-Path: <sjg@google.com>
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72Vm0HQjzDqC6
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g+kChFoY"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="U6yxQHXd";
 dkim-atps=neutral
Received: by mail-ua0-x22d.google.com with SMTP id q26so5285144uaa.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VexHaPJS8eXvmVPFVt3trxDWRA5rkEfuGzQGQ2qkYUU=;
 b=g+kChFoYdc+trmHIg92VE+roBNwVFYFhVjopgIhuGV8saAMss3J3F/Bibu4o0hlGTy
 PUwZpaJCWtkJLKJGnzODZ5QzZ49x9pS4OwS6IiLZ3nkMIiOTGM8PRbNLmNZ0Dio+rU1A
 um0me/kMUQnhi661M3uCQuZWBW4t+ZgLJ4+0OwfEmeEvY4x9jwft/g7oBU2oNR7y5ydo
 cflSNxZ1DDpYrRJzVZRWkKACs5h+/9n6GX8tnoA2gzlROpW/o05cPYHuZj1/5qX1L6e6
 muXWwttOcIA5qt2tpvKG3RgtquzpBamSxXdyd3S7Omrm3lLCDQpVNGDh1NYzT2BTbjvR
 nCgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VexHaPJS8eXvmVPFVt3trxDWRA5rkEfuGzQGQ2qkYUU=;
 b=U6yxQHXd0z6VNGPClAfLB6TM68S2R819Uy8ut5Ngn2YzkZZRmmIViPkWTIWSui1ROp
 PNuYd/c8sgKW1JD9wCNNY82glHGrzLgZB0Ln89EDbjvIgwKiOxtu7q9mnllVtDGb3HDA
 xo5Z0aqV/vVGx3lsAR/ePt8n98WekuCY7uSr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VexHaPJS8eXvmVPFVt3trxDWRA5rkEfuGzQGQ2qkYUU=;
 b=pAhdeKcQthOb0QR3TWVoYnJDijpaNXxL8L46tSSB2qhDG9p8YuRapVTfIkwNolVU5S
 9tcG4tkyT6OTLbQCh1ZV/Jnx2uAEZKUoKSlSzmh6ze/fb+7d9JGZpfwaAGi8lfdOzyWx
 E6sxx/RuPvvtthkWANwc1N9MVI15T2i4VgxFcX+hU7oERiFDmntYpneFr0K7jQ0baHMN
 K8lOn1vjYaDcveBKZOkVNJ5MoDbCpY/fEqsqPcVOo7cNri10/XDsXeudqDy6D6PfaBnR
 oIWouYNpoAiR+GE552izA0fkg/Dhps79RkmnmRDPVdOfvmZEMe+kQjmBbcujQqNyo3P8
 BenA==
X-Gm-Message-State: AN3rC/7Y90tqtvvhykUIoZkR+skQ0xy/t+899aBtSyeXivJdurYuDF2y
 m9yeL1tD7ULWj38GAOhTlVVeauqQWZ58hK0=
X-Received: by 10.176.4.17 with SMTP id 17mr56234uav.68.1492560717640; Tue, 18
 Apr 2017 17:11:57 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:37 -0700 (PDT)
In-Reply-To: <20170417190034.71945-6-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-6-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:37 -0600
X-Google-Sender-Auth: wDpq3XA67YZ7IZmtf7FL4hoqINw
Message-ID: <CAPnjgZ0NC0WUTScY1vsgivOvEkPUkEefynT+zRCy2O+KAzPw2A@mail.gmail.com>
Subject: Re: [PATCH v1 05/15] aspeed: Reset Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tom Warren <twarren@nvidia.com>, 
 Albert Aribaud <albert.u.boot@aribaud.net>, Stephen Warren <swarren@nvidia.com>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:00 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Add Reset Driver for ast2500 SoC. This driver uses Watchdog Timer to
> perform resets and thus depends on it. The actual Watchdog device used
> needs to be configured in Device Tree using "aspeed,wdt" property, which
> must be WDT phandle, for example:
>
> rst: reset-controller {
>     compatible = "aspeed,ast2500-reset";
>     aspeed,wdt = <&wdt1>;
> }
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> ---
>
> Changes in v1:
> - Remove unnecessary check for error in dev_get_priv
> - Fix comment
> - Rename wdt_reset call to wdt_expire_now
>
> ---
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  28 +++++++
>  drivers/reset/Kconfig                          |  10 +++
>  drivers/reset/Makefile                         |   1 +
>  drivers/reset/ast2500-reset.c                  | 106 +++++++++++++++++++++++++
>  4 files changed, 145 insertions(+)
>  create mode 100644 drivers/reset/ast2500-reset.c

Reviewed-by: Simon Glass <sjg@chromium.org>
