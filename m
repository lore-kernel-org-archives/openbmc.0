Return-Path: <julia.lawall@lip6.fr>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=lip6.fr
 (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr;
 envelope-from=julia.lawall@lip6.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lip6.fr
X-Greylist: delayed 690 seconds by postgrey-1.36 at bilbo;
 Wed, 02 May 2018 20:48:08 AEST
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40bZkJ0nzczF2ST
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 20:48:07 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.49,354,1520895600"; d="scan'208";a="264063604"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2018 12:36:28 +0200
Date: Wed, 2 May 2018 12:36:23 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Tali Perry <tali.perry1@gmail.com>
cc: Stephen Boyd <sboyd@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-clk@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] clk: npcm7xx: fix return value check in
 npcm7xx_clk_init()
In-Reply-To: <CAHb3i=vYwGAwAcyQVrsZVgc3xq2dSw58Zi9RtokauEjkoA+LpA@mail.gmail.com>
Message-ID: <alpine.DEB.2.20.1805021234160.3409@hadrien>
References: <1524741668-158135-1-git-send-email-weiyongjun1@huawei.com>
 <152521142011.138124.3008284989746799940@swboyd.mtv.corp.google.com>
 <CAHb3i=vYwGAwAcyQVrsZVgc3xq2dSw58Zi9RtokauEjkoA+LpA@mail.gmail.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Wed, 02 May 2018 10:48:10 -0000



On Wed, 2 May 2018, Tali Perry wrote:

> I added the fix Wei Yongjun indicated ( Thanks Wei !)
> and another fix similar to the above + error print change.
>
> I'm a newbie... what's scripts/coccinelle/ script ?
> I just made a new patch same way I did before. Is this OK?

With Coccinelle, you can make a rule that can be put into the Linux kernel
that can allow others to find this problem automatically. Maybe:

@@
expression e,e1;
statement S1,S2;
@@

e = ioremap(...);
... when != e = e1
if (
-    IS_ERR(e)
+    !e
   )
  S1 else S2

http://coccinelle.lip6.fr/

julia

>
> On Wed, May 2, 2018 at 12:50 AM, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Wei Yongjun (2018-04-26 04:21:08)
> >> In case of error, the function ioremap() returns NULL pointer not
> >> ERR_PTR(). The IS_ERR() test in the return value check should be
> >> replaced with NULL test.
> >>
> >> Fixes: fcfd14369856 ("clk: npcm7xx: add clock controller")
> >> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> >
> > Have you made this into a scripts/coccinelle/ script I can run?
> >
> > Applied to clk-next
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
