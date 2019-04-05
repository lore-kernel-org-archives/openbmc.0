Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44bSPZ1y0DzDqTM
 for <openbmc@lists.ozlabs.org>; Sat,  6 Apr 2019 05:04:17 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Fri, 5 Apr 2019 14:04:57 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: tracking master of upstream openbmc/openbmc subtrees
Message-ID: <20190405180457.m57lsbn6wu6tvjdr@thinkpad>
References: <20190204210735.6wgh7br7l45bj5xc@thinkpad.dyn.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190204210735.6wgh7br7l45bj5xc@thinkpad.dyn.fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 05 Apr 2019 18:04:18 -0000

On Mon, Feb 04, 2019 at 04:07:35PM -0500, Brad Bishop wrote:
>Hi everyone
>
>Just a heads up - in the very near future I'd like to start tracking the
>master branch of our upstream subtrees - poky, meta-openembedded,
>meta-security, meta-raspberrypi and meta-xilinx:
>
>https://gerrit.openbmc-project.xyz/17387
>
>This removes the need to backport fixes from these projects and thinking
>generally, might increase the collaboration between the OpenBMC
>community and the upstream communities on which our project so
>fundamentally depends.
>
>In practice this will really just look like:
>
>https://github.com/openbmc/openbmc/commit/cdf4859f9e74293090d79c02949fa6a694bdb1d5
>
>but the commits will have more content and happen more frequently.
>
>There are a couple caveats - one, upstream may break more frequently
>than it does on the stable branches, and two, given the location of
>these projects in the stack (low), more frequent rebases will result in
>some impact to the development workflow (more time building because a
>patch was applied to gcc, etc).
>
>To mitigate number one, I will submit rebases as patches to gerrit where
>our CI tests can run.  If they find any problems, I won't merge the
>rebase until a resolution is found.  Additionally if you find any
>problems via some other channel than our CI, let me know and again I
>won't apply the rebase until a resolution can be found.  Put another way
>I don't intend to rebase onto upstreams with known problems for us.
>
>To mitigate number two, I was thinking I'd just submit rebases weekly.
>
>Questions/concerns?
>
>thx - brad

Just a quick update - Thanks to some help and motivation from William
and others, this will (probably) happen/begin today.  A couple things to
note.

1 - If you maintain a layer, you'll need to update your layer
compatibility like this:

https://gerrit.openbmc-project.xyz/20150

Although you won't need to keep thud compatibility like that commit
does.

2 - I decided to remove rsyslog inclusion by default
https://gerrit.openbmc-project.xyz/20214 because of
https://github.com/openbmc/phosphor-logging/issues/19.  This allows us
to move our upstream subtrees forward and debug
openbmc/phosphor-logging#19 in parallel - I expect there aren't too many
users of rsyslog anyway.  If I'm wrong about that please let me know but
I also expect that issue to get fixed up in the next couple weeks
regardless.

Please let me know if I've caused anyone pain with any of this.

thx - brad
