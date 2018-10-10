Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JFHqka0+"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VdPQ5tpQzF1Hp
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 02:31:54 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id r9-v6so2692582pgv.6
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DigXPZ0NeFGSNL96mYa+zZ0hmWMjXiv1pQOWcyQzG2I=;
 b=JFHqka0+t0R7sd3izfPgPJ8L7O8MbY/8Ds/TVxwa5XCIfWejqgUhdQBQK8Ah17CpT5
 UhPHPpkG2hEnzzB4ujf4ULz8pxnoyJdpeA4gXKoRVYCXPfxhzCugEC+asleaWlFu+K01
 RDqYBrJiHktd0xG/xfXa85Fzu3QbsQtHVIWv6dGpODEKcaFPw8hvmuuPhZcPXQIZw28K
 xVqzI+KLv3mEBFNGONOQi6W9Klwzzp/0iEcQWWF6ZJxIw6AdV+CBwdN8R+nbtaJTTXU0
 9ti8P/AgkoGofSZWtBBG7Ru7ugFb4sJmw9K66+hES7birXuYqt33yfgj7COtjl3UbMZv
 1zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DigXPZ0NeFGSNL96mYa+zZ0hmWMjXiv1pQOWcyQzG2I=;
 b=Ywc9KDWC6eaMUa26Ys1Byx9kChbCYsZ/zvDrKnPDdmMSZcMfe1JUZexXobKiTLACyv
 p/eEkmZmr2KW34wcpPZIZmqIfCmM20yV+RILYjDY2eKr2EUwz80upZa79t36zUTSIJO6
 D4dg55BBDQTnPd0eIzOo9dO1kZVwpdDZRBCqRLBKF/pFj6pH1EH16ORcnAivvIV3V+Hq
 8FpK32NWC9hdBd10xZTV6g6HI98AH82gWvuWqzQJS6IgZtI/O5Za0Izun7+uEYdquER1
 CLapU92o41PJOCx1RmYImzdNcOT7XamSHqjg81vKQxJfGuo7nMHjesI+ugLvV6z5grUB
 33jA==
X-Gm-Message-State: ABuFfoiMuiZi4PYYTrVxhbRglYBa6Pe3QHrYacpfMg9jmXo536rcj4sY
 SkgJ5df7uVlkVEpIsFzi8FWiumgAbRlFaIo4HiwSIg==
X-Google-Smtp-Source: ACcGV60qeRhSoaTYiK4ETeGpT51aVUvILo65/HkcUPQW2HhoH/XsOfWkvtrfXwL81PdedEkWtEWhNYrdLw5Tla3JXIY=
X-Received: by 2002:a62:18a:: with SMTP id
 132-v6mr35362221pfb.207.1539185512015; 
 Wed, 10 Oct 2018 08:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
 <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
 <CACPK8XdS78mTtqqNUW_YbbwKYWbcpiaBnfU7AOe3QSMGr-ZkNQ@mail.gmail.com>
In-Reply-To: <CACPK8XdS78mTtqqNUW_YbbwKYWbcpiaBnfU7AOe3QSMGr-ZkNQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 08:31:40 -0700
Message-ID: <CAO=notwqFd5fHraUvTMSjK=6Cws13qgCRyf6=05_XTrsbdwSRA@mail.gmail.com>
Subject: Re: Loss of several MB of run-time memory
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 15:31:55 -0000

On Tue, Oct 9, 2018 at 3:25 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 10 Oct 2018 at 03:38, Kun Yi <kunyi@google.com> wrote:
> >
> > A somewhat tedious way to test would be to build and boot with 'bitbake core-image-minimal' to ensure no phosphor-daemons are loaded, and then compare the kernel memory footprint.
> >
> > On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> wrote:
> >>
> >> Was this only the kernel version jump, or did you jump in openbmc/phosphor levels as well?  There have been quite a few daemons added in the last 6 months or so that could explain your memory footprint increase.
>
> HI team. Just a reminder about email etiquette on the mailing lists
> that Brad posted a while back:
>
>  https://fedoraproject.org/wiki/Mailing_list_guidelines#Proper_posting_style
>
> In particular the top posting bit, which makes it hard to reply to this thread.
>
> Back to the issue at hand:
>
> >> > On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> wrote:
> >> >
> >> > Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
> >> > on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
> >> > stuff once things are settled, whereas before I could have up to
> >> > 35MiB.
>
> Are you able to boot the new kernel with the old userspace? This will
> allow you to compare like for like (even if the system is not fully
> functional in that state). Alternatively, boot it with a small
> non-openbmc initrd to allow comparisons as Kun suggested.

I'm going to try building an older kernel with the newer userspace
first (it's a slightly easier experiment).  I'll post back on this
thread once I have a little more information.

>
> The kernel has grown a bunch of new drivers. Most of them should not
> probe, and therefore won't allocate memory at run time, but there may
> be some new ones.
>
> I've not spent much time looking at runtime memory usage, so if these
> suggestions don't provide answers we might need to investigate a bit
> deeper.
>
> >> > This matters for a few reasons:
> >> > 1) my memory chip is too small to be practical and I need all the
> >> > bytes I can get.
> >> > 2) I need at least 32MiB to load a new firmware image.
> >> >
> >> > I dropped all the python except the mapper, and I dropped the newer
> >> > daemons from my build to clear out that difference.  It was originally
> >> > about 16MiB difference, so I was thinking that something is now being
> >> > mapped by default that wasn't before, such as part of a flash image.
>
> I initially thought you were confusing RAM with flash size, but on a
> second read I now understand.
>
> There has been recent work to create phosphor-tiny, is that relevant here Brad?
>
> Cheers,
>
> Joel
