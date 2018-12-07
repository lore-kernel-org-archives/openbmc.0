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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43B0xj0sDfzDrZZ
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 16:14:00 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wB759npn041002
 for <openbmc@lists.ozlabs.org>; Fri, 7 Dec 2018 00:13:59 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2p7g55mybm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Dec 2018 00:13:58 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 7 Dec 2018 05:13:55 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Dec 2018 05:13:52 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wB75DpbK34930916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Dec 2018 05:13:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1769F11C04A;
 Fri,  7 Dec 2018 05:13:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 281B511C050;
 Fri,  7 Dec 2018 05:13:49 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.77.207.55])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Dec 2018 05:13:48 +0000 (GMT)
Subject: Re: Initial MCTP design proposal
To: Jeremy Kerr <jk@ozlabs.org>, openbmc <openbmc@lists.ozlabs.org>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 David Thompson <dthompson@mellanox.com>, Dong Wei <Dong.Wei@arm.com>,
 Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 7 Dec 2018 10:43:48 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18120705-0012-0000-0000-000002D5D5AF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120705-0013-0000-0000-0000210B3DEF
Message-Id: <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812070044
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
X-List-Received-Date: Fri, 07 Dec 2018 05:14:01 -0000

On 07/12/18 8:11 AM, Jeremy Kerr wrote:
> Hi OpenBMCers!
> 
> In an earlier thread, I promised to sketch out a design for a MCTP
> implementation in OpenBMC, and I've included it below.


Thanks Jeremy for sending this out. This looks good (have just one 
comment below).

Question for everyone : do you have plans to employ PLDM over MCTP?

We are interested in PLDM for various "inside the box" communications 
(at the moment for the Host <-> BMC communication). I'd like to propose 
a design for a PLDM stack on OpenBMC, and would send a design template 
for review on the mailing list in some amount of time (I've just started 
with some initial sketches). I'd like to also know if others have 
embarked on a similar activity, so that we can collaborate earlier and 
avoid duplicate work.

> This is roughly in the OpenBMC design document format (thanks for the
> reminder Andrew), but I've sent it to the list for initial review before
> proposing to gerrit - mainly because there were a lot of folks who
> expressed interest on the list. I suggest we move to gerrit once we get
> specific feedback coming in. Let me know if you have general comments
> whenever you like though.
> 
> In parallel, I've been developing a prototype for the MCTP library
> mentioned below, including a serial transport binding. I'll push to
> github soon and post a link, once I have it in a
> slightly-more-consumable form.
> 
> Cheers,
> 
> 
> Jeremy
> 
> --------------------------------------------------------
> 
> # Host/BMC communication channel: MCTP & PLDM
> 
> Author: Jeremy Kerr <jk@ozlabs.org> <jk>
> 
> ## Problem Description
> 
> Currently, we have a few different methods of communication between host
> and BMC. This is primarily IPMI-based, but also includes a few
> hardware-specific side-channels, like hiomap. On OpenPOWER hardware at
> least, we've definitely started to hit some of the limitations of IPMI
> (for example, we have need for >255 sensors), as well as the hardware
> channels that IPMI typically uses.
> 
> This design aims to use the Management Component Transport Protocol
> (MCTP) to provide a common transport layer over the multiple channels
> that OpenBMC platforms provide. Then, on top of MCTP, we have the
> opportunity to move to newer host/BMC messaging protocols to overcome
> some of the limitations we've encountered with IPMI.
> 
> ## Background and References
> 
> Separating the "transport" and "messaging protocol" parts of the current
> stack allows us to design these parts separately. Currently, IPMI
> defines both of these; we currently have BT and KCS (both defined as
> part of the IPMI 2.0 standard) as the transports, and IPMI itself as the
> messaging protocol.
> 
> Some efforts of improving the hardware transport mechanism of IPMI have
> been attempted, but not in a cross-implementation manner so far. This
> does not address some of the limitations of the IPMI data model.
> 
> MCTP defines a standard transport protocol, plus a number of separate
> hardware bindings for the actual transport of MCTP packets. These are
> defined by the DMTF's Platform Management Working group; standards are
> available at:
> 
>    https://www.dmtf.org/standards/pmci
> 
> I have included a small diagram of how these standards may fit together
> in an OpenBMC system. The DSP numbers there are references to DMTF
> standards.
> 
> One of the key concepts here is that separation of transport protocol
> from the hardware bindings; this means that an MCTP "stack" may be using
> either a I2C, PCI, Serial or custom hardware channel, without the higher
> layers of that stack needing to be aware of the hardware implementation.
> These higher levels only need to be aware that they are communicating
> with a certain entity, defined by an Entity ID (MCTP EID).
> 
> I've mainly focussed on the "transport" part of the design here. While
> this does enable new messaging protocols (mainly PLDM), I haven't
> covered that much; we will propose those details for a separate design
> effort.
> 
> As part of the design, I have referred to MCTP "messages" and "packets";
> this is intentional, to match the definitions in the MCTP standard. MCTP
> messages are the higher-level data transferred between MCTP endpoints,
> which packets are typically smaller, and are what is sent over the
> hardware. Messages that are larger than the hardware MTU are split into
> individual packets by the transmit implementation, and reassembled at
> the receive implementation.
> 
> A final important point is that this design is for the host <--> BMC
> channel *only*. Even if we do replace IPMI for the host interface, we
> will certainly need an IPMI interface available for external system
> management.
> 
> ## Requirements
> 
> Any channel between host and BMC should:
> 
>   - Have a simple serialisation and deserialisation format, to enable
>     implementations in host firmware, which have widely varying runtime
>     capabilities
> 
>   - Allow different hardware channels, as we have a wide variety of
>     target platforms for OpenBMC
> 
>   - Be usable over simple hardware implementations, but have a facility
>     for higher bandwidth messaging on platforms that require it.
> 
>   - Ideally, integrate with newer messaging protocols
> 
> ## Proposed Design
> 
> The MCTP core specification just provides the packetisation, routing and
> addressing mechanisms. The actual transmit/receive of those packets is
> up to the hardware binding of the MCTP transport.
> 
> For OpenBMC, we would introduce an MCTP daemon, which implements the
> transport over a configurable hardware channel (eg., Serial UART, I2C or
> PCI). This daemon is responsible for the packetisation and routing of
> MCTP messages to and from host firmware.
> 
> I see two options for the "inbound" or "application" interface of the
> MCTP daemon:
> 
>   - it could handle upper parts of the stack (eg PLDM) directly, through
>     in-process handlers that register for certain MCTP message types; or

We'd like to somehow ensure (at least via documentation) that the 
handlers don't block the MCTP daemon from processing incoming traffic. 
The handlers might anyway end up making IPC calls (via D-Bus) to other 
processes. The second approach below seems to alleviate this problem.

>   - it could channel raw MCTP messages (reassembled from MCTP packets) to
>     DBUS messages (similar to the current IPMI host daemons), where the
>     upper layers receive and act on those DBUS events.
> 
> I have a preference for the former, but I would be interested to hear
> from the IPMI folks about how the latter structure has worked in the
> past.
> 
> The proposed implementation here is to produce an MCTP "library" which
> provides the packetisation and routing functions, between:
> 
>   - an "upper" messaging transmit/receive interface, for tx/rx of a full
>     message to a specific endpoint
> 
>   - a "lower" hardware binding for transmit/receive of individual
>     packets, providing a method for the core to tx/rx each packet to
>     hardware
> 
> The lower interface would be plugged in to one of a number of
> hardware-specific binding implementations (most of which would be
> included in the library source tree, but others can be plugged-in too)
> 
> The reason for a library is to allow the same MCTP implementation to be
> used in both OpenBMC and host firmware; the library should be
> bidirectional. To allow this, the library would be written in portable C
> (structured in a way that can be compiled as "extern C" in C++
> codebases), and be able to be configured to suit those runtime
> environments (for example, POSIX IO may not be available on all
> platforms; we should be able to compile the library to suit). The
> licence for the library should also allow this re-use; I'd suggest a
> dual Apache & GPL licence.
> 
> As for the hardware bindings, we would want to implement a serial
> transport binding first, to allow easy prototyping in simulation. For
> OpenPOWER, we'd want to implement a "raw LPC" binding for better
> performance, and later PCIe for large transfers. I imagine that there is
> a need for an I2C binding implementation for other hardware platforms
> too.
> 
> Lastly, I don't want to exclude any currently-used interfaces by
> implementing MCTP - this should be an optional component of OpenBMC, and
> not require platforms to implement it.
> 
> ## Alternatives Considered
> 
> There have been two main alternatives to this approach:
> 
> Continue using IPMI, but start making more use of OEM extensions to
> suit the requirements of new platforms. However, given that the IPMI
> standard is no longer under active development, we would likely end up
> with a large amount of platform-specific customisations. This also does
> not solve the hardware channel issues in a standard manner.
> 
> Redfish between host and BMC. This would mean that host firmware needs a
> HTTP client, a TCP/IP stack, a JSON (de)serialiser, and support for
> Redfish schema. This is not feasible for all host firmware
> implementations; certainly not for OpenPOWER. It's possible that we
> could run a simplified Redfish stack - indeed, MCTP has a proposal for a
> Redfish-over-MCTP protocol, which uses simplified serialisation and no
> requirement on HTTP. However, this still introduces a large amount of
> complexity in host firmware.
> 
> ## Impacts
> 
> Development would be required to implement the MCTP transport, plus any
> new users of the MCTP messaging (eg, a PLDM implementation). These would
> somewhat duplicate the work we have in IPMI handlers.
> 
> We'd want to keep IPMI running in parallel, so the "upgrade" path should
> be fairly straightforward.
> 
> Design and development needs to involve potential host firmware
> implementations.
> 
> ## Testing
> 
> For the core MCTP library, we are able to run tests there in complete
> isolation (I have already been able to run a prototype MCTP stack
> through the afl fuzzer) to ensure that the core transport protocol
> works.
> 
> For MCTP hardware bindings, we would develop channel-specific tests that
> would be run in CI on both host and BMC.
> 
> For the OpenBMC MCTP daemon implementation, testing models would depend
> on the structure we adopt in the design section.
> 

Regards,
Deepak
