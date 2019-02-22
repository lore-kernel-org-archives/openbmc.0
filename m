Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445YM66f06zDqKJ
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 01:17:21 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1MEFXjY044694
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 09:17:19 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qtj20j99m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 09:17:19 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 22 Feb 2019 14:17:16 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 22 Feb 2019 14:17:14 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1MEHDYu14614620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Feb 2019 14:17:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4258A4059;
 Fri, 22 Feb 2019 14:17:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF4ECA404D;
 Fri, 22 Feb 2019 14:17:12 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.241.219])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Feb 2019 14:17:12 +0000 (GMT)
Subject: Re: Proposal for pldmtool
To: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>, tomjose@linux.vnet.ibm.com
References: <3151516d-0aa1-465c-be01-44b3d837fbce@linux.vnet.ibm.com>
 <VI1PR08MB2799DE313D14D5C96966A840807E0@VI1PR08MB2799.eurprd08.prod.outlook.com>
Cc: openbmc@lists.ozlabs.org
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 22 Feb 2019 19:47:08 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB2799DE313D14D5C96966A840807E0@VI1PR08MB2799.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19022214-0020-0000-0000-00000319FD32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022214-0021-0000-0000-0000216B5577
Message-Id: <5f9e4b07-5680-6335-8050-24c3d97ebf3d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-22_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902220101
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
X-List-Received-Date: Fri, 22 Feb 2019 14:17:24 -0000

On 21/02/19 11:12 PM, Supreeth Venkatesh wrote:
> Tom,
> 
> Thanks for sending this out as a feeler.
> This sounds like a logical next step after implementation of PLDM and MCTP.
> However, I have a couple of initial questions.
> 
> " A provision to run pldmtool targeting OpenBMC over a custom network port and route the request to the PLDM daemon."
> 1. Do you think it is ok to use this as external interface to BMC? I was under the impression that IPMI or Redfish were external facing interfaces to BMC.
>       PLDM was intended for inside the box communications.

I'll let Tom comment as well, but I agree that this use-case probably 
does not exist. This tool serves more as a debug aid for in-band PLDM 
communication.

> 2. Why not use Redfish device enablement for PLDM, so that the tool (typically http/s client) will issue PLDM requests in the form of Json payload.

What if the PLDM device the BMC is talking to does not implement Redfish?

> 3. Can you describe the use case for the tool to be run on host firmware? In my opinion, this is highly unlikely though it can be run from host user space.

Probably for debug - quickly test a remote PLDM device without having to 
write a full blown requester application. Similar to how it would help 
when it runs on the BMC.

> Thanks,
> Supreeth

Regards,
Deepak
