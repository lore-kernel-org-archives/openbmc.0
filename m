Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uS9kVFrO"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Flrf01TMzDqCH
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 02:37:21 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id s17-v6so2926545plp.7
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uPiTfoCIdWAQUKyxWOIzsM3lYzkN+/JpkRNhZKLMvb0=;
 b=uS9kVFrOb1DDlu2o5SEGoPMHS3wwLKJhFTjraOSeshqUXf8soJ09nDqCnUH3uCgDW6
 mKFMRx0DUHJUqfMyC50S7FrHklVdooESJILZlc4LLdc8U+nK4N+yooXOrc73YVjkOhNW
 qO9lC9zPY1GS7u2I+KhV0wmuFlM6DV+tMaTfnbmbXuS5pnEK2bl/A4MTWcKwiNECqdBT
 QhW1ucZeXEJSogYgLP9VjDOo9xFcmbKaoJ5gFNOdxNPwXDIdL9l4ucGcqnb3EUF3gHwS
 dXyl4J26LMv37KqPLrxFCDTmUxAZw3BQle9hDpStpfB/NGLz9xfHVKJM3n7VOsCBGpn/
 0Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uPiTfoCIdWAQUKyxWOIzsM3lYzkN+/JpkRNhZKLMvb0=;
 b=Umrn5eThxSDIP6jUhhuqEONfmYFku/eWE06pfSKddeRcqCagnyvHijRdvQUuYhJAQ+
 NhxFralD5eDXQ0oscjVbjQYYN6f3RVkBNki5VATeYKShw8CaBfewJjU8BtDH51G70Iwd
 /n3NGG2M7Pu62c/spd88aZdPApKYgXV+bdIC4qDzf0pMA3fq5Hb/Gt9eO6gkFIOrVuTC
 QuuOcNEUrsZRjRWh0fMsAeHpg/S6cuBm54eIVUAVJj1SqJEIyJToFvNxhJXDI6kLmTyE
 RbwWF7R58qN/SILs2eIfq5VtLgW3nyV6KyzvOAJ36zGsuRigY4Ycgbj85IzhTJkjSz6S
 Vh5Q==
X-Gm-Message-State: APzg51DOKQgAQdHjE5BLOAisRh/cdOgrit/wk78/VNDLLgsMVLUYsOHe
 FK825l5yF9+b+V3FSGiAJ1x2zlRtQpndUiWIP8VrMQ==
X-Google-Smtp-Source: ANB0VdZP0Iy7QqR9MBoCmH4rRv0N4MGKW0mWwsmrqC3/Xcq36rr4OG7wD2UJKK9+nTUadMoG7IF94aos9eO4L3MpVYM=
X-Received: by 2002:a17:902:b70f:: with SMTP id
 d15-v6mr36106710pls.53.1537375039347; 
 Wed, 19 Sep 2018 09:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
 <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
 <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
In-Reply-To: <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 09:37:07 -0700
Message-ID: <CAO=notxPfx-RufZXncqAX5LsdJCaQLirgxy-M+3hFPKYvrpTDw@mail.gmail.com>
Subject: Re: Link-up between Gerrit & Github
To: Andrew Geissler <geissonator@gmail.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Wed, 19 Sep 2018 16:37:23 -0000

On Wed, Sep 19, 2018 at 9:03 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Wed, Sep 19, 2018 at 10:01 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Sep 17, 2018 at 12:28 PM Brad Bishop
> > <bradleyb@fuzziesquirrel.com> wrote:
> > >
> > >
> > >
> > > > On Sep 17, 2018, at 3:17 PM, Patrick Venture <venture@google.com> wrote:
> > > >
> > > > The first meta-google patchset was pushed by Brad into github.
> > > > Interestingly, the second patchset which was merged into gerrit 3 days
> > > > ago still hasn't been automatically pushed into github.  It makes me
> > > > think there's some box we need to check or a setting to push.
> > > >
> > > > Brad, can you dig into this please?  I don't have any permissions to
> > > > poke at it on Gerrit.
> > >
> > > Will do.  Agreed there is a problem here - I noticed meta-x86 was out
> > > of sync too.  In the meantime I've manually fixed these.
> >
> > I know it hasn't been long, but I was curious if there any thoughts,
> > since it appears to be all new repositories, and not just the meta
> > ones.
>
> Yeah, there's a bug in either gerrit or the github plugin to gerrit
> (or a mismatch in the levels).  If we restart gerrit it picks up all
> the missing synch's and then works fine with that repo after. I'm
> hoping to just defer this until the next gerrit maintenance window in
> a month or so.  Wouldn't be an issue if we weren't adding so many
> freaking repos to openbmc :)  jk
>
> But yeah, until then, Brad please just ping me and I'll manually
> restart gerrit when you add new repos, it just takes a few seconds to
> get back up and running.  If it gets annoying enough I'll dig in a bit
> sooner.

I'd appreciate it if you can restart it shortly to pick up a slew of
new repos, although the meta-x86 wasn't new IIRC, but maybe it's new
in that gerrit hasn't been restarted since it was added.

>
> Andrew
