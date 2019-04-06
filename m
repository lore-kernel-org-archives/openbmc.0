Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RRJJUinM"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44bfXh3nGCzDqNP
 for <openbmc@lists.ozlabs.org>; Sat,  6 Apr 2019 12:41:08 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id i17so1082847pfo.6
 for <openbmc@lists.ozlabs.org>; Fri, 05 Apr 2019 18:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0GnvxjxL4CCeus4rZ//tDiUPOnRpQswq/iOsTiLxh9s=;
 b=RRJJUinMeWfnCst9MiFWinLsRFR6XIw15HFAeRAmu75ACWx8evB/zce+st3yEVSlwS
 eQ2aHEhuqoltc5MxGwk554HzspZt0CUX7gTjeII/PFmvCk8DIfPRxZPqz6SEXI6kvl+4
 9piDwTzcQwH8wmIiCcL9zZd20YUS22i5D8SK+AZw+fBwfdgkioQp5eTH2vt/GHpNCqIJ
 FOypzwvWcw+P6/p5BZ0TIi4+CiQAm11pxnO9s3StuThOxi38L8vNHiS2CTAhJk1iqcTv
 +kPJYxJ2SpIyN3h9trbhe2Gix+CWXpjWZmpUx2J9CCJjDF46/CTyGP7lrap5fs2wc5nk
 bUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0GnvxjxL4CCeus4rZ//tDiUPOnRpQswq/iOsTiLxh9s=;
 b=Qfh/OPpv6qWQSyscmtF20ri56Ag6pzq+t96GMbqTe/BO+rG3Ikv4KtJ7H0ABuCBCgf
 vM2wvLgMlvJyA58VoNAaSjwwT4RbKuUQCGwgN6mkdul9wH8dvkcf5YAwERxBqfEbVUJ+
 bY9nDkHTESHO6SYWENTZrd29JX7TE8QWTLCaNkvmOtegaHWiJitwa4LDlsKxgMcN8wv8
 dbuA+IiZmYYgpPzsmY+j0kjcIJSN0ErIWl3wnowILVDOcKZ2VSF+WAPBEVeEPbe798In
 WCXGrtaWsEDdoVGc2yLGe2vtbzLtrhTCBdKhclBAQSDaHkHESXsQ/HOYWo1Ytr7QWO1g
 8jyA==
X-Gm-Message-State: APjAAAVAKwcuJKjbCMzJnsqao7BCQRXpzfZlWiECKwmt5E9YTf6Dqinq
 xathWujUCiuD36z86vItngcHhqDCb7H1mooZw/FAbQ==
X-Google-Smtp-Source: APXvYqz1VIne3Rn2ZAMODeOJcpnjJ8smunjfx8Lw6DB/OC7jtRSlNJXxpYco+TyA0VmQPoBfUHG8leiIV59NUr8F8Ms=
X-Received: by 2002:a62:1197:: with SMTP id 23mr16313570pfr.210.1554514864101; 
 Fri, 05 Apr 2019 18:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190204210735.6wgh7br7l45bj5xc@thinkpad.dyn.fuzziesquirrel.com>
 <20190405180457.m57lsbn6wu6tvjdr@thinkpad>
In-Reply-To: <20190405180457.m57lsbn6wu6tvjdr@thinkpad>
From: Patrick Venture <venture@google.com>
Date: Fri, 5 Apr 2019 18:40:53 -0700
Message-ID: <CAO=notxjMG0tHXOKFoWHsnjOhM-GhHBtD2YxPjcmNADfv6FLew@mail.gmail.com>
Subject: Re: tracking master of upstream openbmc/openbmc subtrees
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 06 Apr 2019 01:41:09 -0000

On Fri, Apr 5, 2019 at 11:04 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, Feb 04, 2019 at 04:07:35PM -0500, Brad Bishop wrote:
> >Hi everyone
> >
> >Just a heads up - in the very near future I'd like to start tracking the
> >master branch of our upstream subtrees - poky, meta-openembedded,
> >meta-security, meta-raspberrypi and meta-xilinx:
> >
> >https://gerrit.openbmc-project.xyz/17387
> >
> >This removes the need to backport fixes from these projects and thinking
> >generally, might increase the collaboration between the OpenBMC
> >community and the upstream communities on which our project so
> >fundamentally depends.
> >
> >In practice this will really just look like:
> >
> >https://github.com/openbmc/openbmc/commit/cdf4859f9e74293090d79c02949fa6a694bdb1d5
> >
> >but the commits will have more content and happen more frequently.
> >
> >There are a couple caveats - one, upstream may break more frequently
> >than it does on the stable branches, and two, given the location of
> >these projects in the stack (low), more frequent rebases will result in
> >some impact to the development workflow (more time building because a
> >patch was applied to gcc, etc).
> >
> >To mitigate number one, I will submit rebases as patches to gerrit where
> >our CI tests can run.  If they find any problems, I won't merge the
> >rebase until a resolution is found.  Additionally if you find any
> >problems via some other channel than our CI, let me know and again I
> >won't apply the rebase until a resolution can be found.  Put another way
> >I don't intend to rebase onto upstreams with known problems for us.
> >
> >To mitigate number two, I was thinking I'd just submit rebases weekly.
> >
> >Questions/concerns?
> >
> >thx - brad
>
> Just a quick update - Thanks to some help and motivation from William
> and others, this will (probably) happen/begin today.  A couple things to
> note.
>
> 1 - If you maintain a layer, you'll need to update your layer
> compatibility like this:
>
> https://gerrit.openbmc-project.xyz/20150

Found some other layers that needed updating.  One of which because
it's part of the CI.  Sent patches for review with the same topic.
Thanks

>
> Although you won't need to keep thud compatibility like that commit
> does.
>
> 2 - I decided to remove rsyslog inclusion by default
> https://gerrit.openbmc-project.xyz/20214 because of
> https://github.com/openbmc/phosphor-logging/issues/19.  This allows us
> to move our upstream subtrees forward and debug
> openbmc/phosphor-logging#19 in parallel - I expect there aren't too many
> users of rsyslog anyway.  If I'm wrong about that please let me know but
> I also expect that issue to get fixed up in the next couple weeks
> regardless.
>
> Please let me know if I've caused anyone pain with any of this.
>
> thx - brad
