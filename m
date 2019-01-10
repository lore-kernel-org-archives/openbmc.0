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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43b6jS0HhDzDqgL
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 00:46:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0ADeau1119330
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 08:46:33 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2px3uesvqt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 08:46:33 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 10 Jan 2019 13:46:31 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Jan 2019 13:46:28 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0ADkRTn51904744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Jan 2019 13:46:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A6ECA4057;
 Thu, 10 Jan 2019 13:46:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11987A4040;
 Thu, 10 Jan 2019 13:46:26 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.37])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jan 2019 13:46:25 +0000 (GMT)
Subject: Re: PLDM design proposal
To: Alexander Amelkin <a.amelkin@yadro.com>, Jeremy Kerr <jk@ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>,
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomjose@linux.vnet.ibm.com
References: <1f371684-8db6-3a02-cefe-d073856599ab@linux.vnet.ibm.com>
 <a918bd6d-b1cc-5062-cd20-828bba4ec1d0@yadro.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 10 Jan 2019 19:16:25 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <a918bd6d-b1cc-5062-cd20-828bba4ec1d0@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19011013-0028-0000-0000-000003371B7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19011013-0029-0000-0000-000023F43079
Message-Id: <5a87a968-c19c-dcff-8269-5d4c09b77f1d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-10_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=717 adultscore=0 classifier=spam adjust=0 reason=mlx
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
X-List-Received-Date: Thu, 10 Jan 2019 13:46:36 -0000

On 18/12/18 8:06 PM, Alexander Amelkin wrote:
> 13.12.2018 19:30, Deepak Kodihalli wrote:
>> Hi All,
>>
>> I've put down some thoughts below on an initial PLDM design on OpenBMC. Thie structure of the document is based on the OpenBMC design template. Please review and let me know your feedback. Once we've had a discussion here on the list, I can move this to Gerrit with some more details. I'd say reading the MCTP proposal from Jeremy should be a precursor to reading this.
>>
>> # PLDM Stack on OpenBMC
> Hi Deepak!
> 
> Thank you for bringing this up.
> 
> PLDM/MCTP look like a logical step in context of bringing in RedFish.
> 
> Are there any ready Linux-based tools for inband management (similar to ipmitool via /dev/ipmi0) for PLDM/MCTP?

I haven't found one, but I've been meaning to ask this to the relevant 
DMTF workgroup. I'll keep you posted.

> Alexander.
> 
