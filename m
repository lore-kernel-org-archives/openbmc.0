Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXn9k0kPWzF0Xj
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 17:28:25 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w126PNJx112804
 for <openbmc@lists.ozlabs.org>; Fri, 2 Feb 2018 01:28:23 -0500
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fvgm04jjb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Feb 2018 01:28:22 -0500
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 2 Feb 2018 06:28:21 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 2 Feb 2018 06:28:19 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w126SJqp49676412; Fri, 2 Feb 2018 06:28:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18937AE04D;
 Fri,  2 Feb 2018 06:19:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 654A2AE045;
 Fri,  2 Feb 2018 06:19:40 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.113])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  2 Feb 2018 06:19:39 +0000 (GMT)
Subject: Re: BMC redundancy
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 2 Feb 2018 11:58:17 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18020206-0008-0000-0000-000004C8A856
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020206-0009-0000-0000-00001E5C4962
Message-Id: <4014865d-271c-0a00-9a22-a2aad663594f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802020072
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2018 06:28:26 -0000

On 02/02/18 6:18 am, Andrew Jeffery wrote:
> Hi Deepak,
> 
>> So several of the existing OpenBMC apps implement specific D-Bus
>> services. What does it take to make remote D-Bus calls to such apps?
>> - It doesn't look like the D-Bus spec or libdbus officially has anything
>> for D-Bus across computers. There are some good notes at
>> https://www.freedesktop.org/wiki/Software/DBusRemote/.
> 
> Applications can cannect to remote dbus servers; the --address option to dbus-daemon allows it to listen on a TCP socket and setting DBUS_SESSION_BUS_ADDRESS will point applications in the right direction. So there are probably two ways we could do this:
> 
> 1. Slave BMCs connect to the master's DBus daemon, and applications namespace their objects appropriately. Multi-BMC aware applications on the master access the namespaced objects as required
> 2. Slave BMCs are willfully ignorant of their role, with the master connecting to the slaves' DBus daemons to form a coherent global view of the bus for its multi-BMC aware applications, which access the remote objects as required.
> 
> Given the support DBus has today it might be easier to go for 1 than for 2, if we go down this path at all.

I've to look at how/if this is possible in a scenario where any BMC can 
take on the role of a master, dynamically.

> [1] https://dbus.freedesktop.org/doc/dbus-daemon.1.html
> 
>> - There are ways to achieve this via Qt D-Bus, but it would involve some
>> amount tweaking with the D-Bus configs.
>> - I'm not aware of any open/active project implementing remote D-Bus.
> 
> Here is someone's attempt at making it easier: http://gabriel.sourceforge.net/howto.html though you would struggle to say it's active given the last contribution was 2013-05-14.

Yep, did look at this.

>> - Thoughts on doing remote D-Bus over WebSockets?
> 
> How do websockets come into the picture? Why do we need the extra complication vs normal sockets?

I agree that WebSockets are not the same as plain sockets, there's the 
additional connection scheme and framing, but the protocol itself 
doesn't preclude non-browser clients. Why I brought up WebSockets though 
is for things like sending/receiving (D-Bus) signals asynchronously 
across BMCs, ping/ping heartbeat messages (surveillance).

> Cheers,
> 
> Andrew
> 

Regards,
Deepak
