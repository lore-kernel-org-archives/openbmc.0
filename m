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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wstK0tlMzDr69
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 00:10:00 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4UE7GxE000549
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 10:09:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j9w6kgwpx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 10:09:57 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 30 May 2018 15:09:55 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 30 May 2018 15:09:53 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4UE9qcx23265380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 14:09:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 074E9A405F
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 15:01:03 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A28B7A405B
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 15:01:02 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.244.27])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 15:01:02 +0100 (BST)
Subject: Re: Logging user actions
To: openbmc@lists.ozlabs.org
References: <c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Wed, 30 May 2018 19:39:50 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18053014-0020-0000-0000-000002950222
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18053014-0021-0000-0000-000020E076AE
Message-Id: <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1805300157
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
X-List-Received-Date: Wed, 30 May 2018 14:10:01 -0000

On 28/05/18 5:30 pm, Alexander Amelkin wrote:
> Hi all!
> 
> Customers ask us for extensive user action logging. That is, they want
> to log everything that a user may change in the system. They want to
> know who, how (via which interface) and when changed what. That includes
> but is not limited to network configuration, host power on/off, reboots,
> power restoration policy changing, firmware updates, user
> addition/deletion and password changing, et al.
> 
> We could listen for dbus signals and log most of that, but that way we
> wouldn't know whether a user made a change or that was some internal
> work. Additionally, that would yield an enormous amount of data logged
> if we just log every property change. We could limit logging to a
> predefined subset of properties, but when later the community adds a new
> crucial property, we could miss it in our logs.
> 
> We could log requests at each user interface (thankfully, we don't allow
> shell access for users), but that would mean having copies of the same
> logic in different subsystems, which is error prone, plus those copies
> will definitely diverge with time.
> 
> Does anyone have any idea on how to best implement such a requirement?


phosphor-dbus-monitor has event monitoring support. You can specify via 
build-time config (YAML files) what D-Bus interfaces/properties you're 
interested in, and a corresponding "event" D-Bus object is created under 
the /events/<event_category>/ namespace. This was implemented via
https://github.com/openbmc/openbmc/issues/2254.

This doesn't address all of the concerns you've mentioned above in terms 
of the amount of data that can be logged. It helps specify the 
properties of interest though, and the event D-Bus objects are persisted 
upto a certain limit.

> Alexander Amelkin
> YADRO
> 
> 

Regards,
Deepak
