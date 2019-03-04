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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Csr10x8HzDq8g
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 08:00:48 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C61A36DD31;
 Mon,  4 Mar 2019 16:00:44 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: anyone interested in chip register error diagnostics?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
Date: Mon, 4 Mar 2019 16:01:16 -0500
Cc: zshelle <zshelle@linux.vnet.ibm.com>,
 "ed.tanous@intel.com" <ed.tanous@intel.com>, Dong Wei <Dong.Wei@arm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D80C3F77-70A1-4ECF-A492-97D6D28B9484@fuzziesquirrel.com>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
X-Mailer: Apple Mail (2.3445.102.3)
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
X-List-Received-Date: Mon, 04 Mar 2019 21:00:50 -0000

oops=E2=80=A6I did not mean to take the list off copy.  Adding it back =
on=E2=80=A6

> On Mar 4, 2019, at 3:56 PM, Supreeth Venkatesh =
<Supreeth.Venkatesh@arm.com> wrote:
>=20
>=20
> Thanks Brad.
>=20
> Hi Zane/Brad,
>=20
> On Arm Platforms, We use Common Platform Error Record (CPER) to report =
these kinds of hardware errors.
> The format of the errors are defined in Appendix N in UEFI =
specification
> =
http://www.uefi.org/sites/default/files/resources/UEFI%20Spec%202_7_A%20Se=
pt%206.pdf
>=20
> I have not read the proposal in its entirety, but this seems similar =
to Reliability, Availability, Serviceability (RAS) feature using
> System Management Mode/Management Mode, but on the BMC side.
>=20
> I will take a look at the reviews posted and provide more feedback.
>=20
> If this is something similar to RAS feature, I have in fact proposed =
in DMTF PMCI WG to include CPER formats to be added to one of
> the PLDM specifications.
>=20
> Arm would be interested in the design of this component, if it can =
accommodate the above error formats and component can be designed in
> an architecture agnostic way.
>=20
> Thanks,
> Supreeth
>=20
> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Sent: Monday, March 4, 2019 2:38 PM
> To: zshelle <zshelle@linux.vnet.ibm.com>; Supreeth Venkatesh =
<Supreeth.Venkatesh@arm.com>; ed.tanous@intel.com
> Subject: Re: anyone interested in chip register error diagnostics?
>=20
> On Mon, Mar 04, 2019 at 02:22:45PM -0600, zshelle wrote:
>> On POWER, I work on a component that listens for hardware errors
>> reported by registers in the system chips (processors, memory =
buffers,
>> I/O chips, etc.) and performs service actions based on those errors. =
I
>> have been working on porting some of this code to the BMC for system
>> fatal error analysis (see my work-in-progress proposals:
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18591/ and
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18831/). As =
part
>> of the new design, we are building a generic, data-driven register
>> error isolator, which will be used by several applications within
>> POWER. However, it has the potential to be useful on other
>> architectures as well. I am curious if anyone in the community is
>> interested in this.
>=20
> Thanks Zane - I'll tag Ed(x86) and Supreeth(arm) on this one.  Ed, =
Supreeth - do you understand the function being proposed here?  How does =
this work on x86 and arm servers?
>=20
> thx - brad
> IMPORTANT NOTICE: The contents of this email and any attachments are =
confidential and may also be privileged. If you are not the intended =
recipient, please notify the sender immediately and do not disclose the =
contents to any other person, use it for any purpose, or store or copy =
the information in any medium. Thank you.
