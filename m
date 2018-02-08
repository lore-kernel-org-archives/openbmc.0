Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d1MBiPce"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcTRQ3L5gzF158
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 17:53:05 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id c17so4764330iod.1
 for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2018 22:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nz3xlCoPi8MUzJh4BuDYM2xHSQMxuoArpC5Ohwppirk=;
 b=d1MBiPceCDIuNb99WR/eWrtRF2s75UDPBCYileF7yWEhL2w1KloZQkuurr4JYbrJ2/
 MppyYdwsf0RF+U20lZ8RNA9oZV9wJ39Cu+XpnJDXgOOTR9/AxrzKUVKXwIylOJbVc70A
 jmW/odZmvM3vMa77VuuiXUf4/hV5XrfDzC7HSITnSKm+U3TKiT3BlbRGXAvAzSkusg0f
 jFl9hzZoWrrYECraZy9kRGwbQ6IRjRa2axYkm9+IDOtIUdVufUbGa964t3OiHOStuA2P
 PQAs1kFRQr36UxfrlPbOjq7zpgVVEWg89xdonmVJfrQW00z2QFeUltnDosSyh8p0JJ7j
 EwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nz3xlCoPi8MUzJh4BuDYM2xHSQMxuoArpC5Ohwppirk=;
 b=XXkIn/c++XV1RV5/ZBwBeOx/9kXxppJ6czsLiV/i4S06H8zAu+jRqNkVtOEF/5U5+k
 MQPZXRnH992v/qVDtrxD3yNlvuF9Q18x1NXwRvR5819UU6mMx19KCy6ka9ZBWwdcH3Iz
 M5ENaBW8COuZbk8y/3VliFmDPnDM+aT5EBXIXbFHuK6KZ/RoihcF1h1CynGu+kPv+WJL
 ttV2xapG4EMW1BSBmVlJK/RgrKgVsuAG2BGqdYJ2TLGv2ZXsWkCadmI/8pVHJssGuZpK
 fLlCNbHTHlFd4sM9aSJ1/jbkUn6ArciJvz0qzSsYn8LYMLYz5+dSbnm2XzyPrc1Hqz43
 Szqg==
X-Gm-Message-State: APf1xPDA973bMeEE9r4Se1czrGDgyA8LuUWmUpKaQM971KMP3N/lmTYx
 zg+vLAHsLz60CfChU3GSZiQqHgey+a6X+iNinTg=
X-Google-Smtp-Source: AH8x226SGNKSsOAcMsb2IVqVaRTGJAwC75uIVDvDVWAQGFHuYkWRJMj3KJuoxjnHde5ZYANpKZ4rrxrVEedcTJE77nU=
X-Received: by 10.107.148.82 with SMTP id w79mr10601173iod.207.1518072783479; 
 Wed, 07 Feb 2018 22:53:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.159.68 with HTTP; Wed, 7 Feb 2018 22:53:02 -0800 (PST)
In-Reply-To: <20180208053745.31254-1-joel@jms.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 8 Feb 2018 14:53:02 +0800
Message-ID: <CAARXrtm8DisHh6+87QZJbKC8d38Tr82ohJZWywoDYCp1ErvWJg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 0/3] LPC fixes
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 06:53:07 -0000

Without the patches, LPC is not working and SBE fails to fetch PNOR.
With the patches, LPC is working and SBE starts host OK.

Tested-by: Lei YU <mine260309@gmail.com>

On Thu, Feb 8, 2018 at 1:37 PM, Joel Stanley <joel@jms.id.au> wrote:
> These patches were developed when bringing up dev-4.13 on Romulus. We
> need to ensure the LPC clock is enabled, now that the clock driver turns
> off any unused clocks. We also need to enable the LPC firmware cycles
> bit as we no longer have the aspeed.c hack.
>
> Joel Stanley (3):
>   ARM: dts: aspeed: Add LPC clock phandles
>   misc: aspeed-lpc: Enable clock
>   soc: aspeed-lpc-ctrl: Enable FWH cycles
>
>  arch/arm/boot/dts/aspeed-g4.dtsi |  1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi |  1 +
>  drivers/misc/aspeed-lpc-ctrl.c   | 31 +++++++++++++++++++++++++++++--
>  3 files changed, 31 insertions(+), 2 deletions(-)
>
> --
> 2.15.1
>
