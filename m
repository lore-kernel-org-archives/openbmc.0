Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7HfL51Z7zDqjY
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 11:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gH9MUwpP"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id l21so2270866ywb.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2017 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XQ27X5HuL1yT8jDTzeGIGjHhljlrGOFd0deGjKwIKhI=;
 b=gH9MUwpPQREC0i/p89h1xza0mxYtpL+IUV/aJY1/XTglCmpUQPkXtf92L8qgg+Z9Gu
 4a56AsKVlzIPOrmSZ/QQh+7s1GiPXLwpeFyHBVQjCF8nGbZC5H1vFtU6mLzryKHwQwRS
 Zn45sGPJnXwVjLGRUCiivcVDEpuzWrSw3ZKsHFJJDbWorHa3jbszTWjHdvzqx+FzxF0A
 kQ5kQCR6VZQkjSI1yHI6jPv4o0jlRWwXl/ZmcmCBUMG/mz2SRKibtIcnQUodDwT5h8sK
 2qKqQqL4f1L4jEHxNzU5TT1ThMwekyb+Ja+9z0sjV9fG6ML1BiJQSWOqoY2DZcpCweSU
 t2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XQ27X5HuL1yT8jDTzeGIGjHhljlrGOFd0deGjKwIKhI=;
 b=ZD+Cknna+6Hv8PKP+5AFjllzPzDoy58ak/kfIGWIObwX90vr6QhQ0fM2sE3scP5Phm
 UYf9x2HZjtc9GlHHODfHkWBSxPCNEWtHaL0TYQgzEVJTGnEfONRRAh+GyDsqOqoHAFKA
 HIpMHgx/iX0CJQRWLjIUyaswOi5zHTX6qaivvD00kq5GoHn1UM4P8/x9VGpwigWwlH2v
 I2DHfE5Y9QWdq8tJEs3+XbHmD8Ioz5UHxGS945xXw630eGeMsUohlnNAUj9pZxAROirx
 sP/VVspHynmbkzfKZq+uJD+F+tRcw5JFOW2SXi+1m+l2eMAqcxWZNMZO98JdW00tWw15
 5Cdw==
X-Gm-Message-State: AIVw113y4Rc+JUAt6YhnyV4jjJyXTHqmLbyWg012yZpkZnf8C70/zI06
 mkeWgrEfDvEgQpC2HjwItC4Ob7FnF/DO
X-Received: by 10.13.252.131 with SMTP id m125mr50134ywf.293.1499907880777;
 Wed, 12 Jul 2017 18:04:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Wed, 12 Jul 2017 18:04:20 -0700 (PDT)
In-Reply-To: <1499889964-23262-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499889964-23262-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jul 2017 10:34:20 +0930
X-Google-Sender-Auth: 6ZV2ogY_mrSUjiacdNM1WhVu86g
Message-ID: <CACPK8XdMbJsov9o-OWHNw8RPwXSJgMuVrdouT5w8zQAne7omkQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add FSI devices for Zaius
To: Eddie James <eajames@linux.vnet.ibm.com>, Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 13 Jul 2017 01:04:43 -0000

On Thu, Jul 13, 2017 at 5:36 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Missing label, properties, and include file.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Hey Xo, can I get an ack on this?

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index c620015..750ec12 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -71,10 +71,10 @@
>                 };
>         };
>
> -       gpio-fsi {
> +       fsi: gpio-fsi {
>                 compatible = "fsi-master-gpio", "fsi-master";
> -
> -               status = "okay";
> +               #address-cells = <2>;
> +               #size-cells = <0>;
>
>                 /*
>                  * These 2 GPIOs are set per board revision in aspeed.c.
> @@ -96,6 +96,8 @@
>         };
>  };
>
> +#include "ibm-power9-cfam.dtsi"
> +
>  &fmc {
>         status = "okay";
>         flash@0 {
> --
> 1.8.3.1
>
