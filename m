Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="b6dfv1fK"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zTjT3MB6zDqLc
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 04:12:13 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id q206so1544974pgq.4
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 09:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=snXmkm3VVIZ+K/tGK+mouDnrvNSBGw3QQYrfavgA9gQ=;
 b=b6dfv1fKCC94fxwsrzEjD3V4TvcUaM0ZZWAclBRJMiYxnVFg+/ZN5k6xsYsBDpG4mm
 jQF3XcC+vLvusHxWXvAcJppOsx8xSpnGIm7ZYNIkMFf0tdPYSAw7hA1wGLofH8RdxKyC
 Ke8dKWaSASS+Cde+zNW4zFxQEktKj6yQDE3f33oNpSIynLfDizW+6NN4WIp1BrIHRixy
 TNy8quwijJyfRHHenR9ok8OuWiEFH6AkcSoU2HJ/PYMNSsFmIxUo9Owijlg2Taq0CZu3
 L8rGTFYawUPOex3JDAm0e5PZuNc2GuVVgohXwVkfVWpu/rUDrGcLqoTjz6SasLJEd+3k
 uJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=snXmkm3VVIZ+K/tGK+mouDnrvNSBGw3QQYrfavgA9gQ=;
 b=FktHCQ1N0SLKMtTSsvw9JnmAWHKf23i+EpRzZbeMAqWABdWj9sEXQr+GPbzYEkg6FJ
 WzFieoIKiZXmsYIxpsV23NUFbLnyXTykPGoEWinKvjYdmGzKTImY8IMCXEFCE5VmK6/N
 zw0VirJL8lWJMgJE+DKCzB4B9eJbFi9b0UCkfpvQCj+X/znkgyuTyqsaz76AVxMgrJzM
 K+XMIVMytrq8d0jZ7umk/So6BM8oo75Q1O9ryn2iZFqiHhyp6jD/3bj9d9z+jULATEmV
 Puw1rhUBOidTpvTgh6Fqhvc9KofxN839FGZ/X178buFqDQFgE9qvn05rtxY3e+kJcUN4
 dkWA==
X-Gm-Message-State: AHQUAua7tLnAznpOv2G7QNsOWhrJUOGRdaj8ZBFYDk42rOwlzXPItQHb
 lPBVSnreO3qmFZy/r5hKcMFnJu+P828Ma2M02kGrfA==
X-Google-Smtp-Source: AHgI3IbSPZkHvFgr73l8+APt+OdYQRoLus91oGxWMHsV3Q0RB0c4/CX/ueXRTEk32fDNRTngoHZL0K7qy2cnPNhAFig=
X-Received: by 2002:a63:125a:: with SMTP id 26mr4564295pgs.314.1549991530925; 
 Tue, 12 Feb 2019 09:12:10 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
 <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
 <CAPnigKm9Sce7DbBjKf7tGJrgVPyF=2u04GFPW4FTzeHKUHYhTg@mail.gmail.com>
 <CAO=notwCLir90VDFiNHWKwYHuKJ6k7TWrCECkWkAe3QKprc_hg@mail.gmail.com>
 <CAO=notyaqHWYHk3+wekPMLBK_==vwDT-+ccyNMxXPcRKwvPZDQ@mail.gmail.com>
In-Reply-To: <CAO=notyaqHWYHk3+wekPMLBK_==vwDT-+ccyNMxXPcRKwvPZDQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 12 Feb 2019 09:11:59 -0800
Message-ID: <CAO=notyKK7f_rwScw2UDuhJPv7rNJQj5sTpz8N-_M9iO+XR36A@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Feb 2019 17:12:14 -0000

On Mon, Feb 11, 2019 at 3:07 PM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Feb 11, 2019 at 2:58 PM Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Feb 11, 2019 at 11:49 AM William Kennington <wak@google.com> wrote:
> > >
> > > As long as it's possible to build the host side tooling without
> > > building any of the BMC side tooling and vice versa it sounds fine to
> > > me.
> >
> > I've been doing a lot of host-side development lately and I was
> > interested to know what the end result would be.  If someone ran the
> > configuration just to use the tool, they might run into issues.  I've
> > avoided using BMC-side libraries where possible to avoid host-side
> > tool poisoning.
> >
> > >
> > > On Mon, Feb 11, 2019 at 10:51 AM Brad Bishop
> > > <bradleyb@fuzziesquirrel.com> wrote:
> > > >
> > > > On Mon, Feb 11, 2019 at 08:03:17AM -0800, Patrick Venture wrote:
> > > > >Brad,
> > > > >
> > > > >It's my understanding that host-side tools that cooperate with bmc-side
> > > > >tools should be in the same repo,
> > > >
> > > > Is this something I said at some point?  Where is this coming from?
> >
> > I don't have the exact email, and it might have been very very stale
> > information.  But I'm glad to clear this up! :D
> >
> > > >
> > > > >hence why the host-side blobs stuff is in phosphor-ipmi-flash.
> > > > >However, if I add any dependencies to the configuration for the
> > > > >BMC-side, those get in the way of configuring for the host-side.  Would
> > > > >it not make sense to sometimes have it split?  And if so, I would like
> > > > >to propose creating two repos, a blobs library host-side, and a flash
> > > > >tool host-side repo, so those can be neatly split and not have anything
> > > > >in their configuration file that's really bmc-side specific, like
> > > > >ipmid, or phosphor-dbus-interface, or something.
> > > >
> > > > I can make a repo if you would like.  Just let me know what you would
> > > > like it called.
> >
> > Thanks.  I'm working on an IPMI blob toolset, such that there is a
> > library that provides host-side blob tooling, and then the flash host
> > toolset can link against that library and be used on the host.
> >
> > So that's my goal.  To get there I was thinking,
> > phosphor-ipmi-blobs-tool (or ipmi-blobs-lib) and
> > phosphor-ipmi-flash-tool for that side.  The argument against
> > ipmi-blobs-lib is that there may end up being some basic tool there
> > tool and not just the library -- do you have any preference in this
> > case?
>
> Reviewing my goals further, the idea of having an ipmi-blobs-lib or
> ipmi-blobslib repo would be helpful.  I could do all the host-side
> blob tooling there, and have that be a dependency of
> phosphor-ipmi-flash-tool.  Which leaves me with two repo requests:
>
> ipmi-blobslib
> phosphor-ipmi-flash-tool
>
> You could add the phosphor prefix to the ipmi-blobslib if you wanted
> for consistency since its' meant to work with and on the phosphor
> environment.

Brad + William,

I was thinking about this more -- w.r.t the configure script, i could
put the blobs host-side library portion into the phosphor-ipmi-blobs
repo and have it build and install a library.  And could use enable or
disable to only check for things like phosphor-logging if it's being
built for the BMC.  I'm just not sure what the idiomatic approach is
for that -- or maybe a build variable, like "build-host-library=yes"
or something.

Patrick

>
>
> >
> > I'm definitely seeking suggestions on this.
> >
> > > >
> > > > That said, I think you can also probably do this in the same repo, if
> > > > you wanted, by having different build targets - it might not make any
> > > > sense to try and build both applications with a single invocation of
> > > > configure - as you point out, they are being "configured" for vastly
> > > > different runtime environments.
