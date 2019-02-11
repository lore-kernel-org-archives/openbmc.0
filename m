Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TRDoYUQL"; 
 dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z1RG2WJKzDqdD
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 09:58:18 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id g6so252281pfh.13
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 14:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1sJmY6LR+lHt7QuYMw6x1zNJHgJJ+N2EzIjJ0l5UCxs=;
 b=TRDoYUQLF2WfYuXtsVa8AHprJkF0XHUQFP0EXppkozk5eIxYFJ+EifmeF1gsnO9miz
 7aF4yG0CHjMrte/orq8gza9op3956bFAAW3ECd7BWo4QHNuXfvQVnujAl5Piii55oFWC
 04LjneNmIUO+thW3/KMchjg/BT0lO93pjSw9Bzr5S0a5d9luLT8K4yf97W81MF14Q4a1
 XPrxgMlnBfeJjXfnn/dEIV6MGQJ91LCjKZDu6lmHhuW+/40PSD3PJ3bcMJnBHGSNJf/2
 qEVAOXnwysdMHWWTyWIQgnq6Sv9CC9OpgaQ9mF5mvka+P3IQQVxgovXQ5ty6yrFjNyOU
 m0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1sJmY6LR+lHt7QuYMw6x1zNJHgJJ+N2EzIjJ0l5UCxs=;
 b=W1HDg+GvIUYVCc43KgLk9cSxNXOBdDUpikn8j+I+asXwGfFmSY3GnYdfg1UE/HjFvG
 7Z4fdPB9IsAetHh8husVgUtuQINsPZgHL215PXeBuor4LW8qhqDNAeKeAqJF8rUgDyab
 66WdWt3EltLJdvEjiL10Jms746MUgLGnoySGU2osfxMtlUQb+wuPXuLDmatb0MfrZVyj
 GXneH/f/eZ/acmHIsSsNG0OOc0IheFxH/sL8eJZbgLbgAUghn66EAZHcQAmK6WB8+Knl
 i5nkU13IEhaXhk7sTxLG3L3qEzNjCGc+6tFXMI0prNAeTCIV1JFUcgjW6XpQp+L+tz1w
 rQBA==
X-Gm-Message-State: AHQUAuYehoDLrhIRK3OlikDpS0mxFhJGfI6TMN+YWVsoT6nCkdGmXzbr
 gVMOdTC+4CDAD7D6bg5Pga3mknm756Sg+PtQ3264TG8blWU=
X-Google-Smtp-Source: AHgI3IbaaKI6zCy9Ks2k55XqLMmQY6wkcYaiFdJgg95QU1F6+VoF4vKzLFyzIYhdC6GYzB0hnkLq65NRPGIeD3KyG7Y=
X-Received: by 2002:a62:7086:: with SMTP id l128mr703887pfc.68.1549925896236; 
 Mon, 11 Feb 2019 14:58:16 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
 <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
 <CAPnigKm9Sce7DbBjKf7tGJrgVPyF=2u04GFPW4FTzeHKUHYhTg@mail.gmail.com>
In-Reply-To: <CAPnigKm9Sce7DbBjKf7tGJrgVPyF=2u04GFPW4FTzeHKUHYhTg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 11 Feb 2019 14:58:04 -0800
Message-ID: <CAO=notwCLir90VDFiNHWKwYHuKJ6k7TWrCECkWkAe3QKprc_hg@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 22:58:19 -0000

On Mon, Feb 11, 2019 at 11:49 AM William Kennington <wak@google.com> wrote:
>
> As long as it's possible to build the host side tooling without
> building any of the BMC side tooling and vice versa it sounds fine to
> me.

I've been doing a lot of host-side development lately and I was
interested to know what the end result would be.  If someone ran the
configuration just to use the tool, they might run into issues.  I've
avoided using BMC-side libraries where possible to avoid host-side
tool poisoning.

>
> On Mon, Feb 11, 2019 at 10:51 AM Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> >
> > On Mon, Feb 11, 2019 at 08:03:17AM -0800, Patrick Venture wrote:
> > >Brad,
> > >
> > >It's my understanding that host-side tools that cooperate with bmc-side
> > >tools should be in the same repo,
> >
> > Is this something I said at some point?  Where is this coming from?

I don't have the exact email, and it might have been very very stale
information.  But I'm glad to clear this up! :D

> >
> > >hence why the host-side blobs stuff is in phosphor-ipmi-flash.
> > >However, if I add any dependencies to the configuration for the
> > >BMC-side, those get in the way of configuring for the host-side.  Would
> > >it not make sense to sometimes have it split?  And if so, I would like
> > >to propose creating two repos, a blobs library host-side, and a flash
> > >tool host-side repo, so those can be neatly split and not have anything
> > >in their configuration file that's really bmc-side specific, like
> > >ipmid, or phosphor-dbus-interface, or something.
> >
> > I can make a repo if you would like.  Just let me know what you would
> > like it called.

Thanks.  I'm working on an IPMI blob toolset, such that there is a
library that provides host-side blob tooling, and then the flash host
toolset can link against that library and be used on the host.

So that's my goal.  To get there I was thinking,
phosphor-ipmi-blobs-tool (or ipmi-blobs-lib) and
phosphor-ipmi-flash-tool for that side.  The argument against
ipmi-blobs-lib is that there may end up being some basic tool there
tool and not just the library -- do you have any preference in this
case?

I'm definitely seeking suggestions on this.

> >
> > That said, I think you can also probably do this in the same repo, if
> > you wanted, by having different build targets - it might not make any
> > sense to try and build both applications with a single invocation of
> > configure - as you point out, they are being "configured" for vastly
> > different runtime environments.
