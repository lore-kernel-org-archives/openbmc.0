Return-Path: <sjitindarsingh@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSh6W58R0zDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 13:25:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qyp7aNpK"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id 5so21150465pgj.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 18:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eauvt2NQaxuIRDkrcflPEFUP5osIwFnFrOPfeFzt7Gk=;
 b=qyp7aNpKERtF0bns0ytCDTDLMn/12P3qejsEh2Sug1uI2qiLaWJxVGRzaCQoEA7oBo
 bl4obf6QkLqdzAMu+GPSyFzcQ0l88A5sotk6E3lc4frARHe3zfoC2d1W//kk6mEcCVvB
 JOXAouUyWdxaYG5Thw8tmYZ3Hpkmmjukcu5K0iol15c6IL1bOWZpCrZV/iwJZb7JpAMh
 rOTgkSnmLfsD6U+wJAkpSHIlDZVxcz62bLrkbpPwCdaxjsZEE7bwlsyyuvXsBt5dz9bH
 9TLeSfERH6Tb0LP1ZTOZU1VzEi3sb/3tm4N43geHd03Zw02Wfym2KzSy3zEmyQw6YBvb
 EOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eauvt2NQaxuIRDkrcflPEFUP5osIwFnFrOPfeFzt7Gk=;
 b=HuSSdFSVO+LCGClYsqOfVIsRNmwQ+13654IS3atmkyG/+BKwvkVrjSMgOU50bKLxkb
 sYWlrQ2wR3H1Lec0eXxmJdEyFHAB5L1rCti9/EPW8uLspkUEfBuGYQ9WE9A2vv70vFJp
 4CN7vWhNQw1NGb+UcdwuunUI+H6iE5830I8wEBQ2eosG6J0v9ybGfHN9pKRQcvjZa8Nw
 twUZ3tqxH7boW9j25ahaTWZwZLUbcYNVLTxTTycLUIZUDYKzuKFgvR13AvEByfhSoh+A
 kYOjZ39NpeY07QFX2qf9tkPIymFD/KIH9pn1jco/acLoNqvNSqGrm5yECKcmC0RDjUmg
 MM7Q==
X-Gm-Message-State: AMke39k5jd/WBk5xLST7lsRwGgplYEMBxbDCOxqKCQFpUCINwAnRAAt/rrOV+jY9A9ez5A==
X-Received: by 10.84.233.200 with SMTP id m8mr14718532pln.92.1487730321541;
 Tue, 21 Feb 2017 18:25:21 -0800 (PST)
Received: from surajjs.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 64sm43191705pfq.112.2017.02.21.18.25.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Feb 2017 18:25:21 -0800 (PST)
Message-ID: <1487730316.2140.1.camel@gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/2] ARM: dts: aspeed: Reserve memory on
 all P9 machines
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>
Date: Wed, 22 Feb 2017 13:25:16 +1100
In-Reply-To: <20170221051259.18383-2-joel@jms.id.au>
References: <20170221051259.18383-1-joel@jms.id.au>
 <20170221051259.18383-2-joel@jms.id.au>
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
X-List-Received-Date: Wed, 22 Feb 2017 02:25:24 -0000

On Tue, 2017-02-21 at 15:42 +1030, Joel Stanley wrote:
> This flash_memory region reserved memory region is used by the host<-
> >bmc
> mailbox daemon.
> 
> The vga_memory region is for the host processor's framebuffer when
> using
> the Aspeed as a PCI graphics device. We reserve the maximum region to
> protect against bad host drivers. In the future this should
> correspond
> to the amount of memory we've told the host it can use.
> 
> These numbers were generated as follows for Zaius:
> 
>  $ genmem.py --ram-base 0x80000000 --ram 1G --flash 64M
> 
> And for Romulus and Witherspoon:
> 
>  $ genmem.py --ram-base 0x80000000 --ram 512M --flash 64M --vga 64M
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
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 16
> ++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  9 +++++++--
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  4 ++--
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 58baf87454e2..7293b41239a3 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -20,6 +20,22 @@
>  		reg = <0x80000000 0x20000000>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		vga_memory: region@9c000000 {
> +			no-map;
> +			reg = <0x9c000000 0x04000000>; /* 64M */
> +		};
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
> index 2cbdeba88908..1ea8f65c1dab 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -25,9 +25,14 @@
>  		#size-cells = <1>;
>  		ranges;
>  
> -		flash_memory: region@94000000 {
> +		vga_memory: region@9c000000 {
>  			no-map;
> -			reg = <0x94000000 0x04000000>; /* 64M */
> +			reg = <0x9c000000 0x04000000>; /* 64M */
> +		};
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x04000000>; /* 64M */
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e1c9b3f4fe44..c3a6a8656b3e 100644
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
FWIW:

Reviewed-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
