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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4359Vt1WlFzDr3X
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 19:22:26 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAT8EZTt115390
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 03:22:24 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2p2b2bkt0v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 03:22:24 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 29 Nov 2018 08:22:22 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 29 Nov 2018 08:22:21 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wAT8MKYM59572378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 08:22:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69291AE056
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 08:22:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 169BEAE055
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 08:22:20 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.172])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 08:22:19 +0000 (GMT)
Subject: Re: Understand OpenBMC Event logging mechanism for beginner
To: openbmc@lists.ozlabs.org
References: <AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10@AM6PR02MB4392.eurprd02.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 29 Nov 2018 13:52:19 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10@AM6PR02MB4392.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18112908-4275-0000-0000-000002E86C22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18112908-4276-0000-0000-000037F5AF7D
Message-Id: <cd424085-d81d-bde4-bc94-39d7fa9bcfa3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=904 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811290072
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
X-List-Received-Date: Thu, 29 Nov 2018 08:22:30 -0000

On 28/11/18 5:18 PM, A, Maheswari wrote:
> Hi,
> 
> I found some OpenBMC document to understand LED Control architecture.
> 
> Document is very useful for beginner.
> 
> But There is no document to understand workflow of OpenBMC event 
> management for beginner.


Agree. I volunteer to write a document related to phosphor-logging.

> We need to understand BMC SEL logging mechanism in OpenBMC.


You should look at 
https://gerrit.openbmc-project.xyz/#/q/topic:%22IPMI+SEL%22. The high 
level idea is to log SEL related messages and metadata to the journal, 
and then have a deamon look at the journal to make a SEL repository.

>  1. BMC Need to log chassis intrusion SEL.
>  2. We need to log Event while Emergency Power OFF case . 
> 
> I hope below packages are concerns to record events.
> 
> Phosphor-logging   ( getting fan ReadFailure log in REST command 
> xyz.openproject.logging ).

phosphor-logging looks at journal metadata (placed in the journal via 
the log<>() or elog<>() APIs) and makes D-Bus objects to represent 
errors/events.

> Phosphor-event
> 
> Phosphor-dbus-monitor
> 
> obmc-event-mgmt is removed from stack.
> 
> Please clarify which recipes are needed to log events in BMC.
> 
> Please explain some basic understanding to log test event.
> 
> How do verify logged events .


If you're just interested in IPMI SELs, you should look at those reviews 
I posted above. Were you looking at something else though as the 
external interface - such as Redfish?

> Thanks
> 
> Maheswari A
> 

Regards,
Deepak
