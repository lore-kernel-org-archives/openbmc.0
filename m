Return-Path: <pombredanne@nexb.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=nexb.com
 (client-ip=2a00:1450:400c:c0c::241; helo=mail-wr0-x241.google.com;
 envelope-from=pombredanne@nexb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nexb-com.20150623.gappssmtp.com
 header.i=@nexb-com.20150623.gappssmtp.com header.b="YmPHB7Mu"; 
 dkim-atps=neutral
Received: from mail-wr0-x241.google.com (mail-wr0-x241.google.com
 [IPv6:2a00:1450:400c:c0c::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyMDg4yDKzDrbG
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 05:15:31 +1100 (AEDT)
Received: by mail-wr0-x241.google.com with SMTP id k61so5918673wrc.4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 10:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexb-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ieXdN2orggEjEbV8WS4WgImmMW+WPumF3vtMNqbX3ro=;
 b=YmPHB7Mul8J+1E81CFOytEFvTvyQMTyr/UiGkrfJVF86W1WwnjAga/jBhWD9c0elkR
 zzlGSOYYLrtOS7N+q6YG+8mtz31AfrHwxdhEzVcG0efOod3jG1ZAOVigEAKD8NvPFHf+
 xXYRaXQ/6ZBrQSNwBL9aHMufertaNS1rY9E1oaVMzrdX9bh++TmCyWQVydGmnZApQe+Z
 XVzHBSU1vO8UyeiUFU/rA5gR8ycslzY1PnizJNY5JlBrI6JoFiVc+TnOKab8G5uT8Fjw
 vq0sbaA1hEK41TZfPPQjdpU6MK+ioBswc70jmHcDqdLeSww1zL7kgt/oXZ0bGbUa9qJi
 /aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ieXdN2orggEjEbV8WS4WgImmMW+WPumF3vtMNqbX3ro=;
 b=dsMM5MUP//ckgFLpLlPj6MCF5XfaLHEvBsYoJ63LUhcx0yXmY1JE3EX27NPMQ62PfH
 L0201iHLdwgXN24qsXsUPQzNqPQAJR0hz86rw2HqX5PB+K6fFAGOCLKB7lk8lmJb0yRW
 cLGfzbgii/5cYgVBWCgKZneVlrDy0fR6acPXAXsmy7/BSxBEfO+AMWozfGxFi5K1jD9C
 wi/B0U54XomEpHIKWfM3QRKg8WJcbekRHUfZoeIiZUpAfbFeYIPDJzyJGXsxuozIFUlF
 qjLoHkUfx6uvu26p4AqBiOHWDDIXnpcoYrK2uS2I9msDiFUfkrbT3FgaC31Eia0+ioPd
 rwaw==
X-Gm-Message-State: AKGB3mIRwFcDYXFvmIgoBs6xJT4Q00PZ4C8RN8mwqePPusj3rBtP+0br
 H79fF67cInSbQ6o1WKojd8xB+Ugb9bd8UB+ZELGwuw==
X-Google-Smtp-Source: ACJfBove8krFuBXU1ZAYzYhyFickbxarHOLEqDH/iCQ+HTq+4BoQgZtJc2J+SsihvHcPXzjNuoGK/6udvdDvnC/5JkI=
X-Received: by 10.223.182.19 with SMTP id f19mr6601324wre.81.1513275328476;
 Thu, 14 Dec 2017 10:15:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.157.195 with HTTP; Thu, 14 Dec 2017 10:14:47 -0800 (PST)
In-Reply-To: <1513268971-13518-3-git-send-email-oleksandrs@mellanox.com>
References: <1513268971-13518-1-git-send-email-oleksandrs@mellanox.com>
 <1513268971-13518-3-git-send-email-oleksandrs@mellanox.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Thu, 14 Dec 2017 19:14:47 +0100
Message-ID: <CAOFm3uHohuaoBYWCxnwzDgGATrt8Zf1B-JaOtQ0sZgf+=sSovw@mail.gmail.com>
Subject: Re: [patch v14 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 joel@jms.id.au, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, 
 system-sw-low-level@mellanox.com, Rob Herring <robh+dt@kernel.org>, 
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 18:15:32 -0000

Oleksandr,

On Thu, Dec 14, 2017 at 5:29 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Driver adds support of Aspeed 2500/2400 series SOC JTAG master controller.
>
> Driver implements the following jtag ops:
> - freq_get;
> - freq_set;
> - status_get;
> - idle;
> - xfer;
>
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v13->v14
> Comments pointed by Philippe Ombredanne <pombredanne@nexb.com>
> - Change style of head block comment from /**/ to //
>
> v12->v13
> Comments pointed by Philippe Ombredanne <pombredanne@nexb.com>
> - Change jtag-aspeed.c licence type to
>   SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
>   and reorder line with license in description

Thanks for the SPDX tags! for this part you have my ack:

Acked-by: Philippe Ombredanne <pombredanne@nexB.com?

--
Cordially
Philippe Ombredanne
