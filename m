Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cXOsmz6C"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Yv702rGJzDqLx
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 16:01:15 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id o129so9372975qke.8
 for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2019 22:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPVuHtehm7hn04BmOropKC4vg1YWy/Y5MnEJJ8DEaVE=;
 b=cXOsmz6CvQ0u1CqlFUdSjdCTUis9hiQJ0cq19F88gw/mqa0qukhGZ5o+Lo5tiKfib6
 8aPAUFBpAdECVV0AiArUaX3d/zSwWuRrpYkx/I2FfMHl5RWZfh2MPXYxr3Lo8O1uSc7W
 W2PreBnDr92KhbxqWY1e4ICf4x2zyo6gtVJic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPVuHtehm7hn04BmOropKC4vg1YWy/Y5MnEJJ8DEaVE=;
 b=iA0se1a/u5JKQM0EMXYpquVNsWlebnjSZ1My+EEJRBrg63CS3dzhAbU1Hxkp5WiE1J
 mztdghnBnpt1MOrSOmA0x6qv+A7o9mikyEY2KTWzlU92DO7DEKJacDreZQG0tBoJVMz9
 pZZ5WMA8tvlZb7TjARBpufI3ujgMfUbto+fnKaJCCYHwu7uXJ4s7Got9rIiGtpF9ydCE
 mjo5o01bpqFBU9gaXQta/wn2SL20u/T6nwesHGgaP4ci/XQmJkVvpMU+7BuVeHGihVBn
 qIfI/i1pRyvm/0hc6/65VlWX4hQhK+ssb3YxQWhveX3dToh81Bm4ZmF1EmoYiDfORj1I
 NsrQ==
X-Gm-Message-State: APjAAAVrD3V4cHhl5LnzrOin7voZFIwAScm9UKZynq913J/t3ZfvLQab
 Fl9arLQ8Wb2BLC91CgmfI8RhlgcZFwp1gyRoeNE=
X-Google-Smtp-Source: APXvYqygQA3M1aOG5kT0hLX7XoIlgVgpkHvQlPnDsjCmc/GVY1YGV8cujPkORfhZWay2njicgq9nGp24EqyUUgMCtzE=
X-Received: by 2002:ae9:e313:: with SMTP id v19mr22983933qkf.153.1554267672247; 
 Tue, 02 Apr 2019 22:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190403042051.105948-1-benjaminfair@google.com>
In-Reply-To: <20190403042051.105948-1-benjaminfair@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Apr 2019 05:00:59 +0000
Message-ID: <CACPK8XdvNpNzn7vbdstOsunxUWjcoEpr7bFTnSQfy0WoO4k2Jw@mail.gmail.com>
Subject: Re: [PATCH dev-5.0] net: npcm: use bitmap functions on link mode
 params
To: Benjamin Fair <benjaminfair@google.com>
Cc: Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Tomer Maimon <tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 05:01:17 -0000

On Wed, 3 Apr 2019 at 04:22, Benjamin Fair <benjaminfair@google.com> wrote:
>
> This fixes a compilation error caused by the phy_device "supported" and
> "advertising" parameters switching from u32 to bitmap.
>
> Fixes: 35998b5c4073 ("net: npcm: add NPCM7xx Ethernet MAC controller")
>
> Signed-off-by: Benjamin Fair <benjaminfair@google.com>

Thanks, applied to dev-5.0.

Cheers,

Joel
