Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="VrUZX539"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442pF26JcKzDqCG
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 13:47:34 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id m9so9194061qkl.4
 for <openbmc@lists.ozlabs.org>; Sun, 17 Feb 2019 18:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Alugpt5dMxow4V8s6b+TyYBLVCn3d+yHDqif/3Puoj0=;
 b=VrUZX5391nLjlnneyd9nHUDFcUwL51hm63rY5ZiQj9ZbF/EhVGvLquLk/Whwnii3qV
 MPVxWZvq8IUFFj8D2+0GGl986MhkuQCA0k+5OI1DBmdckC4mI1d3c1xuzmOMJLIFIxqV
 iiNzpgxM/QzyuJ7/CzPHVPPUR5DzIb4Hsrxq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Alugpt5dMxow4V8s6b+TyYBLVCn3d+yHDqif/3Puoj0=;
 b=oR5XOIF7LGAgsYv4kM3iH6xCcjYJbnYnruuKbENfJ0yhMJo5avXAsxcFdwiV0/Tkdx
 lqbMh7ASSytQ9I/E25s+DKJ83OobSHTGqd7S1QlBSOT+sJJ8uuwyBXsOry26SLNPPVxS
 fHPO1fap9pq2lSeWboHNDH7vJKu3/ywakA1ZeRYXBy1+ysKGjcSq/V0r3+dsaGmDLc/t
 sX8mVK/dMlBfnnaOYNwdnVkVdnE0T7442K3gOEol0A/YGC812I2Yqhcihmw49BsMm8Mg
 N0VlCfu+LeQbuDgtwod9qLOGqXypi7pv5RjoDVFmZ0GmKQk1X39TXeK9QSQjq21Zbqxn
 9b1A==
X-Gm-Message-State: AHQUAuZ4Qqty3qtyBv4tEXlx+Fon/dRjCBGgii4Z5xpG11GU+jwbpNs5
 pt4y/yn8jylFCYSpUZ84hQrxVAkFKwH2HTP5dlE=
X-Google-Smtp-Source: AHgI3IYPQ8rbhXzZInBzA3xJwyvS4y42NUVdro2/h83wAlNdO9b93JfM5qth+In9mssFeQOPRGjbZpehDds3CGSmIw0=
X-Received: by 2002:a37:dd41:: with SMTP id n62mr14772901qki.11.1550458052194; 
 Sun, 17 Feb 2019 18:47:32 -0800 (PST)
MIME-Version: 1.0
References: <1550216841-57006-1-git-send-email-mine260309@gmail.com>
In-Reply-To: <1550216841-57006-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Feb 2019 13:17:20 +1030
Message-ID: <CACPK8XeYeGw_PRhn8ZW8e9ep=PRR6PTb4VOcBC5nc=RRdeRVDg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.19] ARM: dts: palmetto: Fix flash_memory region
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Feb 2019 02:47:36 -0000

On Fri, 15 Feb 2019 at 18:17, Lei YU <mine260309@gmail.com> wrote:
>
> The flash_memory region was incorrect and exceeds AST2400's RAM range.
> Fix it by putting it before coldfire region, and aligned with 32MiB.

We've had a patch to do this in patchwork for some time now:

https://patchwork.ozlabs.org/patch/879522/

We can't do that as it breaks booting, as the FIT loading will
(sometimes) place the initrd or dtb in the reserved region, and this
stops Linux from being able to map it, causing boot to fail.

We need to fix that bug before we can resolve this issue. There is a
u-boot environment variable that can be set that stops anything being
loaded too high. The proper fix is probably to make u-boot's FIT
loader aware of the reserved mappings and not put things there. Other
suggestions are welcome.

>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 9285b90..50c9178 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -32,9 +32,9 @@
>                         no-map;
>                 };
>
> -               flash_memory: region@98000000 {
> +               flash_memory: region@5c000000 {
>                         no-map;
> -                       reg = <0x98000000 0x01000000>; /* 16MB */
> +                       reg = <0x5C000000 0x02000000>; /* 32MB */
>                 };
>         };
>
> --
> 2.7.4
>
