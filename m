Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PeiUysKZ"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DlLk0QBDzDrJl;
 Tue, 18 Sep 2018 11:11:25 +1000 (AEST)
Received: by mail-qt0-x244.google.com with SMTP id r37-v6so263723qtc.0;
 Mon, 17 Sep 2018 18:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtbpE7kHQMgu33Pd/EEVA/FMbHiUtU2dDouAFF85bPE=;
 b=PeiUysKZ3ZbvsMtZrFaBxl7I64NapyjMC7oh73eF1tGMbXNShdk2hk45RsTaTyQ3tt
 mDKOVualCLDc/Q/GzrtxdEWr3P7N8SxuEIIznk9OEpqOLTn1JukCE3v7QdzC7V96N/U0
 vBmxp49CX6+GwEpwEU9rRPtU3spqzuU6fJl7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtbpE7kHQMgu33Pd/EEVA/FMbHiUtU2dDouAFF85bPE=;
 b=Mn8wTGEOdcTkSQOCNZRQbwmcxnuJpi5zKMnEoKlTXTTmqFaMfSy25jHHJ3We3Xxppk
 /SOFb2O0g9x/JVowHJK6cBvhlAenV36HCcQvaja0mAiJvp7nkt+W+bLgno6vwQBg0qlt
 HeXqoICWOuiKd0UxRaaPa/g91eqIlH/HUzWiEF2tg2JfzL/MdfsKTtVZvLPHcttBTmGl
 fkBleXyJSyC+nz2CI6On6BZ0RNxKH6x+Y36mXis96Or8++jkCWJOSwEaIwUEkIxEQNcF
 TNQGoroAn4767xeQO7CIq0DaFphg8QzharDXil76JryM5WL0Lfn6aGv1cPWPXGTjXbrc
 N9Qg==
X-Gm-Message-State: APzg51B3lGyVc5b15LjrPUS96H62rsJNJ/pz9iObyWAZdxyG5RdangNc
 31VWAOa6VvMHftP1Lh4ngHAGddto4ah4OTGidMg=
X-Google-Smtp-Source: ANB0Vdapq0YkvHJUouihT+p0PTlDec8CjjvMGYcfHx0vLw4qOfXxGNU/EfOM3t3z2Jt62twvTT+UrSukMfHoGeQLPuU=
X-Received: by 2002:ac8:35d9:: with SMTP id
 l25-v6mr20104641qtb.84.1537233083439; 
 Mon, 17 Sep 2018 18:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <1536895810-28903-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1536895810-28903-1-git-send-email-linux@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 Sep 2018 10:41:12 +0930
Message-ID: <CACPK8XchoryZ_RS8f4n=-GoT-Ak+dXuC3cgqLmxK9C=gySEJFQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge most interrupts early in
 interrupt handler
To: Guenter Roeck <linux@roeck-us.net>
Cc: Brendan Higgins <brendanhiggins@google.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2018 01:11:26 -0000

On Fri, 14 Sep 2018 at 13:00, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events
> properly") moved interrupt acknowledgment to the end of the interrupt
> handler. In part this was done because the AST2500 datasheet says:
>
>  I2CD10 Interrupt Status Register
>    bit 2 Receive Done Interrupt status
>          S/W needs to clear this status bit to allow next data receiving.
>
> Acknowledging Receive Done before receive data was handled resulted in
> receive errors on high speed I2C busses.
>
> However, interrupt acknowledgment was not only moved to the end of the
> interrupt handler for Receive Done Interrupt status, but for all interrupt
> status bits. This could result in race conditions if a second interrupt was
> received during interrupt handling and not handled but still acknowledged
> at the end of the interrupt handler.
>
> Acknowledge only "Receive Done Interrupt status" late in the interrupt
> handler to solve the problem.
>
> Fixes: 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events properly")
> Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks for getting to the bottom of this Guenter. I gave it a spin on
Romulus (ast2500) and Palmetto (ast2400) without issue.

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
