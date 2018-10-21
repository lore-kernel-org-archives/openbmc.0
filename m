Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="jrOLB2xN"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dZBs6lltzDsGh
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 09:31:49 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id c16-v6so1921245qtj.13
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 15:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R768BEGYhanq0reU2J9y6wfY1RRxRjl+Qp5OPgqwn/I=;
 b=jrOLB2xNGs1XPLzxL4hd3J/EhEbBxzmbNppgCee20RAgBTdM9WFHjwnEkD6PQZr6cM
 QEWjZs5kJlgICP5/a/5FuSl3lVWA2d0owr4xOeyIF8C/fcWO5fY7OsylRZpU4NPSG4Xf
 tpza1U7V8V71G0qjpYguRoQD2rdHrBEonJW+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R768BEGYhanq0reU2J9y6wfY1RRxRjl+Qp5OPgqwn/I=;
 b=I9y/sKXUl8GhHOmZNSyHmMjF0Gsef7MHucjS8UEMLQzMvyGd4qiwK5I85Wj3+t+WTP
 qSOQb4QwzBH4Blf+8XosAVAXCVJUjGatd0JgnWqPUdSMzixt5lLsvkmxILTFsX+kfe+j
 6YbLuJJAxKBrCWC4+KBYSyGCgYfB6esw5H9abR1n6HiCRjMzphduSQBHyruvkCNG2XM7
 HrB5NKMz0NctGPfk9s8DXRPj1JNjNv4pBfeeCsjB8P/Gfzz6W3wWzcBg7jc5OQFwjzCZ
 L8Ae0ARmvnFoPGbG1Yz2oCRRDCKT9pzkC7cD1X2AOSOAiNoM+7XUmOxKqQoFwr+fK2k/
 o0zQ==
X-Gm-Message-State: ABuFfoi2Xm3EgS1yllz4zfek06/CoqRwpHmjX9VaoDlaF9V5RZ+fLqr4
 bi7RmeyIlMZFlRdi1066rr43f291EhOq0Vc8tTw=
X-Google-Smtp-Source: ACcGV63kaDfcy8fJGkeKJ9pEJW0f5SwsMuM+pU7i8WgFkt4CwTu2ARdwoPYeqF9A9Oyf/AXkOt/7qv9ymQOoVHq/HaY=
X-Received: by 2002:ac8:d84:: with SMTP id
 s4-v6mr42643273qti.284.1540161107648; 
 Sun, 21 Oct 2018 15:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20181015034710.3090400-1-taoren@fb.com>
 <CCE39525-03B1-40DF-9083-6E5501DC2DF0@fb.com>
In-Reply-To: <CCE39525-03B1-40DF-9083-6E5501DC2DF0@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Oct 2018 09:01:36 +1030
Message-ID: <CACPK8XfVkDMgdXmjC7jk-X=QJWQ6QPJvM1-_BGWavtOiPFxpUg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.18] clocksource/drivers/fttmr010: Fix
 set_next_event handler
To: Tao Ren <taoren@fb.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
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
X-List-Received-Date: Sun, 21 Oct 2018 22:31:50 -0000

On Mon, 15 Oct 2018 at 14:27, Tao Ren <taoren@fb.com> wrote:
>
> On 10/14/18, 8:47 PM, "Tao Ren" <taoren@fb.com> wrote:
>
> > Currently, the aspeed MATCH1 register is updated to <current_count -
> > cycles> in set_next_event handler, with the assumption that COUNT
> > register value is preserved when the timer is disabled and it continues
> > decrementing after the timer is enabled. But the assumption is wrong:
> > RELOAD register is loaded into COUNT register when the aspeed timer is
> > enabled, which means the next event may be delayed because timer
> > interrupt won't be generated until <0xFFFFFFFF - current_count +
> > cycles>.
> >
> > The problem can be fixed by updating RELOAD register to <cycles>, and
> > COUNT register will be re-loaded when the timer is enabled and interrupt
> > is generated when COUNT register overflows.
> >
> > The test result on Facebook Backpack-CMM BMC hardware (AST2500) shows
> > the issue is fixed: without the patch, usleep(100) suspends the process
> > for several milliseconds (and sometimes even over 40 milliseconds);
> > after applying the fix, usleep(100) takes averagely 240 microseconds to
> > return under the same workload level.
> >
> > Signed-off-by: Tao Ren <taoren@fb.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Tested-by: Lei YU <mine260309@gmail.com>
> > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>
> Hi Joel / Andrew,
>
> The patch is included in v4.19-rc6 (commit 4451d3f59f2a), so you could either apply the patch to dev-4.18 now, or it can also be included when kernel is upgraded to 4.19.

This patch was included in stable, so when openbmc moved to 4.18.16 we
got it for "free".

Thanks for submitting the fix upstream. This saves a everyone from
duplicated effort.

Cheers,

Joel
