Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtx7w5v9zzDrXg
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 23:29:16 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8FDSn1F023692
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 09:29:13 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d0cq49d59-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 09:29:13 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 15 Sep 2017 23:29:11 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 15 Sep 2017 23:29:09 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8FDT9Gi35913968
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 23:29:09 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v8FDT94X005922
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 23:29:09 +1000
Received: from Deepaks-MacBook-Pro.local ([9.79.249.196])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v8FDT7SX005874
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 23:29:08 +1000
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Mechanism for external event notification
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 15 Sep 2017 18:59:07 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17091513-0016-0000-0000-000002650F0F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17091513-0017-0000-0000-000006EA1D43
Message-Id: <b3329680-caa6-5873-d986-beda11de5902@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-15_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709150196
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Sep 2017 13:29:17 -0000

Hello,

I have a proposal on the mechanism be able to do external event 
notification from the BMC. With this, the BMC would be able to push 
event notifications to interested clients that have a connection 
established, without having the clients to do a poll.

I was primarily looking at websockets [1] and the gevent-websocket 
project [2]. The idea is to enhance OpenBMC's phosphor-rest-server 
implementation to be able to handle websockets. The existing rest server 
implementation uses the Bottle framework, and it is easily possible to 
handle a websocket route via Bottle. Once a websocket has been created, 
there are various possibilities - a client can subscribe to specific 
events and push data to the server, the server can push data to the 
client, and the client should still be able to use the regular http routes.

I hacked up a quick prototype [3] via which I can notify connected 
clients about d-bus paths being created on the BMC.

Thoughts or questions about the proposal?

[1] https://www.fullstackpython.com/websockets.html
[2] https://gitlab.com/noppo/gevent-websocket
[3] https://gerrit.openbmc-project.xyz/#/c/6679/

Regards,
Deepak
