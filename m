Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BscM06fxyzDqKl
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 22:52:42 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Message-ID: <2da1eb3d655cb6a03882ce22b7ea365dafb71afa.camel@fuzziesquirrel.com>
Subject: Re: ast2600 support
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Beck He <bhe@celestica.com>, openbmc@lists.ozlabs.org
Date: Thu, 17 Sep 2020 08:52:38 -0400
In-Reply-To: <CALPNqoTA7d31GhfM6WfS9bz+RPzMtscpJhuFCYqsV68xV+AV4g@mail.gmail.com>
References: <CALPNqoTA7d31GhfM6WfS9bz+RPzMtscpJhuFCYqsV68xV+AV4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 17 Sep 2020 12:52:45 -0000

On Thu, 2020-09-17 at 17:18 +0800, Beck He wrote:
>   May I know whether OpenBMC has supported the ast2600 BMC chip, I
> noticed
> some code about it, but no 2600evb support in:
> https://github.com/openbmc/openbmc/tree/master/meta-evb/meta-evb-aspeed
> 
> thanks!

The support for ast2600 evb is in meta-aspeed: 
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/conf/machine/evb-ast2600.conf

meta-evb is just a wrapper that adds the openbmc bitbake layers to
bblayers.conf.  You could probably copy paste the ast2500 things and get
it working.

-brad
