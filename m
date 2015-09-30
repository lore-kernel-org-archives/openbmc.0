Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5E1DA1A002B
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2015 10:48:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=a2WVuSpG; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=gQxW8I//; 
 dkim-atps=neutral
Received: by oiww128 with SMTP id w128so13916275oiw.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2015 17:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=YRExDD9aKpdAnL4QLUg6BiSWttHuZ9y8JTjrZ81kbGk=;
 b=a2WVuSpGQS607W+qWu/v0W5Jh+pxdxhyVnAyXZdJVOhBKNSWzjrcyOmHRgEaT/auuR
 SCyC54grKWdyKTSt33GaXSoAvq0hR3YgXGkdGleFAz2IUyzPBsfAq4gxY9tZ2VQXosIw
 Y42VR0jM0kAiR4/zENANwoYVJBLF+CjLF2D3koszYev8igRYAtFXsaeXvoCYXz2/0t3l
 lPDB0BpTa1iCiaMRwxf1OFeD2C0r2QrZ7xpFZAPRECquqLje5bOLzjD7vMPJSRjOMzFF
 WVaRNYq1uUQih7lGWsrFybyi4smseyfKNGPziwK4bG4mS4RtviZjrv1QcfoyyXT/ug8j
 V9eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=YRExDD9aKpdAnL4QLUg6BiSWttHuZ9y8JTjrZ81kbGk=;
 b=gQxW8I//50+YBGo5FTmq1ouU9MP2fQLGV/x2PN0PDqp9cX9G9X/Y2iFHjV8UvQ1R2c
 JWPCiiwrF13IByJiisyTxDAVyTdEcpFX+N4J+XpkNImqYy4homQ0kDNXjiTo+7MkrwON
 bberDM9ML4+1xXpkBlXlCzzgYqRuT0fDCK1UU=
X-Received: by 10.202.72.20 with SMTP id v20mr517281oia.125.1443574099177;
 Tue, 29 Sep 2015 17:48:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Tue, 29 Sep 2015 17:47:59 -0700 (PDT)
In-Reply-To: <20150929143413.GE14293@asimov.ibm.com>
References: <20150929143413.GE14293@asimov.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Sep 2015 10:17:59 +0930
X-Google-Sender-Auth: pFcxBJcBKsUNNpn0jhAKHduU-go
Message-ID: <CACPK8XeHTP4gUa=P3hdeo-uCU6_O+3SJg8qnwadfn=+GH3h5WA@mail.gmail.com>
Subject: Re: EEPROM driver
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Sep 2015 00:48:21 -0000

Hey Patrick,

On Wed, Sep 30, 2015 at 12:04 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> The EEPROM connected to the BMC is an AT24C256.  This is already
> supported by a kernel driver: drivers/misc/eeprom/at24.c.  It is enabled
> with EEPROM_AT24.
>
> If we have enabled this driver correctly and probe the i2c bus then
> there will be an entry in /sys/bus/i2c/devices/ with a file containing
> the EEPROM data.  This file can then be passed to our IPMI FRU parser
> and then updated in the appropriate fru-manager DBus object.

IIRC it lives on i2c1 - the second bus. We should be able to add it to
the device tree and have the kernel load the driver at boot; this is
working for the rtc device that sits on i2c0.

However, I'm currently hunting down an interrupt issue with the i2c
bus driver when we enable anything more than the first bus. I'll let
you know when we have that working.

Cheers,

Joel

> [1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/misc-devices/eeprom
> [2] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/misc/eeprom/at24.c
