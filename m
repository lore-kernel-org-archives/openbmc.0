Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vP5Tw4MDKzDqpG
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 17:14:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qEUKQc+/"; 
 dkim-atps=neutral
Received: by mail-qt0-x243.google.com with SMTP id s58so1002297qtc.2
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 22:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bVAmNvHlme+fjplQ+waP3BpTTS3WuSRoGkYg0voe1MA=;
 b=qEUKQc+/3/jBZEPlL9yEY404uYXKnGRhiAl9Os33vHepTcsMlVCaEF/kMxBiwUG9HR
 e9f1SeKbHGIl31uLFEu1CVcNMccbM04Uc9VLizyoNNUFZdkNWpDeTbf04MEaIK6Y5UKF
 WNS9+iK6Zx1WxEFCL2mMc8eXNlvr+wBESC/Epv/mqk8f46UvX1jAnkD9+ryPfMoZIUrn
 Gtbjns9OgWODJS0ISzbuuQSR3+E9VTLVdd07+2X1pBdB683wsVPUWCYl9evye/dsEpXo
 CJf/QNSEaftLt3LjBuUosQY32EnYFdqMbjNKE+0GmOdOxzulGYVTCOOiH9eK0gSC7teW
 cfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bVAmNvHlme+fjplQ+waP3BpTTS3WuSRoGkYg0voe1MA=;
 b=k78om+Qy2e7vY82bNLDA3/qDE3E3QtwqLLkSgusSjDsKK4CJPgh1CuGv0/9vGvMMlO
 FsFcMZVMZ5KvAhwe36YfwsIjM5T3tPhHYijnnrlSvNcRMDQ8gjO1uwIXql0xbWJdgHxx
 P7t/ZEM21Q5wPcv8hzGX1r4jtNUz8vX7YcPzWGZFwB2ouatzwhLmrEhRDQZHKuhW8Gdu
 Grit1SeWBROh2kwE3S63jpqIxhufLUWVYgoPOmiARbf+BKo1KsIWHN7l8JjLZHj+Ivjn
 Nsu0WNtwxOCuQitwkCOwoEyC/69MEwxyDzQ6EfJO6LTr42L+hhWwWGcEQ5VHDdD5NKgT
 rTNg==
X-Gm-Message-State: AMke39lHByKa+Gqoh56btDd9FsNWezhOTWhL+rcWfg4uPHdier2Qb0epHI4sRT5dClUrjxO9bkLFyPvvZihbLw==
X-Received: by 10.200.39.77 with SMTP id h13mr563643qth.62.1487225682258; Wed,
 15 Feb 2017 22:14:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Wed, 15 Feb 2017 22:14:41 -0800 (PST)
In-Reply-To: <20170216054922.19722-1-cyrilbur@gmail.com>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
From: Mine <mine260309@gmail.com>
Date: Thu, 16 Feb 2017 14:14:41 +0800
Message-ID: <CAARXrtm=xGhKQrngbjx2qZZhOx8tq-S3f948n+TnxGjkgb14Gg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for zaius
 and witherspoon
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 16 Feb 2017 06:14:45 -0000

Hi Cyril,

On Thu, Feb 16, 2017 at 1:49 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 9 +++++++--
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 9 +++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 4b2d8aa8abb6..2d76bfee1262 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -25,9 +25,14 @@
>                 #size-cells = <1>;
>                 ranges;
>
> -               flash_memory: region@94000000 {
> +               flash_memory: region@98000000 {
>                         no-map;
> -                       reg = <0x94000000 0x04000000>; /* 64M */
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +
> +               vga_memory: framebuffer@9c000000 {
> +                       no-map;
> +                       reg = <0x9c000000 0x04000000>; /* 64MB */

This assumes that Witherspoon has 512MiB RAM, then why the memory part
indicates it has 1GiB?
```
        memory {
                reg = <0x80000000 0x40000000>;
        };
```

>                 };
>         };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e1c9b3f4fe44..f30288f735bc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -25,9 +25,14 @@
>                 #size-cells = <1>;
>                 ranges;
>
> -               flash_memory: region@94000000 {
> +               flash_memory: region@98000000 {
>                         no-map;
> -                       reg = <0x94000000 0x04000000>; /* 64M */
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +
> +               vga_memory: framebuffer@9c000000 {
> +                       no-map;
> +                       reg = <0x9c000000 0x04000000>; /* 64MB */

As I know Google decides to not support VGA on Zaius, so maybe
vga_memory is not needed to Zaius at all.

>                 };
>         };
>
> --
> 2.11.1
>
