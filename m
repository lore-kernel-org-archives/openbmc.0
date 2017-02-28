Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXdBl580bzDqHG
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 23:27:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DY6oOIEB"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id n127so2291884qkf.2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 04:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VOKdCb9ulrluqhRX6yq8D6XA/9NwFTnjnv6VzRju4KE=;
 b=DY6oOIEBrlct1goEeUD2AhouirEDhSoiVEC1TWjLNi7JeB91DfprhR7QBfl7RTn37t
 4Uj9BLycx0aaGHekAnZnrEisUKi66VmOFedmPYfeXF3mHZZU0Sr0J2Wq0WWWRPPD9QqG
 PXtAE9ng7533Etj9wr8ZfjvSucsvOcK0Dav1QuknOCzgmycL9MuEcL1ZRr87Em1MmyLB
 aKvsVwc8AjWFOi5TdIDYTbD7XgA6bb+r+Q0KVac40H91gyAmrF4dUnKgcXGuIqXk9csQ
 gnyKK+FZFZQqk6fSEuA0dx9+jEPb4osyC7X9vd8wB4szi3EQZnh7YKsKIOClAtNO/bhJ
 kLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VOKdCb9ulrluqhRX6yq8D6XA/9NwFTnjnv6VzRju4KE=;
 b=uWBOjaH7Uue+xyEg8ah3D8wA+OC/C0MyUB7v4CzZNyHSHdsI/JCRpqM0gNH0OQtpfW
 7oTYc4u2HVgbjddpDmANYuwrTNl+RKWRH7nhJ2QOq14QZnntJajhtsbAcMa0XIhWnguY
 2Ctzsax9jAXMWkU/+FhDiVssFp0rK+5i8N6Z/iYhxl+S0nL6qbU8uvjEYbW2JjD7iG3c
 GMXw6txDuBRlnfHp5sV9UP+Sfh4EGQXdvmqy/5bFImklZ5AOnXcG0Jq6dpvMYOI3tdmw
 +EEXSUdBRjDwx6y9xWUMKb2YCgCqYilrIEXSwQ3a+Pl6a+UZRQwJhBZudQt/wzKTGus5
 umMQ==
X-Gm-Message-State: AMke39kBmJHBw+XJBGIxM94D87DVIkjvdGqKkMy8Ys6Z9bMy0yXWkXaE3RlGj/9oBNNcNzF3Swxbz/Ca+wToMg==
X-Received: by 10.237.36.172 with SMTP id t41mr2002731qtc.142.1488284861559;
 Tue, 28 Feb 2017 04:27:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Tue, 28 Feb 2017 04:27:41 -0800 (PST)
In-Reply-To: <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
 <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 28 Feb 2017 20:27:41 +0800
Message-ID: <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI address
 mapping
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
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
X-List-Received-Date: Tue, 28 Feb 2017 12:27:44 -0000

Hi Andrew, Joel,

This patch is for issue https://github.com/openbmc/openbmc/issues/1214

Here's what I have tested:
1. rom1-19 with updated OpenBMC (c85f23e1), which has mboxd enabled;
2. Do a power cycle;
3. Once BMC is ready, check the registers by devmem:
   ```
   root@romulus:/tmp# devmem 0x1e630034
   0x70640000        <== Wrong, expect 0x70680000
   root@romulus:/tmp# devmem 0x1e630030
   0x64600000        <== Wrong, expect 0x68600000
   ```
I can see the two registers have the unexpected value.

Without manually setting the two registers, `obmcutil poweron` results in
no output at all in host console.

That's why I send this patch to initialize the registers.

Note: I think the lines
+       writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+       writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
are not necessary since they are having the expected value without this patch.

But below changes are necessary:
+       /* Set SPI1 CE1 decoding window to 0x34000000 */
+       writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
+
+       /* Set SPI1 CE0 decoding window to 0x30000000 */
+       writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));

--
BRs,
Lei YU

On Tue, Feb 28, 2017 at 7:16 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, Feb 28, 2017, at 20:10, Joel Stanley wrote:
>
>
>
> On 28 Feb 2017 17:49, "Lei YU" <mine260309@gmail.com> wrote:
>
> The PNOR SPI address mapping is the same as Witherspoon.
>
>
> This should be handled by the device drivers we now have.
>
> Mbox brains trust, any idea why we would still need this?
>
>
> I was going to say NAK for the same reason.
>
> Lei: are you absolutely positive you need this? If you do something has gone
> wrong. Is mboxd integrated into the romulus image? If not we need a yocto
> patch rather than a kernel patch.
>
> Andrew
>
> Cheers,
>
> Joel
>
>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 726b8fa..ec9eecf 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -221,6 +221,24 @@ static void __init do_witherspoon_setup(void)
>  static void __init do_romulus_setup(void)
>  {
>         do_common_setup();
> +
> +       /* Setup PNOR address mapping for 64M flash
> +        *
> +        *   ADRBASE: 0x3000 (0x30000000)
> +        *   HWMBASE: 0x0C00 (0x0C000000)
> +        *  ADDRMASK: 0xFC00 (0xFC000000)
> +        *   HWNCARE: 0x03FF (0x03FF0000)
> +        *
> +        * Mapping appears at 0x60300fc000000 on the host
> +        */
> +       writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
> +       writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
> +
> +       /* Set SPI1 CE1 decoding window to 0x34000000 */
> +       writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
> +
> +       /* Set SPI1 CE0 decoding window to 0x30000000 */
> +       writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>  }
>
>  #define SCU_PASSWORD   0x1688A8A8
> --
> 1.9.1
