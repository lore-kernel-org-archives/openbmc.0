Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbFM21lVczDqs4
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 17:45:02 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w166iORV021340
 for <openbmc@lists.ozlabs.org>; Tue, 6 Feb 2018 01:45:00 -0500
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fy2ag1frb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 01:44:59 -0500
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Tue, 6 Feb 2018 06:44:57 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 6 Feb 2018 06:44:56 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w166itNW65208402
 for <openbmc@lists.ozlabs.org>; Tue, 6 Feb 2018 06:44:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 637874C15F
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 06:38:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4C114C16C
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 06:38:46 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.251.60])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 06:38:46 +0000 (GMT)
Subject: Re: BMC redundancy
To: openbmc@lists.ozlabs.org
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
 <20180202211043.GD113334@mauery>
 <20180206060932.GB18567@wn7x64-4cggry1.aus.amer.dell.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Tue, 6 Feb 2018 12:14:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180206060932.GB18567@wn7x64-4cggry1.aus.amer.dell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18020606-0008-0000-0000-000004C9CE93
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020606-0009-0000-0000-00001E5D799A
Message-Id: <938ac3f2-af34-86d7-4f30-91426b9b4628@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-06_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802060082
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
X-List-Received-Date: Tue, 06 Feb 2018 06:45:02 -0000

On 06/02/18 11:40 am, Michael E Brown wrote:
> On Fri, Feb 02, 2018 at 01:10:43PM -0800, Vernon Mauery wrote:
>> On 02-Feb-2018 11:18 AM, Andrew Jeffery wrote:
>>> Hi Deepak,
>>>
>>>> So several of the existing OpenBMC apps implement specific D-Bus
>>>> services. What does it take to make remote D-Bus calls to such apps?
>>>> - It doesn't look like the D-Bus spec or libdbus officially has anything
>>>> for D-Bus across computers. There are some good notes at
>>>> https://www.freedesktop.org/wiki/Software/DBusRemote/.
>>>
>>> Applications can cannect to remote dbus servers; the --address option to dbus-daemon allows it to listen on a TCP socket and setting DBUS_SESSION_BUS_ADDRESS will point applications in the right direction. So there are probably two ways we could do this:
>>
>> Putting DBus on an externally-available TCP socket is a security architect's
>> nightmare. All command and control of the entire BMC is done over DBus; we
>> cannot put that on an externally-available address. I suppose if you have an
>> internal connection and switching fabric between the nodes, this would be
>> possible.
> 
> Vernon, I completely and wholeheartedly agree with this assessment. Most of the
> things I've heard so far start way too high up in the stack and try to solve
> the issue there. I believe that we ought to start at the networking layer and
> build up from there.
> 
> Here is a dump of my thoughts related to what we talked about on the conference
> call.
> 
> Step 0: Internal network
> 	Definition: This is a private network that is internal to a chassis and
> cannot be attached via the external world. This does not make this network
> implicitly secure, however. I would strongly suggest that we create standards
> for addressing this network and how components communicate at the IP level
> between BMCs.
> 	Proposal: all nodes on this network use IPv6 SLAAC, with a designation
> for one or a redundant pair of nodes running "radvd" to provide stable
> site-local address space assignments.
> 
> Step 1: Discovery
> 	Definition: This is how you figure out that there are other BMCs on the
> internal network. Zeroconf/Avahi/MDNS are three names for one method. This also
> includes figuring out which role any specific node may fill (chassis-level BMC
> vs node-level BMC, for example).
> 	Proposal: MDNS DNS-SD with TXT records indicating BMC Role
> 
> Step 2: Exchanging certificates
> 	Definition: To start a crypto system, one needs to exchange public
> keys, at a minimum. Other information about a machine can also be useful. Note
> that exchanging certificates does not imply "trust" of those certificates, but
> only provides the basis upon which you later decide if you trust or not.
> 	Proposal: Oauth 2.0 Dynamic Client Registration
> 
> Step 3: Trust
> 	Definition: based on many factors, a machine decides if it trusts
> another machine. There is the implication that end-users may wish to disable
> new trust relationships from forming, but that's not a requirement. Factors
> that determine trust: 1) which network initiated connection, 2) machine
> identity certs, 3) any signatures on the machine identity certs (for example, a
> vendor signature probably implies higher trust), 4) user wishes/configuration,
> and 5) any possible remote attestation (TPM) or similar. These factors could
> certainly be extended to include many other things, but these are a baseline
> for starting to talk about this. Depending on user settings, devices might
> require OAuth 2.0 device flow or be implicitly trusted based on vendor-signed
> device certificates.
> 	Proposal: The OAuth 2.0 Client Credentials grant or the OAuth 2.0
> device flow. (Depending on policy)
> 
> Step 4: RPC
> 	After establishing trust, you need a mechanism to do remote calls
> between machines. This could be as simple as REST (using oauth tokens granted
> in #3), or as complex as a full DBUS interface.
> 	Proposal: None at this time
> 
> Step 5: Clustering
> 	Definition: Clustering is generally divided into a cluster
> communication protocol and a cluster resource manager. The resource manager has
> the job of taking developer constraints about which daemons have to run where
> and what resources they need, and running the jobs on the machines available.
> For example, you might specify that only one machine should run sensors
> connected to physical hardware i2c lines, and specify the list of daemons that
> depend on these hardware resources. The resource manager would be responsible
> for running the daemons in the correct order on the correct number of machines.
> 	Proposal: Corosync/Pacemaker have fairly reliable and flexible
> clustering, and can describe complex requirements.
> 
> The one thing to keep in mind is that everything up to step 4/5 is part of your
> forwards/backwards compatibility guarantee for all time for everything in the
> chassis. To make sure it is supportable for a very long time, try to keep it as
> simple as possible, but no simpler.
> 
> Another part of the design is figuring out if you need Active/Active
> clustering, or Active/Standby. If you can get away with Active/Standby, you can
> greatly minimize your RPC requirements between the machines, to the point you
> don't really need much other than REST.
> 
> --
> Michael


Thanks for this break-up and summary, Michael. I'm trying to collect the 
factors that can help us weighing up the pros and cons of the RPC 
mechanism (REST vs D-Bus vs something else). This is what I've gathered 
so far :

- Some of the other layers in the picture can influence the RPC 
mechanism - you've brought out the active/active vs active/standby 
design, but I'm not sure if it's possible to identify an RPC mechanism 
that fits all such designs, because such configurations could depend on 
the system design, which can vary. So REST for example may not fit the 
bill for a multi-master.
- One thing about D-Bus that people have brought up is that our 
REST/Redfish API might be based around the existing D-Bus interface, so 
it kind of seems natural that the same interface serves as the RPC 
interface as well.
- Security aspects of D-Bus vs REST : depends on the design/mechanisms 
chosen for the steps prior to RPC.
- Any other factors?

Regards,
Deepak
