Return-Path: <supreeth.venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44F2Ql01cQzDq8x
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 05:31:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB995EBD;
 Wed,  6 Mar 2019 10:31:23 -0800 (PST)
Received: from supven01-ThinkStation-P720.austin.arm.com
 (supven01-ThinkStation-P720.austin.arm.com [10.118.28.44])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A037F3F706;
 Wed,  6 Mar 2019 10:31:23 -0800 (PST)
Message-ID: <f2afd3a89073c03f13830ce071f300ae1df6186c.camel@arm.com>
Subject: Re: anyone interested in chip register error diagnostics?
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Dong Wei
 <Dong.Wei@arm.com>,  "ed.tanous@intel.com" <ed.tanous@intel.com>, zshelle
 <zshelle@linux.vnet.ibm.com>
Date: Wed, 06 Mar 2019 12:31:23 -0600
In-Reply-To: <20190305174139.ya4kvilcng3adfcd@thinkpad>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <D80C3F77-70A1-4ECF-A492-97D6D28B9484@fuzziesquirrel.com>
 <20190305174139.ya4kvilcng3adfcd@thinkpad>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 06 Mar 2019 18:31:27 -0000

On Tue, 2019-03-05 at 12:41 -0500, Brad Bishop wrote:
> On Mon, Mar 04, 2019 at 04:01:16PM -0500, Brad Bishop wrote:
> > oops…I did not mean to take the list off copy.  Adding it back on…
> > 
> > > On Mar 4, 2019, at 3:56 PM, Supreeth Venkatesh <
> > > Supreeth.Venkatesh@arm.com> wrote:
> > > 
> > > 
> > > Thanks Brad.
> > > 
> > > Hi Zane/Brad,
> > > 
> > > On Arm Platforms, We use Common Platform Error Record (CPER) to
> > > report these kinds of hardware errors.
> 
> Supreeth - Is the code that generates these open source?
Yes. 
arm-tf: https://github.com/ARM-software/arm-trusted-firmware
edk2: https://github.com/tianocore/edk2/tree/master/StandaloneMmPkg
