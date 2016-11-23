Return-Path: <sjg@google.com>
Received: from mail-oi0-x22d.google.com (mail-oi0-x22d.google.com
 [IPv6:2607:f8b0:4003:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP72Z3Sj2zDvqg
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 03:24:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fqnyURSQ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="UXJsPAUQ";
 dkim-atps=neutral
Received: by mail-oi0-x22d.google.com with SMTP id b126so20544723oia.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 08:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WMK5nS2+g59wl6vyTGIMPPrg5tsdGsajTaHMSzZ5dK8=;
 b=fqnyURSQq6IKXsPWZJBGnPI7hhn9xFH93CqU85mzyqPgLo+d0Pbfc8gw8aP2csYweA
 CMl66YyoeXGgAAq5vMfgLlneRoGjoCftaD+58f/+fB6aGHQhn4fbQUQckGVqgCyewiSo
 Co42sKF/Mkrg+AGtz5cGo1vnuhxEjYwKD3Ls/Az/2uS9wxqrMRbGAZkjDa25ZK9KATrv
 BCv25cF2NGyoYkAAaRiPXi55utQCzkzhUfl4s0q7U6MZSfsa3uPKuBHTAWYdqrfW5oKT
 xq6hOxLKmCQ4gD5W5td15GZLacfRvNuOcDmTrHlz3L1LwxR11MnGEeGC1Qg9RgFnyYQf
 z2KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WMK5nS2+g59wl6vyTGIMPPrg5tsdGsajTaHMSzZ5dK8=;
 b=UXJsPAUQ9oSJVP3AzrwZK07QnSXK9Vn2a3xiShH48TwRnHmQxG+cq8IBeYsK40FQBP
 oEeHcnoTY72Bn+XXv2NDt6r0BqPa0jE+WGQdHWsvbT6N9sE0QhS0dlsEE8X9rYXR/28v
 WMeT4pQEFNz93ogsVoX4FW1F/mfv+ftEmXcE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WMK5nS2+g59wl6vyTGIMPPrg5tsdGsajTaHMSzZ5dK8=;
 b=UlYPGhCwLaX1r8PZzFJnkBFLWHRbLfwVjq/UuEK/zo8PygXF+8po8FSplGHauAxXUy
 Byvrf1PiELNUf4rGraDunQjXklXzE0KJRcJIy6kj4R+soFvglDjouh+tJbNx8p+JwA3p
 3ciiFPhxJULrcDOK0qc4mRtGj0Lv30cXhlB9qM0UpCbYcnfeZOF1fAFOFYqmeGogbwD5
 ioX35DqZqMFDCvUptKt9/fXg5uW0L7xMEjfbvDEgDnbJqWmRe+YsrMJRyA7aLhHP2RYW
 XZRh9jfPWDe0Putflc7IA/xtglr/HORJOPFDmDbbZEXB3FL85NdU7WOY6o9X9tOokxIN
 YLhQ==
X-Gm-Message-State: AKaTC00h8ztAmLssYaUkQwHTqCG2SdbfSuw/GmFkG0MQIjx+siOxiyEpuI7TvoRbTp3Tjul4EU1akQSqNauR2G7z
X-Received: by 10.202.88.2 with SMTP id m2mr1897137oib.27.1479918260547; Wed,
 23 Nov 2016 08:24:20 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 08:24:00 -0800 (PST)
In-Reply-To: <CAPnjgZ1SUsvOfvdjYtsqxkNoR_0mGMGuvgU_n28rjntr3QAcNA@mail.gmail.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479858976-139210-3-git-send-email-maxims@google.com>
 <CAPnjgZ1SUsvOfvdjYtsqxkNoR_0mGMGuvgU_n28rjntr3QAcNA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 09:24:00 -0700
X-Google-Sender-Auth: 8SSid0UJNyRd_6BADLnn0z_C0Ks
Message-ID: <CAPnjgZ2J3-OhFYa+oK-5D79hrq=4zBynQAF7fER5fu02=YDcPQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 2/5] aspeed: Fixed incosistency in some SCU
 registers naming.
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 23 Nov 2016 16:24:23 -0000

[resend from correct address]

On 23 November 2016 at 09:13, Simon Glass <sjg@google.com> wrote:
> Hi Maxim,
>
> On 22 November 2016 at 16:56,  <maxims@google.com> wrote:
>> From: Maxim Sloyko <maxims@google.com>
>>
>> Basically fixed FUC/FUN typo that went out of hand.
>>
>> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> This looks like a mix of whiltespace changes and other changes? If so,
> can you split it into two patches?
>
>> ---
>>  arch/arm/include/asm/arch-aspeed/regs-scu.h | 73 ++++++++++++++++-------------
>>  arch/arm/mach-aspeed/ast-scu.c              |  2 +-
>>  2 files changed, 42 insertions(+), 33 deletions(-)
>>
>
> Regards,
> Simon
