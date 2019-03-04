Return-Path: <supreeth.venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Cxgl720mzDqFY
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 10:53:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B08B80D;
 Mon,  4 Mar 2019 15:53:46 -0800 (PST)
Received: from supven01-thinkstation-p720.austin.arm.com
 (supven01-thinkstation-p720.austin.arm.com [10.118.28.44])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B8E03F706;
 Mon,  4 Mar 2019 15:53:46 -0800 (PST)
Message-ID: <d68f47712a2b0b82dfa4c313fc899afd1e37e529.camel@arm.com>
Subject: Re: anyone interested in chip register error diagnostics?
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: zshelle <zshelle@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, ed.tanous@intel.com, Dong Wei
 <Dong.Wei@arm.com>, openbmc@lists.ozlabs.org
Date: Mon, 04 Mar 2019 17:53:45 -0600
In-Reply-To: <3d72867607bc75b18960223dc8cea114@linux.vnet.ibm.com>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <3d72867607bc75b18960223dc8cea114@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 04 Mar 2019 23:53:56 -0000

On Mon, 2019-03-04 at 16:44 -0600, zshelle wrote:
> On 2019-03-04 14:56, Supreeth Venkatesh wrote:
> > Thanks Brad.
> > 
> > Hi Zane/Brad,
> > 
> > On Arm Platforms, We use Common Platform Error Record (CPER) to
> > report
> > these kinds of hardware errors.
> > The format of the errors are defined in Appendix N in UEFI 
> > specification
> > 
http://www.uefi.org/sites/default/files/resources/UEFI%20Spec%202_7_A%20Sept%206.pdf
> > 
> > I have not read the proposal in its entirety, but this seems
> > similar
> > to Reliability, Availability, Serviceability (RAS) feature using
> > System Management Mode/Management Mode, but on the BMC side.
> > 
> > I will take a look at the reviews posted and provide more feedback.
> > 
> > If this is something similar to RAS feature, I have in fact
> > proposed
> > in DMTF PMCI WG to include CPER formats to be added to one of
> > the PLDM specifications.
> > 
> > Arm would be interested in the design of this component, if it can
> > accommodate the above error formats and component can be designed
> > in
> > an architecture agnostic way.
> > 
> > Thanks,
> > Supreeth
> > 
> > -----Original Message-----
> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > Sent: Monday, March 4, 2019 2:38 PM
> > To: zshelle <zshelle@linux.vnet.ibm.com>; Supreeth Venkatesh
> > <Supreeth.Venkatesh@arm.com>; ed.tanous@intel.com
> > Subject: Re: anyone interested in chip register error diagnostics?
> > 
> > On Mon, Mar 04, 2019 at 02:22:45PM -0600, zshelle wrote:
> > > On POWER, I work on a component that listens for hardware errors
> > > reported by registers in the system chips (processors, memory
> > > buffers,
> > > I/O chips, etc.) and performs service actions based on those
> > > errors. I
> > > have been working on porting some of this code to the BMC for
> > > system
> > > fatal error analysis (see my work-in-progress proposals:
> > > https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18591/ and
> > > https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18831/). As
> > > part
> > > of the new design, we are building a generic, data-driven
> > > register
> > > error isolator, which will be used by several applications within
> > > POWER. However, it has the potential to be useful on other
> > > architectures as well. I am curious if anyone in the community is
> > > interested in this.
> > 
> > Thanks Zane - I'll tag Ed(x86) and Supreeth(arm) on this one.  Ed,
> > Supreeth - do you understand the function being proposed here?  How
> > does this work on x86 and arm servers?
> > 
> > thx - brad
> > IMPORTANT NOTICE: The contents of this email and any attachments
> > are
> > confidential and may also be privileged. If you are not the
> > intended
> > recipient, please notify the sender immediately and do not disclose
> > the contents to any other person, use it for any purpose, or store
> > or
> > copy the information in any medium. Thank you.
> 
> Looks like CPER is similar to IBM's Platform Error Log (PEL). At
> this 
> time, I am not really focused on the log format at the moment, but it
> is 
> on my list of things to investigate. I heard a rumor that there may
> be a 
> standard "OpenBMC" logging mechanism in the works. With those, you
> could 
> convert them into the CPER or PEL format if needed.
Ok. You are not currently focussed on format of the log itself but
rather on the error syndrome/fault registers. Right?
However, at present, error syndrome information gathered from the fault
registers are converted to CPER/PEL format for logging purposes in the
host firmware/microcontroller firmware.

> 
> My proposals are more focused on reading the registers from hardware
> and 
> determining what caused the error. On POWER, we have hundreds of what
> we 
> call fault isolation registers (FIRs), where each bit within those 
> registers can signify a different hardware error event. It is also 
> possible that there may be several active bits on at the same time.
> So 
> my component will sort through all of those registers, find the
> active 
> bits, and determine what is the root cause of the failure versus 
> side-effect errors. Once root cause is determined, we then perform
> any 
> services actions defined by our RAS team (and commit a log). Is
> there 
> anything like this on ARM?
On Arm platforms also, There are several error syndrome registers which
are read. 
This information leads to contruction of CPER record which will be used
by OS to take service actions as per RAS policy.

After reading 18831, it looks like you want to move error data
collection to BMC from host firmware and for that you collect all fault
isolation registers.
Is there a security implication here?

Thank you for the proposal, I will read 18591 thoroughly to understand,
whether we can reuse this on arm architecture.
