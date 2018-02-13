Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rlUK/u3V"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgTLW01XJzF100
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 14:59:14 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id d14so2230034qtg.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 19:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=e3DSmUamQOWWcYs0lZg27R3Avdou5nUz1Z/lmuOldKY=;
 b=rlUK/u3VB6pJkJsYcC7qeCtFO0CAjq0s6Mxaw7rwhTQl1goJudTXslWnHAa1T5biE/
 mWTGnvuzSxbRV1uL2dCmL481i/3oJCMkVycsDiyh0CcuUKhjY9ScRuT92H/MjzsSueCW
 E4ANa5aW4I6TmhEdZzkjhTcy3d9/AX38MZNi0lloXIwZky0wIleGBMzGBoA3RUsc+Flm
 kKIWIvnjtoI888EuLrWc0lxyMk0rLx5tNfUtvk5w+xr6doSnXoDgftjDUYC8yZgOQVOD
 ajtVU6xUE4Wwchf1O/MPIIPUpTAbM6ufuCtk4xcZmdZb32EZxEMd3IpkGHHX1BoLfM/P
 anjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=e3DSmUamQOWWcYs0lZg27R3Avdou5nUz1Z/lmuOldKY=;
 b=ST3Du6juOUo7xWricB6NZPAGXq93YwpIpjmO81UyG5srn73TqtgS+hFe2FFAA75sO4
 Lzf2REvNSGPBuLK031AsJVQo2MbuEa423ZnWEYulbFr7gogm5J2QpS7OZf6cC5EGUhMU
 OLN2YmAnQndDp7Xs1Trfd5F7zodvHC1xWzuTlM6AkPzVJS+vlW7tq0e0/YizRlcOtupe
 Z8GHiqn4LtCmtrlU3PBbMGqyMq9IGFKxgCsIO5PoxAYQG7fGfRLU+Iaja6mPOfk1hI9M
 kk+5OlgtsQ0zEwr568NB5XCnB1mNNNP3sKcxCdgOH8MmZBX/g7+4m4zcvZ8Kcv/z7tzY
 5c5g==
X-Gm-Message-State: APf1xPDgD4f4/9TgG4hix6IKLZhnW7GFM3KGxOE98JPNjpwjoMO9HrAV
 FYHcF1esVrTtstlulhH2jduo/fRHSyLPYRBXwJY=
X-Google-Smtp-Source: AH8x226t1Kv3iQjwVTO1l1kNR+t0BnkplQ7aLLXDcM+LGptJKTCazmUp5HgJq01Rtq1MJH5FAOLyJwKGi+fLdKKsElI=
X-Received: by 10.237.38.132 with SMTP id q4mr2559676qtd.121.1518494351840;
 Mon, 12 Feb 2018 19:59:11 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Feb 2018 19:58:51 -0800 (PST)
In-Reply-To: <20180202030725.11771-1-bradleyb@fuzziesquirrel.com>
References: <20180202030725.11771-1-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Feb 2018 14:28:51 +1030
X-Google-Sender-Auth: _YvxQh8zhV1bE8zdAw81KtSXxUk
Message-ID: <CACPK8Xdj3zeH1PM=4DtS68jHDBKd_+eCJmRiBmw6cYeJRNUUVA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed: un-hardcode FIT
 configuration selection
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2018 03:59:15 -0000

On Fri, Feb 2, 2018 at 1:37 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> Rely on the FDT parser to select a FIT config when looking for a
> ramdisk_conf.  This allows image builders to use arbitrary configuration
> names like /configurations/conf@foo.

Can you elaborate?

Do we even need this script? IIRC it was in place to support pre-FIT
configurations where the initrd and the kernel were stored in seperate
locations in flash. Now that all systems use FIT, we can simply say
"bootm 2008000".

I suggest we don't need it, so we should change the environment to be

#define CONFIG_BOOTCOMMAND "bootm 20080000"

Cheers,

Joel

>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  include/configs/ast-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> index 89b0cd8533..fbae281811 100644
> --- a/include/configs/ast-common.h
> +++ b/include/configs/ast-common.h
> @@ -110,7 +110,7 @@
>
>  #define CONFIG_BOOTCOMMAND     \
>         "fdt addr 20080000; " \
> -       "if fdt get value ramdisk_conf /configurations/conf@1 ramdisk; then " \
> +       "if fdt get value ramdisk_conf /configurations/conf ramdisk; then " \
>         "    bootm 20080000; else bootm 20080000 20300000; " \
>         "fi"
>  #define CONFIG_ENV_OVERWRITE
> --
> 2.14.3
