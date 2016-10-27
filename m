Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4DJc4GpJzDt3Q
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 15:22:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=eVtqYxNC; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id i127so2521433oia.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 21:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=718no4mwvxvWOYFlWT5HYurM/wEtRb7iCVzkh3wd/1Y=;
 b=eVtqYxNCDbgGEFZWZVsbTO8yylf7zt4d7PrDMm1U0Py2iW8ttN6MFXjK873ewNgZSb
 H475kA7uX2gnQ/tcUojd/TzEC0KgHp3zH7JxzZ9fISRGx/mf7DHhrXA5JokpX8vix7VC
 Nsm38kJ5R+kbeKVMRyznNvTVfmwHhkzIRTYGQj+9Mmm9oJ/xgcoXQFbmvsJBKBp54pgm
 Hx7O+dF5n5u0v3IgEo0KPimoXN6OIob+2E0orkbLv38FF3nXWlaMJhjX+4LoT9Gi9vLf
 LH98uVcBlgoPGzAYTg5FNBaYbuB4AkDQLFnSQ4ksZHHgGvlyG1RdtJkwwRiRUmsrQc6j
 by/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=718no4mwvxvWOYFlWT5HYurM/wEtRb7iCVzkh3wd/1Y=;
 b=gui91y5eZmNJ1aoLSMWXMmDfkj8Fxp/SN1t/3d4Qm08z7pu6/IRkArVVy9rB1Rsv2b
 Avb5jczHqNRpDRQmZcFW5CDYAY2bAb1YfKijX96ecaw2IvXfSakSvhJF7QegZ0bdwftS
 w15PcRH4VaeDT4pfwXM0Fyiz6f80JOe3hHwYD1hmAUPS/EU20Am+f5C+JfuFJqCEOtu6
 vkagKOx7Oi1l8mLxwyIL5pTGvKzt8m68hGHRRy+BHhndJ/KOoI/cvEH8jqdBPDwn691e
 nAoFOdmrty/GO3uSuOHTCzVU3A7YDoD/ulJcqhvAmmrNv76CCVd7nbSTFYm3oOZ9iNyS
 E3Hw==
X-Gm-Message-State: ABUngveG6UbaXo7WLhJFrd8ecerAMVh7kvtmIFlByJDDxn4bHw8vaziC72+T6L+rUUlZ1n2isZToZfZKWsG0yw==
X-Received: by 10.202.81.204 with SMTP id f195mr5356215oib.137.1477542174861; 
 Wed, 26 Oct 2016 21:22:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 26 Oct 2016 21:22:34 -0700 (PDT)
In-Reply-To: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Oct 2016 14:52:34 +1030
X-Google-Sender-Auth: CQLezUi-H1nDz_veAjAjZvDBH8U
Message-ID: <CACPK8XdUpYOF_jgRhzwvUp=P7eemgYYgY7UJW-2TOP+YJnRUHg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add QEMU support for the Epson rx8900 RTC
To: alastair@au1.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, clg@koad.org, 
 "Alastair D'Silva" <alastair@d-silva.org>
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
X-List-Received-Date: Thu, 27 Oct 2016 04:22:57 -0000

Hi Alastair,

On Thu, Oct 27, 2016 at 12:57 PM,  <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> This series adds preliminary support for the Epson rx8900 RTC.
>
> Setting and retrieving time is supported, and the chip temperature
> is hardcoded.

I commented in the patch about setting the temperature with a property
so we can adjust it at runtime with the monitor.

> Other features (in particular, those that require the interrupt line)
> are not implmented.

Do you intend to implement these features?

Cheers,

Joel

>
> Alastair D'Silva (3):
>   Add Epson RX8900 RTC support
>   Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32
>   Add a unit test for RX8900 RTC (time functionality only)
>
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/aspeed.c                 |   4 +
>  hw/arm/imx25_pdk.c              |   9 +-
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/rx8900.c               | 426 ++++++++++++++++++++++++++++++++++++++++
>  tests/Makefile.include          |   2 +
>  tests/rx8900-test.c             |  82 ++++++++
>  7 files changed, 521 insertions(+), 4 deletions(-)
>  create mode 100644 hw/timer/rx8900.c
>  create mode 100644 tests/rx8900-test.c
>
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
