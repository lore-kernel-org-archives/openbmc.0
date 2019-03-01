Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449pPz1kHxzDqQv
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 23:19:33 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x21CA7Jk141891
 for <openbmc@lists.ozlabs.org>; Fri, 1 Mar 2019 07:19:29 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qy4gnrc2u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 07:19:29 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 1 Mar 2019 12:19:26 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 1 Mar 2019 12:19:24 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x21CJNCx30277812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Mar 2019 12:19:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43899A4055;
 Fri,  1 Mar 2019 12:19:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6767FA4040;
 Fri,  1 Mar 2019 12:19:22 +0000 (GMT)
Received: from [9.193.103.203] (unknown [9.193.103.203])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  1 Mar 2019 12:19:22 +0000 (GMT)
Subject: Re: Proposal for pldmtool
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, "benwei@fb.com" <benwei@fb.com>
References: <3151516d-0aa1-465c-be01-44b3d837fbce@linux.vnet.ibm.com>
 <VI1PR08MB2799DE313D14D5C96966A840807E0@VI1PR08MB2799.eurprd08.prod.outlook.com>
 <9ef52020-8bd1-8aab-b8b4-56c636523892@linux.vnet.ibm.com>
 <CAJoAoZ=KtCWabJUxxeUHnDdKz0fkKAFN6Cnvqpes3QETQJRuhA@mail.gmail.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Fri, 1 Mar 2019 17:49:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZ=KtCWabJUxxeUHnDdKz0fkKAFN6Cnvqpes3QETQJRuhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19030112-0028-0000-0000-0000034E9926
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030112-0029-0000-0000-0000240CF83F
Message-Id: <8d8ad264-827d-e9fa-5585-86c99d9dd31f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903010086
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
X-List-Received-Date: Fri, 01 Mar 2019 12:19:36 -0000



On Friday 01 March 2019 12:06 AM, Emily Shaffer wrote:
> On Wed, Feb 27, 2019 at 10:29 PM Tom Joseph <tomjose@linux.vnet.ibm.com> wrote:
>>
>>
>> On Thursday 21 February 2019 11:12 PM, Supreeth Venkatesh wrote:
>>> Tom,
>>>
>>> Thanks for sending this out as a feeler.
>>> This sounds like a logical next step after implementation of PLDM and MCTP.
>>> However, I have a couple of initial questions.
>>>
>>> " A provision to run pldmtool targeting OpenBMC over a custom network port and route the request to the PLDM daemon."
>>> 1. Do you think it is ok to use this as external interface to BMC? I was under the impression that IPMI or Redfish were external facing interfaces to BMC.
>>>        PLDM was intended for inside the box communications.
>> I agree that PLDM is intended for inside the box communications. The
>> proposal is not to use it as an external interface, but rather give a
>> provision to run pldmtool from outside the box.
> I'm a little confused how this is different from external interface.
> Could you elaborate? Are you trying to route through the host first?

On a box shipped to customers, there would be no external interface to 
send PLDM messages to BMC. This can be considered as a debug option for 
lab purpose.

>
>>> 2. Why not use Redfish device enablement for PLDM, so that the tool (typically http/s client) will issue PLDM requests in the form of Json payload.
>> I think it is not guaranteed that the management controllers
>> implementing pldm has https support.
>>> 3. Can you describe the use case for the tool to be run on host firmware? In my opinion, this is highly unlikely though it can be run from host user space.
>> This might not be a typical use-case to run pldmtool from host firmware.
>> I was curious to know if someone will be interested to do this. But we
>> do see a possibility of running it from Host OS targeting the BMC, just
>> like ipmitool can be run from the host targeting the BMC via KCS/BT
>> interfaces.
>>> Thanks,
>>> Supreeth
>>> -----Original Message-----
>>> From: Tom Joseph <tomjose@linux.vnet.ibm.com>
>>> Sent: Monday, February 18, 2019 4:09 AM
>>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>; Alexander Amelkin <a.amelkin@yadro.com>; benwei@fb.com
>>> Subject: Proposal for pldmtool
>>>
>>> Hi All,
>>>
>>> I wanted to put down initial thoughts on "pldmtool" which is a utility for controlling PLDM enabled devices. The naming of the utility was influenced by ipmitool which is a client utility to control IPMI enabled devices. The pldmtool acts as the requester and sends the PLDM message to target any PLDM enabled device. The PLDM response message is processed and expressed in human readable format.  This proposal needs to be considered on the basis of the pldm design (https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md).
>>> These are possible pldmtool usage scenarios.
>>>
>>> * pldmtool can run on OpenBMC and can target the PLDM daemon. PLDM daemon will have a D-Bus interface to accept PLDM requests.
>>> * pldmtool can target other management controllers connected to BMC implementing PLDM stacks.
>>> * A provision to run pldmtool targeting OpenBMC over a custom network port and route the request to the PLDM daemon.
>>>
>>> These are the some of the salient features in the pldmtool that
>>>
>>> * Provide user friendly command options
>>> * Debug options to print detailed PLDM messages.
>>> * Leverage libmctp and libpldm library getting developed for communicating with MCTP layer and for encoding/decoding PLDM messages.
>>> (https://github.com/openbmc/pldm, https://github.com/jk-ozlabs/libmctp)
>>>
>>> The host firmware stacks typically have runtime constraints. If there is interest in having pldmtool run on host firmware then pldmtool will have to be written in C. Apart from this consideration the natural choice will be to develop this in modern C++.
>>>
>>> This mail is a feeler to seek the interests of the community. I will be keen to follow-up this with a design template.
>>>
>>> Thanks,
>>> Tom
>>>
>>> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
>
