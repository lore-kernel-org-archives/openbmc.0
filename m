Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qXAiO6ZO"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DbjQ1J8qzF110
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 05:27:05 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id s15-v6so8129020pgv.8
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 12:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bHbO5e8RJPdQXhtMBwWrUlg3O272Wr9DY64zpimqcbI=;
 b=qXAiO6ZOWU+9FCYWlJhA5qABMR2ttD3AmjX0Gn0sKKWKl6bb/lIbSYJI1Gn8EtZWKv
 OTmNJjJ0M9s7G5m+mV56Hv76B8ziaNHj/V++xhauGJiLDS8ry4Es3OSgAe0e8IVgEVza
 mTbohATQYlJ9ySMdEHhBVBBpvGNuYLf2O9J4cHVjGlVrRF/XcnLGhfAK8XTx1vqh/y4D
 UkZfEuEeBpkIbOoPtpj9vk8ZBzOk3z70thGhLOB3NJvwN2V5vNOR1xbMHuU8VlzZIN2v
 4vf0EkQwzs0Ik1eXfWhQe834cn+5e9oN5WLMRbSfgt6DIBl20Ps0/Z02z+1zkLHz+BFR
 RweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHbO5e8RJPdQXhtMBwWrUlg3O272Wr9DY64zpimqcbI=;
 b=grDr1UCS73wOUzdRBb+jhsccHy72qVhjfAjXCAG1pG1me0YQnDUIa/rw0f4IudT2wM
 TgmZPe+VZfMYCsNC3fvzaKY5U9ZDMvztSdvLAsMyBM26f1zyuSbbnQ4rt6W1MF5SwAWP
 mmdh0S8lEkccgCTkmGKBx/6c40wLiMTzvnZWCOIND3cHOFg7F6Fm1wpdB84Z7Lt+pFHr
 iCXKiFWlpTQYc34GFCYB2AZqt5y8MAOzRoT1yvgmJ7gctE6rGib3zQr5F2l29H8BbbYk
 MZiFpF57CMlmMFClny7ey7A/kfvOOY8+kmnHfgkRai/SyKrvVbNbHe16rlSVb2Zj5yrn
 0+Ig==
X-Gm-Message-State: APzg51C2rdbstbQFmnPlqVYPqIoEl0Cf2Y9G4M3xRQUT0CflfXn+NmRj
 MXHaM1fKxaZEbOZieFUcC6lO/x/gD6Lzj1gdslblzZ9S
X-Google-Smtp-Source: ANB0Vdb5j/XRJXkOfJrV02v6tbtflQNXLJTuG4YmVINmTREecF5KxU5Kmu7HDVdDx+Z0W4bNbVluUmX+jlCTayXDy9Q=
X-Received: by 2002:a63:6c04:: with SMTP id
 h4-v6mr11906638pgc.290.1537212423147; 
 Mon, 17 Sep 2018 12:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwmqkF-8hdfjSSg81UrJTwHKscUPt+DCpWip915nhiUyg@mail.gmail.com>
 <6909C7D6-278A-4DEE-B9E5-D9813A907404@fuzziesquirrel.com>
In-Reply-To: <6909C7D6-278A-4DEE-B9E5-D9813A907404@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 17 Sep 2018 12:26:51 -0700
Message-ID: <CAO=notz2grSZmnCj5MVtaxO+ocw3LLL+Sk7R_XkUJyqtDCfUbA@mail.gmail.com>
Subject: Re: maintainer for google-ipmi-sys repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 17 Sep 2018 19:27:07 -0000

On Mon, Sep 17, 2018 at 12:20 PM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Sep 17, 2018, at 3:18 PM, Patrick Venture <venture@google.com> wrote:
> >
> > Brad,
> >
> > Can you update the ownership of google-ipmi-sys s.t. I can be
> > maintainer for it?  If this is something I should have permission to
> > fix, please point me to where -- I did some snooping around and didn't
> > see an option.
> >
>
> done!

Thank you!  That is a very quick turnaround.
