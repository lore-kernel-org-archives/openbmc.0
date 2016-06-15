Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x244.google.com (mail-qg0-x244.google.com
 [IPv6:2607:f8b0:400d:c04::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTsvy46VyzDqh8
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 13:49:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GXe40AtO; 
 dkim-atps=neutral
Received: by mail-qg0-x244.google.com with SMTP id 78so779839qgt.3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 20:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=BZaZKv2yYk/4tQTcWBv/D+iCyF2qveo/KceiBCxSQio=;
 b=GXe40AtOoRorQKJDE7nVecN3y6BSKvND6Cwt4uQS949h7xGnEnIkqTDz+UaLmooaiO
 7Lg25MQC3RKXmfXlP0B19KZ/fF35y/zCokcRPYwmAcv6B3JOpHxMUxssZkkLemxOo+26
 TyaThOAXQbrGJYT61UIjNnGJPhfy/8cSJnnZP1kBkFCVcE0SFHfPdjPgam0iNaMSDz3G
 MJf54aizG5UYKci82Xsw+50CiLe4xSodoTdJMA/2UBYLSWwcvhKgsr+eoA8Qjaa4TqEN
 GdX/xNQ9/MX5F+JHS4/pqlYW9K2U9d5CzuFoUVFQzIu4BCom5nCz3QrYyfEi8iEnZgDM
 R5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=BZaZKv2yYk/4tQTcWBv/D+iCyF2qveo/KceiBCxSQio=;
 b=Fsm1YXZOlgg1nZkLmJ/sNP5/Jktl4qrTyxYpZ8tAP52QpkxwMjohpYIuFEkrcOPPQX
 5fQvVF/bPlIHMLaBG3aC9H0/EueZOOXKtQM7dq7mKUdHAtCtWttQ4YWeKIZYWFNDVp1b
 pW0j5Nd0e6YyKyQBKmWmsYERndomarfNSQxqha1V0+qSXkkpWyIX46wtjVZy6jW0KYxB
 1XUz7T2Z8ioC5Ce66pKnY+ewIqi1MOpuZ++qCKNqnSlkLcikfmt8BhqpMTSXXKEX0YFo
 W5ulZ/raBR33URFGsts1tO+x/F9DEqDzi6m+X1NxjKK3lsaR9WadezVZRYNti2wP4KPm
 HKRQ==
X-Gm-Message-State: ALyK8tKhEYjiqwUrlq9uPuwITrXWtIoHQJNI0TDYql1Wo0JssXNuYzn840tsc1pZHXloeRh9QqIDjDiByV5rwA==
X-Received: by 10.140.228.134 with SMTP id y128mr23632519qhb.81.1465962571977; 
 Tue, 14 Jun 2016 20:49:31 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Tue, 14 Jun 2016 20:49:12 -0700 (PDT)
In-Reply-To: <1465932059-5531-1-git-send-email-raltherr@google.com>
References: <1465932059-5531-1-git-send-email-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Jun 2016 13:49:12 +1000
X-Google-Sender-Auth: QDjN20IPQSVeo39XW0_Wa7-58rU
Message-ID: <CACPK8Xfe+pVLwniWd9Nm3pemfrnVTZpS1twttN-aUGjQdPG-aA@mail.gmail.com>
Subject: Re: [PATCH] aspeed/ast-g5: Simplify default bootargs
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 03:49:35 -0000

On Wed, Jun 15, 2016 at 5:20 AM, Rick Altherr <raltherr@google.com> wrote:
> From: Xo Wang <xow@google.com>
>
> New arguments set default console for DEBUG_UART on the EVB and allow
> the kernel to choose init path, root/overlay, and memory size.
>
> Change-Id: I919f7e4027968ad000c4283f8bd80cca1b17e2eb

I normally ask submissions to not include links to internal bugzillas
when submitting patches. Do you think that's a reasonable rule for
gerrit tags as well?

> Signed-off-by: Xo Wang <xow@google.com>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  include/configs/ast-g5.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h
> index 6c05e6d..149cac8 100644
> --- a/include/configs/ast-g5.h
> +++ b/include/configs/ast-g5.h
> @@ -139,7 +139,7 @@
>
>  #define CONFIG_SYS_LOAD_ADDR           0x83000000      /* default load address */
>
> -#define CONFIG_BOOTARGS                "console=ttyS0,115200n8 ramdisk_size=16384 root=/dev/ram rw init=/linuxrc mem=80M"
> +#define CONFIG_BOOTARGS                "console=ttyS4,115200 earlyprintk"

The change looks good.

As you mentioned on IRC, we should create an ast2500-evb configuration
in the future.

Cheers,

Joel
