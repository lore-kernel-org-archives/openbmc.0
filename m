Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FBPk8kYk"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VfQQ0by6zDqfV
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 03:17:49 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 80-v6so2737843pgh.10
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 09:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3qZ2suIN+OaGJd1vxRUPO9+DHqf9PYG1vyiMU6M0Ko=;
 b=FBPk8kYkZIswNzpwJIlhm2zQ7CYSMm8lRTUL2VTo8uk4e5nZAM5CDIqcOezbbD/V2t
 RRXfxaUSHzrYwNAJybE3revP6+ty0iWJnY5TQg5WCNkIb4UTxkzb4AZiuJXmSLc0QExC
 fHsDsdYtqD3wZkcpkZ7A2V6+kEmOabtHjT0aHaUaDGCCTqwVUS9mAAjpSisKTFw1QPuh
 1zbkV76qgKgK/W6PlUqCzOFQ1jHBxGJBoDRcJEAeDVIt225ErUIYDOdnqZ7ZVxEM/hjo
 PWeNSOW9sYJOIu62YwRNyIRI+qIQyoGDV/liLROuPDfx5OpwWqZ50UTKv3uH/tWcoCCP
 llyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3qZ2suIN+OaGJd1vxRUPO9+DHqf9PYG1vyiMU6M0Ko=;
 b=SZIz1F/et1xAbhWiRTntCLo1x7kBjj6All6gRmSO5fXg3b9DCG+z4wC0DjiQOy1I/u
 4uGAs6PUBQRQ1i/3lRJO9VbIgEmeIgSC3NySuo4O8jXLQG46VX9uE01P4AbKbcyxLANK
 GE5UDzV3vk8ycL4svi4j6D317JT6duJiZZdATyD1ZbFP6RtKSvgCxlPmMARQKAn1QOPr
 pcf9k4/XVoqupmmhtJYvrVDFMHq1c6DnbGDgfDjbZIVA1rrCtkISwpolpV0f6sR2B8o3
 LDY7mUqzNP1D8GVug+FEAK+q6swS7WYqbSkRe9NO7FXfyGzd1P+fsTJFBHlygewL+FHs
 oCQQ==
X-Gm-Message-State: ABuFfoinibRYCXhxI7FXLvcrg6v6OkLi2bYZvJnYRd3XihmFTOlRGIcb
 gg5u0ULvgKhcB4lISds3w2wGOuZB2dE6jE1A0SlMRjU32JHydA==
X-Google-Smtp-Source: ACcGV60ug7LbNvBsotilloXU8dnMxk1q0tSTIWRz2Sn4FrsHcOKGGjZhOAK/ieS/RHAxuGWuFA7qRTadmsAxPknBnjM=
X-Received: by 2002:a62:42d4:: with SMTP id
 h81-v6mr36326865pfd.0.1539188266246; 
 Wed, 10 Oct 2018 09:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
 <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
 <CACPK8XdS78mTtqqNUW_YbbwKYWbcpiaBnfU7AOe3QSMGr-ZkNQ@mail.gmail.com>
 <CAO=notwqFd5fHraUvTMSjK=6Cws13qgCRyf6=05_XTrsbdwSRA@mail.gmail.com>
In-Reply-To: <CAO=notwqFd5fHraUvTMSjK=6Cws13qgCRyf6=05_XTrsbdwSRA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 09:17:34 -0700
Message-ID: <CAO=notySRV2yzMfQ72MqUUgzAYkk9zMruBFFzbi1jPsXLzbDCg@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 16:17:51 -0000

On Wed, Oct 10, 2018 at 8:31 AM Patrick Venture <venture@google.com> wrote:
>
> On Tue, Oct 9, 2018 at 3:25 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 10 Oct 2018 at 03:38, Kun Yi <kunyi@google.com> wrote:
> > >
> > > A somewhat tedious way to test would be to build and boot with 'bitbake core-image-minimal' to ensure no phosphor-daemons are loaded, and then compare the kernel memory footprint.
> > >
> > > On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> wrote:
> > >>
> > >> Was this only the kernel version jump, or did you jump in openbmc/phosphor levels as well?  There have been quite a few daemons added in the last 6 months or so that could explain your memory footprint increase.
> >
> > HI team. Just a reminder about email etiquette on the mailing lists
> > that Brad posted a while back:
> >
> >  https://fedoraproject.org/wiki/Mailing_list_guidelines#Proper_posting_style
> >
> > In particular the top posting bit, which makes it hard to reply to this thread.
> >
> > Back to the issue at hand:
> >
> > >> > On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> wrote:
> > >> >
> > >> > Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
> > >> > on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
> > >> > stuff once things are settled, whereas before I could have up to
> > >> > 35MiB.
> >
> > Are you able to boot the new kernel with the old userspace? This will
> > allow you to compare like for like (even if the system is not fully
> > functional in that state). Alternatively, boot it with a small
> > non-openbmc initrd to allow comparisons as Kun suggested.
>
> I'm going to try building an older kernel with the newer userspace
> first (it's a slightly easier experiment).  I'll post back on this
> thread once I have a little more information.

Running 4.17 kernel with new userspace:

MemTotal   113944
MemFree   19316
MemAvailable   61700
Buffers    11072
Cached   48872
Active   39012
Inactive  29200
Active(anon) 17432
Inactive(anon)  9332
Active(file)   21580
Inactive(file) 19868
Unevitable    9088
AnonPages  17372
Mapped       22704
Shmem     9408
Slab             11704
SReclaimable 6204
SUnreclaim  5500
KernelStack  648
PageTables  1472
CommitLimit  56972
Commited_AS  125448
VmallocTota   1957888

Running 4.7.10 kernel with new userspace:

MemTotal: 116224 kB
MemFree: 27396 kB  <--- older kernel same userspace, ~8MiB difference right off.
MemAvailable: 74212 kB
Buffers: 10380 kB
Cached: 46456 kB
Active: 40516 kB
Inactive: 33380 kB
Active(anon): 17124 kB
Inactive(anon): 9356 kB
Active(file): 23392 kB
Inactive(file): 24024 kB
Unevictable: 0 kB
AnonPages: 17076 kB
Mapped: 20696 kB
Shmem: 9420 kB
Slab: 9660 kB
SReclaimable: 4776 kB
SUnreclaim: 4884 kB
KernelStack: 744 kB
PageTables: 1364 kB
CommitLimit: 58112 kB
Committed_AS: 116540 kB
VmallocTotal: 909312 kB

Running 4.7.10 kernel with old (openbmc 1.99) userspace:

MemTotal:         116224 kB
MemFree:           39636 kB  <--- everything before ~12MiB difference.
MemAvailable:      80224 kB
Buffers:            9500 kB
Cached:            38940 kB
SwapCached:            0 kB
Active:            36472 kB
Inactive:          26156 kB
Active(anon):      14452 kB
Inactive(anon):     6456 kB
Active(file):      22020 kB
Inactive(file):    19700 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         14200 kB
Mapped:            19584 kB
Shmem:              6720 kB
Slab:               8928 kB
SReclaimable:       4256 kB
SUnreclaim:         4672 kB
KernelStack:         744 kB
PageTables:         1320 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:       58112 kB
Committed_AS:     139392 kB
VmallocTotal:     909312 kB
VmallocUsed:           0 kB
VmallocChunk:          0 kB

Losing those 8MiB with just a kernel difference, makes me think it is
always loading more or there's some default 8MiB window being eaten
now that wasn't before.  I deliberately have the VGA window, but
that's in both kernel's device-trees, so that isn't it -- but it makes
me think it's something along those lines.

As far as the rest of the loss in userspace :( :( I'll take a look at
what is built and compare sizes -- my process lists are basically
identical between old and new userspace, so something in them must
have changed?

>
> >
> > The kernel has grown a bunch of new drivers. Most of them should not
> > probe, and therefore won't allocate memory at run time, but there may
> > be some new ones.
> >
> > I've not spent much time looking at runtime memory usage, so if these
> > suggestions don't provide answers we might need to investigate a bit
> > deeper.
> >
> > >> > This matters for a few reasons:
> > >> > 1) my memory chip is too small to be practical and I need all the
> > >> > bytes I can get.
> > >> > 2) I need at least 32MiB to load a new firmware image.
> > >> >
> > >> > I dropped all the python except the mapper, and I dropped the newer
> > >> > daemons from my build to clear out that difference.  It was originally
> > >> > about 16MiB difference, so I was thinking that something is now being
> > >> > mapped by default that wasn't before, such as part of a flash image.
> >
> > I initially thought you were confusing RAM with flash size, but on a
> > second read I now understand.
> >
> > There has been recent work to create phosphor-tiny, is that relevant here Brad?

So, the image fits on my flash chip, but it may have extra daemons
that are being mapped in from flash for the fs?

> >
> > Cheers,
> >
> > Joel
