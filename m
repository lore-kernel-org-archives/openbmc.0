Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::233; helo=mail-io0-x233.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GaJeiXNt"; 
 dkim-atps=neutral
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHVGD0HFszDqBH
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 11:30:58 +1100 (AEDT)
Received: by mail-io0-x233.google.com with SMTP id 97so8151350iok.7
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 17:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:to:cc:from:subject:in-reply-to;
 bh=2P0pVN+igIsPTUd6VeyPDwg4spxe9wcluVu2EjmnUMM=;
 b=GaJeiXNtYgNGLnSx/Hjn5OHvSx05gjUz4iqa0gtEjg0SA4TqaTFQEFGg8a9jrvJusB
 YFU1hJAjZpiQOh07QA1ayY6w92Lrc6qgBfjRct5pHnYL02D+moeQZcFLaNtPQOGHd0qI
 YAqOG8CVDqEn38k9mWM7L6+QVXWL9b24qqyOKFZvsy9TKDywrlWOyZyncammW7TeGhgd
 L9HyGaWoHpqRD8mBZbNMv99+XeoQjMlNpj7gMCeEcJE485jO3ae+RBsBazvoMuyemnCw
 HbWpnQsFSEXEtg3eHT33BpWyYh/TjlAJ7aU/oXYYoSJBdaScjCQh6WI7ImDKJTFf3+QH
 JfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:to:cc:from:subject:in-reply-to;
 bh=2P0pVN+igIsPTUd6VeyPDwg4spxe9wcluVu2EjmnUMM=;
 b=feyuPiq4/NIMaDKIIXQYbJ2ukwEALukFy/q7VYXZtfJ/t7kSZeVanlmyVbmFDg8gWJ
 4fgBoKaIkUy7uY2sTz57jcAyjhEjX/lcYlkk7+RnoqJApJ6+2kMvcgwJDkfFL4hRM6Gr
 DdYu0OhB0zz89a8RcSuRs0CwdLpSfiSJ3gP7FLj0uUgFQ+aBXhEkZdhB/e8JdRTioQdl
 VT9NtmWKdEM7hsPF8kj3WNRHWMZrRlhY6t5mctHvFxu7dTDVVkJJ2zhD8sUYJgWyqwgZ
 UaMaebQD+OU+xjRoi3WURyJk5ywgqqXgynK6FAZM5Jdv8YbxUPR8eGbUpjW3rsoH5T5F
 zeKg==
X-Gm-Message-State: AMCzsaX6f7nmdUcsh/5GWI0eZhkn7XbiU+lvsP+FO8fC3XT25tUUTiv9
 6G/L7CyQSatb9raVWymH1q6roXwOLgY=
X-Google-Smtp-Source: ABhQp+SeelIS5tjSVZol4XldtMeUY0V9pITn0nAcUVYhe+CCMCq7w+50MqKcx0wfIeSY2vOnkrkRhQ==
X-Received: by 10.107.114.18 with SMTP id n18mr432009ioc.105.1508373056346;
 Wed, 18 Oct 2017 17:30:56 -0700 (PDT)
Received: from mactruck.svl.corp.google.com
 ([2620:15c:2c5:3:61fb:ee5a:34c7:9b7d])
 by smtp.gmail.com with ESMTPSA id d16sm4350157iod.38.2017.10.18.17.30.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Oct 2017 17:30:55 -0700 (PDT)
Received: from mactruck.svl.corp.google.com (localhost [127.0.0.1])
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
 id v9J0UsuQ009861; Wed, 18 Oct 2017 17:30:54 -0700
Received: (from brendanhiggins@localhost)
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Submit) id v9J0FMXA004897;
 Wed, 18 Oct 2017 17:15:22 -0700
Date: Wed, 18 Oct 2017 17:15:22 -0700
Message-Id: <201710190015.v9J0FMXA004897@mactruck.svl.corp.google.com>
To: andrew@aj.id.au, joel@jms.id.au, bradleyb@fuzziesquirrel.com,
 yuenn@google.com
Cc: openbmc@lists.ozlabs.org
From: brendanhiggins@google.com
Subject: Re: Machine-scope maintainers for OpenBMC
In-Reply-To: 1508285598.24322.19.camel@aj.id.au
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
X-List-Received-Date: Thu, 19 Oct 2017 00:31:01 -0000

> On Tue, 2017-10-17 at 11:25 -0700, brendanhiggins at google.com wrote:
> > > Hello!
> > >
> > > I'm wondering whether we should jot down the maintainers of machines
> > > supported by OpenBMC, and if so, where? With respect to the latter, one
> > > candidate might be the MAINTAINERS file in openbmc/docs.
> >
> > I agree with that idea; this is what the MAINTAINERS file was supposed to be
> > for. The reason I chose the syntax @repo-name://*, was that the '*' at the end
> > is supposed to be a file matcher path (this is mentioned in the header of the
> > document); however, at the time there were no sub-repo owners, hence all the
> > entries were @repo-name://*.
>
> Indeed! Given it's a per-repo description it may get a bit unwieldy but we'll
> see how it turns out. Primarily, my concern is that we will have to at least
> describe paths in the kernel repo, paths in the openbmc/openbmc repo, and
> possibly a bunch of others. I'm curious if there isn't a more effective way to
> resolve this, but there's probably not as that's how the code is structured
> (and if we want to have something like get_maintainers.pl, then it needs to
> know about these paths).

True, maybe there will be some way to shard the file in the future? If we only
have the MAINTAINERS file at the root of each repo, it still does not need to
know much about the code structure, but we loose the ability to have one
MAINTAINERS file that describes cross repository machine ownership, which might
be valuable. Time might provide the best insight on this.

>
> >
> > Nancy and I talked to Brad yesterday and he mentioned that he would like to have
> > a way to enforce sub-repo permissions, since Gerrit only enforces permissions on
> > a repo level. We, Google, have recently started doing automated reviews to
> > verify that Google internal changes had owners that we could go back to durring
> > a merge/rebase.
>
> Can you expand on what you are talking about here? You've piqued my interest.

Sure, I wrote a Gerrit bot that looks at the commit messages on changes
submitted to Gerrit. This bot, which I named Gerrit Watcher, checks that the
footers, discussed in my linux-change-tracking doc, are present and that the
commit is appropriately maintained by someone.

If the change is not "Upstream" or "In-review" (also discussed in the doc),
Gerrit Watcher checks that all affected files are listed in Google's MAINTAINERS
file (with some exceptions). This is logically similar to what we would want to
do here, since we would be scanning our @docs://MAINTAINERS file for matching
entries and then adding those people to the review and then want to make sure
that they actually had a chance to do the review.

>
> > It should be pretty straightforward to do something similar for
> > enforcing sub-repo reviewers/maintainers: we could have a bot that would listen
> > for all new changes (similar to the Jenkins bot) and then add the appropriate
> > reviewers based on the MAINTAINER file entries; it could also then vote +1/+2
> > once one or more of the appropriate reviewers have signed off.
>
> Right. There are gerrit plugins that can auto-assign reviewers based on
> git-blame and such, maybe we could also massage one of those. Is there much
> benefit in the bot assigning a score?

Having the bot assign a score is just provides a zero effort way to see that the
change has gotten the appropriate reviews. We might not require that all
reviewers sign-off on a change, but only the people listed in
@docs://MAINTAINERS, or maybe even a subset of them; that might not be entirely
obvious to whoever is responsible for merging the change.

Just a thought. Maybe it is better to just make sure people are keeping up with
who is looking at the reviews. Or maybe we should be more liberal with who gets
to +2.

>
> >
> > Gerrit documentation for doing this type of thing can be found here:
> > https://gerrit-review.googlesource.com/Documentation/rest-api-changes.html
> >
> > >
> > > A related question is: Who are the machine maintainers? Off the top of
> > > my head I feel the following machines machines match with people:
> > >
> > >     meta-evb/meta-evb-raspberrypi                  Yi TZ Li <shliyi at cn.ibm.com>
> > >     meta-evb/meta-evb-aspeed/meta-evb-ast2500      Joel Stanley <joel at jms.id.au>
> > >     meta-x86/meta-mellanox/meta-msn                Mykola Kostenok <c_mykolak at mellanox.com>
> > >     meta-x86/meta-quanta/meta-q71l                 Patrick Venture <venture at google.com>    , Rick Altherr <raltherr at google.com>
> > >     meta-openpower/meta-ingrasys/meta-zaius        Xo Wang <xow at google.com>
> > >     meta-openpower/meta-ibm/meta-firestone         Lei YU <mine260309 at gmail.com>
> > >     meta-openpower/meta-ibm/meta-romulus           Lei YU <mine260309 at gmail.com>
> > >     meta-openpower/meta-ibm/meta-witherspoon       Brad Bishop <bradleyb at fuzziesquirrel.com>, Andrew Geissler <geissonator at gmail.com>
> >
> > I proposed a change that adds the above entries in the syntax that I suggested
> > above: https://gerrit.openbmc-project.xyz/#/c/7409/
>
> Thanks, I'll take a look.
>
> >
> > >
> > > Less obvious are the following machines:
> > >
> > >     meta-openpower/meta-ibm/meta-palmetto
> > >     meta-openpower/meta-ibm/meta-garrison
> > >     meta-openpower/meta-rackspace/meta-barreleye
> > >
> > > Yet another related question is what do we want to do with machines
> > > that don't have an obvious maintainer?
> > >
> > > In the case of Palmetto I imagine we could find someone willing to step
> > > up (/me ducks). Garrison I'm unsure about, and for Barreleye I've had
> > > kernel patches on the list for several months with not a lot of
> > > interest in them, which indicates to me that we could probably drop it.
> > >
> > > As some background, Joel and I were recently discussing machine
> > > maintainers with respect to the dev-4.13 kernel effort. The approach
> > > Joel kicked off for dev-4.13 was to start from scratch against upstream
> > > and distribute the forward-porting amongst owners of patches in dev-
> > > 4.10. That is, if you have patches in dev-4.10 and that are not in
> > > upstream v4.13, you should rework and send them for us to apply to dev-
> > > 4.13.
> >
> > So this is something we have been trying to deal with internally as well, I came
> > up with a merge/rebase document that described a system for keeping track of
> > internal changes. At its core, it relies on a set of commit footers:
> >
> > * Effort - used to specify who the work is for. This makes the project
> >   responsible for supplying people to address problems supporting these commits.
> > * Origin - Specifies the original version of an internal commit; used when an
> >   internal commit is rebased or cherry-picked.
> > * Dropped - Specifies that a commit is to be dropped in any rebase.
> > * Upstream - Specifies that a commit is to be dropped if the commit can be found
> >   in the branch being rebased to.
> > * Git-repo - used in conjunction with Upstream, used to specify a non-mainline
> >   upstream repository, this should probably always be an upstream maintainer's
> >   for-next repository.
> > * In-review - used to specify where the most recent version of a patch is being
> >   reviewed upstream.
> > * Maintainer - used in exceptionally rare circumstances to identify who is
> >   responsible for maintaining an internal patch.
> >
> > We also have an internal GOOGLE_MAINTAINERS file for files that are not
> > upstream, rather than using the Maintainer footer for everything.
> >
> > The idea is, that whenever we do a rebase, we can run a script that looks at the
> > above footers and should be able to resolve most of the issues; either by
> > automatically dropping the commit, when it has been superceded, or contacting
> > the appropriate owner when the issue needs to be resolved manually.
> >
> > Let me know if this sounds useful, and I will get the document in a format that
> > I can share via email.
>
> I'd certainly like to explore this more, so if you can share please do! I'd
> like to get feedback from people on the list (primarily those affected,
> particularly Joel, and I expect Brad will be interested).

Cool, originally I was going to scrub our internal change tracking doc and
attach it below as markdown, but then I decided that it would not take much more
work to make it OpenBMC specific, so I just went ahead and did it. I posted it
as an RFC here: https://gerrit.openbmc-project.xyz/#/c/7435/. Let me know what
you think!

>
> Thanks for the detailed reply, clearly it's something that's bothered people
> besides Joel and I. If it's bothered people beyond us and Google, I'd love to
> hear your solutions if you've got so far as having any.
>
> Andrew

Cheers!
