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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZWmf5BGKzF2QB
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 03:31:29 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3UHTeRM072804
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 13:31:25 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hp4ssr0f9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 13:31:24 -0400
Received: from localhost
 by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 30 Apr 2018 18:31:23 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 30 Apr 2018 18:31:21 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3UHVL0T10617164; Mon, 30 Apr 2018 17:31:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6908AE04D;
 Mon, 30 Apr 2018 18:20:57 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 167AEAE051;
 Mon, 30 Apr 2018 18:20:57 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.195.34.177])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Apr 2018 18:20:56 +0100 (BST)
Subject: Re: Code levels in error log entries
To: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <120dd10d-e04a-477e-e84a-5cd536aff663@linux.vnet.ibm.com>
 <98ce31d805dcc9c6d44154ef5825efd3@linux.vnet.ibm.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Mon, 30 Apr 2018 23:01:20 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <98ce31d805dcc9c6d44154ef5825efd3@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18043017-0012-0000-0000-000005D08926
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18043017-0013-0000-0000-0000194DA16F
Message-Id: <6eff09e8-6e8e-db50-2207-94549d24e8ba@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804300169
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2018 17:31:31 -0000

On 30/04/18 8:18 pm, Matt Spinler wrote:
> On 2018-03-21 12:23, Matt Spinler wrote:
>> For IBM systems, we need to add the current code level to each error log
>> object as it's created to make it easier on the lives of support
>> personnel.  It would be a new interface (or maybe use an existing
>> code version one) on the /xyz/openbmc_project/logging/entry/X objects.
>>
>> Does anyone here that also uses error logs have an opinion on if they
>> would also be interested in this or not, so it would go into the common
>> logging code?
>>
>> Unless others are interested in it, I plan on putting it in an IBM
>> specific repository.  (or maybe turn on with a configure option?)
> 
> 
> After some additional discussion, we decided this would be useful enough to
> warrant putting it into the base error logging code.  I plan on adding the
> xyz.openbmc_project.Software.Version interface to the logging objects and
> populating it with the VERSION_ID field from /etc/os-release.

I see the Version interface also has a 'VersionPurpose' enum property. 
What would you populate that with? VersionPurpose.BMC? What if the error 
was from host and the version required was that of the host firmware?

Also, the value that gets into the /etc/os-release is known to the 
os-release recipe, so you could provide that to the logging recipe at 
build time (ipmi does something similar).

> 
> 
> 
>>
>> Thanks

Thanks,
Deepak
