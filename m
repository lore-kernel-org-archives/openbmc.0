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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FzgS45NmzDqnV
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 03:30:28 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBDGSBLf038068
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 11:30:25 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2pbtyp83x8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 11:30:25 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 13 Dec 2018 16:30:23 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 13 Dec 2018 16:30:21 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wBDGUKUc49545390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Dec 2018 16:30:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56F48AE045;
 Thu, 13 Dec 2018 16:30:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5B5FAE05A;
 Thu, 13 Dec 2018 16:30:18 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.172])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Dec 2018 16:30:18 +0000 (GMT)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, Emily Shaffer <emilyshaffer@google.com>,
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomjose@linux.vnet.ibm.com
Subject: PLDM design proposal
Date: Thu, 13 Dec 2018 22:00:18 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18121316-0008-0000-0000-000002A0E16F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121316-0009-0000-0000-0000220B6401
Message-Id: <1f371684-8db6-3a02-cefe-d073856599ab@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812130141
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
X-List-Received-Date: Thu, 13 Dec 2018 16:30:29 -0000

Hi All,

I've put down some thoughts below on an initial PLDM design on OpenBMC. 
Thie structure of the document is based on the OpenBMC design template. 
Please review and let me know your feedback. Once we've had a discussion 
here on the list, I can move this to Gerrit with some more details. I'd 
say reading the MCTP proposal from Jeremy should be a precursor to 
reading this.

# PLDM Stack on OpenBMC

Author: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> <dkodihal>

## Problem Description

On OpenBMC, in-band IPMI is currently the primary industry-standard 
means of communication between the BMC and the Host firmware. We've 
started hitting some inherent limitations of IPMI on OpenPOWER servers: 
a limited number of sensors, and a lack of a generic control mechanism 
(sensors are a generic monitoring mechanism) are the major ones. There 
is a need to improve upon the communication protocol, but at the same 
time inventing a custom protocol is undesirable.

This design aims to employ Platform Level Data Model (PLDM), a standard 
application layer communication protocol defined by the DMTF. PLDM draws 
inputs from IPMI, but it overcomes most of the latter's limitations. 
PLDM is also designed to run on standard transport protocols, for e.g. 
MCTP (also designed by the DMTF). MCTP provides for a common transport 
layer over several physical channels, by defining hardware bindings. The 
solution of PLDM over MCTP also helps overcome some of the limitations 
of the hardware channels that IPMI uses.

PLDM's purpose is to enable all sorts of "inside the box communication": 
BMC - Host, BMC - BMC, BMC - Network Controller and BMC - Other (for 
e.g. sensor) devices. This design doesn't preclude enablement of 
communication channels not involving the BMC and the host.

## Background and References

PLDM is designed to be an effective interface and data model that 
provides efficient access to low-level platform inventory, monitoring, 
control, event, and data/parameters transfer functions. For example, 
temperature, voltage, or fan sensors can have a PLDM representation that 
can be used to monitor and control the platform using a set of PLDM 
messages. PLDM defines data representations and commands that abstract 
the platform management hardware.

As stated earlier, PLDM is designed for different flavors of "inside the 
box" communication. PLDM groups commands under broader functions, and 
defines separate specifications for each of these functions (also called 
PLDM "Types"). The currently defined Types (and corresponding specs) are 
: PLDM base (with associated IDs and states specs), BIOS, FRU, Platform 
monitoring and control, Firmware Update and SMBIOS. All these 
specifications are available at:

https://www.dmtf.org/standards/pmci

Some of the reasons PLDM sounds promising (some of these are advantages 
over IPMI):

- Common in-band communication protocol.

- Already existing PLDM Type specifications that cover the most common 
communication requirements. Up to 64 PLDM Types can be defined (the last 
one is OEM). At the moment, 6 are defined. Each PLDM type can house up 
to 256 PLDM commands.

- PLDM sensors are 2 bytes in length.

- PLDM introduces the concept of effecters - a control mechanism. Both 
sensors and effecters are associated to entities (similar to IPMI, 
entities cab be physical or logical), where sensors are a mechanism for 
monitoring and effecters are a mechanism for control. Effecters can be 
numeric or state based. PLDM defines commonly used entities and their 
IDs, but there 8K slots available to define OEM entities.

- PLDM allows bidirectional communication, and sending asynchronous events.

- A very active PLDM related working group in the DMTF.

The plan is to run PLDM over MCTP. MCTP is defined in a spec of its own, 
and a proposal on the MCTP design is in discussion already. There's 
going to be an intermediate PLDM over MCTP binding layer, which lets us 
send PLDM messages over MCTP. This is defined in a spec of its own, and 
the design for this binding will be proposed separately.

## Requirements

How different BMC/Host/other applications make use of PLDM messages is 
outside the scope of this requirements doc. The requirements listed here 
are related to the PLDM protocol stack and the request/response model:

- Marshalling and unmarshalling of PLDM messages, defined in various 
PLDM Type specs, must be implemented. This can of course be staged based 
on the need of specific Types and functions. Since this is just encoding 
and decoding PLDM messages, I believe there would be motivation to build 
this into a library that could be shared between BMC, host and other 
firmware stacks. The specifics of each PLDM Type (such as FRU table 
structures, sensor PDR structures, etc) are implemented by this lib.

- Mapping PLDM concepts to native OpenBMC concepts must be implemented. 
For e.g.: mapping PLDM sensors to phosphor-hwmon hosted D-Bus objects, 
mapping PLDM FRU data to D-Bus objects hosted by 
phosphor-inventory-manager, etc. The mapping shouldn't be restrictive to 
D-Bus alone (meaning it shouldn't be necessary to put objects on the Bus 
just so serve PLDM requests, a problem that exists with 
phosphor-host-ipmid today). Essentially these are platform specific PLDM 
message handlers.

- The BMC should be able to act as a PLDM responder as well as a PLDM 
requester. As a PLDM responder, the BMC can monitor/control other 
devices. As a PLDM responder, the BMC can react to PLDM messages 
directed to it via requesters in the platform, for e.g, the Host.

- As a PLDM requester, the BMC must be able to discover other PLDM 
enabled components in the platform.

- As a PLDM requester, the BMC must be able to send simultaneous 
messages to different responders, but at the same time it can issue a 
single message to a specific responder at a time.

- As a PLDM requester, the BMC must be able to handle out of order 
responses.

- As a PLDM responder, the BMC may simultaneously respond to messages 
from different requesters, but the spec doesn't mandate this. In other 
words the responder could be single-threaded.

- It should be possible to plug-in non-existent PLDM functions (these 
maybe new/existing standard Types, or OEM Types) into the PLDM stack.

## Proposed Design

The following are high level structural elements of the design:

### PLDM encode/decode libraries

This library would take a PLDM message, decode it and spit out the 
different fields of the message. Conversely, given a PLDM Type, command 
code, and the command's data fields, it would make a PLDM message. The 
thought is to design this library such that it can be used by BMC and 
the host firmware stacks, because it's the encode/decode and protocol 
piece (and not the handling of a message). I'd like to know if there's 
enough motivation to have this as a common lib. That would mean 
additional requirements such as having this as a C lib instead of C++, 
because of the runtime constraints of host firmware stacks. If there's 
not enough interest to have this as a common lib, this could just be 
part of the provider libs (see below), and it could then be written in C++.

There would be one encode/decode lib per PLDM Type. So for e.g. 
something like /usr/lib/pldm/libbase.so, /usr/lib/pldm/libfru.so, etc.

### PLDM provider libraries

These libraries would implement the platform specific handling of 
incoming PLDM requests (basically helping with the PLDM responder 
implementation, see next bullet point), so for instance they would query 
D-Bus objects (or even something like a JSON file) to fetch platform 
specific information to respond to the PLDM message. They would link 
with the encode/decode libs. Like the encode/decode libs, there would be 
one per PLDM Type (for e.g /usr/lib/pldm/providers/libfru.so).

These libraries would essentially be plug-ins. That lets someone add 
functionality for new PLDM (standard as well as OEM) Types, and it also 
lets them replace default handlers. The libraries would implement a 
"register" API to plug-in handlers for specific PLDM messages. Something 
like:

template <typename Handler, typename... args>
auto register(uint8_t type, uint8_t command, Handler handler);

This allows for providing a strongly-typed C++ handler registration 
scheme. It would also be possible to validate the parameters passed to 
the handler at compile time.

### Request/Response Model

There are two approaches that I've described here, and they correlate to 
the two options in Jeremy's MCTP design for how to notify on incoming 
PLDM messages: in-process callbacks vs D-Bus signals.

#### With in-process callbacks

In this case, there would be a single PLDM (over MCTP) daemon that 
implements both the PLDM responder and PLDM requester function. The 
daemon would link with the encode/decode libs mentioned above, and the 
MCTP lib.

The PLDM responder function would involve registering the PLDM provider 
libs on startup. The PLDM responder implementation would sit in the 
callback handler from the transport's rx. If it receives PLDM messages 
of type Request, it will route them to an appropriate handler in a 
provider lib, get the response back, and send back a PLDM response 
message via the transport's tx API. If it receives messages of type 
Response, it will put them on a "Response queue".

I think designing the BMC as a PLDM requester is interesting. We haven't 
had this with IPMI, because the BMC was typically an IPMI server. I 
envision PLDM requester functions to be spread across multiple OpenBMC 
applications (instead of a single big requester app) - based on the 
responder they're talking and the high level function they implement. 
For example, there could be an app that lets the BMC upgrade firmware 
for other devices using PLDM - this would be a generic app in the sense 
that the same set of commands might have to be run irrespective of the 
device on the other side. There could also be an app that does fan 
control on a remote device, based on sensors from that device and 
algorithms specific to that device.

The PLDM daemon would have to provide a D-Bus interface to send a PLDM 
request message. This API would be used by apps wanting to send out PLDM 
requests. If the message payload is too large, the interface could 
accept an fd (containing the message), instead of an array of bytes. The 
implementation of this would send the PLDM request message via the 
transport's tx API, and then conditionally wait on the response queue to 
have an entry that matches this request (the match is by instance id). 
The conditional wait (or something equivalent) is required because the 
app sending the PLDM message must block until getting a response back 
from the remote PLDM device.

With what's been described above, it's obvious that the responder and 
requester functions need to be able to run concurrently (this is as per 
the PLDM spec as well). The BMC can simultaneously act as a responder 
and requester. Waiting on a rx from the transport layer shouldn't block 
other BMC apps from sending PLDM messages. So this means the PLDM daemon 
would have to be multi-threaded, or maybe we can instead achieve this 
via an event loop.

#### With D-Bus signals

This lets us separate PLDM daemons from the MCTP daemon, and eliminates 
the need to handle request and response messages concurrently in the 
same daemon, at the cost of much more D-Bus traffic. The MCTP daemon 
would emit D-Bus signals describing the type of the PLDM message 
(request/response) and containing the message payload. Alternatively it 
could pass the PLDM message over a D-Bus API that the PLDM daemons would 
implement. The MCTP daemon would also implement a D-Bus API to send PLDM 
messages, as with the previous approach.

With this approach, I'd recommend two separate PLDM daemons - a 
responder daemon and a requester daemon. The responder daemon reacts to 
D-Bus signals corresponding to PLDM Request messages. It handles 
incoming requests as before. The requester daemon would react to D-Bus 
signals corresponding to PLDM response messages. It would implement the 
instance id generation, and would also implement the response queue and 
the conditional wait on that queue. It would also have to implement a 
D-Bus API to let other PLDM-enabled OpenBMC apps send PLDM requests. The 
implementation of that API would send the message to the MCTP daemon, 
and then block on the response queue to get a response back.

### Multiple requesters and responders

The PLDM spec does allow simultaneous connections between multiple 
responders/requesters. For e.g. the BMC talking to a multi-host system 
on two different physical channels. Instead of implementing this in one 
MCTP/PLDM daemon, we could spawn one daemon per physical channel.

## Impacts

Development would be required to implement the PLDM protocol, the 
request/response model, and platform specific handling. Low level design 
is required to implement the protocol specifics of each of the PLDM 
Types. Such low level design is not included in this proposal.

Design and development needs to involve potential host firmware
implementations.

## Testing

Testing can be done without having to depend on the underlying transport 
layer.

The responder function can be tested by mocking a requester and the 
transport layer: this would essentially test the protocol handling and 
platform specific handling. The requester function can be tested by 
mocking a responder: this would test the instance id handling and the 
send/receive functions.

APIs from the shared libraries can be tested via fuzzing.

Thanks,
Deepak
