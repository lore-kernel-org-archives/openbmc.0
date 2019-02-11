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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yw501mCnzDqMb
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 05:57:08 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 11 Feb 2019 13:57:36 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 David Thompson <dthompson@mellanox.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>, Dong Wei <Dong.Wei@arm.com>
Subject: Re: Initial MCTP design proposal
Message-ID: <20190211185736.dafbfc74n76r33pu@thinkpad.dyn.fuzziesquirrel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
 <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
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
X-List-Received-Date: Mon, 11 Feb 2019 18:57:08 -0000

>If we go ahead with the MCTP designs, and want to use this, I'd propose
>moving it from my personal github repo into /openbmc/ (after suitable
>updates to get it into OpenBMC standards, of course). Patches welcome!

There was some interest in performing a formal code review on Gerrit of
what you have written thus far (or intend to distribute).

To that end I could create an initial empty repository in the openbmc
namespace and you could push your tree there for review, when you are
ready.  How does that sound?
