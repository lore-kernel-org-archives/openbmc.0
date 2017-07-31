Return-Path: <venture@google.com>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com
 [IPv6:2607:f8b0:400c:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLlVf3TftzDrHD
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 02:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SWwov8Gr"; 
 dkim-atps=neutral
Received: by mail-vk0-x22e.google.com with SMTP id n125so37552238vke.1
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WT/MrO8c9Hfp/OYyV276afbyhGQ+moOyVYiuFDvPF20=;
 b=SWwov8GrAbwnhK+0Ojkz4VKO0tvfPclFl/IdxW+bknZjp94N8fdkrifjZZIqegqw0Z
 UBgeknJk0EY5c8dLgniTONw57XO7N5oUEdEAEjTiAK4G88OAn3iaF8GVf2j8ScKkXYxn
 rPOSXACN1cEsuBIJ+cxD0txetI8A6Xi3zT0qA4QI83jpmFG+mSO417J/4QUt3lCluSxB
 6J54ZCG5IsGbxXp9yRSU7yzS8J7DHWAHSiV+LoaJ5BZTfMVmIjSh1MPVElQHdQbHZZL1
 TkKIiOCQSHUWMt/Gs7n7UZRByfQTVVDaYypVms2vWjI+ndGQoqsj8bwYeRwsetmDOfZB
 I1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WT/MrO8c9Hfp/OYyV276afbyhGQ+moOyVYiuFDvPF20=;
 b=FhuNwqcgrqgv+hFpOURE+OGjiL0s4uOWqAm1wFq+qSNdrmiQKjZ4vJiiokkJc+Ms/g
 qF3Q1qYSC1JuT1O3JiGDdGi3WBXj/EsoiiZVpQMqcm9+ZCsQGHyKhi2inzkeFnnRkwSM
 5TL5jJWR9Rv3WWr4G8W+bDPNnIy3kJ3eHI4QFAUozb6zqrGhnYpcCuKDtkMYN6zGr4U+
 EpFWqIMeWPTco/b1OIH/ig1+/tx5uP6ijd2cNcLPb/Z+8vJ9m1BgVgoEfD53JSwvWdii
 Ii8Cf632pqk2wJcVBZdj4NN7GboiF1G+FkJCYyZg4Iu2pw1ub76+bZj1iSX98coG7CDU
 Mldw==
X-Gm-Message-State: AIVw111kli+XS3QdlrttZk0qIHkGd/8OEvScEEX9XRhNdgn/SqM0QTBl
 PtRhS6nnViRRxp1mMWepx0Q9D/P25/481hg=
X-Received: by 10.31.63.130 with SMTP id m124mr9916835vka.213.1501519063745;
 Mon, 31 Jul 2017 09:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.48.94 with HTTP; Mon, 31 Jul 2017 09:37:23 -0700 (PDT)
In-Reply-To: <20170706161409.GC22100@asimov.austin.ibm.com>
References: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
 <FB3659C0-EF79-40D3-8001-17D9116FA522@fuzziesquirrel.com>
 <CAO=notzHV07bANYK=f+QsqBpx_t83rYAJxvYzSAZb9qeYUPwLw@mail.gmail.com>
 <20170706161409.GC22100@asimov.austin.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 31 Jul 2017 09:37:23 -0700
Message-ID: <CAO=notw08xcRNXtud+wAT=c45LQ1m9eR4jPfJyet+4aTjWFaOA@mail.gmail.com>
Subject: Re: Swampd PID-driven Fan Controller
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 31 Jul 2017 16:37:47 -0000

On Thu, Jul 6, 2017 at 9:14 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Wed, Jun 28, 2017 at 06:13:27PM -0700, Patrick Venture wrote:
>> I would have liked to develop this in the open, but as you touched on
>> it, schedules.  My platform is under a compressed schedule.  Under any
>> situation, I'll be responsible for maintaining this code base.  And
>> expanding it to support other platforms.  As implementing it wasn't
>> done in a vacuum, I feel fairly confident that outside contributions
>> at least in furthering the design to make it simpler or more modular
>> would be warranted.
>>
>> Obviously, it was designed around very specific execution
>> requirements, which drove my adding an interval to phosphor-hwmon and
>> quite a few downstream hacks.  That said, those specific execution
>> requirements do have an impact on the ability to change the design
>> from input.  If the design suggestions or ideas violate the terms of
>> service that we're providing the data centers -- it can be forked,
>> effectively.
>
> Patrick,
>
> It was hard to tell from your initial email if your intentions were to
> just give away some code you wrote (hence Brad's fears of a "code dump"
> approach) or if you were trying to get this integrated as a repo we
> would maintain long-term.  After discussions off-list it sounds like you
> are wanting to do the work to integrate this into OpenBMC proper, which
> is great.

My plan is to work on integrating it in.  I've been preoccupied lately
with an upcoming deployment of OpenBMC: so basically all other things
are temporarily back-burner-ed.

>
> One way of reading your original email was that you were wanting to host
> this and maintain it in your own space and then add a recipe for the
> package to openbmc/openbmc.  Since this hasn't come up before, I should
> probably say formally I am really opposed to this.  I see it as a
> difficulty long-term for us to have a repository that links against
> phopshor-dbus-interfaces and recipe in openbmc, but the code itself is
> not able to be updated by us.  It is not uncommon that we need to change
> the dbus schema and the developer doing that is also generally responsible
> for the changes across the repositories using the schema.  Having this
> other code outside the project but that the project also relies on to
> build an officially supported machine would make a dbus schema change
> pretty painful.
>
> My suggestion would be that we tackle this code in a few phases:
>
> 1. Place code on Github in your personal account for a high-level review
>    by interested parties.

I have to reach out to the legal team to see if that's feasible.
There are guidelines for publishing to the Google owned repos, and
guidelines for personal open source projects, but not quite this type
of hybrid where it's non-personal project but isn't aiming to live
outside of the Google namespace.  So, i'll reach out and figure it
out.

>
>    1a.  We can take a look and get a feel for what lines up with
>         existing architecture and where one of us needs to make changes.
>
> 2. We create a Gerrit repo for this code to live in long-term and you
>    submit any changes from phase 1 there.
>
>    2a.  We will then do a review and revisions per our normal process.
>
> 3. After merge, the code is now an officially supported repo that we
>    will expect others to help maintain as, for example, APIs change.
>
> At any point here, if you decide it is not going to be worth the effort,
> we can stop or someone else can pick up where you leave off.  Does this
> sound workable?
>
It sounds workable.

> --
> Patrick Williams
