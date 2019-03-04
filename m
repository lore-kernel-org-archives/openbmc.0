Return-Path: <zshelle@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zshelle@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CvzB1l6zzDqFt
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 09:37:09 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x24MVPRw034174
 for <openbmc@lists.ozlabs.org>; Mon, 4 Mar 2019 17:37:07 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r1afrdm29-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 17:37:06 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <zshelle@linux.vnet.ibm.com>;
 Mon, 4 Mar 2019 22:37:05 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Mar 2019 22:37:01 -0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x24Mb0bQ21364762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Mar 2019 22:37:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A46A6B205F;
 Mon,  4 Mar 2019 22:37:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20D3AB2064;
 Mon,  4 Mar 2019 22:37:00 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 Mar 2019 22:36:59 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Mar 2019 16:44:36 -0600
From: zshelle <zshelle@linux.vnet.ibm.com>
To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, ed.tanous@intel.com, Dong Wei
 <Dong.Wei@arm.com>, openbmc@lists.ozlabs.org
Subject: RE: anyone interested in chip register error diagnostics?
In-Reply-To: <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
References: <d6c9b047b8906a7dabc6fc1acf7d7c2d@linux.vnet.ibm.com>
 <20190304203754.5piu2z2hj2yipomd@thinkpad>
 <AM4PR08MB2788F676F7BE8F10D8EFB90A80710@AM4PR08MB2788.eurprd08.prod.outlook.com>
X-Sender: zshelle@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030422-0072-0000-0000-0000040470FF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010705; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01169678; UDB=6.00611245; IPR=6.00950306; 
 MB=3.00025831; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-04 22:37:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030422-0073-0000-0000-00004B60D105
Message-Id: <3d72867607bc75b18960223dc8cea114@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-04_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=974 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903040157
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
X-List-Received-Date: Mon, 04 Mar 2019 22:37:10 -0000

On 2019-03-04 14:56, Supreeth Venkatesh wrote:
> Thanks Brad.
> 
> Hi Zane/Brad,
> 
> On Arm Platforms, We use Common Platform Error Record (CPER) to report
> these kinds of hardware errors.
> The format of the errors are defined in Appendix N in UEFI 
> specification
> http://www.uefi.org/sites/default/files/resources/UEFI%20Spec%202_7_A%20Sept%206.pdf
> 
> I have not read the proposal in its entirety, but this seems similar
> to Reliability, Availability, Serviceability (RAS) feature using
> System Management Mode/Management Mode, but on the BMC side.
> 
> I will take a look at the reviews posted and provide more feedback.
> 
> If this is something similar to RAS feature, I have in fact proposed
> in DMTF PMCI WG to include CPER formats to be added to one of
> the PLDM specifications.
> 
> Arm would be interested in the design of this component, if it can
> accommodate the above error formats and component can be designed in
> an architecture agnostic way.
> 
> Thanks,
> Supreeth
> 
> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Sent: Monday, March 4, 2019 2:38 PM
> To: zshelle <zshelle@linux.vnet.ibm.com>; Supreeth Venkatesh
> <Supreeth.Venkatesh@arm.com>; ed.tanous@intel.com
> Subject: Re: anyone interested in chip register error diagnostics?
> 
> On Mon, Mar 04, 2019 at 02:22:45PM -0600, zshelle wrote:
>> On POWER, I work on a component that listens for hardware errors
>> reported by registers in the system chips (processors, memory buffers,
>> I/O chips, etc.) and performs service actions based on those errors. I
>> have been working on porting some of this code to the BMC for system
>> fatal error analysis (see my work-in-progress proposals:
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18591/ and
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18831/). As part
>> of the new design, we are building a generic, data-driven register
>> error isolator, which will be used by several applications within
>> POWER. However, it has the potential to be useful on other
>> architectures as well. I am curious if anyone in the community is
>> interested in this.
> 
> Thanks Zane - I'll tag Ed(x86) and Supreeth(arm) on this one.  Ed,
> Supreeth - do you understand the function being proposed here?  How
> does this work on x86 and arm servers?
> 
> thx - brad
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose
> the contents to any other person, use it for any purpose, or store or
> copy the information in any medium. Thank you.

Looks like CPER is similar to IBM's Platform Error Log (PEL). At this 
time, I am not really focused on the log format at the moment, but it is 
on my list of things to investigate. I heard a rumor that there may be a 
standard "OpenBMC" logging mechanism in the works. With those, you could 
convert them into the CPER or PEL format if needed.

My proposals are more focused on reading the registers from hardware and 
determining what caused the error. On POWER, we have hundreds of what we 
call fault isolation registers (FIRs), where each bit within those 
registers can signify a different hardware error event. It is also 
possible that there may be several active bits on at the same time. So 
my component will sort through all of those registers, find the active 
bits, and determine what is the root cause of the failure versus 
side-effect errors. Once root cause is determined, we then perform any 
services actions defined by our RAS team (and commit a log). Is there 
anything like this on ARM?
