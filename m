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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tgJK6CxgzDqC9
 for <openbmc@lists.ozlabs.org>; Tue,  5 Feb 2019 08:07:13 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 4 Feb 2019 16:07:35 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: tracking master of upstream openbmc/openbmc subtrees
Message-ID: <20190204210735.6wgh7br7l45bj5xc@thinkpad.dyn.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
X-List-Received-Date: Mon, 04 Feb 2019 21:07:14 -0000

Hi everyone

Just a heads up - in the very near future I'd like to start tracking the
master branch of our upstream subtrees - poky, meta-openembedded,
meta-security, meta-raspberrypi and meta-xilinx:

https://gerrit.openbmc-project.xyz/17387

This removes the need to backport fixes from these projects and thinking
generally, might increase the collaboration between the OpenBMC
community and the upstream communities on which our project so
fundamentally depends.

In practice this will really just look like:

https://github.com/openbmc/openbmc/commit/cdf4859f9e74293090d79c02949fa6a694bdb1d5

but the commits will have more content and happen more frequently.

There are a couple caveats - one, upstream may break more frequently
than it does on the stable branches, and two, given the location of
these projects in the stack (low), more frequent rebases will result in
some impact to the development workflow (more time building because a
patch was applied to gcc, etc).

To mitigate number one, I will submit rebases as patches to gerrit where
our CI tests can run.  If they find any problems, I won't merge the
rebase until a resolution is found.  Additionally if you find any
problems via some other channel than our CI, let me know and again I
won't apply the rebase until a resolution can be found.  Put another way
I don't intend to rebase onto upstreams with known problems for us.

To mitigate number two, I was thinking I'd just submit rebases weekly.

Questions/concerns?

thx - brad
