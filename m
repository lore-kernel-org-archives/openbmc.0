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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41sHjK580WzDqm6
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 19:20:04 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7H9IiF7092192
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 05:20:02 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kwspuvded-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Aug 2018 05:20:02 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 17 Aug 2018 10:20:00 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 Aug 2018 10:19:58 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7H9Jvun38666288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Aug 2018 09:19:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B84511C050;
 Fri, 17 Aug 2018 12:20:00 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DCC611C04A;
 Fri, 17 Aug 2018 12:19:59 +0100 (BST)
Received: from [9.78.193.43] (unknown [9.78.193.43])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Aug 2018 12:19:58 +0100 (BST)
Subject: Re: Streaming logs via rsyslog
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: openbmc@lists.ozlabs.org
References: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
 <046e8fe9-1465-49ee-2170-0d06cd013218@intel.com>
 <b5f05749-ee42-a53c-5da2-f2fe04eaafd9@linux.vnet.ibm.com>
Date: Fri, 17 Aug 2018 14:49:54 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b5f05749-ee42-a53c-5da2-f2fe04eaafd9@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18081709-0012-0000-0000-0000029B13FC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081709-0013-0000-0000-000020CE4353
Message-Id: <066e4ef8-a411-16bf-548a-b7698188f189@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-17_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=922 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808170102
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 09:20:06 -0000

On 17/08/18 12:00 PM, Deepak Kodihalli wrote:
> On 16/08/18 11:37 PM, Ed Tanous wrote:
>> On 08/16/2018 03:21 AM, Deepak Kodihalli wrote:
>>> Hi,
>>>
>>> We have a requirement to forward BMC logs (the systemd journal) to an 
>>> external logging server.
>>>
>>> We're proposing doing this by making use of rsyslog. Here are notes 
>>> based on some initial investigation.
>>>
>>
>>  From the rsyslog github page
>>
>> """
>> Rsyslog's main sponsor Adiscon tries to fund rsyslog by selling custom 
>> development and support contracts. Adiscon does NOT license rsyslog 
>> under a commercial license (this is simply impossible for anyone due 
>> to rsyslog's license structure).
>> """
>>
>> I think this license makes rsyslog a non-starter for most of the 
>> people in this project, but I'm not a license expert.  We've looked at 
>> it in the past, and while nice to use in practice, we couldn't 
>> overcome the license conflicts and legal implications.
> 
> I'm not sure if that's the case, but I'm no license expert either. It 
> looks like rsyslog's license is GPLv3. Is it that GPLv3 packages can't 
> be part of a project that has an Apache license? I'll try to find out 
> more about this from license experts.

I was just pointed out that Busybox itself is GPLv2, so rsyslog being 
GPLv3 seems to be usable without any concern?

Regards,
Deepak
