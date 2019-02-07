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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wN8F5pBRzDqSJ
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 02:51:07 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 7 Feb 2019 10:51:31 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>,
 David Thompson <dthompson@mellanox.com>, Dong Wei <Dong.Wei@arm.com>,
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>
Subject: Re: Initial MCTP design proposal
Message-ID: <20190207155131.gzntyqoflqfw5vld@thinkpad>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
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
X-List-Received-Date: Thu, 07 Feb 2019 15:51:10 -0000

On Fri, Dec 07, 2018 at 10:41:08AM +0800, Jeremy Kerr wrote:
>Hi OpenBMCers!
>
>In an earlier thread, I promised to sketch out a design for a MCTP
>implementation in OpenBMC, and I've included it below.

Hi Jeremy

Were you planning on submitting this to the docs repository as a design?
Do you need some help with that?

I bring this up because another mctp related design has appeared:

https://gerrit.openbmc-project.xyz/18031

I haven't had a chance to determine how (if at all) these two designs
overlap.  Mostly just wanted to bring to your awareness.

thx - brad
