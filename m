Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zYRMG6fW6zDr2v
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 19:08:58 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w13844ri101714
 for <openbmc@lists.ozlabs.org>; Sat, 3 Feb 2018 03:08:56 -0500
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fw89v1tdq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 03 Feb 2018 03:08:56 -0500
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Sat, 3 Feb 2018 08:08:54 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 3 Feb 2018 08:08:51 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1388oYG45875420
 for <openbmc@lists.ozlabs.org>; Sat, 3 Feb 2018 08:08:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67535A404D
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 08:02:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C182A4051
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 08:02:19 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.247.255])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 08:02:19 +0000 (GMT)
Subject: Re: BMC redundancy
To: openbmc@lists.ozlabs.org
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
 <20180202211043.GD113334@mauery>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Sat, 3 Feb 2018 13:38:47 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180202211043.GD113334@mauery>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18020308-0008-0000-0000-000004C9069B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020308-0009-0000-0000-00001E5CAB62
Message-Id: <b048428d-5361-710c-edbd-c6876deb267b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802030105
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
X-List-Received-Date: Sat, 03 Feb 2018 08:08:59 -0000

On 03/02/18 2:40 am, Vernon Mauery wrote:
> On 02-Feb-2018 11:18 AM, Andrew Jeffery wrote:
>> Hi Deepak,
>>
>>> So several of the existing OpenBMC apps implement specific D-Bus
>>> services. What does it take to make remote D-Bus calls to such apps?
>>> - It doesn't look like the D-Bus spec or libdbus officially has anything
>>> for D-Bus across computers. There are some good notes at
>>> https://www.freedesktop.org/wiki/Software/DBusRemote/.
>>
>> Applications can cannect to remote dbus servers; the --address option 
>> to dbus-daemon allows it to listen on a TCP socket and setting 
>> DBUS_SESSION_BUS_ADDRESS will point applications in the right 
>> direction. So there are probably two ways we could do this:
> 
> Putting DBus on an externally-available TCP socket is a security 
> architect's nightmare. All command and control of the entire BMC is done 
> over DBus; we cannot put that on an externally-available address. I 
> suppose if you have an internal connection and switching fabric between 
> the nodes, this would be possible.

This shouldn't be a problem though with SSH forwarding, with a proxy 
D-Bus daemon for example. 
https://www.freedesktop.org/wiki/Software/DBusRemote/ talks about 
another issue with SSH forwarding D-Bus, which I haven't fully 
understood. I know that the Gabriel project took the SSH forwarding route.

Regards,
Deepak

> --Vernon
> 
>> 1. Slave BMCs connect to the master's DBus daemon, and applications 
>> namespace their objects appropriately. Multi-BMC aware applications on 
>> the master access the namespaced objects as required
>> 2. Slave BMCs are willfully ignorant of their role, with the master 
>> connecting to the slaves' DBus daemons to form a coherent global view 
>> of the bus for its multi-BMC aware applications, which access the 
>> remote objects as required.
>>
>> Given the support DBus has today it might be easier to go for 1 than 
>> for 2, if we go down this path at all.
>>
>> [1] https://dbus.freedesktop.org/doc/dbus-daemon.1.html
>>
>>> - There are ways to achieve this via Qt D-Bus, but it would involve some
>>> amount tweaking with the D-Bus configs.
>>> - I'm not aware of any open/active project implementing remote D-Bus.
>>
>> Here is someone's attempt at making it easier: 
>> http://gabriel.sourceforge.net/howto.html though you would struggle to 
>> say it's active given the last contribution was 2013-05-14.
>>
>>> - Thoughts on doing remote D-Bus over WebSockets?
>>
>> How do websockets come into the picture? Why do we need the extra 
>> complication vs normal sockets?
>>
>> Cheers,
>>
>> Andrew
> 
