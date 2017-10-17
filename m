Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::22d; helo=mail-io0-x22d.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="wV/xG6aI"; 
 dkim-atps=neutral
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGkBd3GDpzDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 05:25:13 +1100 (AEDT)
Received: by mail-io0-x22d.google.com with SMTP id h70so3297400ioi.4
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:to:cc:from:subject:in-reply-to;
 bh=q30LrrBPAgDg8nSW/X0TLu26CPRZNZb0voxYcfa5B/A=;
 b=wV/xG6aI0wfO/8rzCpdMZ/xDb86G1FEio4IgHyE/d9Mcu3PFPGlrRbWdPNp49xYy9R
 46mPnJVeXpwvzkTKCrDckeoNkW9z3kZ6mSP9WXpfLYS6wx3M7SLViC9W0V6I3Y0mR4zy
 EZ2jFNz5kG8tHoLh7CoF6fTcd3g8NI5lKWMX7YzNu4j3m+/pd+i0hsULX2M38LwbFH0T
 FuUicjrOMjMTpcXQaMr2DewdGnRJLRHeACRMZ1Ao5i7SUERkzvvbkC1Y3+1mKGim75Zl
 u5IDnEfJUT1ZBngZ9tTFqBPM6YcNFsOEglgVw6BNzkEQPqaCwB+XZwPHKVUXdkD9oxrC
 +ahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:to:cc:from:subject:in-reply-to;
 bh=q30LrrBPAgDg8nSW/X0TLu26CPRZNZb0voxYcfa5B/A=;
 b=tu6T67YenHLhWoeQsCGyrom0vBr9kxIlBfpcS9n7YP27lSeC6RELJQcoRaeugBKiMd
 A5dg/9wEb0CRg5JFp1Z0BLWqXUZ6o2pz7J5ApyE0jwvg7NgEnor7RgE9NjKreWIo66eJ
 e3LHH8iq9B8+p4/InbZFikBZ9S+TdKOEVkT3kTZI+RKKAEsIFWCLfzrc1ypnOxxi4QTV
 mTEOPW+B8ccrhDrFp/jLcEb1m4sNSJEThOietyQRKeHMg+FLPaGejxiL3O281M35B2D0
 s/uKkNUb7uKlrU/mTcCRitPd79jBM2GtIE93cvuwkbNT9c/T4501d/XFqbUc8h7VBtUb
 su5Q==
X-Gm-Message-State: AMCzsaVXBQ5Of+5k1BoTryYXn/jHnj/yCfQ3eshtVPZPs9pxOt4bEupN
 1hr/jR5PbZe8WUjGXb80LAvCei8ALwM=
X-Google-Smtp-Source: ABhQp+RwA4NNjrrVMGCU4Os0yfhIzT0bWwzxz0uy+5vHimJuR8U30pq2q9pFMMhOBfKTUWJoFWRAew==
X-Received: by 10.107.11.73 with SMTP id v70mr18994550ioi.260.1508264710240;
 Tue, 17 Oct 2017 11:25:10 -0700 (PDT)
Received: from mactruck.svl.corp.google.com
 ([2620:15c:2c5:3:d105:e1d7:d338:d9dc])
 by smtp.gmail.com with ESMTPSA id e15sm5549162ite.31.2017.10.17.11.25.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Oct 2017 11:25:09 -0700 (PDT)
Received: from mactruck.svl.corp.google.com (localhost [127.0.0.1])
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
 id v9HIP8jW021353; Tue, 17 Oct 2017 11:25:08 -0700
Received: (from brendanhiggins@localhost)
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Submit) id v9HIP79Q021352;
 Tue, 17 Oct 2017 11:25:07 -0700
Date: Tue, 17 Oct 2017 11:25:07 -0700
Message-Id: <201710171825.v9HIP79Q021352@mactruck.svl.corp.google.com>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
From: brendanhiggins@google.com
Subject: Re: Machine-scope maintainers for OpenBMC
In-Reply-To: 1507868164.5452.192.camel@aj.id.au
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 18:25:14 -0000

> Hello!
>
> I'm wondering whether we should jot down the maintainers of machines
> supported by OpenBMC, and if so, where? With respect to the latter, one
> candidate might be the MAINTAINERS file in openbmc/docs.

I agree with that idea; this is what the MAINTAINERS file was supposed to be
for. The reason I chose the syntax @repo-name://*, was that the '*' at the end
is supposed to be a file matcher path (this is mentioned in the header of the
document); however, at the time there were no sub-repo owners, hence all the
entries were @repo-name://*.

Nancy and I talked to Brad yesterday and he mentioned that he would like to have
a way to enforce sub-repo permissions, since Gerrit only enforces permissions on
a repo level. We, Google, have recently started doing automated reviews to
verify that Google internal changes had owners that we could go back to durring
a merge/rebase. It should be pretty straightforward to do something similar for
enforcing sub-repo reviewers/maintainers: we could have a bot that would listen
for all new changes (similar to the Jenkins bot) and then add the appropriate
reviewers based on the MAINTAINER file entries; it could also then vote +1/+2
once one or more of the appropriate reviewers have signed off.

Gerrit documentation for doing this type of thing can be found here:
https://gerrit-review.googlesource.com/Documentation/rest-api-changes.html

>
> A related question is: Who are the machine maintainers? Off the top of
> my head I feel the following machines machines match with people:
>
>     meta-evb/meta-evb-raspberrypi                  Yi TZ Li <    shliyi at cn.ibm.com    >
>     meta-evb/meta-evb-aspeed/meta-evb-ast2500      Joel Stanley <    joel at jms.id.au    >
>     meta-x86/meta-mellanox/meta-msn                Mykola Kostenok <    c_mykolak at mellanox.com    >
>     meta-x86/meta-quanta/meta-q71l                 Patrick Venture <    venture at google.com>    , Rick Altherr <    raltherr at google.com    >
>     meta-openpower/meta-ingrasys/meta-zaius        Xo Wang <    xow at google.com    >
>     meta-openpower/meta-ibm/meta-firestone         Lei YU <    mine260309 at gmail.com>    meta-openpower/meta-ibm/meta-romulus           Lei YU <    mine260309 at gmail.com>
> meta-openpower/meta-ibm/meta-witherspoon       Brad Bishop <bradleyb at fuzziesquirrel.com>, Andrew Geissler <geissonator at gmail.com>

I proposed a change that adds the above entries in the syntax that I suggested
above: https://gerrit.openbmc-project.xyz/#/c/7409/

>
> Less obvious are the following machines:
>
>     meta-openpower/meta-ibm/meta-palmetto
>     meta-openpower/meta-ibm/meta-garrison
>     meta-openpower/meta-rackspace/meta-barreleye
>
> Yet another related question is what do we want to do with machines
> that don't have an obvious maintainer?
>
> In the case of Palmetto I imagine we could find someone willing to step
> up (/me ducks). Garrison I'm unsure about, and for Barreleye I've had
> kernel patches on the list for several months with not a lot of
> interest in them, which indicates to me that we could probably drop it.
>
> As some background, Joel and I were recently discussing machine
> maintainers with respect to the dev-4.13 kernel effort. The approach
> Joel kicked off for dev-4.13 was to start from scratch against upstream
> and distribute the forward-porting amongst owners of patches in dev-
> 4.10. That is, if you have patches in dev-4.10 and that are not in
> upstream v4.13, you should rework and send them for us to apply to dev-
> 4.13.

So this is something we have been trying to deal with internally as well, I came
up with a merge/rebase document that described a system for keeping track of
internal changes. At its core, it relies on a set of commit footers:

* Effort - used to specify who the work is for. This makes the project
  responsible for supplying people to address problems supporting these commits.
* Origin - Specifies the original version of an internal commit; used when an
  internal commit is rebased or cherry-picked.
* Dropped - Specifies that a commit is to be dropped in any rebase.
* Upstream - Specifies that a commit is to be dropped if the commit can be found
  in the branch being rebased to.
* Git-repo - used in conjunction with Upstream, used to specify a non-mainline
  upstream repository, this should probably always be an upstream maintainer's
  for-next repository.
* In-review - used to specify where the most recent version of a patch is being 
  reviewed upstream.
* Maintainer - used in exceptionally rare circumstances to identify who is
  responsible for maintaining an internal patch.

We also have an internal GOOGLE_MAINTAINERS file for files that are not
upstream, rather than using the Maintainer footer for everything.

The idea is, that whenever we do a rebase, we can run a script that looks at the
above footers and should be able to resolve most of the issues; either by
automatically dropping the commit, when it has been superceded, or contacting
the appropriate owner when the issue needs to be resolved manually.

Let me know if this sounds useful, and I will get the document in a format that
I can share via email.

>
> To stress the point a bit, the dev-4.13 tree as it stands does not have
> niceties such as `arch/arm/mach-aspeed/aspeed.c` or any of the machine-
> specific devicetree files. The idea is that in addition to distributing
> the workload, we only add back in what we need and try to avoid
> carrying accumulated cruft across moves to new upstream releases.
>
> Whilst the distributed approach eases the workload on Joel, it does
> mean that we could miss things that are required for specific machines
> (the board-file hacks are particularly worrisome). This is driving my
> interest in identifying the maintainers. Having such a list of people
> would, for instance, clarify who ought to be on the review list for
> kernel bumps to openbmc/openbmc in Gerrit. In the case of dev-4.13 this
> would help with the go/no-go decision.
>
> So if you have thoughts on the above or want to put your hand up to
> claim any of the machines in the limbo list above, please do speak up!
>
> Cheers,
>
> Andrew

Cheers
