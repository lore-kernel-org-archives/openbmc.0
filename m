Return-Path: <supreeth.venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44FjFD04zrzDqDW
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 07:40:30 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECE07EBD;
 Thu,  7 Mar 2019 12:40:27 -0800 (PST)
Received: from supven01-thinkstation-p720.austin.arm.com
 (supven01-thinkstation-p720.austin.arm.com [10.118.28.44])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9E2E3F71D;
 Thu,  7 Mar 2019 12:40:27 -0800 (PST)
Message-ID: <fe67a0a67bf7208a1a8be74d1f737fc37aea96b1.camel@arm.com>
Subject: Re: Initial MCTP design proposal
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Jeremy Kerr
 <jk@ozlabs.org>,  "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 07 Mar 2019 14:40:27 -0600
In-Reply-To: <76923984-3d27-581b-0541-ae571a441e2d@linux.vnet.ibm.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
 <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
 <20190211185736.dafbfc74n76r33pu@thinkpad.dyn.fuzziesquirrel.com>
 <9c1410a1255d49735b7a9879750557bc92acaa47.camel@ozlabs.org>
 <ad89021d-57a9-980a-6034-8530b81b975c@intel.com>
 <76923984-3d27-581b-0541-ae571a441e2d@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 07 Mar 2019 20:40:32 -0000

On Thu, 2019-03-07 at 14:16 +0530, Deepak Kodihalli wrote:
> On 07/03/19 1:34 AM, Ed Tanous wrote:
> > 
> > On 2/12/19 12:43 AM, Jeremy Kerr wrote:
> > > > To that end I could create an initial empty repository in the
> > > > openbmc
> > > > namespace and you could push your tree there for review, when
> > > > you are
> > > > ready.  How does that sound?
> > 
> > I would like to see this happen.  Once it does, I'll likely push
> > reviews
> > for the commits in this tree to it (which includes both Jeremys
> > commits
> > as well as my own.
> > https://github.com/edtanous/libmctp/commits/pr1
> > 
> > 
> > > 
> > > Yep, I'd be happy to do this when we decide on a good time to do
> > > the
> > > reviews.
> > 
> > I vote the time is now.  Any objections?

+1

> 
> I agree to this as well. I've got two PLDM stacks on my laptop 
> (requester and responder) talking to each other over libmctp (over
> the 
> serial binding - making use of fifos instead of an actual serial 
> connection). I'd like to push a couple small commits to libmctp as
> well 
> (I made a PR for one of them at the moment).
> 
> Regards,
> Deepak
> 

Thanks,
Supreeth
