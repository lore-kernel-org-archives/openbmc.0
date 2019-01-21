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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jkhW2vvDzDqPf
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 19:08:43 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0L83nwc028344
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 03:08:40 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2q59wfs1k7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 03:08:39 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 21 Jan 2019 08:08:38 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 21 Jan 2019 08:08:35 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0L88YQU56754308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Jan 2019 08:08:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D56F44C04E;
 Mon, 21 Jan 2019 08:08:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCB944C046;
 Mon, 21 Jan 2019 08:08:33 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.248.54])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jan 2019 08:08:33 +0000 (GMT)
Subject: Re: PLDM design proposal
To: Ben Wei <benwei@fb.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <MWHPR15MB1327A59DC0012C831B79E817A3870@MWHPR15MB1327.namprd15.prod.outlook.com>
 <6fea6e16-2156-7bb7-5f6c-ca7847d730b2@linux.vnet.ibm.com>
 <MWHPR15MB13272EE8CF59309817820E77A3830@MWHPR15MB1327.namprd15.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Mon, 21 Jan 2019 13:38:32 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <MWHPR15MB13272EE8CF59309817820E77A3830@MWHPR15MB1327.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19012108-0020-0000-0000-000003092F21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012108-0021-0000-0000-0000215A5C6F
Message-Id: <9f794735-1087-c132-5ca6-50e44190aa00@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-21_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901210066
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2019 08:08:44 -0000

On 18/01/19 4:29 AM, Ben Wei wrote:
> Thanks Deepak, just couple additional questions below.
> 
>>>> Hi All,
>>>>
>>>> I've put down some thoughts below on an initial PLDM design on OpenBMC.
>>>> The structure of the document is based on the OpenBMC design template.
>>>> Please review and let me know your feedback. Once we've had a
>>>> discussion here on the list, I can move this to Gerrit with some more
>>>> details. I'd say reading the MCTP proposal from Jeremy should be a
>>>> precursor to reading this.
>>>>
>>>> # PLDM Stack on OpenBMC
>>>>
>>>> Author: Deepak Kodihalli <mailto:dkodihal@linux.vnet.ibm.com> <dkodihal>
>>>>
>>>> ## Problem Description
>>>>
>>>> On OpenBMC, in-band IPMI is currently the primary industry-standard
>>>> means of communication between the BMC and the Host firmware. We've
>>>> started hitting some inherent limitations of IPMI on OpenPOWER servers:
>>>> a limited number of sensors, and a lack of a generic control
>>>> mechanism (sensors are a generic monitoring mechanism) are the major
>>>> ones. There is a need to improve upon the communication protocol, but
>>>> at the same time inventing a custom protocol is undesirable.
>>>>
>>>> This design aims to employ Platform Level Data Model (PLDM), a
>>>> standard application layer communication protocol defined by the
>>>> DMTF. PLDM draws inputs from IPMI, but it overcomes most of the latter's limitations.
>>>> PLDM is also designed to run on standard transport protocols, for e.g.
>>>> MCTP (also designed by the DMTF). MCTP provides for a common
>>>> transport layer over several physical channels, by defining hardware
>>>> bindings. The solution of PLDM over MCTP also helps overcome some of
>>>> the limitations of the hardware channels that IPMI uses.
>>>>
>>>> PLDM's purpose is to enable all sorts of "inside the box communication":
>>>> BMC - Host, BMC - BMC, BMC - Network Controller and BMC - Other (for
>>>> e.g. sensor) devices. This design doesn't preclude enablement of
>>>> communication channels not involving the BMC and the host.
>>>>
>>>> ## Background and References
>>>>
>>>> PLDM is designed to be an effective interface and data model that
>>>> provides efficient access to low-level platform inventory,
>>>> monitoring, control, event, and data/parameters transfer functions.
>>>> For example, temperature, voltage, or fan sensors can have a PLDM
>>>> representation that can be used to monitor and control the platform
>>>> using a set of PLDM messages. PLDM defines data representations and
>>>> commands that abstract the platform management hardware.
>>>>
>>>> As stated earlier, PLDM is designed for different flavors of "inside
>>>> the box" communication. PLDM groups commands under broader functions,
>>>> and defines separate specifications for each of these functions (also
>>>> called PLDM "Types"). The currently defined Types (and corresponding
>>>> specs) are
>>>> : PLDM base (with associated IDs and states specs), BIOS, FRU,
>>>> Platform monitoring and control, Firmware Update and SMBIOS. All
>>>> these specifications are available at:
>>>>
>>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.dmtf.org_sta
>>>> ndards_pmci&d=DwICAg&c=5VD0RTtNlTh3ycd41b3MUw&r=U35IaQ-7Tnwjs7q_Fwf_b
>>>> Q&m=hfNgxW6BBJnW0LRRa3Hh2xnPH29lrZDGcvqooGTWVjc&s=qOY-dlAn__E9D7LWH6L
>>>> 16US1Sq8lsCZQX1zJv36BLN0&e=
>>>>
>>>> Some of the reasons PLDM sounds promising (some of these are
>>>> advantages over IPMI):
>>>>
>>>> - Common in-band communication protocol.
>>>>
>>>> - Already existing PLDM Type specifications that cover the most
>>>> common communication requirements. Up to 64 PLDM Types can be defined
>>>> (the last one is OEM). At the moment, 6 are defined. Each PLDM type
>>>> can house up to 256 PLDM commands.
>>>>
>>>> - PLDM sensors are 2 bytes in length.
>>>>
>>>> - PLDM introduces the concept of effecters - a control mechanism.
>>>> Both sensors and effecters are associated to entities (similar to
>>>> IPMI, entities cab be physical or logical), where sensors are a
>>>> mechanism for monitoring and effecters are a mechanism for control.
>>>> Effecters can be numeric or state based. PLDM defines commonly used
>>>> entities and their IDs, but there 8K slots available to define OEM entities.
>>>>
>>>> - PLDM allows bidirectional communication, and sending asynchronous events.
>>>>
>>>> - A very active PLDM related working group in the DMTF.
>>>>
>>>> The plan is to run PLDM over MCTP. MCTP is defined in a spec of its
>>>> own, and a proposal on the MCTP design is in discussion already.
>>>> There's going to be an intermediate PLDM over MCTP binding layer,
>>>> which lets us send PLDM messages over MCTP. This is defined in a spec
>>>> of its own, and the design for this binding will be proposed separately.
>>>>
>>>> ## Requirements
>>>>
>>>> How different BMC/Host/other applications make use of PLDM messages
>>>> is outside the scope of this requirements doc. The requirements
>>>> listed here are related to the PLDM protocol stack and the request/response model:
>>>>
>>>> - Marshalling and unmarshalling of PLDM messages, defined in various
>>>> PLDM Type specs, must be implemented. This can of course be staged
>>>> based on the need of specific Types and functions. Since this is just
>>>> encoding and decoding PLDM messages, I believe there would be
>>>> motivation to build this into a library that could be shared between
>>>> BMC, host and other firmware stacks. The specifics of each PLDM Type
>>>> (such as FRU table structures, sensor PDR structures, etc) are implemented by this lib.
>>>>
>>>> - Mapping PLDM concepts to native OpenBMC concepts must be implemented.
>>>> For e.g.: mapping PLDM sensors to phosphor-hwmon hosted D-Bus
>>>> objects, mapping PLDM FRU data to D-Bus objects hosted by
>>>> phosphor-inventory-manager, etc. The mapping shouldn't be restrictive
>>>> to D-Bus alone (meaning it shouldn't be necessary to put objects on
>>>> the Bus just so serve PLDM requests, a problem that exists with
>>>> phosphor-host-ipmid today). Essentially these are platform specific
>>>> PLDM message handlers.
>>>>
>>>> - The BMC should be able to act as a PLDM responder as well as a PLDM
>>>> requester. As a PLDM responder, the BMC can monitor/control other
>>>> devices. As a PLDM responder, the BMC can react to PLDM messages
>>>> directed to it via requesters in the platform, for e.g, the Host.
>>>>
>>>> - As a PLDM requester, the BMC must be able to discover other PLDM
>>>> enabled components in the platform.
>>>>
>>>> - As a PLDM requester, the BMC must be able to send simultaneous
>>>> messages to different responders, but at the same time it can issue a
>>>> single message to a specific responder at a time.
>>>>
>>>> - As a PLDM requester, the BMC must be able to handle out of order
>>>> responses.
>>>>
>>>> - As a PLDM responder, the BMC may simultaneously respond to messages
>>>> from different requesters, but the spec doesn't mandate this. In
>>>> other words the responder could be single-threaded.
>>>>
>>>> - It should be possible to plug-in non-existent PLDM functions (these
>>>> maybe new/existing standard Types, or OEM Types) into the PLDM stack.
>>>>
>>>> ## Proposed Design
>>>>
>>>> The following are high level structural elements of the design:
>>>>
>>>> ### PLDM encode/decode libraries
>>>>
>>>> This library would take a PLDM message, decode it and spit out the
>>>> different fields of the message. Conversely, given a PLDM Type,
>>>> command code, and the command's data fields, it would make a PLDM
>>>> message. The thought is to design this library such that it can be
>>>> used by BMC and the host firmware stacks, because it's the
>>>> encode/decode and protocol piece (and not the handling of a message).
>>>> I'd like to know if there's enough motivation to have this as a
>>>> common lib. That would mean additional requirements such as having
>>>> this as a C lib instead of C++, because of the runtime constraints of
>>>> host firmware stacks. If there's not enough interest to have this as
>>>> a common lib, this could just be part of the provider libs (see below), and it could then be written in C++.
>>>
>>>
>>> Can you elaborate a bit on the pros and cons of having PLDM library as
>>> a common C lib vs them being provider libs only?
>>
>> These two are exclusive of each other, meaning what can be common is the encoding and decoding alone. The provider libs would be platform specific. I think the main advantage of having the common piece is the BMC and every other host firmware stack needn't re-implement this part.
>> So while we should strive for this, I guess some host firmware stack might not find it usable (even if it's in C) due to other constraints.
>> These constraints might not be determinable exhaustively a priori, so the disadvantage is that I'm not sure if the common lib is worth the effort as opposed to the liberty of using something like modern C++ to code this.
>>
> 
> Great, I think having a common shared library would be nice especially if we're going to have potentially multiple daemon running linking to the shared lib.
> Also I'm wondering, would this place any constraints on the plug ins?
> For example suppose we have provider libs in libbase.so and libfru.so in C++, would other plug in modules  (e.g. libfwupdate ,libbios), do they need to be in C++ as well?

The common encode/decode libs would have to be C libs, plus any other 
constraints that commonly apply to host firmware stacks (such as limited 
dynamic memory allocations) apply to them. The provider libs, like I 
said are different than the encode/decode libs. Since they are platform 
specific, they can be implemented using whatever norms apply to a 
specific platform.

>>>>
>>>> There would be one encode/decode lib per PLDM Type. So for e.g.
>>>> something like /usr/lib/pldm/libbase.so, /usr/lib/pldm/libfru.so, etc.
>>>>
>>>> ### PLDM provider libraries
>>>>
>>>> These libraries would implement the platform specific handling of
>>>> incoming PLDM requests (basically helping with the PLDM responder
>>>> implementation, see next bullet point), so for instance they would
>>>> query D-Bus objects (or even something like a JSON file) to fetch
>>>> platform specific information to respond to the PLDM message. They
>>>> would link with the encode/decode libs. Like the encode/decode libs,
>>>> there would be one per PLDM Type (for e.g /usr/lib/pldm/providers/libfru.so).
>>>>
>>>> These libraries would essentially be plug-ins. That lets someone add
>>>> functionality for new PLDM (standard as well as OEM) Types, and it
>>>> also lets them replace default handlers. The libraries would
>>>> implement a "register" API to plug-in handlers for specific PLDM
>>>> messages. Something
>>>> like:
>>>>
>>>> template <typename Handler, typename... args> auto register(uint8_t
>>>> type, uint8_t command, Handler handler);
> One thought on this is, do you want to limit registration to Type only (e.g. a libfru),
> or open registration on command level?
> At high level I feel having 1 lib registered for a type (e.g. libfru will handle all "PLDM For FRU Data"  commands) would be very clean.
> If there are unsupported command, the lib handler would reject accordingly, and anyone can add new/modify command handler at lib.
> 
> This proposed API seems to allow multiple libraries of the same type?   e.g. libfruX.so registers  Type 4, commands 0x01, 0x05, 0x07,
> And libfruY.so has the option to register Type 4, commands 0x02, 0x04,  (or even overwrite 0x01).
> Do you want to allow  this?   (I feel it's best to just combine libFruX.so and libFruY.so  into 1 libfru.so)

I agree that overwrites should be prevented, and that in general the 
registration is per-type. Although, there might be use-cases to plug-in 
an implementation of OEM commands/extensions for an existing standard type.


>>>>
>>>> This allows for providing a strongly-typed C++ handler registration
>>>> scheme. It would also be possible to validate the parameters passed
>>>> to the handler at compile time.
>>>>
>>>> ### Request/Response Model
>>>>
>>>> There are two approaches that I've described here, and they correlate
>>>> to the two options in Jeremy's MCTP design for how to notify on
>>>> incoming PLDM messages: in-process callbacks vs D-Bus signals.
>>>>
>>>> #### With in-process callbacks
>>>>
>>>> In this case, there would be a single PLDM (over MCTP) daemon that
>>>> implements both the PLDM responder and PLDM requester function. The
>>>> daemon would link with the encode/decode libs mentioned above, and
>>>> the MCTP lib.
>>>
>>> In the case if we want to run PLDM over NCSI, do you envision having a
>>> separate NCSI daemon that also link with PLDM decode/encode lib? So in
>>> this case there'd be multiple stream of (separate) PLDM traffic.
>>
>> That's one way. Having separate daemons (linking to shared PLDM
>> libraries) per transport channel gives us greater flexibility at not too much additional cost, I think.
>>
>>>>
>>>> The PLDM responder function would involve registering the PLDM
>>>> provider libs on startup. The PLDM responder implementation would sit
>>>> in the callback handler from the transport's rx. If it receives PLDM
>>>> messages of type Request, it will route them to an appropriate
>>>> handler in a provider lib, get the response back, and send back a
>>>> PLDM response message via the transport's tx API. If it receives
>>>> messages of type Response, it will put them on a "Response queue".
>>>
>>> Do you see any needs for handler in the provider lib to communicate
>>> with other daemons?
>>
>> Yes.
>>
>> For example, PLDM sensor handler may have to query a separate
>>> sensor daemon (sensord) to get the sensor data before it can respond.
>>>
>>> If the handler needs to communicate with other daemons/applications in
>>> the system, I think this part of the design would be very similar to
>>> the "BMC as PLDM requester" design you've specified below.
>>>
>>> e.g.
>>> The response from sensord may not return right away, and the PLDM
>>> handler shouldn't block, in this case I think the handler for each PLDM type  would also need a "Request Queue"
>>> so it may queue up  incoming requests while it processes each request.
>>>
>>> Also if each PLDM Type handler needs to communicate with multiple
>>> daemons, I'm thinking having a msg_in  queue (in addition to the
>>> Request queue above) so it may receive responses back from other
>>> daemons in the system, and store PLDM IID in meta-data when
>>> communicating with other daemons so the PLDM handler can map each messages in msg_in queue to a PLDM request in Request Queue.
>>>
>>> In this case each PLDM handler would need multiple threads to handle these separate tasks.
>>
>> All this sounds reasonable to me. Implementation-wise, we might have to carefully consider multi-threading as opposed to using a single thread with ASIO/event loop.
>>
>>>>
>>>> I think designing the BMC as a PLDM requester is interesting. We
>>>> haven't had this with IPMI, because the BMC was typically an IPMI
>>>> server. I envision PLDM requester functions to be spread across
>>>> multiple OpenBMC applications (instead of a single big requester app)
>>>> - based on the responder they're talking and the high level function they implement.
>>>> For example, there could be an app that lets the BMC upgrade firmware
>>>> for other devices using PLDM - this would be a generic app in the
>>>> sense that the same set of commands might have to be run irrespective
>>>> of the device on the other side. There could also be an app that does
>>>> fan control on a remote device, based on sensors from that device and
>>>> algorithms specific to that device.
>>>>
>>>> The PLDM daemon would have to provide a D-Bus interface to send a
>>>> PLDM request message. This API would be used by apps wanting to send
>>>> out PLDM requests. If the message payload is too large, the interface
>>>> could accept an fd (containing the message), instead of an array of
>>>> bytes. The implementation of this would send the PLDM request message
>>>> via the transport's tx API, and then conditionally wait on the
>>>> response queue to have an entry that matches this request (the match is by instance id).
>>>> The conditional wait (or something equivalent) is required because
>>>> the app sending the PLDM message must block until getting a response
>>>> back from the remote PLDM device.
>>>>
>>>> With what's been described above, it's obvious that the responder and
>>>> requester functions need to be able to run concurrently (this is as
>>>> per the PLDM spec as well). The BMC can simultaneously act as a
>>>> responder and requester. Waiting on a rx from the transport layer
>>>> shouldn't block other BMC apps from sending PLDM messages. So this
>>>> means the PLDM daemon would have to be multi-threaded, or maybe we
>>>> can instead achieve this via an event loop.
>>>
>>> Do you see both Requester and Responder spawning multiple threads?
>>
>> As per the base specification, I understand that the responder and requester functions should not block each other out. The base spec says a requester terminus should wait for a response from the other end before sending a new command. The spec also says a responder may optionally be multi-threaded. So I guess the answer depends on whether we view the BMC as a single requester, or multiple virtual requesters.
>> As a responder, the BMC must definitely be able to respond to different transport channels concurrently. I'm not sure yet if concurrency is required on the same transport channel.
>>
>>> I can see them performing similar functionalities,
>>>
>>> e.g. perhaps something like this below:
>>>
>>> PLDM Requester
>>> - listens for other applications/daemons for PLDM requests, and generate and send PLDM
>>>      Requests to device (1 thread)
>>> - waits for device response,  look up original request sender via response IID and send
>>>      response back to applications/daemons (1 thread)
>>>
>>> PLDM Responder
>>>     - listens for PLDM requests from device, decode request and add it
>>> to corresponding handler's Request queue (1 thread)
>>> - each handler:
>>> 	- checks its Request Queue, process request inline (if able to) and adds response to response queue,
>>>                      If request needs data from other application, send message to other application (1 thread)
>>>               - processes incoming messages from other applications and put them to Response queue (1 thread)
>>>               - process Response queue - send response back to device
>>> (1 thread)
>>>
>>>> #### With D-Bus signals
>>>>
>>>> This lets us separate PLDM daemons from the MCTP daemon, and
>>>> eliminates the need to handle request and response messages
>>>> concurrently in the same daemon, at the cost of much more D-Bus
>>>> traffic. The MCTP daemon would emit D-Bus signals describing the type
>>>> of the PLDM message
>>>> (request/response) and containing the message payload. Alternatively
>>>> it could pass the PLDM message over a D-Bus API that the PLDM daemons
>>>> would implement. The MCTP daemon would also implement a D-Bus API to
>>>> send PLDM messages, as with the previous approach.
>>>>
>>>> With this approach, I'd recommend two separate PLDM daemons - a
>>>> responder daemon and a requester daemon. The responder daemon reacts
>>>> to D-Bus signals corresponding to PLDM Request messages. It handles
>>>> incoming requests as before. The requester daemon would react to
>>>> D-Bus signals corresponding to PLDM response messages. It would
>>>> implement the instance id generation, and would also implement the
>>>> response queue and the conditional wait on that queue. It would also
>>>> have to implement a D-Bus API to let other PLDM-enabled OpenBMC apps
>>>> send PLDM requests. The implementation of that API would send the
>>>> message to the MCTP daemon, and then block on the response queue to get a response back.
>>>
>>> Similar to previous "in-process callback" approach, the  Responder
>>> daemon may have to send D-Bus signals to other applications in order process a PLDM request?
>>
>> I was thinking the responder would make D-Bus method calls.
>>
>>> Is there a way for any daemons in the system to register a
>>> communication channel With PLDM handler?
>>
>> That's a good question. We should design an API for this.
>>
>>>> ### Multiple requesters and responders
>>>>
>>>> The PLDM spec does allow simultaneous connections between multiple
>>>> responders/requesters. For e.g. the BMC talking to a multi-host
>>>> system on two different physical channels. Instead of implementing
>>>> this in one MCTP/PLDM daemon, we could spawn one daemon per physical channel.
>>>
>>> OK I see, so in this case a daemon monitor MCTP channel would have its
>>> own PLDM handler, and a daemon monitoring NCSI channel would spawn its
>>> PLDM handler, both streams of PLDM traffic occurs independently of
>>> each other and have its own series of instance IDs.
>>>
>>>> ## Impacts
>>>>
>>>> Development would be required to implement the PLDM protocol, the
>>>> request/response model, and platform specific handling. Low level
>>>> design is required to implement the protocol specifics of each of the
>>>> PLDM Types. Such low level design is not included in this proposal.
>>>>
>>>> Design and development needs to involve potential host firmware
>>>> implementations.
>>>>
>>>> ## Testing
>>>>
>>>> Testing can be done without having to depend on the underlying
>>>> transport layer.
>>>>
>>>> The responder function can be tested by mocking a requester and the
>>>> transport layer: this would essentially test the protocol handling
>>>> and platform specific handling. The requester function can be tested
>>>> by mocking a responder: this would test the instance id handling and
>>>> the send/receive functions.
>>>>
>>>> APIs from the shared libraries can be tested via fuzzing.
>>>
>>> Thanks!
>>> -Ben
>>
>> Please do let me know if you have additional questions. I plan to incorporate your feedback, and I'll most likely post the next draft on Gerrit.
> 
> Great! Looking forward to it.
> 
> Best,
> -Ben

Thanks,
Deepak
