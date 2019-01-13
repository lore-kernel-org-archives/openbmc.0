Return-Path: <prvs=69168832a3=benwei@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69168832a3=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="kNm/IEZX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="RVBgCLHX"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43cjmn1KmHzDqr6
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jan 2019 15:09:55 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0D46Dfw019292
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jan 2019 20:09:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=4t9+f2hKXh7EXebDnmzs6lre7TxePz085JjA/NtSiNI=;
 b=kNm/IEZXLTii/VDB6PIVH7IDpb5RFGO1oti3mFxbKgjJf8tiYhE5Eb95KRdTHEchTUUf
 gEXgid/ug4blWvpITxSfxZhThprdswKDhj8ti78pnPCE4v8GCmkUTEN9A+kQhUYbv6id
 pXrcHk2sIkIYRDVFYdvVElCUsY0ZniIgMtw= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pyetj1mw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jan 2019 20:09:53 -0800
Received: from frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Sat, 12 Jan 2019 20:09:45 -0800
Received: from frc-hub03.TheFacebook.com (2620:10d:c021:18::173) by
 frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Sat, 12 Jan 2019 20:09:45 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.73) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Sat, 12 Jan 2019 20:09:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4t9+f2hKXh7EXebDnmzs6lre7TxePz085JjA/NtSiNI=;
 b=RVBgCLHX8eMhRHyWRPNxqkCKZqSSQVKAhEC/Doi88p/gyh9QHKvarOkBq7ekyEqtfM0fZsVmQKY33i/Wv9FeY4oilkXCt4zgxcUtWRM44jfWuUD6hTBz0Zzb4N1DEi6q0YaFzMGArMVu3VwTsTuD5jsUkre7Is567RorXt584wc=
Received: from MWHPR15MB1327.namprd15.prod.outlook.com (10.175.3.141) by
 MWHPR15MB1120.namprd15.prod.outlook.com (10.175.2.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.17; Sun, 13 Jan 2019 04:09:43 +0000
Received: from MWHPR15MB1327.namprd15.prod.outlook.com
 ([fe80::3042:a639:d58d:635b]) by MWHPR15MB1327.namprd15.prod.outlook.com
 ([fe80::3042:a639:d58d:635b%10]) with mapi id 15.20.1516.019; Sun, 13 Jan
 2019 04:09:43 +0000
From: Ben Wei <benwei@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: PLDM design proposal 
Thread-Topic: PLDM design proposal 
Thread-Index: AdSq9cGzNRfhGLaSRJKSYbm3cr5ukQ==
Date: Sun, 13 Jan 2019 04:09:43 +0000
Message-ID: <MWHPR15MB1327A59DC0012C831B79E817A3870@MWHPR15MB1327.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2600:1700:1150:8cc0:f562:f9c:72:a569]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1120;
 20:vtke5XEGIrKUrakAzipUKJ7nzzyJPbFKq4tHKgxFk+dgU/emyXm3OQutqcmkTSSl4vlxitOZgSXJYzs4uLpvoptGEC9YX5F/eaCVKc3JPsANqFs1ENNhOK4TIw5B0YNCoPoqiLULFiTd75Z94SsqcwC9G2SeuBI2xtVkmZCr3C8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 2d9b3dfd-58b9-4d28-a597-08d6790cf260
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1120; 
x-ms-traffictypediagnostic: MWHPR15MB1120:
x-microsoft-antispam-prvs: <MWHPR15MB1120A041B81367C18163D5FAA3870@MWHPR15MB1120.namprd15.prod.outlook.com>
x-forefront-prvs: 0916FC3A18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(366004)(136003)(39860400002)(346002)(53754006)(25584004)(199004)(189003)(2501003)(7696005)(486006)(305945005)(256004)(14444005)(8936002)(81156014)(1730700003)(46003)(7736002)(81166006)(99286004)(316002)(25786009)(4743002)(476003)(8676002)(30864003)(102836004)(6506007)(9686003)(6246003)(6306002)(53936002)(53946003)(68736007)(74316002)(6116002)(2906002)(2351001)(966005)(14454004)(575784001)(86362001)(478600001)(33656002)(561944003)(105586002)(106356001)(5640700003)(55016002)(229853002)(186003)(5660300001)(7116003)(97736004)(6436002)(6916009)(3480700005)(71200400001)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1120;
 H:MWHPR15MB1327.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 45L2p9GuhDi7QE85zfyEUfTTDFL/FZcJyAZhhtoeVnWT2L+JzPmU7DqXqbCZWgruPhhuXuDfExNo2wPKImVZ+PSdohBvTWEg8CV1ZZDBgHHW+EW4It3Yl40JpMzVVrt1PxpT5S6sExtQMm7gOMTb3LI1YaxmuFsf3ipUfuD0YGj1zMd7InO4ZASeYBcQkU6hFMWCZAXGb+WO/Y9SVjUWyrHcDwINp+c4Gdp1iSbzktfxrnxbys7Q/VUOZ6C3ZrS3VRDrxCoAoy7655XCo0pYWfMCFnxCLRTzbHedj3BgTxtnbG/bGRxyu85OrXV42q4iA8/k5ni8H1RWZ9d4yky2PG9mp/u9aHqkiHonv7QxXJOQYhXgTFFaCdVUnMvLrJy+4b5idI8XShO1TnhYfDb/TVNI8Yki8VEpMfZr50j601Q=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9b3dfd-58b9-4d28-a597-08d6790cf260
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2019 04:09:43.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1120
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-13_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Sun, 13 Jan 2019 04:10:03 -0000

Hi Deepak,

Thanks for providing the detailed design and the background info.=20
I just have some questions and comments below,=20

> Hi All,
>
> I've put down some thoughts below on an initial PLDM design on OpenBMC.=20
> The structure of the document is based on the OpenBMC design template.=20
> Please review and let me know your feedback. Once we've had a discussion=
=20
> here on the list, I can move this to Gerrit with some more details. I'd=20
> say reading the MCTP proposal from Jeremy should be a precursor to=20
> reading this.
>
> # PLDM Stack on OpenBMC
>
> Author: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com> <dkodihal>
>
> ## Problem Description
>
> On OpenBMC, in-band IPMI is currently the primary industry-standard=20
> means of communication between the BMC and the Host firmware. We've=20
> started hitting some inherent limitations of IPMI on OpenPOWER servers:=20
> a limited number of sensors, and a lack of a generic control mechanism=20
> (sensors are a generic monitoring mechanism) are the major ones. There=20
> is a need to improve upon the communication protocol, but at the same=20
> time inventing a custom protocol is undesirable.
>
> This design aims to employ Platform Level Data Model (PLDM), a standard=20
> application layer communication protocol defined by the DMTF. PLDM draws=
=20
> inputs from IPMI, but it overcomes most of the latter's limitations.=20
> PLDM is also designed to run on standard transport protocols, for e.g.=20
> MCTP (also designed by the DMTF). MCTP provides for a common transport=20
> layer over several physical channels, by defining hardware bindings. The=
=20
> solution of PLDM over MCTP also helps overcome some of the limitations=20
> of the hardware channels that IPMI uses.
>
> PLDM's purpose is to enable all sorts of "inside the box communication":=
=20
> BMC - Host, BMC - BMC, BMC - Network Controller and BMC - Other (for=20
> e.g. sensor) devices. This design doesn't preclude enablement of=20
> communication channels not involving the BMC and the host.
>
> ## Background and References
>
> PLDM is designed to be an effective interface and data model that=20
> provides efficient access to low-level platform inventory, monitoring,=20
> control, event, and data/parameters transfer functions. For example,=20
> temperature, voltage, or fan sensors can have a PLDM representation that=
=20
> can be used to monitor and control the platform using a set of PLDM=20
> messages. PLDM defines data representations and commands that abstract=20
> the platform management hardware.
>
> As stated earlier, PLDM is designed for different flavors of "inside the=
=20
> box" communication. PLDM groups commands under broader functions, and=20
> defines separate specifications for each of these functions (also called=
=20
> PLDM "Types"). The currently defined Types (and corresponding specs) are=
=20
>: PLDM base (with associated IDs and states specs), BIOS, FRU, Platform=20
> monitoring and control, Firmware Update and SMBIOS. All these=20
> specifications are available at:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.dmtf.org_stand=
ards_pmci&d=3DDwICAg&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3DU35IaQ-7Tnwjs7q_Fwf_bQ&=
m=3DhfNgxW6BBJnW0LRRa3Hh2xnPH29lrZDGcvqooGTWVjc&s=3DqOY-dlAn__E9D7LWH6L16US=
1Sq8lsCZQX1zJv36BLN0&e=3D
>
> Some of the reasons PLDM sounds promising (some of these are advantages=20
> over IPMI):
>
> - Common in-band communication protocol.
>
> - Already existing PLDM Type specifications that cover the most common=20
> communication requirements. Up to 64 PLDM Types can be defined (the last=
=20
> one is OEM). At the moment, 6 are defined. Each PLDM type can house up=20
> to 256 PLDM commands.
>
> - PLDM sensors are 2 bytes in length.
>
> - PLDM introduces the concept of effecters - a control mechanism. Both=20
> sensors and effecters are associated to entities (similar to IPMI,=20
> entities cab be physical or logical), where sensors are a mechanism for=20
> monitoring and effecters are a mechanism for control. Effecters can be=20
> numeric or state based. PLDM defines commonly used entities and their=20
> IDs, but there 8K slots available to define OEM entities.
>=20
> - PLDM allows bidirectional communication, and sending asynchronous event=
s.
>
> - A very active PLDM related working group in the DMTF.
>
> The plan is to run PLDM over MCTP. MCTP is defined in a spec of its own,=
=20
> and a proposal on the MCTP design is in discussion already. There's=20
> going to be an intermediate PLDM over MCTP binding layer, which lets us=20
> send PLDM messages over MCTP. This is defined in a spec of its own, and=20
> the design for this binding will be proposed separately.
>
> ## Requirements
>
> How different BMC/Host/other applications make use of PLDM messages is=20
> outside the scope of this requirements doc. The requirements listed here=
=20
> are related to the PLDM protocol stack and the request/response model:
>
> - Marshalling and unmarshalling of PLDM messages, defined in various=20
> PLDM Type specs, must be implemented. This can of course be staged based=
=20
> on the need of specific Types and functions. Since this is just encoding=
=20
> and decoding PLDM messages, I believe there would be motivation to build=
=20
> this into a library that could be shared between BMC, host and other=20
> firmware stacks. The specifics of each PLDM Type (such as FRU table=20
> structures, sensor PDR structures, etc) are implemented by this lib.
>
> - Mapping PLDM concepts to native OpenBMC concepts must be implemented.=20
> For e.g.: mapping PLDM sensors to phosphor-hwmon hosted D-Bus objects,=20
> mapping PLDM FRU data to D-Bus objects hosted by=20
> phosphor-inventory-manager, etc. The mapping shouldn't be restrictive to=
=20
> D-Bus alone (meaning it shouldn't be necessary to put objects on the Bus=
=20
> just so serve PLDM requests, a problem that exists with=20
> phosphor-host-ipmid today). Essentially these are platform specific PLDM=
=20
> message handlers.
>
> - The BMC should be able to act as a PLDM responder as well as a PLDM=20
> requester. As a PLDM responder, the BMC can monitor/control other=20
> devices. As a PLDM responder, the BMC can react to PLDM messages=20
> directed to it via requesters in the platform, for e.g, the Host.
>
> - As a PLDM requester, the BMC must be able to discover other PLDM=20
> enabled components in the platform.
>
> - As a PLDM requester, the BMC must be able to send simultaneous=20
> messages to different responders, but at the same time it can issue a=20
> single message to a specific responder at a time.
>
> - As a PLDM requester, the BMC must be able to handle out of order=20
> responses.
>
> - As a PLDM responder, the BMC may simultaneously respond to messages=20
> from different requesters, but the spec doesn't mandate this. In other=20
> words the responder could be single-threaded.
>
> - It should be possible to plug-in non-existent PLDM functions (these=20
> maybe new/existing standard Types, or OEM Types) into the PLDM stack.
>
> ## Proposed Design
>
> The following are high level structural elements of the design:
>
> ### PLDM encode/decode libraries
>
> This library would take a PLDM message, decode it and spit out the=20
> different fields of the message. Conversely, given a PLDM Type, command=20
> code, and the command's data fields, it would make a PLDM message. The=20
> thought is to design this library such that it can be used by BMC and=20
> the host firmware stacks, because it's the encode/decode and protocol=20
> piece (and not the handling of a message). I'd like to know if there's=20
> enough motivation to have this as a common lib. That would mean=20
> additional requirements such as having this as a C lib instead of C++,=20
> because of the runtime constraints of host firmware stacks. If there's=20
> not enough interest to have this as a common lib, this could just be=20
> part of the provider libs (see below), and it could then be written in C+=
+.


Can you elaborate a bit on the pros and cons of having PLDM library as a co=
mmon C lib vs them
being provider libs only?


>
> There would be one encode/decode lib per PLDM Type. So for e.g.=20
> something like /usr/lib/pldm/libbase.so, /usr/lib/pldm/libfru.so, etc.
>
> ### PLDM provider libraries
>
> These libraries would implement the platform specific handling of=20
> incoming PLDM requests (basically helping with the PLDM responder=20
> implementation, see next bullet point), so for instance they would query=
=20
> D-Bus objects (or even something like a JSON file) to fetch platform=20
> specific information to respond to the PLDM message. They would link=20
> with the encode/decode libs. Like the encode/decode libs, there would be=
=20
> one per PLDM Type (for e.g /usr/lib/pldm/providers/libfru.so).
>
> These libraries would essentially be plug-ins. That lets someone add=20
> functionality for new PLDM (standard as well as OEM) Types, and it also=20
> lets them replace default handlers. The libraries would implement a=20
> "register" API to plug-in handlers for specific PLDM messages. Something=
=20
> like:
>
> template <typename Handler, typename... args>
> auto register(uint8_t type, uint8_t command, Handler handler);
>
> This allows for providing a strongly-typed C++ handler registration=20
> scheme. It would also be possible to validate the parameters passed to=20
> the handler at compile time.
>
> ### Request/Response Model
>
> There are two approaches that I've described here, and they correlate to=
=20
> the two options in Jeremy's MCTP design for how to notify on incoming=20
> PLDM messages: in-process callbacks vs D-Bus signals.
>
> #### With in-process callbacks
>
> In this case, there would be a single PLDM (over MCTP) daemon that=20
> implements both the PLDM responder and PLDM requester function. The=20
> daemon would link with the encode/decode libs mentioned above, and the=20
> MCTP lib.

In the case if we want to run PLDM over NCSI, do you envision having a sepa=
rate=20
NCSI daemon that also link with PLDM decode/encode lib? So in this case the=
re'd
be multiple stream of (separate) PLDM traffic.

>
> The PLDM responder function would involve registering the PLDM provider=20
> libs on startup. The PLDM responder implementation would sit in the=20
> callback handler from the transport's rx. If it receives PLDM messages=20
> of type Request, it will route them to an appropriate handler in a=20
> provider lib, get the response back, and send back a PLDM response=20
> message via the transport's tx API. If it receives messages of type=20
> Response, it will put them on a "Response queue".

Do you see any needs for handler in the provider lib to communicate with
other daemons? For example, PLDM sensor handler may have to query a separat=
e=20
sensor daemon (sensord) to get the sensor data before it can respond.=20

If the handler needs to communicate with other daemons/applications in the =
system,
I think this part of the design would be very similar to the "BMC as PLDM r=
equester" design
you've specified below.

e.g.=20
The response from sensord may not return right away, and the PLDM handler s=
houldn't=20
block, in this case I think the handler for each PLDM type  would also need=
 a "Request Queue"=20
so it may queue up  incoming requests while it processes each request.

Also if each PLDM Type handler needs to communicate with multiple daemons, =
I'm thinking having
a msg_in  queue (in addition to the Request queue above) so it may receive =
responses back
from other daemons in the system, and store PLDM IID in meta-data when
communicating with other daemons so the PLDM handler can map each messages =
in=20
msg_in queue to a PLDM request in Request Queue.

In this case each PLDM handler would need multiple threads to handle these =
separate tasks.

>
> I think designing the BMC as a PLDM requester is interesting. We haven't=
=20
> had this with IPMI, because the BMC was typically an IPMI server. I=20
> envision PLDM requester functions to be spread across multiple OpenBMC=20
> applications (instead of a single big requester app) - based on the=20
> responder they're talking and the high level function they implement.=20
> For example, there could be an app that lets the BMC upgrade firmware=20
> for other devices using PLDM - this would be a generic app in the sense=20
> that the same set of commands might have to be run irrespective of the=20
> device on the other side. There could also be an app that does fan=20
> control on a remote device, based on sensors from that device and=20
> algorithms specific to that device.
>
> The PLDM daemon would have to provide a D-Bus interface to send a PLDM=20
> request message. This API would be used by apps wanting to send out PLDM=
=20
> requests. If the message payload is too large, the interface could=20
> accept an fd (containing the message), instead of an array of bytes. The=
=20
> implementation of this would send the PLDM request message via the=20
> transport's tx API, and then conditionally wait on the response queue to=
=20
> have an entry that matches this request (the match is by instance id).=20
> The conditional wait (or something equivalent) is required because the=20
> app sending the PLDM message must block until getting a response back=20
> from the remote PLDM device.
>
> With what's been described above, it's obvious that the responder and=20
> requester functions need to be able to run concurrently (this is as per=20
> the PLDM spec as well). The BMC can simultaneously act as a responder=20
> and requester. Waiting on a rx from the transport layer shouldn't block=20
> other BMC apps from sending PLDM messages. So this means the PLDM daemon=
=20
> would have to be multi-threaded, or maybe we can instead achieve this=20
> via an event loop.

Do you see both Requester and Responder spawning multiple threads?

I can see them performing similar functionalities,=20

e.g. perhaps something like this below:

PLDM Requester=20
- listens for other applications/daemons for PLDM requests, and generate an=
d send PLDM=20
   Requests to device (1 thread)
- waits for device response,  look up original request sender via response =
IID and send=20
   response back to applications/daemons (1 thread)

PLDM Responder
  - listens for PLDM requests from device, decode request and add it to cor=
responding handler's Request queue (1 thread)
- each handler: =20
	- checks its Request Queue, process request inline (if able to) and adds r=
esponse to response queue,=20
                   If request needs data from other application, send messa=
ge to other application (1 thread)
            - processes incoming messages from other applications and put t=
hem to Response queue (1 thread)
            - process Response queue - send response back to device (1 thre=
ad) =20

> #### With D-Bus signals
>
> This lets us separate PLDM daemons from the MCTP daemon, and eliminates=20
> the need to handle request and response messages concurrently in the=20
> same daemon, at the cost of much more D-Bus traffic. The MCTP daemon=20
> would emit D-Bus signals describing the type of the PLDM message=20
> (request/response) and containing the message payload. Alternatively it=20
> could pass the PLDM message over a D-Bus API that the PLDM daemons would=
=20
> implement. The MCTP daemon would also implement a D-Bus API to send PLDM=
=20
> messages, as with the previous approach.
>
> With this approach, I'd recommend two separate PLDM daemons - a=20
> responder daemon and a requester daemon. The responder daemon reacts to=20
> D-Bus signals corresponding to PLDM Request messages. It handles=20
> incoming requests as before. The requester daemon would react to D-Bus=20
> signals corresponding to PLDM response messages. It would implement the=20
> instance id generation, and would also implement the response queue and=20
> the conditional wait on that queue. It would also have to implement a=20
> D-Bus API to let other PLDM-enabled OpenBMC apps send PLDM requests. The=
=20
> implementation of that API would send the message to the MCTP daemon,=20
> and then block on the response queue to get a response back.

Similar to previous "in-process callback" approach, the  Responder daemon m=
ay
have to send D-Bus signals to other applications in order process a PLDM re=
quest?

Is there a way for any daemons in the system to register a communication ch=
annel
With PLDM handler?

> ### Multiple requesters and responders
>
> The PLDM spec does allow simultaneous connections between multiple=20
> responders/requesters. For e.g. the BMC talking to a multi-host system=20
> on two different physical channels. Instead of implementing this in one=20
> MCTP/PLDM daemon, we could spawn one daemon per physical channel.

OK I see, so in this case a daemon monitor MCTP channel would have its own =
PLDM
handler, and a daemon monitoring NCSI channel would spawn its PLDM handler,
both streams of PLDM traffic occurs independently of each other and have it=
s own=20
series of instance IDs.

> ## Impacts
>
> Development would be required to implement the PLDM protocol, the=20
> request/response model, and platform specific handling. Low level design=
=20
> is required to implement the protocol specifics of each of the PLDM=20
> Types. Such low level design is not included in this proposal.
>
> Design and development needs to involve potential host firmware
> implementations.
>
> ## Testing
>
> Testing can be done without having to depend on the underlying transport=
=20
> layer.
>
> The responder function can be tested by mocking a requester and the=20
> transport layer: this would essentially test the protocol handling and=20
> platform specific handling. The requester function can be tested by=20
> mocking a responder: this would test the instance id handling and the=20
> send/receive functions.
>
> APIs from the shared libraries can be tested via fuzzing.

Thanks!
-Ben
