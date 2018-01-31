Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWYFH3zsdzDqms
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 17:27:14 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0V6Qf8R077289
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 01:27:12 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fu8heg10t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 01:27:12 -0500
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 31 Jan 2018 06:27:10 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 31 Jan 2018 06:27:08 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0V6R8nP1180014
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 06:27:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39EF542049
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 06:20:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE81F42045
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 06:20:14 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.113])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 06:20:14 +0000 (GMT)
Subject: Re: BMC redundancy
To: openbmc@lists.ozlabs.org
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Wed, 31 Jan 2018 11:57:07 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18013106-0020-0000-0000-000003F0A21D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013106-0021-0000-0000-00004283051C
Message-Id: <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-31_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801310085
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
X-List-Received-Date: Wed, 31 Jan 2018 06:27:16 -0000

On 29/01/18 9:22 pm, Brad Bishop wrote:
> I know we have a lot of work to do with the basics before tackling something
> like supporting multiple BMCs in a single system, but its never too early to
> brainstorm.
> 
> Quick community poll:  Please share any thoughts you may have around supporting
> systems with multiple BMCs.  Does your organization care?  Thoughts on how it
> could/should be done?  System designs that are a non-starter for OpenBMC?
> 
> Would love to see some brain-dumps here.
> 
> thx - brad
> 

I had some thoughts/questions on messaging protocols that multiple BMCs 
within the same system (potentially managing their own sleds) may employ 
to talk to each other. I'm not getting into how the BMCs discover and 
address each other. I see two broad use-cases for a peer BMC 
communication in such a system :

- A group operation : where an external agent talks to a single BMC (for 
the want of not having to query each BMC), but wants an aggregate of 
information. For eg the agent wants to collect error logs, it talks to a 
single BMC but expects that BMC would give back an aggregation of errors 
across all peer BMCs.

- There may be reasons for a BMC to itself initiate communication with 
one or more peers.


I was interested in brainstorming what protocol should the BMCs use for 
peer communication. What I had in mind though was, can this be done by 
leveraging the existing D-Bus/REST API, as opposed to employing a new 
protocol (I've looked at some such as Protobufs/gRPC, MQTT, etc).


So several of the existing OpenBMC apps implement specific D-Bus 
services. What does it take to make remote D-Bus calls to such apps?
- It doesn't look like the D-Bus spec or libdbus officially has anything 
for D-Bus across computers. There are some good notes at 
https://www.freedesktop.org/wiki/Software/DBusRemote/.
- There are ways to achieve this via Qt D-Bus, but it would involve some 
amount tweaking with the D-Bus configs.
- I'm not aware of any open/active project implementing remote D-Bus.
- Thoughts on doing remote D-Bus over WebSockets? For instance one could 
write a serialized D-Bus message over a WebSocket that has been 
established between two BMCs. Since WebSockets are full-duplex, they 
could also be used to receive events/D-Bus signals from peer BMCs 
asynchronously.


How about using REST for the peer to peer communication? Although this 
would mean each of the peer BMCs in the system would need a REST server 
and client implementation. The 'group operation' I've mentioned above 
seems a logical fit to do this, presuming an external agent would be 
using a REST API to talk to one of the BMCs, and the REST server 
implementation on that BMC has to propagate/multicast that API to all 
its peers, and then aggregate the responses.
If it's a D-Bus app wanting to talk to a counterpart app on a peer BMC, 
then it would have to use the REST client to send an https request.


Thanks,
Deepak
