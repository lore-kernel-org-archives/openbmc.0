Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTKcP0JhrzDq8M
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 14:35:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pwyxXt1V"; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id x71so3247523qkb.0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 19:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=NcrkRAh3e+LHnNztzXx4/K57q13XCGKJX8wB5R7r5fY=;
 b=pwyxXt1Vcn0mXG9V3xwAr9z0ihCjx8hJHYVw9AaOw5IypVJius3y1lOCgcfbfPFqtS
 vB+ktIQYY5FTXfAb9YKz+n/tMbcJCs8+aa2caL6LRer7L4ubs20ekgwDhFJq6pakJ15i
 hiqHxThSSRwvlydWQhAHUxuf9Z7Du5InvCZqvWVIV03cA8WNN0DvAFXUmb/FpWCf7kWf
 cbMiCEKXQpHthrDGRlV+h1ieRdhEwlxYYM4NUhm7IprvNpZr/xeoLMrxSikXUTeqtNS/
 vK0xEoYneuUFlYesosePGEQuHHvaeM3gYUhOEHrLj2DmEri0DYMz/zjelob1kC4ADd9A
 An6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=NcrkRAh3e+LHnNztzXx4/K57q13XCGKJX8wB5R7r5fY=;
 b=I7UkwKOmNs+5+fLecIFVSxu6ImEtc5sR2DDYjpVQT8JHorX6cHpM7iwY2Rn+ne+wnh
 8Y9gNp44/KqoGuvL2FuXnNTZLsyV1D1HyQaisxzFjtNU7qTnMBNZaRkVNys3EyEN6wr+
 bHRMOzZLguph6Xx238c6F5lDL8wM304GqZN3X9qs9+jqhshXEA7Y0f44W1gRn7bnSyFH
 pYGYnbgBnw0JtCMogGk+090erE6Io7IoKlsP3E6aX/m8WuYTBtnpksi47uzO9iYXxFRx
 18GMzvo3QlHEygRvIGj/L24i5Y5k8DVRozNlfyXyNKpPa7RA8R+OSyDgZF91+9LlHSln
 C1Ig==
X-Gm-Message-State: AMke39lBPvAjWJJrnkGhBxP1kCePm9QRRNOtpeFZs4p1QueQa1fAGeZWiksSIVQGSSEdNzt157ptZrZWC4Rfyg==
X-Received: by 10.55.180.5 with SMTP id d5mr34385092qkf.266.1487820898458;
 Wed, 22 Feb 2017 19:34:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Wed, 22 Feb 2017 19:34:58 -0800 (PST)
In-Reply-To: <20170221051259.18383-2-joel@jms.id.au>
References: <20170221051259.18383-1-joel@jms.id.au>
 <20170221051259.18383-2-joel@jms.id.au>
From: Mine <mine260309@gmail.com>
Date: Thu, 23 Feb 2017 11:34:58 +0800
Message-ID: <CAARXrt=dKRZh0AczANUee4asj-KxxU4zKqMhWd+_CiO7CQ75BQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/2] ARM: dts: aspeed: Reserve memory on all
 P9 machines
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>,
 Xo Wang <xow@google.com>
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
X-List-Received-Date: Thu, 23 Feb 2017 03:35:01 -0000

Hi Joel,

On Tue, Feb 21, 2017 at 1:12 PM, Joel Stanley <joel@jms.id.au> wrote:
> This flash_memory region reserved memory region is used by the host<->bmc
> mailbox daemon.
>
> The vga_memory region is for the host processor's framebuffer when using
> the Aspeed as a PCI graphics device. We reserve the maximum region to
> protect against bad host drivers. In the future this should correspond
> to the amount of memory we've told the host it can use.
>
> These numbers were generated as follows for Zaius:
>
>  $ genmem.py --ram-base 0x80000000 --ram 1G --flash 64M
>
> And for Romulus and Witherspoon:
>
>  $ genmem.py --ram-base 0x80000000 --ram 512M --flash 64M --vga 64M
>
> With this script:
>
> def convert_one(s):
>     suffixes = [
>                 ('K', 1024),
>                 ('M', (1024*1024)),
>                 ('G', (1024*1024*1024)),
>                 ('T', (1024*1024*1024*1024)),
>                 ('th', 1000),
>                 ('mi', (1000*1000)),
>                 ('bi', (1000*1000*1000)),
>                 ('tri', (1000*1000*1000*1000))
>                ]
>
>     s = s.strip()
>
>     factor = 1
>     for suffix, mul in suffixes:
>         if s.endswith(suffix) or s.endswith(suffix.lower()):
>             factor = mul
>             s = s[:-len(suffix)]
>             break
>
>     val = None
>
>     if s.startswith('0b'):
>         val = convert_binary(s)
>     elif s.startswith('0x'):
>         val = int(s, 16)
>     else:
>         for c in 'abcdefABCDEF':
>             if c in s:
>                 val = int(s, 16)
>                 break
>
>     if val is None:
>         val = int(s)
>
>     val *= factor
>
>     return val
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
>     vga_size = convert_one(args.vga)
>
> vga_base = base + size - vga_size
> flash_base = base + size - vga_size - flash_size
>
> if flash_base % flash_size != 0:
>     print("Error: flash base address not a multiple of window. Rounding down")
>     flash_base -= flash_base % flash_size
>
> print("memory {\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (base, size))
> if vga_size > 0:
>     print("vga_memory {\r\n\tno-map;\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (vga_base, vga_base))
> print("flash_memory {\r\n\tno-map;\r\n\treg = <0x%08x 0x%08x>;\r\n}" % (flash_base, flash_size))
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 16 ++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  9 +++++++--
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  4 ++--
>  3 files changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 58baf87454e2..7293b41239a3 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -20,6 +20,22 @@
>                 reg = <0x80000000 0x20000000>;
>         };
>
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vga_memory: region@9c000000 {
> +                       no-map;
> +                       reg = <0x9c000000 0x04000000>; /* 64M */
> +               };
> +
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +       };
> +
>         fsi-master {
>                 compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 2cbdeba88908..1ea8f65c1dab 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -25,9 +25,14 @@
>                 #size-cells = <1>;
>                 ranges;
>
> -               flash_memory: region@94000000 {
> +               vga_memory: region@9c000000 {
>                         no-map;
> -                       reg = <0x94000000 0x04000000>; /* 64M */
> +                       reg = <0x9c000000 0x04000000>; /* 64M */
> +               };
> +
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
>                 };
>         };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e1c9b3f4fe44..c3a6a8656b3e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -25,9 +25,9 @@
>                 #size-cells = <1>;
>                 ranges;
>
> -               flash_memory: region@94000000 {
> +               flash_memory: region@bc000000 {
>                         no-map;
> -                       reg = <0x94000000 0x04000000>; /* 64M */
> +                       reg = <0xbc000000 0x04000000>; /* 64M */

For Zaius with 512MiB RAM (what I saw in Foxconn), the memory size
will be adjusted by Uboot,
which is OK.
Will this reserved memory be adjusted from 0xbc000000 to 0x9c000000?

>                 };
>         };
>
> --
> 2.11.0
>
