Return-Path: <zshelle@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zshelle@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DP6D6wPbzDqC7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 04:29:56 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x25HTYa6097108
 for <openbmc@lists.ozlabs.org>; Tue, 5 Mar 2019 12:29:52 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2r1vbbv36v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 12:29:52 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <zshelle@linux.vnet.ibm.com>;
 Tue, 5 Mar 2019 17:29:51 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Mar 2019 17:29:47 -0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x25HTk9v27656334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Mar 2019 17:29:47 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E14587805F;
 Tue,  5 Mar 2019 17:29:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A46587805C;
 Tue,  5 Mar 2019 17:29:46 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 Mar 2019 17:29:46 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Mar 2019 11:37:24 -0600
From: zshelle <zshelle@linux.vnet.ibm.com>
To: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, ed.tanous@intel.com, Dong Wei
 <Dong.Wei@arm.com>, openbmc@lists.ozlabs.org
Subject: Re: anyone interested in chip register error diagnostics?
In-Reply-To: <d68f47712a2b0b82dfa4c313fc899afd1e37e529.camel@arm.com>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <3d72867607bc75b18960223dc8cea114@linux.vnet.ibm.com>
 <d68f47712a2b0b82dfa4c313fc899afd1e37e529.camel@arm.com>
X-Sender: zshelle@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030517-0036-0000-0000-00000A9489CB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010709; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170049; UDB=6.00611472; IPR=6.00950683; 
 MB=3.00025843; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-05 17:29:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030517-0037-0000-0000-00004AEEFCF4
Message-Id: <a6ddc54a8be7ef5ed6cdb70037d8295d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-05_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903050115
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
X-List-Received-Date: Tue, 05 Mar 2019 17:29:58 -0000

On 2019-03-04 17:53, Supreeth Venkatesh wrote:
> On Mon, 2019-03-04 at 16:44 -0600, zshelle wrote:
>> On 2019-03-04 14:56, Supreeth Venkatesh wrote:
>> > Thanks Brad.
>> >
>> > Hi Zane/Brad,
>> >
>> > On Arm Platforms, We use Common Platform Error Record (CPER) to
>> > report
>> > these kinds of hardware errors.
>> > The format of the errors are defined in Appendix N in UEFI
>> > specification
>> >
> http://www.uefi.org/sites/default/files/resources/UEFI%20Spec%202_7_A%20Sept%206.pdf
>> >
>> > I have not read the proposal in its entirety, but this seems
>> > similar
>> > to Reliability, Availability, Serviceability (RAS) feature using
>> > System Management Mode/Management Mode, but on the BMC side.
>> >
>> > I will take a look at the reviews posted and provide more feedback.
>> >
>> > If this is something similar to RAS feature, I have in fact
>> > proposed
>> > in DMTF PMCI WG to include CPER formats to be added to one of
>> > the PLDM specifications.
>> >
>> > Arm would be interested in the design of this component, if it can
>> > accommodate the above error formats and component can be designed
>> > in
>> > an architecture agnostic way.
>> >
>> > Thanks,
>> > Supreeth
>> >
>> > -----Original Message-----
>> > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> > Sent: Monday, March 4, 2019 2:38 PM
>> > To: zshelle <zshelle@linux.vnet.ibm.com>; Supreeth Venkatesh
>> > <Supreeth.Venkatesh@arm.com>; ed.tanous@intel.com
>> > Subject: Re: anyone interested in chip register error diagnostics?
>> >
>> > On Mon, Mar 04, 2019 at 02:22:45PM -0600, zshelle wrote:
>> > > On POWER, I work on a component that listens for hardware errors
>> > > reported by registers in the system chips (processors, memory
>> > > buffers,
>> > > I/O chips, etc.) and performs service actions based on those
>> > > errors. I
>> > > have been working on porting some of this code to the BMC for
>> > > system
>> > > fatal error analysis (see my work-in-progress proposals:
>> > > https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18591/ and
>> > > https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18831/). As
>> > > part
>> > > of the new design, we are building a generic, data-driven
>> > > register
>> > > error isolator, which will be used by several applications within
>> > > POWER. However, it has the potential to be useful on other
>> > > architectures as well. I am curious if anyone in the community is
>> > > interested in this.
>> >
>> > Thanks Zane - I'll tag Ed(x86) and Supreeth(arm) on this one.  Ed,
>> > Supreeth - do you understand the function being proposed here?  How
>> > does this work on x86 and arm servers?
>> >
>> > thx - brad
>> > IMPORTANT NOTICE: The contents of this email and any attachments
>> > are
>> > confidential and may also be privileged. If you are not the
>> > intended
>> > recipient, please notify the sender immediately and do not disclose
>> > the contents to any other person, use it for any purpose, or store
>> > or
>> > copy the information in any medium. Thank you.
>> 
>> Looks like CPER is similar to IBM's Platform Error Log (PEL). At
>> this
>> time, I am not really focused on the log format at the moment, but it
>> is
>> on my list of things to investigate. I heard a rumor that there may
>> be a
>> standard "OpenBMC" logging mechanism in the works. With those, you
>> could
>> convert them into the CPER or PEL format if needed.
> Ok. You are not currently focussed on format of the log itself but
> rather on the error syndrome/fault registers. Right?
> However, at present, error syndrome information gathered from the fault
> registers are converted to CPER/PEL format for logging purposes in the
> host firmware/microcontroller firmware.
> 
>> 
>> My proposals are more focused on reading the registers from hardware
>> and
>> determining what caused the error. On POWER, we have hundreds of what
>> we
>> call fault isolation registers (FIRs), where each bit within those
>> registers can signify a different hardware error event. It is also
>> possible that there may be several active bits on at the same time.
>> So
>> my component will sort through all of those registers, find the
>> active
>> bits, and determine what is the root cause of the failure versus
>> side-effect errors. Once root cause is determined, we then perform
>> any
>> services actions defined by our RAS team (and commit a log). Is
>> there
>> anything like this on ARM?
> On Arm platforms also, There are several error syndrome registers which
> are read.
> This information leads to contruction of CPER record which will be used
> by OS to take service actions as per RAS policy.
> 
> After reading 18831, it looks like you want to move error data
> collection to BMC from host firmware and for that you collect all fault
> isolation registers.
> Is there a security implication here?
> 
> Thank you for the proposal, I will read 18591 thoroughly to understand,
> whether we can reuse this on arm architecture.
On POWER, reading the FIR data has no security concerns. Writing data to 
those registers does have security concerns, but that should not be 
allowed from the BMC.
