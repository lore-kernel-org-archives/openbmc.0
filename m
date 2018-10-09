Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="VDoe8Zc3"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VBdV08DjzF0x8
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 09:25:49 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q12-v6so2002418qkl.13
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 15:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bTXv8aNDKt3qsaDzLBkz8qZ4118W+gC4mG0wJtlmsFg=;
 b=VDoe8Zc3XELnEwQKMwZnVTBNOwbCoLpTf0tNEmrGN6XYRTyW9cpgr75Qif26ER/qPr
 YDrjxO+yQ/2qRnNrrWfndjXf0CUH+vBt2kRnznrRlvRsHQ4JGuOoW5hQ+UEYrTDqB05k
 Z2HaLM2gGJgyURuw8rhlJe/JkcmCehX7/WZZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bTXv8aNDKt3qsaDzLBkz8qZ4118W+gC4mG0wJtlmsFg=;
 b=VfYSC3684Ry9uvGtWQnoZ1wR56LJ9dBsyZ0LZV1JB88l01Z2+T6XmfmInYHEsiiUka
 ipWubcGCROKxoMBkqQvpZ3+4IlH+543jg3ilL68CRY2/jFBm1yMHLeoeAr8ReataUk/f
 W9W3FvHVvp0J37gkAsXQZQs+qu8INjAT/eGLxAiclt78KAD7I07nvUSmaTKpHRgxiegB
 A1ObWJu8O3sdNXL+PF6j2wXbzYJieRdFnF5RraodPlusp/MkIP7zoa9anmwg6dKZr4fZ
 +qpiQ/a/LVfyWM+XRXabriAn78tsBSDK9FcUl+3lkwDqDIWWnv1Ee3HwNiWJw2rBY79b
 mzfQ==
X-Gm-Message-State: ABuFfog9eqKJOVA5eSSu/9rXeQOuo3pl/vavXV+uldeLTRVCRtiliOqs
 UfFNzBMt1wsjVpzifv7JDdYvynI13q+w/xp91hI=
X-Google-Smtp-Source: ACcGV63ali7w283Nldwhod1ajkqI38yrSZ7BI0K9Wxr6h+Ir7z6UY6MUoA2Pp6f01cD/fk37uA5czXSf0my+XE+lC/8=
X-Received: by 2002:a37:d86:: with SMTP id
 128-v6mr23390750qkn.11.1539123947359; 
 Tue, 09 Oct 2018 15:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxDmpv_j=XT_c5WLUa=aHb6vfVLms=-_J4v_VM2ue0k7A@mail.gmail.com>
 <3147DF98-3720-4846-9728-881BF6F91218@intel.com>
 <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
In-Reply-To: <CAGMNF6V6eo3G8WSHdpcy5g9e56tYW_C7g_tBA0bRyfByJrTHiQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Oct 2018 08:55:33 +1030
Message-ID: <CACPK8XdS78mTtqqNUW_YbbwKYWbcpiaBnfU7AOe3QSMGr-ZkNQ@mail.gmail.com>
Subject: Re: Loss of several MB of run-time memory
To: Patrick Venture <venture@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Ed Tanous <ed.tanous@intel.com>,
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
X-List-Received-Date: Tue, 09 Oct 2018 22:25:50 -0000

On Wed, 10 Oct 2018 at 03:38, Kun Yi <kunyi@google.com> wrote:
>
> A somewhat tedious way to test would be to build and boot with 'bitbake core-image-minimal' to ensure no phosphor-daemons are loaded, and then compare the kernel memory footprint.
>
> On Tue, Oct 9, 2018 at 10:01 AM Tanous, Ed <ed.tanous@intel.com> wrote:
>>
>> Was this only the kernel version jump, or did you jump in openbmc/phosphor levels as well?  There have been quite a few daemons added in the last 6 months or so that could explain your memory footprint increase.

HI team. Just a reminder about email etiquette on the mailing lists
that Brad posted a while back:

 https://fedoraproject.org/wiki/Mailing_list_guidelines#Proper_posting_style

In particular the top posting bit, which makes it hard to reply to this thread.

Back to the issue at hand:

>> > On Oct 9, 2018, at 9:54 AM, Patrick Venture <venture@google.com> wrote:
>> >
>> > Just jumped from 4.7 kernel to 4.18 running the latest openbmc image
>> > on the quanta-q71l board.  And I see now I have ~20MiB of RAM free for
>> > stuff once things are settled, whereas before I could have up to
>> > 35MiB.

Are you able to boot the new kernel with the old userspace? This will
allow you to compare like for like (even if the system is not fully
functional in that state). Alternatively, boot it with a small
non-openbmc initrd to allow comparisons as Kun suggested.

The kernel has grown a bunch of new drivers. Most of them should not
probe, and therefore won't allocate memory at run time, but there may
be some new ones.

I've not spent much time looking at runtime memory usage, so if these
suggestions don't provide answers we might need to investigate a bit
deeper.

>> > This matters for a few reasons:
>> > 1) my memory chip is too small to be practical and I need all the
>> > bytes I can get.
>> > 2) I need at least 32MiB to load a new firmware image.
>> >
>> > I dropped all the python except the mapper, and I dropped the newer
>> > daemons from my build to clear out that difference.  It was originally
>> > about 16MiB difference, so I was thinking that something is now being
>> > mapped by default that wasn't before, such as part of a flash image.

I initially thought you were confusing RAM with flash size, but on a
second read I now understand.

There has been recent work to create phosphor-tiny, is that relevant here Brad?

Cheers,

Joel
