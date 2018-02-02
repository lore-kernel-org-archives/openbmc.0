Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXscj368nzF0bX
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 20:48:36 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w129jdMm141279
 for <openbmc@lists.ozlabs.org>; Fri, 2 Feb 2018 04:48:32 -0500
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fvgm0bwfx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Feb 2018 04:48:32 -0500
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 2 Feb 2018 09:48:31 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 2 Feb 2018 09:48:28 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w129mSA947120444; Fri, 2 Feb 2018 09:48:28 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EA0311C04A;
 Fri,  2 Feb 2018 09:41:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AD9211C04C;
 Fri,  2 Feb 2018 09:41:55 +0000 (GMT)
Received: from [9.79.219.199] (unknown [9.79.219.199])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  2 Feb 2018 09:41:55 +0000 (GMT)
Subject: Re: BMC redundancy
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 2 Feb 2018 15:18:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18020209-0016-0000-0000-0000051EB2A2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020209-0017-0000-0000-0000285B5A54
Message-Id: <8a7a2bfd-b30c-9409-14e1-cd058f4b6dd0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-02_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802020118
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
X-List-Received-Date: Fri, 02 Feb 2018 09:48:38 -0000

Hi Andrew,


On Friday 02 February 2018 06:18 AM, Andrew Jeffery wrote:
> Hi Deepak,
>
>> So several of the existing OpenBMC apps implement specific D-Bus
>> services. What does it take to make remote D-Bus calls to such apps?
>> - It doesn't look like the D-Bus spec or libdbus officially has anything
>> for D-Bus across computers. There are some good notes at
>> https://www.freedesktop.org/wiki/Software/DBusRemote/.
> Applications can cannect to remote dbus servers; the --address option to dbus-daemon allows it to listen on a TCP socket and setting DBUS_SESSION_BUS_ADDRESS will point applications in the right direction. So there are probably two ways we could do this:
>
> 1. Slave BMCs connect to the master's DBus daemon, and applications namespace their objects appropriately. Multi-BMC aware applications on the master access the namespaced objects as required
> 2. Slave BMCs are willfully ignorant of their role, with the master connecting to the slaves' DBus daemons to form a coherent global view of the bus for its multi-BMC aware applications, which access the remote objects as required.
>
> Given the support DBus has today it might be easier to go for 1 than for 2, if we go down this path at all.
>
> [1] https://dbus.freedesktop.org/doc/dbus-daemon.1.html
>
>> - There are ways to achieve this via Qt D-Bus, but it would involve some
>> amount tweaking with the D-Bus configs.
>> - I'm not aware of any open/active project implementing remote D-Bus.
> Here is someone's attempt at making it easier: http://gabriel.sourceforge.net/howto.html though you would struggle to say it's active given the last contribution was 2013-05-14.
How it would be beneficial sending dbus packets over ssh v/s current 
REST architecture,where url is mapped with the Dbus objects?
>
>> - Thoughts on doing remote D-Bus over WebSockets?
> How do websockets come into the picture? Why do we need the extra complication vs normal sockets?
>
> Cheers,
>
> Andrew
>
Regards
Ratan
