Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="R7RgLmXN"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fQ0x3h8nzDqNN
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 23:26:41 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id z17so2721218qts.13
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKbq6W5n8dGMmRV06rUmCNgaCIhmtBLSqoVITCIi4bs=;
 b=R7RgLmXNTC+CYEhJACF+DxosDDEtQkPTBh5yQFiGvpbFPZKdslXCJVxRCXWv7PHJoh
 7/rKE4Ld7e25M+trkOqokao69Hjm7rbWF0cIRqP3p+ETYgJLzKS9a3+S17selfUmwFS1
 3cRnskQt0jXs2ZIfaOL69z0zj/Tli4dskT3zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKbq6W5n8dGMmRV06rUmCNgaCIhmtBLSqoVITCIi4bs=;
 b=LA7op4ybY83Ps60WlOuFRvOD30Yuy9nLzeMvWE+7Cytco1eO8JfAJnBmpt32ciHvGo
 eyUgNFJ4/2pDTiRFXKHRWn8I38qlS4SzmDl5/VLA3gME00bz0mILi0S0qHUPEjq77Tjw
 jI9bLax6a9oXiquOboI8cduUC4Mqz/STlyFzeVae+1e2DHO4CCP2ltQfmT0lFHdBY0Yi
 9g1Ux+MKuDd2J/WgWVFEheZTRojKhVvqZ9GIBiI4aD7XPgZ9OB7vjQP6pGj6CeuShovJ
 LURC4kHK49g7kRtXQ8QxRHg5p/er6jlyRxd1Jg2E4qNqMVglI/b0G1J0scFIx6Uw6fkb
 Oc1Q==
X-Gm-Message-State: APjAAAVvHn1Fiy5B6g+qLw9rfVWUfZr79Bl0p/1Ndu0bMup8WA+KCwmP
 s7a5ZrzcQ+AEuZsogJtuHQu9O6OauhYxqKmjAvJJHb4A
X-Google-Smtp-Source: APXvYqwuGlcmhemUEpcNV+uD5iGlfug91i2qq9rucMa0XOj5sxBA6jTw32MOzHqoTVUnDeYCBVBx7E9YbDkXbdmMycQ=
X-Received: by 2002:ad4:42cb:: with SMTP id f11mr35015583qvr.53.1554902797156; 
 Wed, 10 Apr 2019 06:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Apr 2019 13:26:25 +0000
Message-ID: <CACPK8XeuVj8tZu48Ci59GGMJE9TtEP0kRZEDFhp789qQbw7Dwg@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 0/3] Improve stability of Aspeed video engine
 driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 10 Apr 2019 13:26:43 -0000

Hi Jae,

On Tue, 9 Apr 2019 at 19:21, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This patch series improves stability of Aspeed video engine driver by fixing
> clock control and irq handling logic in the driver.
>
> Jae Hyun Yoo (3):
>   media: platform: aspeed: fix a kernel warning on clk control
>   media: platform: aspeed: refine clock control logic
>   media: platform: aspeed: change irq to threaded irq

I had a glance at these patches and they look okay to me. Thanks for
the testing and sending fixes. Can you please send them upstream?

I can apply them to the openbmc tree once we have Eddie's ack.

>
>  drivers/media/platform/aspeed-video.c | 75 ++++++++++++++++++++++-----
>  1 file changed, 61 insertions(+), 14 deletions(-)
>
> --
> 2.21.0
>
