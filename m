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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rj6S1qnFzDqp5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 20:21:18 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7GAJ6Ik078920
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 06:21:16 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kw6p49uv2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 06:21:16 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 16 Aug 2018 11:21:14 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Aug 2018 11:21:11 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7GALA4s42991726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 10:21:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFAF552059
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 13:21:13 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.110])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8136752050
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 13:21:13 +0100 (BST)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Streaming logs via rsyslog
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 16 Aug 2018 15:51:09 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18081610-0020-0000-0000-000002B79E6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081610-0021-0000-0000-00002104D5C6
Message-Id: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808160109
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
X-List-Received-Date: Thu, 16 Aug 2018 10:21:20 -0000

Hi,

We have a requirement to forward BMC logs (the systemd journal) to an 
external logging server.

We're proposing doing this by making use of rsyslog. Here are notes 
based on some initial investigation.

Forwarding the journal logs to a syslog daemon :
Journald has this feature of being able to write journal logs to a 
socket which then can be read by a syslog daemon. I see that (on 
Witherspoon at least) the syslog daemon running by default (busybox 
syslogd) doesn't support reading logs forwarded by the journald to due 
to this commit : 
https://git.busybox.net/busybox/commit/?id=accd9eeb719916da974584b33b1aeced5f3bb346. 
However, I could get the forwarding working with the rsyslog daemon. I 
found an existing rsyslog recipe in the meta-oe layer.

rsyslog configuration :
rsyslog is configurable in various ways. For example, I can turn off 
local logging altogether via a config file, if I'm interested only in 
using rsyslog for streaming journal logs out. Various optional features 
can be turned off at build time to save flash space.

rsyslog server provision :
The BMC would need to be made aware of the external rsyslog server. This 
can just be an admin updating the rsyslog config file on the BMC, and 
there could also be a REST API if need be. I think a small app can 
implement the 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/Client.interface.yaml 
interface to update the rsyslog config.

streaming :
rsyslog can be configured to make use of TCP, or UDP, and optionally 
TLS. I think TCP is the default.


Thoughts on this proposal? If this sounds okay, I'm planning to get some 
commits up in Gerrit for review. I can pull rsyslog in a phosphor layer 
(I mean as the default choice of a syslog daemon, replacing busybox 
syslog) if there's interest, as opposed to making it only a 
meta-witherspoon package. Specific rsyslog package config and config 
file overrides are possible in system specific layers.

Regards,
Deepak
