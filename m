Return-Path: <supreeth.venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44F2J31ptTzDq63
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 05:25:36 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0DC0EBD;
 Wed,  6 Mar 2019 10:25:33 -0800 (PST)
Received: from supven01-ThinkStation-P720.austin.arm.com
 (supven01-ThinkStation-P720.austin.arm.com [10.118.28.44])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 843F93F706;
 Wed,  6 Mar 2019 10:25:33 -0800 (PST)
Message-ID: <eca208264ee44e17ec86371aeaf3bce1dc36e1e5.camel@arm.com>
Subject: Re: anyone interested in chip register error diagnostics?
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: zshelle <zshelle@linux.vnet.ibm.com>, Dong Wei <Dong.Wei@arm.com>, 
 ed.tanous@intel.com, openbmc@lists.ozlabs.org
Date: Wed, 06 Mar 2019 12:25:33 -0600
In-Reply-To: <20190305173938.tdcz4cxtomxz2cbh@thinkpad>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <3d72867607bc75b18960223dc8cea114@linux.vnet.ibm.com>
 <d68f47712a2b0b82dfa4c313fc899afd1e37e529.camel@arm.com>
 <20190305173938.tdcz4cxtomxz2cbh@thinkpad>
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
X-List-Received-Date: Wed, 06 Mar 2019 18:25:40 -0000

On Tue, 2019-03-05 at 12:39 -0500, Brad Bishop wrote:
> On Mon, Mar 04, 2019 at 05:53:45PM -0600, Supreeth Venkatesh wrote:
> > On Mon, 2019-03-04 at 16:44 -0600, zshelle wrote:
> > On Arm platforms also, There are several error syndrome registers
> > which
> > are read.
> > This information leads to contruction of CPER record which will be
> > used
> > by OS to take service actions as per RAS policy.
> > 
> > After reading 18831, it looks like you want to move error data
> > collection to BMC from host firmware and for that you collect all
> > fault
> > isolation registers.
> 
> It isn't really moving - we run it on the host as well as the BMC,
> for
> situations where the POWER processor is not able to execute
> instructions
> due to a malfunction somewhere.
Thanks for the clarification Brad.

> 
> > Is there a security implication here?
> 
> Are you able to expand on this?
Yes. I meant if this involves direct host/target register access from
BMC, then there may be a security issue. 
However, from Zane's reply, it does not seem to be the case.    


> 
> > 
> > Thank you for the proposal, I will read 18591 thoroughly to
> > understand,
> > whether we can reuse this on arm architecture.
> 
> Thanks Supreeth!
