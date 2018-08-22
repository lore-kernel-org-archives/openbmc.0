Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NhZ3pE68"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wTr64rk2zF2QM
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 00:07:02 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id v66-v6so974011pgb.10
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lADCbob4aPdoppDm9V8Mc+mYO5ESUwq4VdeLrvsppUQ=;
 b=NhZ3pE686uNv8wZ8wuE7imq9YR8vxeyktBq5X4+x1XoOLVPcCiT3iklI1O1uBj8IKl
 yPPCOFFGk8Dm7lfJOYxMeFU0ZsV4zxtGL727zyy/rJUee/qn16jLw2Ms+ixjUTIhVADR
 upws9ocp/kf93RLAdYAAOxHfRmABqTI2WTU1hKTxJHT4N6enOR2W8N7MkH3ymVW7Ot3Y
 8tkoTZCkwJD+gTJw0STM25ZqDUUEufA1761GdC/Q8+5rEv82hnOeeSsNIO839B1th54H
 yzZRu+asTbMHST21+p6UC4n/ZrxerAlEJg4lys6FmegCYkYgjfJq8V/SYPgCeXtsIKgH
 G44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lADCbob4aPdoppDm9V8Mc+mYO5ESUwq4VdeLrvsppUQ=;
 b=bbWbHbUj7e0UwxalKt7XlugEqjrQpDk/KbVgFF5/AO3ebZLS5PTzknd9OEhVu7zmHQ
 qI3LtJtX/0nHL7mZ4qSdiCKFLvqhTn/73eCTAZm+PfWOcmQcSnRdDlA2lqi+aE/C1jTV
 azRsx9dkL4oeSTGAJ+hXAfUdefE0kEEU/5DAlPChh5bdjMjUR5dzzTyr4hRc2HDS1EG4
 icO6O7WJwabHmlQMBSUOogMRzkeI9MRYpO1gmVub0wUh6/ITlXVnkP8IbR2ZSJD50Z7q
 j9/nu2fPK329m1UQxCFL8lz/Wq2fNSaBCwIF3JHLpueVCeS/Hl4iIlwClHEu2YHZ07gJ
 tGWA==
X-Gm-Message-State: AOUpUlFNsbO0zPYrs5ry5Ay6sNEFcC9SnObjNqA62zuFvGXke4jwnoIo
 29F+Z92v6Gw5XBWaoTHQRlwPf6MzcEGwU6TYoO9TQg==
X-Google-Smtp-Source: AA+uWPzy6Qc7uDKi8uz/+Nrb3AWPUP6G+Vk3oHFlLYZCRV1lH3YXNb6/mTWasp7SAd1gnbJJQwUxUsjK2UQQIf3oULI=
X-Received: by 2002:a63:6745:: with SMTP id
 b66-v6mr17501606pgc.248.1534946819715; 
 Wed, 22 Aug 2018 07:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
 <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
 <CACPK8Xdg6F9N79-qvKNuc-DnjTubKPdgRmmW4+LyOMiifqTvbA@mail.gmail.com>
In-Reply-To: <CACPK8Xdg6F9N79-qvKNuc-DnjTubKPdgRmmW4+LyOMiifqTvbA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 22 Aug 2018 07:06:48 -0700
Message-ID: <CAO=notyiDz2MqKhwpNMAPm-59vPbwAzAuV0J0+KiC-_UbLGfDw@mail.gmail.com>
Subject: Re: Tagging master
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 14:07:03 -0000

On Wed, Aug 22, 2018 at 7:04 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 22 Aug 2018 at 23:30, Patrick Venture <venture@google.com> wrote:
> >
> > On Tue, Aug 21, 2018 at 6:09 PM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > Hello,
> > >
> > > I would like to propose we create a tag of master.
> > >
> > > The tags are useful for those who are working on openbmc, but also
> > > supporting fellow developers and testers who may be working on the
> > > host firmware, operating system or other tools like openstack. When
> > > they have issues, a glance at the tag give us a rough idea of how old
> > > their firmware is. As a developer, this gives me a rough idea of what
> > > kind of issues to expect, but also how far I should dig before
> > > suggesting "you need an update".
> > >
> > > I suggest we use tags as a lightweight epoch in our commit history.
> > > They don't need to carry any additional meaning beyond being easier to
> > > pronounce than 006d86903586b1dde915f5b0d90a68fd31935095. This means
> > > there's no garuntee that a tag contains new features, or has had any
> > > more testing than any other commit.
> >
> > So this would be a non-versioned tag?  I believe we already have
> > versions that are meant to track behind or with yocto (once the
> > release schedule hits).  Since these aren't tested, I'd suggest they
> > do have a naming scheme based on version, with may date in the tag and
> > some indication that it's not stable.
>
> I don't follow. I was proposing we continue with the existing scheme,
> so the tag for today would be v2.4.
>
> All of our builds are tested to some extent, what I meant by "not
> tested" was we would not have a freeze, release candidate, branching
> or similar. It would be a commit that passed CI.

And now I'm confused. :D  I thought the release schedule from the
release working group was pushing to drive versioning from yocto
versioning, versus our own separate versioning.
