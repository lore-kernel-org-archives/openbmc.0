Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDvFs5RJtzDqPX
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 11:05:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FqXqHI3I; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id g64so12491171pfb.2
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i6sVoSKYAmK6PnJcZJ9bFnNYX9xVg0F+YmkL3Vz2sM4=;
 b=FqXqHI3IxFWlIQfjysPGNxRm5WSH9iiX8LFRRoHVdax5hzG+Gk8UKPd+9+O8RAIoqB
 qxjm5opZrp6iQvwxJ8OM0YFqtSKdAYJbbMFzPtc/v9uvmzhyeZZOrQM0I/qSsbgRMwpo
 WVnTbtMtnvQi/CgbxdPdE7hpmNvaFioVNmFyH8Xu2G1mBAAtdlgyU6xuWbOc6UvOBhQ2
 vtDOXk3r/grf4fzCtrklquGWfvmX70GNfz9PsCeftO6/d+RrDaOD6LC7hDR9F6lpebaF
 tAc8CApwty/XZgUmm8h8OwBxuE6EruK+5Pm9GjNcOAdOPKEBvza4tbboXnocOQYtwYUO
 sVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6sVoSKYAmK6PnJcZJ9bFnNYX9xVg0F+YmkL3Vz2sM4=;
 b=M8hGKJMhy2HxDUUh4RYJadeP8ukPN4WJZt3DFOqFGKeAwFVyX84zA4IDyup/jApK2J
 1JemkChy3K6x1hZWfX0mT9LlMXp0zSFfWRSA0QzLMvRAdloGqsUAr83eVfs82uvxq3uk
 DXiSIyY/PZRLYDyaxxWmBVSm9gdhY+J9dLASJdqnwBikbWqGFxR4iiTdy5CkRDOfa2fT
 jLGmOZGSlj2HIDB65ApP2wOaN+modjPsudzxviY83Fzxo2RXvuw9wLGoTPT8meMRTFtT
 TeH4u3FsxcyuthiWup3v22t7IhGnPPcRfgl2MJkE3tlPTYKRZ0a8Nk0gTs71gkA8/355
 0ACw==
X-Gm-Message-State: ALyK8tKHZAGsGSZQwyL2ah5R5zPSdtVJhfsHffvHI1r0qCpVhjF/25e1uQ0bNyRMDArp7Q==
X-Received: by 10.98.58.84 with SMTP id h81mr1658512pfa.93.1464138302304;
 Tue, 24 May 2016 18:05:02 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 63sm57048272pff.43.2016.05.24.18.05.00
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 24 May 2016 18:05:02 -0700 (PDT)
Date: Wed, 25 May 2016 11:04:52 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Hi contributors!
Message-ID: <20160525110452.664dd58a@camb691>
In-Reply-To: <20160524200349.GN19968@asimov.austin.ibm.com>
References: <20160524153000.0a505092@camb691>
 <20160524200349.GN19968@asimov.austin.ibm.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2016 01:05:06 -0000

On Tue, 24 May 2016 15:03:50 -0500
Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, May 24, 2016 at 03:30:00PM +1000, Cyril Bur wrote:
> > ...
> > Sincerely,
> > 
> > Cyril
> > _______________________________________________  
> 
> Cyril,
> 
> You wrote a lot.
> 
> On commit messages:
>     I totally agree.  Poor commit messages are a pet peeve of mine as
>     well.  I also recommend http://chris.beams.io/posts/git-commit/ .
>     Going forward, I will attempt to do a better job of encouraging
>     better formed messages in reviews.
> 

Someone in ozlabs (who heard me ranting over the past few days as I wrote all
that) pointed out that part of the issue there is that good commit or bad
commit message, code gets merged. There is no incentive for contributors to put
any effort there.

> On git documentation:
>     Thanks for the write up.  Rather than put yet another git tutorial
>     in a wiki, I would prefer we point to a good existing tutorial.  For
>     some reason new people seem to always want a "cookbook" of simple
>     git commands.  [Un]Fortunately, nothing in git is that simple.

Yeah I won't put it in the wiki. I didn't expect to have to write quite as much
myself, when I started I thought I'd put a series of links to existing stuff
but all I could find was the 'perfect workflow' style thing that didn't address
what I (hope) I did.

There's a blog I sometimes contribute to, I think I'll expand a bit and write a
full post there if even more googling doesn't yield a good existing tutorial

> 
> On Reviews:
>     We do have a problem with some people reviewing in Github
>     (Reviewable.io) and some people reviewing via mailing list.  We also
>     have an issue with maintainers not ensuring all comments have been
>     addressed.
> 
>     We discussed at the Wed (5/18 PM for US) call last week how to do
>     reviews going forward.  We agreed to the following:
>         1) For OpenBMC specific packages we are going to set up a Gerrit
>            server for all code reviews.  There is a Github integration
>            module for Gerrit that allows mirroring pull requests into
>            Gerrit and replicating merged code back to Github.  Look for
>            this in the near future.

Word of this has peculated to us in Canberra. Admittedly a lot of us are stuck
in our ways for better and (probably worse). After the debacle involving
github/reviewable I will admit I wasn't thrilled to hear that some other tool
was being considered and we aren't just going to use mailing lists.

Joel did step in here and back Gerrit and say that it can be used to improve
productivity and not be a hindrance. Of course it remains to be seen if our
employer who fails at giving people correct emails solutions can give us a
'real and useable' Gerrit instance.

>         2) For packages we are modifying from upstream, we should use
>            upstream method (ie. mailing lists for kernel, yocto, etc.).
>            Patches accepted into the openbmc meta-layers should have
>            already be submitted upstream and have a reasonable
>            confidence about their long-term acceptance.
>         3) For packages we are _temporarily_ forking from upstream, to
>            do significant and focused development on, we can use either
>            Gerrit or this mailing list.  Eventually, changes should be
>            submitted, via path #2, upstream.
> 

Can't say I have strong opinions, 3 feels like it is just a subset of 2
though...

>     Once we get the Gerrit server in place, I plan to deprecate the
>     automatic pull-request mailer.
> 
> On 'Reply-All' issue with patches:
>     At some level, this is an intrinsic problem with Github.  People can

I was afraid of this

>     optionally set their Github profile to "Hide my email address
>     whenever possible."  The content for the cover letter comes from the
>     pull request information they have entered into the Github
>     web-field.  When my patch mailer gets the content from the pull
>     request to make the cover letter, it has to ask Github for their
>     email address.  For people who have hidden their email address in
>     their profile this yields something like "Joe Developer
>     <joey_d@users.github.com>" (I forget the exact format off the top of
>     my head).  Unfortunately, this means my auto-mailer and anyone
>     responding to the cover gets lots of bounces, so I disabled the
>     auto-cc on the cover.  (There is an obvious solution to filter out
>     the @...github.com email addresses but I haven't had the spare
>     cycles).
> 
>     For the code patches themselves, I use git-format-patch and
>     git-send-email and I don't think I suppress-cc at all.  That means
>     the author, per the commit message, should be cc'd.
> 
>     Like I said early, this script is planned to be deprecated at some
>     point in the not-too-distant future anyhow.

Sounds like the sooner we move away from the github solution the better, this
problem goes away once we inforce a 'this is through Gerrit' or 'this is
through the list' and github can stop polluting the list.

Looking forward to a new and improved openbmc soon!!

> 
