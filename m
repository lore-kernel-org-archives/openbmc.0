Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="caZbPSh3"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wTyd0wvHzDqC8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 00:12:40 +1000 (AEST)
Received: by mail-qt0-x230.google.com with SMTP id o15-v6so2180409qtk.6
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ODwD/t4YZbST7uxrgTQePbz0IHarHUWIEydhjQJ1sEE=;
 b=caZbPSh3rMtCHmfQo57/H+bZGiMaXVdxrDUwoHYgWmmEmmxKAlfCfgtVXNTTTyVOvU
 i/EZc7/CBPvjSJIJ7tRMdGT2uRcMwCVpd1mj3EzHMmXAHMJ0L0wuswYD3lVwW9Lxv8e4
 eH+2g5uQyPnuzFmWwZTWtiCe4ynL3Fqix1Cp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODwD/t4YZbST7uxrgTQePbz0IHarHUWIEydhjQJ1sEE=;
 b=mXrlyscmBLlFVviKcs+yRvf/lvMQjumJ9qfj8CW9ufp30kG058CZFyynA86Y/lpa3O
 kzDlTXfIFbA/18px8TEzpm6FiASCgSuMrfcDyUq0GN57GZaadfhJrRsNNjdQAgpZmCZa
 O9eJj5iaxsF/eJH34cefbp1GITISonPKEreulAyJoiaV/mGEaWOiW609gIEfXxFMI79y
 WvIkm7A3n6WUtuVcwoIzdV2rywrFOPFLj3Ph4e3g1W//lnOjZCcy1FMtYQupEu8goAyP
 1/Mo7P59/h+fnPGReiqd7tJhwzVHL58v3QaJAInXy1XFYxomfBbK5d7QjTMZHrgq1A0n
 VsnA==
X-Gm-Message-State: AOUpUlF/OvbsFniFG/HjeF+XrF9kqB5lD57mXEMRU9rgHiPqIF9gqYOo
 VqjKX8ZJRjf6WqG1aUESKTHbljl4icnx/s4awnE=
X-Google-Smtp-Source: AA+uWPztrP8I7ZGE5dasRtOlREvGIkySApD8AsrPnbuoFlv0e4j3SKZrHFGwLkIfeftnWlICg1w1bpUBgFx7rHPWEEE=
X-Received: by 2002:aed:2ce1:: with SMTP id
 g88-v6mr17571995qtd.285.1534947158250; 
 Wed, 22 Aug 2018 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
 <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
 <CACPK8Xdg6F9N79-qvKNuc-DnjTubKPdgRmmW4+LyOMiifqTvbA@mail.gmail.com>
 <CAO=notyiDz2MqKhwpNMAPm-59vPbwAzAuV0J0+KiC-_UbLGfDw@mail.gmail.com>
In-Reply-To: <CAO=notyiDz2MqKhwpNMAPm-59vPbwAzAuV0J0+KiC-_UbLGfDw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Aug 2018 23:42:26 +0930
Message-ID: <CACPK8XcuJp=aMVE4WDbf66gjEv1nEAF9YD=RNS198Db0O+Q1HQ@mail.gmail.com>
Subject: Re: Tagging master
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 14:12:41 -0000

On Wed, 22 Aug 2018 at 23:37, Patrick Venture <venture@google.com> wrote:
> > > So this would be a non-versioned tag?  I believe we already have
> > > versions that are meant to track behind or with yocto (once the
> > > release schedule hits).  Since these aren't tested, I'd suggest they
> > > do have a naming scheme based on version, with may date in the tag and
> > > some indication that it's not stable.
> >
> > I don't follow. I was proposing we continue with the existing scheme,
> > so the tag for today would be v2.4.
> >
> > All of our builds are tested to some extent, what I meant by "not
> > tested" was we would not have a freeze, release candidate, branching
> > or similar. It would be a commit that passed CI.
>
> And now I'm confused. :D  I thought the release schedule from the
> release working group was pushing to drive versioning from yocto
> versioning, versus our own separate versioning.

I had a read of the versioning committee's minutes, and didn't think
this would conflict with their work. This was more about something for
developer and low-level users to use in their day-to-day openbmcing.

Having a release process that says "OpenBMC Pluto is out! It has new
shiny" will be a great thing for the project and people making
products out of it. I think a tag in the git repo can exist in
parallel without taking value away from the broader release branding.

Please help me out if I've missed something here.
