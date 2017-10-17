Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::234; helo=mail-io0-x234.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xc7BZw1l"; 
 dkim-atps=neutral
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGHWj1tR6zDrD6
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 12:23:28 +1100 (AEDT)
Received: by mail-io0-x234.google.com with SMTP id h70so495674ioi.4
 for <openbmc@lists.ozlabs.org>; Mon, 16 Oct 2017 18:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=P+zsBdQz8Tqms9TeZdlz+0EoOhPSOrLu+ttZqFLmJmQ=;
 b=Xc7BZw1lyYRoyxoKHc6nfrofIgGS1oaYsFfe1CAPGPsUtLrl339IjJSCHXYxSmu6eO
 6hqFH+ldYpJF/8KI7oavmx6kC/AEDj/JOUSUMLeh3wcL32JSpD/2lpCQNKHN0XUdcELq
 9oJKNhdWVfZIowQX+4LKVPM+p/4HrOBHLI9BG6VYMFGf2ZIOVdXghIFs4dpyKA8lESkI
 0y+FrUwP56os1w6icw8B+cu7G2fUMXzEheajo9aZnJBhp3om1GUt4UyDwL4yJAapScEh
 bb2ZQy5hOh3UV0VP+Kejd1lxqk/ZbETGdwBKS3EvPvnoLv0wxBJJj/4q3nnBOUxYjH+n
 vTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=P+zsBdQz8Tqms9TeZdlz+0EoOhPSOrLu+ttZqFLmJmQ=;
 b=gQqFldhezMTuHEiAoCstSZRVpRDVglHyMGJIsI0h2kz3iTl+POccZDK0G5nJ59Ts0X
 v40DS5XzYpXb7+FRtFBVfPK/S204Hne6W38QfW8Jbq9dwx9AhWBAxkIeEPM8jwa2Jax8
 tONZ1LUHGrxDwvd/MVq941QEt11SguoX9oM4mUN+NdFv/HgFiTFFGjILRqDsKdjq4rTb
 rU9EcXwl1V7O+isaWacSbGnMdzn9fKO15qsvV9z0XHxceGbgLZsAlsgezR45WM1QAWFw
 SuY7KuVQIJOo8WWMBm4q3tqQQ/dRxmDoeYX+rSJCFYPSOumd5EejxoQGcchydMQJEyAh
 PqHw==
X-Gm-Message-State: AMCzsaWcO4U76fksb1raXYhgMrXt/qTI/SLer87QPC4kbRwNwIvWEKEr
 FBtOX99HzSONOJKVq3OdXJnL1vbuLV01PgTE+18=
X-Google-Smtp-Source: ABhQp+SyCEGEHpFcN8Mk+hwMo4tBnpFkYVHcbKSmVvxA4CteV98KyAlVJ2UGCDOlxEyfhGlt05067Lb0+BuFkmDYcnc=
X-Received: by 10.107.186.87 with SMTP id k84mr15058938iof.121.1508203405852; 
 Mon, 16 Oct 2017 18:23:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.196.9 with HTTP; Mon, 16 Oct 2017 18:23:25 -0700 (PDT)
In-Reply-To: <1507868164.5452.192.camel@aj.id.au>
References: <1507868164.5452.192.camel@aj.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 17 Oct 2017 09:23:25 +0800
Message-ID: <CAARXrtkrQtpdkCxp+Oqf-HUBttY6sv2+BEr3gAknXNXq=SGyAg@mail.gmail.com>
Subject: Re: Machine-scope maintainers for OpenBMC
To: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Yi TZ Li <shliyi@cn.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Mykola Kostenok <c_mykolak@mellanox.com>, 
 Patrick Venture <venture@google.com>, Rick Altherr <raltherr@google.com>,
 Xo Wang <xow@google.com>, Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Tue, 17 Oct 2017 01:23:29 -0000

Hi Andrew, Brad,

I would like to bring a question about how do we welcome system
vendors' systems.

Background: in gerrit we already have some system vendors' machines
under review:
* meta-inventec/meta-lanyang: https://gerrit.openbmc-project.xyz/#/c/3888/
* meta-yadro/meta-vesnin: https://gerrit.openbmc-project.xyz/#/c/6429/

They both contain a "large" commit that introduce a machine.

I know we have suggestions to split the commit into separated smaller
ones, but this
seems a bit hard:
* The work is based (referenced) on a similar machine, e.g palmetto or
zaius, which
   means the base code (meta-xxx) is already big;
* The change is submitted as a "squashed" one after it's built and
tested, which means
   not each "internal" commit can be built successfully.

In such case, how do we handle this case? Is it possible to accept a
large squashed commit
if and *only* if the change is to introduce a new meta-machine?

Thanks!


On Fri, Oct 13, 2017 at 12:16 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello!
>
> I'm wondering whether we should jot down the maintainers of machines
> supported by OpenBMC, and if so, where? With respect to the latter, one
> candidate might be the MAINTAINERS file in openbmc/docs.
>
> A related question is: Who are the machine maintainers? Off the top of
> my head I feel the following machines machines match with people:
>
>     meta-evb/meta-evb-raspberrypi                  Yi TZ Li <    shliyi@cn.ibm.com    >
>     meta-evb/meta-evb-aspeed/meta-evb-ast2500      Joel Stanley <    joel@jms.id.au    >
>     meta-x86/meta-mellanox/meta-msn                Mykola Kostenok <    c_mykolak@mellanox.com    >
>     meta-x86/meta-quanta/meta-q71l                 Patrick Venture <    venture@google.com>    , Rick Altherr <    raltherr@google.com    >
>     meta-openpower/meta-ingrasys/meta-zaius        Xo Wang <    xow@google.com    >
>     meta-openpower/meta-ibm/meta-firestone         Lei YU <    mine260309@gmail.com>    meta-openpower/meta-ibm/meta-romulus           Lei YU <    mine260309@gmail.com>
> meta-openpower/meta-ibm/meta-witherspoon       Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Geissler <geissonator@gmail.com>
>
> Less obvious are the following machines:
>
>     meta-openpower/meta-ibm/meta-palmetto
>     meta-openpower/meta-ibm/meta-garrison
>     meta-openpower/meta-rackspace/meta-barreleye
>
> Yet another related question is what do we want to do with machines
> that don't have an obvious maintainer?
>
> In the case of Palmetto I imagine we could find someone willing to step
> up (/me ducks). Garrison I'm unsure about, and for Barreleye I've had
> kernel patches on the list for several months with not a lot of
> interest in them, which indicates to me that we could probably drop it.
>
> As some background, Joel and I were recently discussing machine
> maintainers with respect to the dev-4.13 kernel effort. The approach
> Joel kicked off for dev-4.13 was to start from scratch against upstream
> and distribute the forward-porting amongst owners of patches in dev-
> 4.10. That is, if you have patches in dev-4.10 and that are not in
> upstream v4.13, you should rework and send them for us to apply to dev-
> 4.13.
>
> To stress the point a bit, the dev-4.13 tree as it stands does not have
> niceties such as `arch/arm/mach-aspeed/aspeed.c` or any of the machine-
> specific devicetree files. The idea is that in addition to distributing
> the workload, we only add back in what we need and try to avoid
> carrying accumulated cruft across moves to new upstream releases.
>
> Whilst the distributed approach eases the workload on Joel, it does
> mean that we could miss things that are required for specific machines
> (the board-file hacks are particularly worrisome). This is driving my
> interest in identifying the maintainers. Having such a list of people
> would, for instance, clarify who ought to be on the review list for
> kernel bumps to openbmc/openbmc in Gerrit. In the case of dev-4.13 this
> would help with the go/no-go decision.
>
> So if you have thoughts on the above or want to put your hand up to
> claim any of the machines in the limbo list above, please do speak up!
>
> Cheers,
>
> Andrew
