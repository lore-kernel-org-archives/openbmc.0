Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22b; helo=mail-qt0-x22b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RGRqpG0j"; 
 dkim-atps=neutral
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcydz2TyPzDqYV
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 12:48:54 +1100 (AEDT)
Received: by mail-qt0-x22b.google.com with SMTP id s27so8760963qts.4
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 17:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uCeBfnvB/JqdpvbJNt616JP1TYa/BGzyiS1qk7nquG8=;
 b=RGRqpG0jUsALwR69vq1hVmwm4xrwsnrLG9F8AiO8nBILQ458uvj/KsM5M5mfB7U1gl
 LNq54dHxrwn0NRpRLvEVT0QpPo/LNlyxps31nXXnsMckQT547/W4zPcNz3uX7wWTSrCJ
 dOvH0EZKOk1jLJ+JxduCdebIURSNaAtofpXl9FntrCwKNKv071W8xDtBmEHRrY5VTjPK
 W4F3P43GK55/b6A81pfL/5nsvvtgBwPkTcPlat3SMOOV2zluRiWMrfRa6ZX+hQp5CN2M
 JQ2jV4DFfUy3DVAzYbitScXNtPBzv9u0KYwOfLkRZtiq2m9iOor9FX2XNGzdKMLY0HPt
 eXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uCeBfnvB/JqdpvbJNt616JP1TYa/BGzyiS1qk7nquG8=;
 b=D3fauuHc7/JN9Q4PzRqC+ToYWVK8sh6m/o74vdG+6/CZLQU5ZACLqtgd3sGLgldPSQ
 IO2A1iGbL3V+nUdrWQ+hPqk5lzItB7I9ezdrb+llfGGXv/tTSrgIfB6x1HHRTsW1MN3g
 yTcS4GIjWqI0N6BaW1+86nsyJW5Coelm/eV3D61JCIwCgiC6z2IlvXJgpufNgW4B25nP
 q03asriw3v58/wz3188kcH8TgQ6YaAhgJPcGUiRlT92irVllWMhr+olNOPDdKThb2ULO
 KwKhcFd7luqNZrPlY/5CzqOMoGm36SmRtIvibbIgYOjNzyKIwl6h/G/fCVW27Av/OD9L
 xgQA==
X-Gm-Message-State: APf1xPAM+S13/wCp11nJjdzg//tbdq47xU7RNe0yS0JgRRHCJ33wOqyh
 9curYTLcP/0uOLBLOBjqy+tgHrz5cKpXmNzuzAY=
X-Google-Smtp-Source: AH8x227O+4MQJZfzpB+HxGOC/gZH6AisST1lzjNH1mhj9kzf9wbYTrfOZWCDeBJajaD/WaMo3B3yPRdcsvBpFalL+vY=
X-Received: by 10.237.38.37 with SMTP id z34mr2139546qtc.178.1518140932595;
 Thu, 08 Feb 2018 17:48:52 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.81 with HTTP; Thu, 8 Feb 2018 17:48:32 -0800 (PST)
In-Reply-To: <1518076351.14456.8.camel@aj.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
 <20180208053745.31254-4-joel@jms.id.au>
 <1518076351.14456.8.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Feb 2018 12:18:32 +1030
X-Google-Sender-Auth: r3ivtsT4SdmsJUALiti9yedNiDo
Message-ID: <CACPK8Xdn-8OTMhucBFXz0CRWi+72-2ZjOnjRWDuHYEWxD-qk5g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 3/3] soc: aspeed-lpc-ctrl: Enable FWH cycles
To: Andrew Jeffery <andrew@aj.id.au>, Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Fri, 09 Feb 2018 01:48:56 -0000

On Thu, Feb 8, 2018 at 6:22 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2018-02-08 at 16:07 +1030, Joel Stanley wrote:
>>
>> +#define HICR5 0x0
>> +#define HICR5_ENL2H  BIT(8)
>
> Shouldn't we be setting this at the same time as HICR5_ENFWH below?

In our testing we didn't require it.

Lei, can you double check that the patch works from a power cycle
without setting bit 8 in 0x1e789080?

Cheers,

Joel
