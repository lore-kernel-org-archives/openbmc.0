Return-Path: <sjitindarsingh@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vV0YF4BHFzDqGv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:49:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tuliAu0j"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id 5so1816873pgj.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 21:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TdgSokLmeSFTiM3JWTcMwsc8liIVVK/LVAqbkEfjBh0=;
 b=tuliAu0ju5gNvQLM39nnmWYhhqCJ+VIlQf5t+tN/K1a10KXbjXrnixk8HFn7YgVt1i
 OiKYfQpDjhXg/e8KGVL+jd+PhAJ3rDfRtmDXg+2pPuaWW/kdRJ9tNq5xXNwEtSo0f2+P
 kaHMM3DGP6lfE2dzME8Fg1Br6idrEdqQmuDlODRJScpt7yZUIsJ2Vu5O/g3/fJPEAsub
 SRHk7uMdowidc1yeMklcHbNTpm2W1iuKreAUdspbNDcwqKfGpCTITq1VpWCxdcSY1ccQ
 SqAY7MALyKuGIGU46+27uRcL7CvYD7yCh1T4uax9L4T1m0utWyO8br4K0T+lMGQlFDr1
 Og2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TdgSokLmeSFTiM3JWTcMwsc8liIVVK/LVAqbkEfjBh0=;
 b=PB4TIl2IhiPIhgL0jVE5ytbeeyEqEpJu3fl0amK5WpM1FK8/GolJOxHbYPkI4rEQOI
 qmkaXtLfo3kOZMHOTdAIeHCmlTV2oU3Qu7ktIYlJFNGsC0GdtU2eCxa2Au5oMxJM/kgi
 epjAu9ZV7T4pXLRbJ6ogP09ECOvZILqaJwt2G8YhdS2pQhrwgn6AqAZIbd/YSGPaz8Dh
 qAlobsVnSo0pHC1LhOqFYUZDiYYqNqu2IussJOkMF98DcOkk8M9Nd2s+YfZ/pBTrm8UM
 1wPI8PAUqQiHWoNWNFlg7XdzoFZmW8TpAZU3cTpfoRj24Nr0B2XiH/6PXzZawLEJOJl8
 aXUQ==
X-Gm-Message-State: AMke39mfCCjmMKo9AEmlL73aoTo2fgXXTGjWxWcBEs/3EM4O7uWT28Ai95RCxemivCLzxA==
X-Received: by 10.98.207.193 with SMTP id b184mr1372692pfg.12.1487915375693;
 Thu, 23 Feb 2017 21:49:35 -0800 (PST)
Received: from surajjs.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id s13sm12772856pfk.26.2017.02.23.21.49.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Feb 2017 21:49:35 -0800 (PST)
Message-ID: <1487915370.23895.40.camel@gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] ARM: dts: aspeed: Reserve RAM on P9
 machines
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Lei YU <mine260309@gmail.com>, Xo Wang
 <xow@google.com>
Date: Fri, 24 Feb 2017 16:49:30 +1100
In-Reply-To: <20170224053357.18391-1-joel@jms.id.au>
References: <20170224053357.18391-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 24 Feb 2017 05:49:38 -0000

On Fri, 2017-02-24 at 16:03 +1030, Joel Stanley wrote:
> This flash_memory region reserved memory region is used by the host<-
> >bmc
> mailbox daemon.
> 
> This patch initially had a vga_memory region for the host processor's
> framebuffer when using the Aspeed as a PCI graphics device. However
> this
> is not required as u-boot modifies the /memory node of the device
> tree
> to report the total RAM size minus the strapped VGA framebuffer. This
> is
> 16MB of the current system.
> 
> These numbers were generated as follows:
> 
>  $ genmem.py --ram-base 0x80000000 --ram 1G --flash 64M
> 
> And for Romulus and Witherspoon:
> 
>  $ genmem.py --ram-base 0x80000000 --ram 512M --flash 64M
> 
> With this script:
> 
> def convert_one(s):
>     suffixes = [
>                 ('K', 1024),
>                 ('M', (1024*1024)),
>                 ('G', (1024*1024*1024)),
>                 ('T', (1024*1024*1024*1024)),
>                 ('th', 1000),
>                 ('mi', (1000*1000)),
>                 ('bi', (1000*1000*1000)),
>                 ('tri', (1000*1000*1000*1000))
>                ]
> 
>     s = s.strip()
> 
>     factor = 1
>     for suffix, mul in suffixes:
>         if s.endswith(suffix) or s.endswith(suffix.lower()):
>             factor = mul
>             s = s[:-len(suffix)]
>             break
> 
>     val = None
> 
>     if s.startswith('0b'):
>         val = convert_binary(s)
>     elif s.startswith('0x'):
>         val = int(s, 16)
>     else:
>         for c in 'abcdefABCDEF':
>             if c in s:
>                 val = int(s, 16)
>                 break
> 
>     if val is None:
>         val = int(s)
> 
>     val *= factor
> 
>     return val
> 
> import argparse
> parser = argparse.ArgumentParser()
> parser.add_argument('--ram-base')
> parser.add_argument('--ram')
> parser.add_argument('--flash')
> parser.add_argument('--vga')
> 
> args = parser.parse_args()
> base = convert_one(args.ram_base)
> size = convert_one(args.ram)
> flash_size = convert_one(args.flash)
> vga_size = 0
> if args.vga:
>     vga_size = convert_one(args.vga)
> 
> vga_base = base + size - vga_size
> flash_base = base + size - vga_size - flash_size
> 
> if flash_base % flash_size != 0:
>     print("Error: flash base address not a multiple of window.
> Rounding down")
>     flash_base -= flash_base % flash_size
> 
> print("memory {\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (base, size))
> if vga_size > 0:
>     print("vga_memory {\r\n\tno-map;\r\n\treg = <0x%08x
> 0x%08x>;\r\n}" % (vga_base, vga_base))
> print("flash_memory {\r\n\tno-map;\r\n\treg = <0x%08x 0x%08x>;\r\n}"
> % (flash_base, flash_size))
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Acked-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> ---
> v2 drops the the reserved region for VGA as we don't need it
> 
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 11 +++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  4 ++--
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  4 ++--
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 5ba7b62aee83..93fbd7b8c490 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -20,6 +20,17 @@
>  		reg = <0x80000000 0x20000000>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x04000000>; /* 64M */
> +		};
> +	};
> +
>  	fsi-master {
>  		compatible = "ibm,fsi-master", "ibm,fsi-master-
> gpio";
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index e15bd256c0fd..0769507f1126 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -25,9 +25,9 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> -		flash_memory: region@94000000 {
> +		flash_memory: region@98000000 {
>  			no-map;
> -			reg = <0x94000000 0x04000000>; /* 64M */
> +			reg = <0x98000000 0x04000000>; /* 64M */
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index d9f63d7752dd..c2af9ffa89bf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -25,9 +25,9 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> -		flash_memory: region@94000000 {
> +		flash_memory: region@bc000000 {
>  			no-map;
> -			reg = <0x94000000 0x04000000>; /* 64M */
> +			reg = <0xbc000000 0x04000000>; /* 64M */
>  		};
>  	};
>  
