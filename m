Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDW945zCzzDr4d
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 10:59:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PwlFjn6E; 
 dkim-atps=neutral
Received: by mail-ua0-x22d.google.com with SMTP id n59so149700989uan.2
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 17:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jCurbMoisPPTVVrF+jHptNpuaarNbWe59BHumpk2oAk=;
 b=PwlFjn6EGP/td4pzHjNe5ltQQMYVB4Zv5sX++rr+YCgK2qr8Nib9uR+Y55m16HvrjP
 05S7LUU/a8xeMO9Q/O072KJzPnmqJiME/r0jea6GJrNkOiGx0fK5vudOJClkPI/LcEBC
 aI+Qe6sYajeuUVihhh7jyslfDiHUYCfBUCYIQdJpD3RodFCtMOyAT6JWc/WuN9G3YBzk
 QjVmsZ61Ky2knuwz90UYVUTi8XZN4kVvZoJRhqXMn4vkG4Gpa1f/a8Hr5xIVcgRTAy/m
 zHOXrS6KNCzzB9KEcPGSqBRdMXZrrtjosbioMUfz0M2L+bTBsVKV1aM0yMoDaIt/G6aZ
 QPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jCurbMoisPPTVVrF+jHptNpuaarNbWe59BHumpk2oAk=;
 b=SpxFhW9tGs/O62+d1bQu445iEnK+O13Zg6HiwjuVwpLnFje6IFfuEa51AEqAypvuIh
 CPmDLp2ag0W7ON88p4yBIYmtCv4X/HCuZgV0A0dng+vEHJJ6PoNJqfIOpEkFVSSSQ6kU
 PGKfJ3k2BJnGtKqqsdaODYpVUIkEKwOEjt+G62Viz/o43bDIpeszY3/TScDJsE2mL/O0
 3M2tngv00pyGKi/ddi6sWUQWb0vRriUgzch5JIfXkBiq/xfaWe25/o+NiUdD0sH02kvu
 nAYchqA2L4Egim+dcpMynkANkts98OEEn7HtyeJs+aY49cKmPISeSx0hwEsNnSSX1hn8
 yDwA==
X-Gm-Message-State: AEkoouvNSua+shrP6Qiz7a8JBjai5gFsT87HGGZ8UhAqPFCuorwhdnTeDDcFPQCAlMKhUYWyQ0fG+BFLskZWQw==
X-Received: by 10.159.35.47 with SMTP id 44mr5836544uae.38.1471395590461; Tue,
 16 Aug 2016 17:59:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 16 Aug 2016 17:59:30 -0700 (PDT)
In-Reply-To: <279731470914875@webcorp01g.yandex-team.ru>
References: <279731470914875@webcorp01g.yandex-team.ru>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Aug 2016 10:59:30 +1000
X-Google-Sender-Auth: xr_K2TN8ulIA46I9_biWXZGneAM
Message-ID: <CACPK8Xci7hVRkDJntJZJE2_eu1Jth+73pZE6NaONgK44BcUOCw@mail.gmail.com>
Subject: Re: Platform setup via DTS
To: "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 17 Aug 2016 00:59:53 -0000

Hey Anton,

On Thu, Aug 11, 2016 at 9:27 PM, Anton D. Kachalov <mouse@yandex-team.ru> wrote:
> I would like to start a little discussion around board setup process in arch/arm/mach-aspeed/aspeed.c.
> For most cases this process is "flat": just modifying regs one-by-one. Sometimes with applying mask.
> I have an idea to add an array of "instructions" to the Device Tree in the following manner
> (I hope dtc's preprocess via cpp resolve ORed macro in the correct way):

I agree that we need to remove the board file.

However, we will not be able to get changes upstream that use the
device tree as a scripting language :)

I think the solution is to write a driver for the different parts of
the system we require. Andrew J has done that for the multi-function
pin control registers in the SCU. I've got a work in progress driver
for the clock related registers. Next up would be a driver for the LPC
register space to properly configure that.

Cheers,

Joel

>
> ==========
> #include <dt-bindings/soc/aspeed.h>
>
> / {
>     model = "Our HW";
>     compatible = "aspeed,ast2400";
>     board-setup = <WR, AST_BASE_LPC | 0x9c, 0x02010023, 0>,
>                            <WR, AST_BASE_SCU, SCU_PASSWORD, 0>,
>                            <WR, AST_BASE_SCU | 0x80, 0xcb000000, 0>,
>                            ...
>                             /* write(read() | 0x1000) */
>                            <OR, AST_BASE_SCU | 0x2c, 0x00001000, 0>,
>
>                            /* write((read() &~ 0x2000) | 0x1000) */
>                            <OR, AST_BASE_SCU | 0x2c, 0x00001000, 0x2000>;
> ==========
>
> or in less talkative way:
>
> ==========
>                             /* write((read() &~ 0) | 0xcb000000) */
>                            <AST_BASE_SCU | 0x80, 0xcb000000, 0>,
>                            ...
>                             /* write((read() &~ 0x1000) | 0x1000) */
>                            <AST_BASE_SCU | 0x2c, 0x00001000, 0x1000>,
> ==========
>
> to completely eliminate board-specific init functions.
>
>
> --
> Anton D. Kachalov
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
