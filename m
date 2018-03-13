Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YHx1SuE8"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BfPD1ZLU"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400lDb3FHnzDrLQ
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 17:23:58 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id s9so1555067qke.12
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 23:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Fzv2mxfkn/7WFMvBAP53n6Z2oSXstdgxePyJOBgjt+A=;
 b=YHx1SuE8XIJplnldoNU6EM/2sUInxuzwhkbTjbv82F9MJgJ78Xv0MbGizlXUJK16CO
 a0wdJErd0h/PNr9YYl7C3GjtHDOh66ouZPRfmBOhVx71Q0k8zVGDl/UGStP+EX4R/TEc
 X+lMzXQPdSpEr6Rx5xKxbwEQHRZZGUPI+KPrloJ/qaPsfmmL7JK4dJ8qF0SNEent/u9e
 NsMgoV1HuXo+ju4kGiSCATD6G7xTIGkx2wCZCDWqnMl5/uxFjDxoVcvMc4248m7KLetF
 XcH3ZE9NTwmgDgIS1ETZSb9yALT8AoIL6I3lfCeQ9sMVTCh2O3EU95WlT92BDd0yLd0V
 3OiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Fzv2mxfkn/7WFMvBAP53n6Z2oSXstdgxePyJOBgjt+A=;
 b=BfPD1ZLUqIUpcCwhBR1nm4MOs7IdTZObMIx3nkgmxqjST7JxC2VoOMwBtNSozyD1ir
 U1BOEEb9qvOfxDl+MmDvYt/J6ITaSEifQ1VaHtFSBXKIfwYhC+3g2KF7tyS6mmStWdqE
 LoVp0AuIdeivlzU+08sb8+Nb7MHaBZKjvFnzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Fzv2mxfkn/7WFMvBAP53n6Z2oSXstdgxePyJOBgjt+A=;
 b=MAbfCnfc8gVGePAauiNqLap49ygKh035m0wga5hvb3TvZrDxaf8pW1W+z/A5VCR6YF
 CnH4PsoHzvLu1dKUUMiPjt1EQj19KwO0r/YAS613/q+Q4l3xex7q0vlve4B4TYlZi6y/
 MZGYs7XGvCzb/+N1HM14vXPnobCNL0FA8nK3CZNFsGHvjICm4mi8XG2eV2cggnYYU2tZ
 QptLZflOTMbkkwGTK/VMxGsia0jEbq0WWh5t+xJr6vqo6MRmGFjY83Oyd4Aj29QyXlPj
 YAPQTZwJIKPG7kF3VKQC/foZ7IW9O8hN6+x+XdSyJXykJxIDIYW3FlYvVdXVRdw5pdhm
 qPWQ==
X-Gm-Message-State: AElRT7GqcxPsK8fDsq7dRM2Ab9TwiGjnXie7wFupC25peMsmQaAA2tY4
 cmlrJFq69J6lipf9VzGc6xQNL9jF9Uc1YPtaqEE=
X-Google-Smtp-Source: AG47ELvgwsgCedUkz9DLE5U/Q3L27Vczbkb/SidklijqFKk4FGEZUAg6H4sdHLqS4in72TzmyRa7W7LTjHWxaYhGOg4=
X-Received: by 10.55.246.26 with SMTP id y26mr4313219qkj.127.1520922236272;
 Mon, 12 Mar 2018 23:23:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Mar 2018 23:23:35 -0700 (PDT)
In-Reply-To: <1520632980-26812-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520632980-26812-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Mar 2018 16:53:35 +1030
X-Google-Sender-Auth: JUnXpiWx8vSdF-MCr37x6lk-80c
Message-ID: <CACPK8Xep=uvO=7og_mkEc3s71Aznd-D+4KgyQ+KROfNTOax21Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 0/3] aspeed: watchdog: fix reset, read
 alt-boot, and set alt-boot for witherspoon
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 13 Mar 2018 06:24:00 -0000

On Sat, Mar 10, 2018 at 8:32 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> This series provides a fix to correctly set the reset mode of the control
> register. Previously, configuring anything other than a full chip reset would
> not reset anything when the watchdog timer expires. The series also provides a
> patch to read in the existing aspeed,alt-boot boolean option from the
> device-tree and set the appropriate bit in the control register.
>
> Finally, set the alt-boot option for witherspoon to enable "brick protection".
>
> Eddie James (1):
>   ARM: dts: aspeed: witherspoon: set alternate boot
>
> Milton Miller (2):
>   watchdog: aspeed: Fix translation of reset mode to ctrl register
>   watchdog: aspeed: Allow configuring for alternate boot

I've merged these three into the openbmc tree. If we decide to change
the way it works upstream with respect to restarting the system we can
backport that change.

Cheers,

Joel


>
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  4 ++++
>  drivers/watchdog/aspeed_wdt.c                    | 12 +++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> --
> 1.8.3.1
>
