Return-Path: <hramasub@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hramasub@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gYT76glXzF1Cr
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 23:05:46 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w71D52vZ080140
 for <openbmc@lists.ozlabs.org>; Wed, 1 Aug 2018 09:05:43 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kkbyvbwq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 09:05:42 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Wed, 1 Aug 2018 13:05:41 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 1 Aug 2018 13:05:30 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.6.12])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2018080113052978-514514 ;
 Wed, 1 Aug 2018 13:05:29 +0000 
In-Reply-To: <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
To: Ed Tanous <ed.tanous@intel.com>
Cc: bradleyb@fuzziesquirrel.com, Jayanth Othayoth <ojayanth@gmail.com>,
 openbmc@lists.ozlabs.org,
 "openbmc"<openbmc-bounces+hramasub=in.ibm.com@lists.ozlabs.org>
Subject: Re: SSL Certificate management proposal.
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Wed, 1 Aug 2018 18:35:29 +0530
References: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
 <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
MIME-Version: 1.0
X-KeepSent: 7222EE1F:6CAFD8F2-652582DC:00462B53;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 27559
X-TNEFEvaluated: 1
x-cbid: 18080113-6059-0000-0000-00000A7B944A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.095927
X-IBM-SpamModules-Versions: BY=3.00009467; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01068822; UDB=6.00549508; IPR=6.00847128; 
 BA=6.00006063; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00022440; XFM=3.00000015;
 UTC=2018-08-01 13:05:38
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-08-01 07:07:42 - 6.00008777
x-cbparentid: 18080113-6060-0000-0000-0000AA649B68
Message-Id: <OF7222EE1F.6CAFD8F2-ON652582DC.00462B53-652582DC.0047E9DE@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 0047E3AF652582DC_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-01_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 13:05:48 -0000


--=_alternative 0047E3AF652582DC_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

"openbmc" <openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org> wrote on=
=20
07/31/2018 11:21:27 PM:

> From: Ed Tanous <ed.tanous@intel.com>
> To: Jayanth Othayoth <ojayanth@gmail.com>, openbmc@lists.ozlabs.org,
> bradleyb@fuzziesquirrel.com
> Date: 07/31/2018 11:21 PM
> Subject: Re: SSL Certificate management proposal.
> Sent by: "openbmc"=20
<openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org>
>=20
> On 07/31/2018 07:49 AM, Jayanth Othayoth wrote:
> >=20
> > The workflow for updating a signed certificate on the BMC consists of:
> > 1. Generating a CSR on the BMC
> > 2. Exporting the CSR from the BMC onto the user?s storage device
> > 3. Obtaining a singed certificate corresponding to the CSR from a CA
> > 4. Importing the signed certificate on the BMC
> >=20
>=20
> This workflow is somewhat of a non starter for a lot of organizations=20
> and IT departments.=20
Could you please share your thoughts on why this is so ?

> First, it requires that every BMC have its own=20
> private key, which isn't always desired.
=5FSharing=5F the private is a potential security risk. If the private key =

were to be compromised, then =5Fall=5F systems sharing the key are exposed.=
=20
Hence I'm inclined to argue that private key should not be shared.

> Second, it means that you either have to be able to specify all=20
> parameters that a user would want to specify about his key (number of=20
> bits, EC vs RSA, ect).
What really is the concern here ? What's the challenge in invoking the=20
REST API with a json body describing the key type & size ?

> Third, it requires that every BMC be provisioned by the intermediate=20
> authority, which can be difficult if keys either have a cost associated=20
> with them, or are difficult to acquire.
The cost considerations could potentially be different for Enterprise=20
class servers and servers deployed on the cloud ? I presume enterprises=20
would favour security to cost.



--=_alternative 0047E3AF652582DC_=
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="UTF-8"

DQo8YnI+PHR0Pjxmb250IHNpemU9Mj4mcXVvdDtvcGVuYm1jJnF1b3Q7ICZsdDtvcGVuYm1jLWJv
dW5jZXMraHJhbWFzdWI9aW4uaWJtLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0Ow0Kd3JvdGUgb24g
MDcvMzEvMjAxOCAxMToyMToyNyBQTTo8YnI+PGJyPiZndDsgRnJvbTogRWQgVGFub3VzICZsdDtl
ZC50YW5vdXNAaW50ZWwuY29tJmd0OzwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0yPiZn
dDsgVG86IEpheWFudGggT3RoYXlvdGggJmx0O29qYXlhbnRoQGdtYWlsLmNvbSZndDssDQpvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmcsPGJyPiZndDsgYnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29t
PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPTI+Jmd0OyBEYXRlOiAwNy8zMS8yMDE4IDEx
OjIxIFBNPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPTI+Jmd0OyBTdWJqZWN0OiBSZTog
U1NMIENlcnRpZmljYXRlIG1hbmFnZW1lbnQgcHJvcG9zYWwuPC9mb250PjwvdHQ+PGJyPjx0dD48
Zm9udCBzaXplPTI+Jmd0OyBTZW50IGJ5OiAmcXVvdDtvcGVuYm1jJnF1b3Q7ICZsdDtvcGVuYm1j
LWJvdW5jZXMraHJhbWFzdWI9aW4uaWJtLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OzwvZm9udD48
L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0yPiZndDsgPGJyPiZndDsgT24gMDcvMzEvMjAxOCAwNzo0
OSBBTSwgSmF5YW50aCBPdGhheW90aCB3cm90ZTo8YnI+Jmd0OyAmZ3Q7IDxicj4mZ3Q7ICZndDsg
VGhlIHdvcmtmbG93IGZvciB1cGRhdGluZyBhIHNpZ25lZCBjZXJ0aWZpY2F0ZSBvbiB0aGUgQk1D
IGNvbnNpc3RzDQpvZjo8YnI+Jmd0OyAmZ3Q7IDEuIEdlbmVyYXRpbmcgYSBDU1Igb24gdGhlIEJN
Qzxicj4mZ3Q7ICZndDsgMi4gRXhwb3J0aW5nIHRoZSBDU1IgZnJvbSB0aGUgQk1DIG9udG8gdGhl
IHVzZXLigJlzIHN0b3JhZ2UgZGV2aWNlPGJyPiZndDsgJmd0OyAzLiBPYnRhaW5pbmcgYSBzaW5n
ZWQgY2VydGlmaWNhdGUgY29ycmVzcG9uZGluZyB0byB0aGUgQ1NSIGZyb20NCmEgQ0E8YnI+Jmd0
OyAmZ3Q7IDQuIEltcG9ydGluZyB0aGUgc2lnbmVkIGNlcnRpZmljYXRlIG9uIHRoZSBCTUM8YnI+
Jmd0OyAmZ3Q7IDxicj4mZ3Q7IDxicj4mZ3Q7IFRoaXMgd29ya2Zsb3cgaXMgc29tZXdoYXQgb2Yg
YSBub24gc3RhcnRlciBmb3IgYSBsb3Qgb2Ygb3JnYW5pemF0aW9ucw0KPGJyPiZndDsgYW5kIElU
IGRlcGFydG1lbnRzLiAmbmJzcDs8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9Mj5Db3Vs
ZCB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgdGhvdWdodHMgb24gd2h5IHRoaXMgaXMNCnNvID88L2Zv
bnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPTI+Jmd0OyBGaXJzdCwgaXQgcmVxdWlyZXMg
dGhhdCBldmVyeSBCTUMgaGF2ZSBpdHMgb3duDQo8YnI+Jmd0OyBwcml2YXRlIGtleSwgd2hpY2gg
aXNuJ3QgYWx3YXlzIGRlc2lyZWQuPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPTI+X1No
YXJpbmdfIHRoZSBwcml2YXRlIGlzIGEgcG90ZW50aWFsIHNlY3VyaXR5IHJpc2suDQpJZiB0aGUg
cHJpdmF0ZSBrZXkgd2VyZSB0byBiZSBjb21wcm9taXNlZCwgdGhlbiBfYWxsXyBzeXN0ZW1zIHNo
YXJpbmcgdGhlDQprZXkgYXJlIGV4cG9zZWQuIEhlbmNlIEknbSBpbmNsaW5lZCB0byBhcmd1ZSB0
aGF0IHByaXZhdGUga2V5IHNob3VsZCBub3QNCmJlIHNoYXJlZC48L2ZvbnQ+PC90dD48YnI+PHR0
Pjxmb250IHNpemU9Mj48YnI+Jmd0OyBTZWNvbmQsIGl0IG1lYW5zIHRoYXQgeW91IGVpdGhlciBo
YXZlIHRvIGJlIGFibGUgdG8gc3BlY2lmeSBhbGwgPGJyPiZndDsgcGFyYW1ldGVycyB0aGF0IGEg
dXNlciB3b3VsZCB3YW50IHRvIHNwZWNpZnkgYWJvdXQgaGlzIGtleSAobnVtYmVyDQpvZiA8YnI+
Jmd0OyBiaXRzLCBFQyB2cyBSU0EsIGVjdCkuPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXpl
PTI+V2hhdCByZWFsbHkgaXMgdGhlIGNvbmNlcm4gaGVyZSA/IFdoYXQncyB0aGUgY2hhbGxlbmdl
DQppbiBpbnZva2luZyB0aGUgUkVTVCBBUEkgd2l0aCBhIGpzb24gYm9keSBkZXNjcmliaW5nIHRo
ZSBrZXkgdHlwZSAmYW1wOw0Kc2l6ZSA/PGJyPjwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6
ZT0yPiZndDsgVGhpcmQsIGl0IHJlcXVpcmVzIHRoYXQgZXZlcnkgQk1DIGJlIHByb3Zpc2lvbmVk
DQpieSB0aGUgaW50ZXJtZWRpYXRlIDxicj4mZ3Q7IGF1dGhvcml0eSwgd2hpY2ggY2FuIGJlIGRp
ZmZpY3VsdCBpZiBrZXlzIGVpdGhlciBoYXZlIGEgY29zdCBhc3NvY2lhdGVkDQo8YnI+Jmd0OyB3
aXRoIHRoZW0sIG9yIGFyZSBkaWZmaWN1bHQgdG8gYWNxdWlyZS48L2ZvbnQ+PC90dD48YnI+PHR0
Pjxmb250IHNpemU9Mj5UaGUgY29zdCBjb25zaWRlcmF0aW9ucyBjb3VsZCBwb3RlbnRpYWxseSBi
ZSBkaWZmZXJlbnQNCmZvciBFbnRlcnByaXNlIGNsYXNzIHNlcnZlcnMgYW5kIHNlcnZlcnMgZGVw
bG95ZWQgb24gdGhlIGNsb3VkID8gSSBwcmVzdW1lDQplbnRlcnByaXNlcyB3b3VsZCBmYXZvdXIg
c2VjdXJpdHkgdG8gY29zdC48YnI+PC9mb250PjwvdHQ+PEJSPg0K
--=_alternative 0047E3AF652582DC_=--
