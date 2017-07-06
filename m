Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3KRn6Lv9zDr3x
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 00:11:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GgDI4wOP"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id a12so202517ywh.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ETC+uk3ySbmaF2nTo7fEvVFiuGDuITw35CRbPoVZofE=;
 b=GgDI4wOP394jubTsycyjI5wML4cvelyfOdYaLp2wcWx75p+GPrkPe94ghylxvs1wP0
 LKzxSylZ+RKGN+Jgr5wP7x+fH5qmWSmO5jtbNni4uhlKBmrY4YoQClnGmtYj7SpqdzJR
 9fDbm3Xpl9kGVlziUbP7jAL9BjmOn6iW3U90vy1AbEcyBDDqb93wqGbYNgBY42owe4yZ
 pMBlWi9leHBJM2YAeHwBvgkXGcSESFbEJrfHsgglHYwAAu3GUv9pt2Pq5sl/Pb9iRJBd
 vleE+K9QLv16jKcbajdCe8Hl8tYt/JBmDbd2tnjYYA/nZ5WUh1UeKSX6OLhy4S7sLZ3k
 etSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ETC+uk3ySbmaF2nTo7fEvVFiuGDuITw35CRbPoVZofE=;
 b=TWCcUxrQ/hiK/ZVz8D+w5H6mSeX10zcnhy6NMaXUmlJrDc1RZ2NzfR/3aO8iMhQdhZ
 Ddr8nnp1C6LKiuA4z5lAYaPCL5FQIHAUxLHS3CGGFtmAOSFUeeJBonw1IcU0BidMn4lN
 T73pKKG5zC7ef74uzuZbGMTY94OQHqMlPKPgMlKgmZWBsGJ1QHbvUXmYwMJqTmaEMVSZ
 FOdK5aJaiNhzOSqmJ8XP5xdMd7m/FsqTMeO/W3J7EOH5k1Oa4V5v3kWuDGnRAwtRgpxk
 JcJYIkuKU++gi7MiNsFFf4MwPWWc+sCvO0WOxxKV9aCuKqDEgdmS6ZESkQ7FgDp/jat0
 R/Jg==
X-Gm-Message-State: AKS2vOwONaRL52MNUxjOQNjjnL4ElHgahaMIWfaQhyUEPzzi/pnaa4/b
 fB24FMAvpgkHJ5EKBBItfdsqBiazWAMTfCQ=
X-Received: by 10.13.225.5 with SMTP id k5mr37709886ywe.178.1499350307142;
 Thu, 06 Jul 2017 07:11:47 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Thu, 6 Jul 2017 07:11:26 -0700 (PDT)
In-Reply-To: <20170706140642.22377-1-cbostic@linux.vnet.ibm.com>
References: <20170706140642.22377-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Jul 2017 23:41:26 +0930
X-Google-Sender-Auth: 79Z2fmPfzUfsutaHwfisd6AeIlo
Message-ID: <CACPK8XcDKo4=Q=+=5OX0Zipp=0_QkxC7XRVg4w=EUY5Par6GSg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] arch/arm/boot/dts: Add watchdog 1 optional
 properties.
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 06 Jul 2017 14:11:50 -0000

On Thu, Jul 6, 2017 at 11:36 PM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Define external-signal and no system reset optional parameters
> to the dev tree so that watchdog 1 can be configured for these
> modes.

Thanks. Take a look at the history of the dts changes. Convention is
to use the prefix:

 "ARM: dts: aspeed: Add watchdog 1 optional properties"

Keep it in mind for next time. I'll fix it up for you when I apply it.

Cheers,

Joel
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 31315d0..20bbda6 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -420,6 +420,11 @@
>         aspeed,external-nodes = <&gfx &lhc>;
>  };
>
> +&wdt1 {
> +       aspeed,no-sys-reset;
> +       aspeed,external-signal;
> +};
> +
>  &wdt2 {
>         status = "okay";
>  };
> --
> 1.8.2.2
>
