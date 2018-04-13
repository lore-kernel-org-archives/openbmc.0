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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Mx9F3vdNzDqZH
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 21:57:36 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3DBoxq9068147
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 07:57:32 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2harpdhgy8-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 07:57:31 -0400
Received: from localhost
 by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 13 Apr 2018 12:57:29 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 13 Apr 2018 12:57:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3DBvRRN7209334; Fri, 13 Apr 2018 11:57:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BB7911C052;
 Fri, 13 Apr 2018 12:49:29 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B630B11C04A;
 Fri, 13 Apr 2018 12:49:27 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.245])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Apr 2018 12:49:27 +0100 (BST)
Subject: Re: BMC redundancy
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: "Michael_E_Brown@Dell.com" <Michael_E_Brown@Dell.com>,
 Andrew Jeffery <andrew@aj.id.au>, rosedahl@us.ibm.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, ratagupt@linux.vnet.ibm.com,
 vernon.mauery@linux.intel.com
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
 <20180202211043.GD113334@mauery>
 <20180206060932.GB18567@wn7x64-4cggry1.aus.amer.dell.com>
 <938ac3f2-af34-86d7-4f30-91426b9b4628@linux.vnet.ibm.com>
 <d78c6a15-8736-7641-47af-714559cc48f5@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 13 Apr 2018 17:27:24 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <d78c6a15-8736-7641-47af-714559cc48f5@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18041311-0012-0000-0000-000005CA7A1C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041311-0013-0000-0000-00001946B498
Message-Id: <d7839792-10fd-6e54-ac7a-490147a30765@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804130111
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
X-List-Received-Date: Fri, 13 Apr 2018 11:57:39 -0000

On 13/04/18 5:15 pm, Deepak Kodihalli wrote:
> On 06/02/18 12:14 pm, Deepak Kodihalli wrote:
>> On 06/02/18 11:40 am, Michael E Brown wrote:
>>> On Fri, Feb 02, 2018 at 01:10:43PM -0800, Vernon Mauery wrote:
>>>> On 02-Feb-2018 11:18 AM, Andrew Jeffery wrote:
>>>>> Hi Deepak,
>>>>>
>>>>>> So several of the existing OpenBMC apps implement specific D-Bus
>>>>>> services. What does it take to make remote D-Bus calls to such apps?
>>>>>> - It doesn't look like the D-Bus spec or libdbus officially has 
>>>>>> anything
>>>>>> for D-Bus across computers. There are some good notes at
>>>>>> https://www.freedesktop.org/wiki/Software/DBusRemote/.
>>>>>
>>>>> Applications can cannect to remote dbus servers; the --address 
>>>>> option to dbus-daemon allows it to listen on a TCP socket and 
>>>>> setting DBUS_SESSION_BUS_ADDRESS will point applications in the 
>>>>> right direction. So there are probably two ways we could do this:
>>>>
>>>> Putting DBus on an externally-available TCP socket is a security 
>>>> architect's
>>>> nightmare. All command and control of the entire BMC is done over 
>>>> DBus; we
>>>> cannot put that on an externally-available address. I suppose if you 
>>>> have an
>>>> internal connection and switching fabric between the nodes, this 
>>>> would be
>>>> possible.
>>>
>>> Vernon, I completely and wholeheartedly agree with this assessment. 
>>> Most of the
>>> things I've heard so far start way too high up in the stack and try 
>>> to solve
>>> the issue there. I believe that we ought to start at the networking 
>>> layer and
>>> build up from there.
>>>
>>> Here is a dump of my thoughts related to what we talked about on the 
>>> conference
>>> call.
>>>
>>> Step 0: Internal network
>>>     Definition: This is a private network that is internal to a 
>>> chassis and
>>> cannot be attached via the external world. This does not make this 
>>> network
>>> implicitly secure, however. I would strongly suggest that we create 
>>> standards
>>> for addressing this network and how components communicate at the IP 
>>> level
>>> between BMCs.
>>>     Proposal: all nodes on this network use IPv6 SLAAC, with a 
>>> designation
>>> for one or a redundant pair of nodes running "radvd" to provide stable
>>> site-local address space assignments.
>>>
>>> Step 1: Discovery
>>>     Definition: This is how you figure out that there are other BMCs 
>>> on the
>>> internal network. Zeroconf/Avahi/MDNS are three names for one method. 
>>> This also
>>> includes figuring out which role any specific node may fill 
>>> (chassis-level BMC
>>> vs node-level BMC, for example).
>>>     Proposal: MDNS DNS-SD with TXT records indicating BMC Role
>>>
>>> Step 2: Exchanging certificates
>>>     Definition: To start a crypto system, one needs to exchange public
>>> keys, at a minimum. Other information about a machine can also be 
>>> useful. Note
>>> that exchanging certificates does not imply "trust" of those 
>>> certificates, but
>>> only provides the basis upon which you later decide if you trust or not.
>>>     Proposal: Oauth 2.0 Dynamic Client Registration
>>>
>>> Step 3: Trust
>>>     Definition: based on many factors, a machine decides if it trusts
>>> another machine. There is the implication that end-users may wish to 
>>> disable
>>> new trust relationships from forming, but that's not a requirement. 
>>> Factors
>>> that determine trust: 1) which network initiated connection, 2) machine
>>> identity certs, 3) any signatures on the machine identity certs (for 
>>> example, a
>>> vendor signature probably implies higher trust), 4) user 
>>> wishes/configuration,
>>> and 5) any possible remote attestation (TPM) or similar. These 
>>> factors could
>>> certainly be extended to include many other things, but these are a 
>>> baseline
>>> for starting to talk about this. Depending on user settings, devices 
>>> might
>>> require OAuth 2.0 device flow or be implicitly trusted based on 
>>> vendor-signed
>>> device certificates.
>>>     Proposal: The OAuth 2.0 Client Credentials grant or the OAuth 2.0
>>> device flow. (Depending on policy)
>>>
>>> Step 4: RPC
>>>     After establishing trust, you need a mechanism to do remote calls
>>> between machines. This could be as simple as REST (using oauth tokens 
>>> granted
>>> in #3), or as complex as a full DBUS interface.
>>>     Proposal: None at this time
>>>
>>> Step 5: Clustering
>>>     Definition: Clustering is generally divided into a cluster
>>> communication protocol and a cluster resource manager. The resource 
>>> manager has
>>> the job of taking developer constraints about which daemons have to 
>>> run where
>>> and what resources they need, and running the jobs on the machines 
>>> available.
>>> For example, you might specify that only one machine should run sensors
>>> connected to physical hardware i2c lines, and specify the list of 
>>> daemons that
>>> depend on these hardware resources. The resource manager would be 
>>> responsible
>>> for running the daemons in the correct order on the correct number of 
>>> machines.
>>>     Proposal: Corosync/Pacemaker have fairly reliable and flexible
>>> clustering, and can describe complex requirements.
>>>
>>> The one thing to keep in mind is that everything up to step 4/5 is 
>>> part of your
>>> forwards/backwards compatibility guarantee for all time for 
>>> everything in the
>>> chassis. To make sure it is supportable for a very long time, try to 
>>> keep it as
>>> simple as possible, but no simpler.
>>>
>>> Another part of the design is figuring out if you need Active/Active
>>> clustering, or Active/Standby. If you can get away with 
>>> Active/Standby, you can
>>> greatly minimize your RPC requirements between the machines, to the 
>>> point you
>>> don't really need much other than REST.
>>>
>>> -- 
>>> Michael
>>
>>
>> Thanks for this break-up and summary, Michael. I'm trying to collect 
>> the factors that can help us weighing up the pros and cons of the RPC 
>> mechanism (REST vs D-Bus vs something else). This is what I've 
>> gathered so far :
>>
>> - Some of the other layers in the picture can influence the RPC 
>> mechanism - you've brought out the active/active vs active/standby 
>> design, but I'm not sure if it's possible to identify an RPC mechanism 
>> that fits all such designs, because such configurations could depend 
>> on the system design, which can vary. So REST for example may not fit 
>> the bill for a multi-master.
>> - One thing about D-Bus that people have brought up is that our 
>> REST/Redfish API might be based around the existing D-Bus interface, 
>> so it kind of seems natural that the same interface serves as the RPC 
>> interface as well.
>> - Security aspects of D-Bus vs REST : depends on the design/mechanisms 
>> chosen for the steps prior to RPC.
>> - Any other factors?
>>
>> Regards,
>> Deepak
> 
> Hello,
> 
> I'd like to resurrect this topic. A quick recap - this is applicable to 
> multi BMC (or peer BMC) systems, where typically each BMC is managing a 
> host.
> 
> While I agree about solving this problem across different layers : the 
> internal network between BMCs, RPC, trust, clustering, etc, some of 
> these have well-known solutions that can be easily integrated into 
> OpenBMC (such as Avahi for discovery and Corosync for clustering). We 
> still need discussions in those areas, but with this email I'd like to 
> propose a peer-BMC RPC mechanism based on a D-Bus model. The motivation 
> behind using D-Bus is that most BMC apps should be minimally impacted or 
> would be agnostic to the fact that there are peer BMCs in the system.
> 
> I've been thinking of various use-cases to see how a D-Bus based RPC 
> fits in. Consider one such use case where an external application wants 
> to issue a power-on command to each of the peer BMCs. Further, the 
> external app wants to communicate with a specific point-of-contact (POC) 
> BMC, expecting the POC to broadcast the command across peers and to 
> aggregate responses. Let's also consider that the external application 
> is using redfish api to communicate to the POC, so it might send out 
> something like /redfish/v1/system/control with {"power" : "on"} (I don't 
> know the exact redfish api for this).
> 
> The POC has two tasks here - translating the redfish request to a D-Bus 
> method call (which would have to be done even for a single BMC system), 
> and then propagating that call across BMCs. The proposal is that the 
> same D-Bus model is created on every peer BMC, with appropriately named 
> object paths. So in this case, say on a 4-BMC system, you could have the 
> following :
> 
> /bmc0/xyz/openbmc_project/host/control/power
> /bmc1/xyz/openbmc_project/host/control/power
> /bmc2/xyz/openbmc_project/host/control/power
> /bmc3/xyz/openbmc_project/host/control/power
> 
> On every BMC, the objects in the model that point to other BMCs are 
> proxies, they'll route D-Bus calls to the relevant BMC and retrieve the 
> response. The advantage of this approach is that for eg the rest/redfish 
> code that attempts to find D-Bus objects corresponding to a REST URI 
> (say by making a mapper query based on the D-Bus interface) will still 
> work as before, just that there will be proxy objects found as well now. 
> These proxy objects will implement the same interface that a 
> /xyz/openbmc_project/host/control/power D-Bus object would. This 
> approach also works with native D-Bus apps wanting to communicate with 
> peer BMCs; a differentiation of a native vs remote path can be made 
> based on the path itself, or the proxy objects could implement an 
> interface indicating they're remote objects.
> 
> So effectively most of the well-known D-Bus model would reside on each 
> peer BMC. In terms of how this scales, I guess it's comparable to a 
> single BMC managing multiple nodes.
> 
> With the previous example, the object paths to construct are well-known, 
> but this may not apply to objects such as error logs. In that case, I 
> think it should be possible to implement proxy "object managers" under 
> well known D-Bus roots. So a call to retrieve all objects under the 
> D-Bus root will retrieve objects across all the peer BMCs, with the 
> proxy object managers routing the request to the appropriate BMCs.
> 
> For the actual remote D-Bus calls, one possibility is to use the API 
> offered by sdbus (it transports D-Bus messages over ssh).
> 
> Thanks,
> Deepak

Forgot copying the list.

Regards,
Deepak
