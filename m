Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tHr4t3YXMzDvhN
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 12:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="shnAVzEG"; 
 dkim-atps=neutral
Received: by mail-it0-x22c.google.com with SMTP id c20so118992468itb.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 17:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=A7CtR+zecvXZSesHTZMf+Jy1dfV18TGDTB/wAt1Ed8I=;
 b=shnAVzEGjoGtegLWmYKB5cOK9xE/ejzlShQjx3U/4bABT5+StuTJBVhlw0ZjlDiKyL
 PST2+u5HfF4sZiY348NIuoF6bA0Za2huPC2LuYBJqgC7j7fj7D34zTI6AONdE/fiH++n
 xKGGqloHK/vywgqESC6Uqmqque6DGMk87opbD1ZnSTivwgD0q/vQwpblVNYz1JR24z97
 XCzeEpRBIVxzbLfmL4Z73ocTjlktAx0oL4mVgD6BAgPD4X/lTzSM3vUT9MsktAvcwS22
 cL41XwgdUL5kvX94VQcL/7vT9dq0LZqA15DeFJKV7hfP8qXdNH1DAZ5MfFzOxah9+d8C
 bEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=A7CtR+zecvXZSesHTZMf+Jy1dfV18TGDTB/wAt1Ed8I=;
 b=bikhWyEyANurF9krhR+xi/XogLVPrzW2ZtpXr0NcCBmd/8x9dX8W/dpZbD+kSpyuRo
 eKdqdMv/U7Ad5RH5fKaaNf9huIG+QanoUSF1MKkhKRj8kPEFjDYGHrRYNRP6tNTLUQxq
 yv71BFffqrYln29mnbZe9SMesJAPZMWSCfwrPi2hY/HkFEu6mK/jW9AtpgWrag79Yu2A
 AHRf+X3E8JH71d1KZXpfsaWxA59oesw7CixFL0b/XdWNimcZKlwzkZXuczwU7mfmqIK6
 soRREu0dmgAWMNoUAQnbJFBhNUOyevPuGsUO8/AzMP25eLgoIqJAcgqH/sK3EFoIvcZy
 0qWg==
X-Gm-Message-State: ABUngveQGQXPFZu+dHoJ/IMTYrr6Axw5HV+Nw9g5KquwGi6Qi5CRN71CfltSN0UgteSEZx25Sx0L6gqeG5tEtg==
X-Received: by 10.157.63.199 with SMTP id i7mr7859644ote.63.1479174779122;
 Mon, 14 Nov 2016 17:52:59 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Mon, 14 Nov 2016 17:52:38 -0800 (PST)
In-Reply-To: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
References: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Nov 2016 12:22:38 +1030
X-Google-Sender-Auth: qKpH8AcuCbC1d-IcVCHgA2KonOQ
Message-ID: <CACPK8XcAvZbH5ZwTPjs-+jvEyG+JdMce41P6h=WFK_ue7DbqAg@mail.gmail.com>
Subject: Re: Refactoring skeleton flash control
To: Abhishek Pandit <abhishekpandit@google.com>, Cyril Bur <cyrilbur@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Tue, 15 Nov 2016 01:53:03 -0000

Hello Abhishek,

On Tue, Nov 15, 2016 at 5:39 AM, Abhishek Pandit
<abhishekpandit@google.com> wrote:
> Hey Adriana,
>
> I'm planning on refactoring the skeleton flash update code and pulling it
> out into it's own repo (openbmc/phosphor-flash-control).
>
> I've started with how I think the dbus interface should behave:
> https://gerrit.openbmc-project.xyz/#/c/1166/.

Great!

I've added to cc Ben and Cyril. They are working on smarter ways to
share access to the PNOR between the Host and the BMC. Your work with
the BMC flash is not affected by what they are doing, there is some
overlap where the PNOR is concerned.

They have a prototype for a system that will own access to the host
flash (aka the  PNOR). Your daemon may end up implementing the
features they describe, or talking to another daemon that manages the
PNOR.

> The overall plan for the flash interface in my head:
>
> REST (or some other) interface receives image + signature to update flash
>
> Gets saved to filesystem and flash control is called

I imagine you mean the tmpfs (which is backed by SDRAM).

> Flash control loads the files into memory and verifies the signature
>
> Reference implementation would probably just be pgp

Have you had input from security/cryptography people for what to do here?

> Flash control locks the flash device
>
> This needs some more thought and probably new dbus interfaces; important for
> host flash
>
> Image written to flash
> Lock on flash device released
> Signal asserted (Done)
>
> ---
>
> For the most part, I don't think I'll rewrite too much of the existing
> skeleton code except to have it use the c++ bindings (continue using
> libflash and existing MTD devices for bmc update).

Consider dropping the libflash dependency. Where we're only dealing
with mtd devices, the libflash code essentially becomes an
implementation of 'flashcp'.

> Locking the host flash would require some additional thought since currently
> it's accessible directly and a mailbox approach would also require some way
> to lock the flash when doing read/write.

Yep. See my comments above.

Cheers,

Joel

>
> --
>
> Please take a look at the gerrit. I'll start adding some more information
> around locking + signing this week.
>
> Abhishek
>
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
