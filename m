Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sth1p72r8zDskf
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 02:37:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=lkIHofa7; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id d132so1681992oib.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DqFsk1VU20+eWzzs0nfLxRCV6POHhTVq0phioCLuJ8k=;
 b=lkIHofa7SVcquzux8uOQX9enN+HJIJiRldE1QLS7Hh7ioOOg5J1SBgdBpm3ykDEfqM
 +jM6uBqmzl3HK48fvFHvcHP2Gpx/oUOZ7Wzn4xRh2vCjoMFJ3jqVupCQspJugsMPsDXu
 /TMPsJpVmyT/Vr6w/47z/mRfbgwiDCxdjLJ+Gz/UY9QmDrSeovgcFrNsj2vixdA1wa8I
 UNE0PYYPrFj9peyHllyLiHQWgezSDXU+ZswYj3gSL0uxcLv9ofoiJ4EaKdALxIQZMQAE
 Mhy2ayPyNCJSbEBB9cS7ZuNOyZG1t6Cjobhhmxt2WIUPyX4wmJfUZ1tacSTToaqykKrS
 DRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DqFsk1VU20+eWzzs0nfLxRCV6POHhTVq0phioCLuJ8k=;
 b=GetfeOjQLv+uZOse1SC3UkDepXxykrKSOrz07Oh5ZuOIElH0zOSJBW1vwQ7aMU9Pyg
 vtFGmAtAq5D+4N5T2Vkh3awnpcc/PcaxiUEOVAjA35zw+2CpMQLq/KlUeMdLN3xP+DZv
 sboQfdb5z9iHEd4Ehu6AUf5DbA8HULgdbia+x8xlQ3N4LBbHJlw/mLB6qG7XsDeXI/YV
 myhnhTm0rYW4+hzj0449qbJzM2ATQZMceQGO/VeJDnQKjy/rMCOX2+YxiyoMciN363XH
 Y2sIxtYwFVZ2UiVs/Si5y9Rpx+/VyclE2J6CvoE0ta0BfocrDFM+RD+G5767zCCK6r9a
 GI8Q==
X-Gm-Message-State: AA6/9Rn7vu4f+X8ZzY5TQtgI6luJWJ7TsoEjP55i5IwUCJJnVZAD+bhPqVPdySBN49BiQAY95a/mf7GS0F0Dlw==
X-Received: by 10.157.33.121 with SMTP id l54mr2077501otd.203.1476200220778;
 Tue, 11 Oct 2016 08:37:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Tue, 11 Oct 2016 08:37:00 -0700 (PDT)
In-Reply-To: <CACPK8XcpFZFDAMToZw4+ZPMi_02iZPvh-hL9CuYT=e26uu1nqQ@mail.gmail.com>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-17-git-send-email-christopher.lee.bostic@gmail.com>
 <bf2fa509-3c91-4969-f598-96806594e117@ozlabs.org>
 <CAA0LjjUpFw5bv=WYp+zuPQU7rUtjxkr0YJZC-g3s_9pDDMsX_Q@mail.gmail.com>
 <0cf6507c-66f4-1717-eb16-925bb44f7f98@ozlabs.org>
 <CACPK8XcpFZFDAMToZw4+ZPMi_02iZPvh-hL9CuYT=e26uu1nqQ@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Tue, 11 Oct 2016 10:37:00 -0500
Message-ID: <CAA0LjjVQRLELNZEMSBSj-DkLd+wB71rkJkTTtf=m6EHSXd0Rxg@mail.gmail.com>
Subject: Re: [PATCH linux v2 16/17] drivers/fsi: Set up CFAMs for communication
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>,
 zahrens@us.ibm.com, xxpetri@de.ibm.com
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Oct 2016 15:37:03 -0000

On Mon, Oct 10, 2016 at 7:04 PM, Joel Stanley <joel@jms.id.au> wrote:
> Chris,
>
> On Tue, Oct 11, 2016 at 2:48 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>> It seems like the priority at the moment should be getting a single
>> master going, with interrupts, then we can look at cascading.
>
> This is an important point that I think is worth restating. Back when
> we met in July, we agreed the goal should be implement only what was
> required to perform a putscom on the host.
>
> I believe this helps us work out what is essential for v1, and what
> can be deferred to the second set of patches.
>

Joel,

Agreed.  I'll hold off on any of the cascaded master considerations for now.

Thanks.

> Cheers,
>
> Joel
