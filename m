Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43b6fq5kmxzDqgD
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 00:44:19 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0ADeapI119297
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 08:44:17 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2px3uesta6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 08:44:17 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 10 Jan 2019 13:44:15 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Jan 2019 13:44:13 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0ADiCKI57344108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Jan 2019 13:44:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 883FCA405E;
 Thu, 10 Jan 2019 13:44:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12AE3A4051;
 Thu, 10 Jan 2019 13:44:12 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.37])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jan 2019 13:44:11 +0000 (GMT)
Subject: Re: PLDM design proposal
To: Ben Wei <benwei@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <MWHPR15MB13272D38C34B33E8EB82F298A3BE0@MWHPR15MB1327.namprd15.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 10 Jan 2019 19:14:11 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <MWHPR15MB13272D38C34B33E8EB82F298A3BE0@MWHPR15MB1327.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19011013-0016-0000-0000-000002436586
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19011013-0017-0000-0000-0000329D69D0
Message-Id: <8ec4aceb-2337-f86e-2416-15f56a12674c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-10_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=980 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901100109
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
X-List-Received-Date: Thu, 10 Jan 2019 13:44:20 -0000

On 19/12/18 5:41 AM, Ben Wei wrote:
>>> Hi All,
>>>
>>> I've put down some thoughts below on an initial PLDM design on OpenBMC.
>>> Thie structure of the document is based on the OpenBMC design template.
>>> Please review and let me know your feedback. Once we've had a discussion
>>> here on the list, I can move this to Gerrit with some more details. I'd
>>> say reading the MCTP proposal from Jeremy should be a precursor to
>>> reading this.
> 
> Hi Deepak,
> 
> Do you see any issues with running PLDM over NCSI/RBT?
> If the NCSI daemon implements the same in-process callbacks as the MCTP daemon,
> (or if it supports the same D-Bus interface which takes PLDM payload and encapsulate it as NCSI commands)

Nothing jumps out as a problem with this.

> Also do you have plans on which PLDM functionalities to implement first?
> I'm looking at creating a prototype user library for PLDM firmware update would love to collaborate.

That sounds great! PLDM platform monitoring and BIOS are likely to be 
first on our list in terms of the order of implementation.  I did see 
some code being dropped at facebook/openbmc, related to PLDM firmware 
upgrade. Is that a prototype and/or do you eventually plan to drop that 
openbmc as well? I'd love to hear feedback from you on the high level 
design that I sent. I'm planning to push that to Gerrit, so you could 
review there as well.

>   Thanks!
> -Ben
> 
