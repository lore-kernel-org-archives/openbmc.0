Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKH9W0JrbzDqHC
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 12:17:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fJErnJFo"; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id 23so1634255vkc.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 17:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hCmi+PfU6obKgc7GSo2wj4Uc8rrqcGgXX1nWugmULbI=;
 b=fJErnJFo/zfMpdCyPRAWQLrAHOiyrMKKG0F+VxyRjPqJODTpCF5R8r7T9RqQet8RzB
 bTk47cuZlJ0+0D7zLD/vJttqzJZhQJpH4B6/cMvBa8YEYp+PKd+/5hmL3Gy/5KXaRdih
 rwTb8QKXTZt5zmF/olSTCuVYQ6nIP0mgeq4SRH/5Qac4/Nj36UEtVhNMds2XGLGo7zI+
 kehiqiIrEo/0Q2INtAYrrDsZ4dhYOEoiRBGSQ2OJvuPhf/u79Kw6SoU1IXqnTFMTx11O
 WXUaP56MynAh/OsNiRtseVX1/pLvpSOfpbZQt/ms0Jx0QIgl+sF6275krASZpVqgVgMV
 VvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hCmi+PfU6obKgc7GSo2wj4Uc8rrqcGgXX1nWugmULbI=;
 b=i3hAZmXDyHkhmSO+mngHfbRgcGgHaa8CFXjSlHJH2fDVHkOhDQRAsTC0Z9OVg5g8Tf
 XASht2xAwsMpiPQ/9a+SH/o1n2+3zXFFOzkdOF/p9hI9h2L0um7Q2EsI7rVcX1qrweSE
 K7cETPtNphlwx11/dltbcqaHOm79J6OI7nLvP6L1VYGlYroaOtPaswCGlSbFO9oP/1Eh
 i4WpyN2zVJtqjRB+3at3Y5A0TGrynzmmfeQ+x8hYnkd9qyo2qgochrV/snkqFttAZa+8
 gdw2BgXNeVXAQXgysgKUQEQO2V+GlpDrryii4R1rhcrKye9QL0OF7hCp9pb+X5dW4cug
 dqGg==
X-Gm-Message-State: AMke39mzIzepk9Kfsy7iiO64eCBWeR9Cp0vISzuZ4C8AyF71wSEzkbq7vImY+9ebjWZBMq/RSF5ALMVKT9MKoA==
X-Received: by 10.31.49.81 with SMTP id x78mr3049077vkx.82.1486689436548; Thu,
 09 Feb 2017 17:17:16 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Thu, 9 Feb 2017 17:16:55 -0800 (PST)
In-Reply-To: <1486588411-25211-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486588411-25211-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Feb 2017 11:46:55 +1030
X-Google-Sender-Auth: utC8zKDp1dmBMLuF9FM8XmtuABE
Message-ID: <CACPK8XfoaPOPJASAerAW6gCjCjidmPcKW_wRYgOYq7K-NccO-w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: i2c fix ports
To: eajames <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Fri, 10 Feb 2017 01:17:19 -0000

On Thu, Feb 9, 2017 at 7:43 AM,  <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> missing a couple of ports
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

This depends on "drivers: fsi: i2c fix probing". You should send it as
part of a series so the maintainer (me) knows which order to apply
them in.

Cheers,

Joel

> ---
>  drivers/fsi/i2c/iic-fsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
> index 1723bc3..28d9624 100644
> --- a/drivers/fsi/i2c/iic-fsi.c
> +++ b/drivers/fsi/i2c/iic-fsi.c
> @@ -282,7 +282,7 @@ exit:
>         return 0;
>  }
>
> -#define IIC_FSI_PORTS  0xFFFULL
> +#define IIC_FSI_PORTS  0x7FFFULL
>  /*
>   * Called when an FSI IIC engine is plugged in.
>   * Causes creation of the /dev entry.
> --
> 1.8.3.1
>
