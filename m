Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SDmD/GT+"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgTN35dVVzF0Sy
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 15:00:35 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id u6so2190868qtg.13
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 20:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=buA4It+CegLvyanXlLt7t9bzwB2KLo7b0o0yqaRcV3w=;
 b=SDmD/GT+a69gHK/HAGXLzkIOglNuqsNrWljZgcZwmS6mKcUY/mLMdIr25Uj1jo8cKV
 vviERVp+jEoBIKNb2jbajfA6WjW46QRhD8EgcwIFgrfQy/SN2q8r7z4BzofklIst3AJW
 yN0fZzoKqpaq1wL1nkfg19vqlT6Q/14ZV4gl7rcunkTw7ZKv8eBL6vuZurBWK5niC9qz
 NWtoIMFyhuATQf6BXE1ow01foCZuxx3C0EK7K7HtU5Vu0LQCVlkAJLs7JhFk750WbrJ3
 T1deXiL6ZQBky3QP7l34Vmy+pI0ATALDMepJqS77o+5i0UUXMeigXg7iNbNSiMaxiQL8
 yDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=buA4It+CegLvyanXlLt7t9bzwB2KLo7b0o0yqaRcV3w=;
 b=cXVKZI+nJrS0J8iBaGLDdCzpWnZs7zqxsLtqlTUHvKPliQdfd81AN+V0XnJxGzNXRx
 +09+kMp8rPfbgEoIu2NZlHqW02YeUFwMBNbHlP8oUCWnhtmNnErHLxVoP+Hkl9zwU/yb
 bcvoiOyPu0YRBqWpsLKGJo3gldAegY7I1X/pyBR6x7lnkpWLqAmj3kGBa3gLpckYvftj
 mV56LIyQOYn1nvb3l2sJ3vUWkmlDumnoTzH4Q/1e6N4kQx02/+0+ap4YB6ShHutZwysu
 /FxVrnU4AQxuHRDnmAI1aOecmqiHLsINDHQt5GfxZHYRpYna/2yYI9THXrq6Lu9DxFPI
 +I3Q==
X-Gm-Message-State: APf1xPBmLCAHBVJHOXQetEJnL39XTKKNH5JiljX6RHUBHEnscEGimrpg
 PuEjPyM9ftpd2qLZ2K3iTyH7T7sbRA3o0c5n4oekgXi+LQE=
X-Google-Smtp-Source: AH8x225xeoOF3J2wEP2YIPwqBJ6XqeJs4bTprlt8aJEO18YW/fErxbo44EqdtqW8lUglhM1Qao1vqzEvzUkcW7YUaqM=
X-Received: by 10.237.50.163 with SMTP id z32mr22248662qtd.249.1518494433594; 
 Mon, 12 Feb 2018 20:00:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Feb 2018 20:00:13 -0800 (PST)
In-Reply-To: <20171127230108.11935-1-rlippert@google.com>
References: <20171127230108.11935-1-rlippert@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Feb 2018 14:30:13 +1030
X-Google-Sender-Auth: dqtbRvzgxPJCBPzqzlAm-Dvl1kI
Message-ID: <CACPK8XdQS1N5PTRWMdYpHwDXViu2Qk8UNu98MDj8T_d4OUyY0Q@mail.gmail.com>
Subject: Re: [PATCH u-boot] aspeed/flash: fix buffersize of MX6651235F flash
 chip
To: Robert Lippert <roblip@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Maxim Sloyko <maxims@google.com>, Robert Lippert <rlippert@google.com>
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
X-List-Received-Date: Tue, 13 Feb 2018 04:00:36 -0000

On Tue, Nov 28, 2017 at 9:31 AM, Robert Lippert <roblip@gmail.com> wrote:
> The MX66L51235F had a wrong write buffersize of 512 bytes set which
> causes issues when trying to write an environment block >256 bytes
> as the SPI chip only "listens" to the last 256 bytes.
>
> Signed-off-by: Robert Lippert <rlippert@google.com>

Thanks Rob. Sorry for letting this one hang around for so long.

Merged into v2016.07-aspeed-openbmc.

Cheers,

Joel

> ---
>  arch/arm/mach-aspeed/flash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
> index e1e3cf8d7f..907e785d8c 100644
> --- a/arch/arm/mach-aspeed/flash.c
> +++ b/arch/arm/mach-aspeed/flash.c
> @@ -1009,7 +1009,7 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
>                         info->readcmd = 0x0b;
>                         info->dualport = 0;
>                         info->dummybyte = 1;
> -                       info->buffersize = 512;
> +                       info->buffersize = 256;
>                         WriteClk = 50;
>                         EraseClk = 20;
>                         ReadClk  = 50;
> --
> 2.15.0.417.g466bffb3ac-goog
>
