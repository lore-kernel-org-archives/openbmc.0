Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fFtdW8tX"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZcYNmrV1"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R7VD6s2kzDr10;
 Thu, 12 Jul 2018 17:53:40 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id c15-v6so3018361qtp.0;
 Thu, 12 Jul 2018 00:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=umaRSsomfK1AGA5JYxVGzEcUVXcPqgUkiVNVUFEAPX0=;
 b=fFtdW8tXnsSyBq5shO4Re2H2nvaWzixQLxxuc3Az21W3+LnbWAaGwQ8xSyHhMVcirn
 7jT00i2B2ER8CW0FCOdEBuar/8qQNArGczcBMPbuLm8qaysXXaeNTtqgjwZoXFmtSkWB
 CmerVRjwXnLl28aC3lae0cYSeJ8lsUHxVOGZHm5zfHz/U8EPuSuEapV8CBn6aCcVMesc
 6zn3wbcVN8fczNWC3arEuMeBrKYcd64dN6lZznNUaNu9bJwbF+dS0vOTCqt9G4q9LfnQ
 6vOED7KvWeFEoR22dROv1NGf+ks4vJlMCM0nabihbvpch3tCx13E/XN/DYxT522NSBbB
 7gsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=umaRSsomfK1AGA5JYxVGzEcUVXcPqgUkiVNVUFEAPX0=;
 b=ZcYNmrV1ZMCAIhvVXeq+kSSFqG0ynUT5CIGjU/ZA6rfR5p/vErzRyawJ6cqL/XI4s4
 WXp58ridlc8eXYdzXbh7QdIw1IZ/HLRPWiwdcxxSvZV4fUKuzA0fQasDzXVc14XCt7dL
 ek2p3cKlhali+MxRZqe4dvv4n6l0+lOnFsD+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=umaRSsomfK1AGA5JYxVGzEcUVXcPqgUkiVNVUFEAPX0=;
 b=ZAEXZ/c8TCeat5q8Y57+OhazYpWHPOyBzm+1MKMzPcRISQt//Q+oNSfDXNs97thhIe
 yAkm/oZYSzFr/2hoJTMdrX7cZ9QV/wWvVRBI4t49/z2m9LWbu9ODgGBTwuZJAmIMloEQ
 oA4zzfw9TufEzYezCkxwojYZhx6aPRnwBT7DoVZqNeTpzmVQCfI3AN/CIR+c72N45CU9
 YD5bgw9F2nQO5cLKYzh7U9OXBukL4dpNwpmIZd6GzBzfT0cSvoYfulb69h6VO5iIjsHO
 WM2e5DNOYYsHLAq7k1sOM6qY5xwPM9IyUeXHO9tvTOv2Ml7Bt2ZGq9JxZyUxnF6xKgDN
 f21w==
X-Gm-Message-State: AOUpUlFq/CNX+tNO6spg2oW2ZRtOHqj9PhRsOvmEXAFYC9DB0wBgBjCL
 1ew7WKdidNPJJeYqQj5P91BNihZsIoR+56jFofM=
X-Google-Smtp-Source: AAOMgpcenqW6JfXzYejz22drDTzxF+UCd/z65v0rH9d5/T275LnY1c5SuS5M8cCTk4VlD2qemb7SlyKN5IcTSeBj7OE=
X-Received: by 2002:ac8:322:: with SMTP id q34-v6mr913548qtg.342.1531382017803; 
 Thu, 12 Jul 2018 00:53:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 00:53:17
 -0700 (PDT)
In-Reply-To: <20180712034847.12878-4-benh@kernel.crashing.org>
References: <20180712034847.12878-1-benh@kernel.crashing.org>
 <20180712034847.12878-4-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 Jul 2018 17:53:17 +1000
X-Google-Sender-Auth: _jN1OIqmHZD8kuuJsta4l61bVgE
Message-ID: <CACPK8XdZKbh2NLQaiZOx66FAo+3csS_D9-BXjJKeppKm8aEM6w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] fsi: master-ast-cf: Add new FSI master using
 Aspeed ColdFire
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 12 Jul 2018 07:53:42 -0000

On 12 July 2018 at 13:48, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> The Aspeed AST2x00 can contain a ColdFire v1 coprocessor which
> is currently unused on OpenPower systems.
>
> This adds an alternative to the fsi-master-gpio driver that
> uses that coprocessor instead of bit banging from the ARM
> core itself. The end result is about 4 times faster.
>
> The firmware for the coprocessor and its source code can be
> found at https://github.com/ozbenh/cf-fsi and is system specific.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  drivers/fsi/Kconfig                      |    9 +
>  drivers/fsi/Makefile                     |    1 +
>  drivers/fsi/cf-fsi-fw.h                  |  157 +++
>  drivers/fsi/fsi-master-ast-cf.c          | 1438 ++++++++++++++++++++++
>  include/trace/events/fsi_master_ast_cf.h |  150 +++
>  5 files changed, 1755 insertions(+)
>  create mode 100644 drivers/fsi/cf-fsi-fw.h
>  create mode 100644 drivers/fsi/fsi-master-ast-cf.c
>  create mode 100644 include/trace/events/fsi_master_ast_cf.h
>
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index 322cec393cf2..e0220d1e1357 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -27,6 +27,15 @@ config FSI_MASTER_HUB
>         allow chaining of FSI links to an arbitrary depth.  This allows for
>         a high target device fanout.
>
> +config FSI_MASTER_AST_CF
> +       tristate "FSI master based on Aspeed ColdFire coprocessor"
> +       depends on GPIOLIB
> +       depends on GPIO_ASPEED
> +       ---help---
> +       This option enables a FSI master using the AST2400 and AST2500 GPIO
> +       lines driven by the internal ColdFire coprocessor. This requires
> +       the corresponding machine specific ColdFire firmware to be available.

The "machine specific" part isn't true anymore, is it?

I gave this a spin on a palmetto and it appeared to work fine for me.

Tested-by: Joel Stanley <joel@jms.id.au>
