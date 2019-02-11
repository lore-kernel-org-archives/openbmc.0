Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="r5gQgsXL"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z1fB46XxzDqbt
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 10:07:46 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id m1so265072pgq.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 15:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=914nUb4u4mWII/BSZ70n1dV3ArZmyJL8xEY8v7nK0ps=;
 b=r5gQgsXLNT8tK0Qm4d1yTPAlKw8a+EMhF/jqG4s3D5xT7zU8JtIF34VSP3jTSQvU4h
 Ec4TpXRP2u3BHZAad2pxtSLzpUCKnmaleBVTLBQoJ/LM6L0N+F+pp6e6FnPY5rE8ZdZl
 8hmA5XrRPEEt9ZMGlMcE43ZknVMii/5LH0fC+5YR4KCLhQMu4Awlk1UyWoOzxfVsKHO9
 O+X1aFVrDr5wxwLSTo0HJg0TixPgsh4OADiWXvFyhuEz794tIGEE/mNQpiYZwcQg70/k
 LVZMWcvgvM6gmrqqiop5bIvMJ1s4Q3N8A4anS/KWW2eb+WIooAgCgXKAMMfgJmrCujVd
 fBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=914nUb4u4mWII/BSZ70n1dV3ArZmyJL8xEY8v7nK0ps=;
 b=hxO2zFH1gK+VIoc1CNRA+bOhcoC9RTc88+BBlXVwjPiZVhBJHNK+WqUqp5AXrx62l/
 YJDZ4PcFoHf+F60PK5bQH57egwhwupRgWEmhmNi3RAVnAWGmDT/Mm+SX/kbktfIfXhm/
 QijL1WDHmLd6LZPf6uU+Je5UKguItXamAHiLjSFRQVL29IfKO45YPBzE+4zl/G7GfB9P
 I/k/hFY4hJyOn4YrnQ8Qjyw7v1sogxCEABktYgogQkLH+BBSfV13kl0yt/XSyIwyLhvj
 9hBFl6up11lIcWFEtCGuJgrNnEzKQu24Dwq5YFZaLUU3RykSRwzwyRi9Htbhck40Hwi7
 Q8pw==
X-Gm-Message-State: AHQUAubjGcQ5sMFENzCBZSioY7EXqpYjw7B8a+KDQMs8ZU4QinTo264D
 l05nB6M4TnOkytUoKyLcGUR3KAwMShF8mJqCmCM9JQ==
X-Google-Smtp-Source: AHgI3IY2Cd54uptdNA9u7d1VFHw81uxRAQ7pavDfqmdegaJMx6vQvlwdl8lQuyGvnBgml2cnbpk5uFQ13+95BgLOGng=
X-Received: by 2002:a62:994e:: with SMTP id d75mr726725pfe.236.1549926462774; 
 Mon, 11 Feb 2019 15:07:42 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
 <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
 <CAPnigKm9Sce7DbBjKf7tGJrgVPyF=2u04GFPW4FTzeHKUHYhTg@mail.gmail.com>
 <CAO=notwCLir90VDFiNHWKwYHuKJ6k7TWrCECkWkAe3QKprc_hg@mail.gmail.com>
In-Reply-To: <CAO=notwCLir90VDFiNHWKwYHuKJ6k7TWrCECkWkAe3QKprc_hg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 11 Feb 2019 15:07:31 -0800
Message-ID: <CAO=notyaqHWYHk3+wekPMLBK_==vwDT-+ccyNMxXPcRKwvPZDQ@mail.gmail.com>
Subject: Re: Host-side tools
To: William Kennington <wak@google.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 23:07:47 -0000

On Mon, Feb 11, 2019 at 2:58 PM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Feb 11, 2019 at 11:49 AM William Kennington <wak@google.com> wrote:
> >
> > As long as it's possible to build the host side tooling without
> > building any of the BMC side tooling and vice versa it sounds fine to
> > me.
>
> I've been doing a lot of host-side development lately and I was
> interested to know what the end result would be.  If someone ran the
> configuration just to use the tool, they might run into issues.  I've
> avoided using BMC-side libraries where possible to avoid host-side
> tool poisoning.
>
> >
> > On Mon, Feb 11, 2019 at 10:51 AM Brad Bishop
> > <bradleyb@fuzziesquirrel.com> wrote:
> > >
> > > On Mon, Feb 11, 2019 at 08:03:17AM -0800, Patrick Venture wrote:
> > > >Brad,
> > > >
> > > >It's my understanding that host-side tools that cooperate with bmc-side
> > > >tools should be in the same repo,
> > >
> > > Is this something I said at some point?  Where is this coming from?
>
> I don't have the exact email, and it might have been very very stale
> information.  But I'm glad to clear this up! :D
>
> > >
> > > >hence why the host-side blobs stuff is in phosphor-ipmi-flash.
> > > >However, if I add any dependencies to the configuration for the
> > > >BMC-side, those get in the way of configuring for the host-side.  Would
> > > >it not make sense to sometimes have it split?  And if so, I would like
> > > >to propose creating two repos, a blobs library host-side, and a flash
> > > >tool host-side repo, so those can be neatly split and not have anything
> > > >in their configuration file that's really bmc-side specific, like
> > > >ipmid, or phosphor-dbus-interface, or something.
> > >
> > > I can make a repo if you would like.  Just let me know what you would
> > > like it called.
>
> Thanks.  I'm working on an IPMI blob toolset, such that there is a
> library that provides host-side blob tooling, and then the flash host
> toolset can link against that library and be used on the host.
>
> So that's my goal.  To get there I was thinking,
> phosphor-ipmi-blobs-tool (or ipmi-blobs-lib) and
> phosphor-ipmi-flash-tool for that side.  The argument against
> ipmi-blobs-lib is that there may end up being some basic tool there
> tool and not just the library -- do you have any preference in this
> case?

Reviewing my goals further, the idea of having an ipmi-blobs-lib or
ipmi-blobslib repo would be helpful.  I could do all the host-side
blob tooling there, and have that be a dependency of
phosphor-ipmi-flash-tool.  Which leaves me with two repo requests:

ipmi-blobslib
phosphor-ipmi-flash-tool

You could add the phosphor prefix to the ipmi-blobslib if you wanted
for consistency since its' meant to work with and on the phosphor
environment.


>
> I'm definitely seeking suggestions on this.
>
> > >
> > > That said, I think you can also probably do this in the same repo, if
> > > you wanted, by having different build targets - it might not make any
> > > sense to try and build both applications with a single invocation of
> > > configure - as you point out, they are being "configured" for vastly
> > > different runtime environments.
