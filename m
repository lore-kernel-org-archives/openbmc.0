Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsWNc6psQzDqhk
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 01:05:04 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5KEweuY145432
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 11:05:02 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b70ybfy3v-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 11:05:01 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 20 Jun 2017 09:04:59 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Jun 2017 09:04:58 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5KF4we064880784
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 08:04:58 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B29E78038
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 09:04:58 -0600 (MDT)
Received: from d50lp32.co.us.ibm.com (unknown [9.17.249.36])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id EFC5878043
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 09:04:57 -0600 (MDT)
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 20 Jun 2017 09:04:57 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Tue, 20 Jun 2017 09:04:55 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 20 Jun 2017 15:04:53 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 20 Jun 2017 15:03:35 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017062015033456-610164 ;
 Tue, 20 Jun 2017 15:03:34 +0000 
MIME-Version: 1.0
In-Reply-To: <C82D2909-D48E-4F2E-9C84-C0AAAB763AFA@linux.vnet.ibm.com>
Subject: Re: OpenBMC Image Management
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "openbmc"<openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, Stewart
 Smith <stewart@linux.vnet.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Tue, 20 Jun 2017 10:03:35 -0500
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <87y3sv8str.fsf@linux.vnet.ibm.com>
 <DF60C6B0-BEF2-4CBA-B5D8-6B85EF0F158A@linux.vnet.ibm.com>
 <87mv945y5r.fsf@linux.vnet.ibm.com>
 <C82D2909-D48E-4F2E-9C84-C0AAAB763AFA@linux.vnet.ibm.com>
X-KeepSent: AF8C53AE:6841FFA9-86258145:00526192;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 2471
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0BD6DFC1E7028f9e8a93df938690918c09BB0BD6DFC1E702"
Content-Disposition: inline
x-cbid: 17062015-0020-0000-0000-00000C333251
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.433748;
 ST=0; TS=0; UL=0; ISC=; MB=0.021873
X-IBM-SpamModules-Versions: BY=3.00007261; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877486; UDB=6.00437126; IPR=6.00657624; 
 BA=6.00005432; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015900; XFM=3.00000015;
 UTC=2017-06-20 15:04:53
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-06-20 05:15:54 - 6.00006914
x-cbparentid: 17062015-6060-0000-0000-0000115BC507
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007261; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877486; UDB=6.00437127; IPR=6.00657624; 
 BA=6.00005432; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015900; XFM=3.00000015;
 UTC=2017-06-20 15:04:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFAF8C53AE.6841FFA9-ON86258145.00526192-86258145.0052B9D4@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-20_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706200265
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Jun 2017 15:05:05 -0000


--0__=09BB0BD6DFC1E7028f9e8a93df938690918c09BB0BD6DFC1E702
Content-Transfer-Encoding: base64
Content-type: text/plain; charset=UTF-8

DQoNCiJvcGVuYm1jIiA8b3BlbmJtYy1ib3VuY2VzK2F1c3RlbmM9dXMuaWJtLmNvbUBsaXN0cy5v
emxhYnMub3JnPiB3cm90ZSBvbg0KMDYvMjAvMjAxNyAwOTozODo0MCBBTToNCg0KPiBGcm9tOiBB
ZHJpYW5hIEtvYnlsYWsgPGFub29AbGludXgudm5ldC5pYm0uY29tPg0KPiBUbzogU3Rld2FydCBT
bWl0aCA8c3Rld2FydEBsaW51eC52bmV0LmlibS5jb20+DQo+IENjOiBPcGVuQk1DIE1haWxsaXN0
IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IERhdGU6IDA2LzIwLzIwMTcgMDk6MzggQU0N
Cj4gU3ViamVjdDogUmU6IE9wZW5CTUMgSW1hZ2UgTWFuYWdlbWVudA0KPiBTZW50IGJ5OiAib3Bl
bmJtYyIgPG9wZW5ibWMtYm91bmNlcythdXN0ZW5jPXVzLmlibS5jb21AbGlzdHMub3psYWJzLm9y
Zz4NCj4NCj4NCj4gPiBPbiBKdW4gMTksIDIwMTcsIGF0IDEyOjQ0IEFNLCBTdGV3YXJ0IFNtaXRo
DQo+IDxzdGV3YXJ0QGxpbnV4LnZuZXQuaWJtLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZHJpYW5h
IEtvYnlsYWsgPGFub29AbGludXgudm5ldC5pYm0uY29tPiB3cml0ZXM6DQo+ID4+PiBXaHkgaXMg
dGhlcmUgbWJveGJyaWRnZSBzZXBhcmF0ZSBmcm9tIHBob3NwaG9yLW1ib3hkPw0KPiA+Pg0KPiA+
PiBCZWNhdXNlIHRoZSBtYm94YnJpZGdlIGlzIGJlaW5nIHVzZWQgYnkgb3RoZXIgY29tcGFuaWVz
IGFzIGEgcmVmZXJlbmNlDQo+ID4+IHRvIGJlIGFibGUgdG8gaW1wbGVtZW50IHRoZSBtYWlsYm94
IGRhZW1vbiBpbiB0aGVpciBvd24gQk1DIGZpcm13YXJlDQo+ID4+IHN0YWNrIGZvciBvdGhlciBv
cGVucG93ZXIgc3lzdGVtcywgd2UgZGlkbuKAmXQgd2FudCB0byDigJxwb2xsdXRl4oCdIHRoZQ0K
PiA+PiByZXBvc2l0b3J5IHdpdGggb3BlbmJtYy1zcGVjaWZpYyBhbmQgYysrIGltcGxlbWVudGF0
aW9uIHRoYXQgY291bGQNCj4gPj4gY29uZnVzZSB0aGVtLg0KPiA+DQo+ID4gV2h5IGFyZSB0aGVy
ZSBPcGVuQk1DIHNwZWNpZmljIHRoaW5ncyBpbiBtYm94ZD8NCj4gPg0KPiA+IFdoeSBjYW4ndCB0
aGUgcmVmZXJlbmNlIGltcGxlbWVudGF0aW9uIGJlIHVzZWQ/IFdoYXQncyBkZWZpY2llbnQgaW4g
aXQ/DQo+DQo+IEZvciBPcGVuQk1DLCB3ZeKAmXJlIGhhdmluZyB0aGUgUE5PUiBjaGlwIHdpdGgg
YSBmaWxlc3lzdGVtLCBzbyBtYm94ZA0KPiB3b3VsZCByZWFkL3dyaXRlIGZpbGVzIGluc3RlYWQg
b2YgbG9va2luZyBmb3IgdGhlIGRhdGEgYXQgYW4gb2Zmc2V0DQo+IGluIHRoZSBjaGlwLiBOb3Ro
aW5nIGRlZmljaWVudCB3aXRoIGl0LCBqdXN0IGEgZGlmZmVyZW50DQo+IGltcGxlbWVudGF0aW9u
IHRoYXQgbmVlZHMgdG8gYmUgaGFuZGxlZC4NCg0KSSBoYXZlIGJlZW4gcmVjb21tZW5kaW5nIHRo
YXQgaWYgeW91IHdhbnQgdG8gdHJ5IE9wZW5CTUMgb24geW91ciBzeXN0ZW0NCih0aGF0IGlzIG5v
dCBydW5uaW5nICBPcGVuQk1DIG5vdykgdGhhdCB0aGUgQk1DIGNoaXAgYmUgc3dhcHBlZC4gIERv
ZXMgdGhlDQpvZmZzZXQgdnMgZmlsZXN5c3RlbSBjaGFuZ2UgZm9yY2UgdGhlIFBOT1IgZmxhc2gg
aW1hZ2UgdG8gYmUgZm9yZXZlcg0KY2hhbmdlZCB0b28/DQoNCj4NCj4gPg0KPiA+IC0tDQo+ID4g
U3Rld2FydCBTbWl0aA0KPiA+IE9QQUwgQXJjaGl0ZWN0LCBJQk0uDQo+DQpDaHJpcyBBdXN0ZW4N
ClBPV0VSIFN5c3RlbXMgRW5hYmxlbWVudCBNYW5hZ2VyDQo=

--0__=09BB0BD6DFC1E7028f9e8a93df938690918c09BB0BD6DFC1E702
Content-Transfer-Encoding: base64
Content-type: text/html; charset=UTF-8
Content-Disposition: inline

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPiZxdW90O29wZW5ibWMmcXVvdDsgJmx0
O29wZW5ibWMtYm91bmNlcythdXN0ZW5jPXVzLmlibS5jb21AbGlzdHMub3psYWJzLm9yZyZndDsg
d3JvdGUgb24gMDYvMjAvMjAxNyAwOTozODo0MCBBTTo8YnI+PGJyPiZndDsgRnJvbTogQWRyaWFu
YSBLb2J5bGFrICZsdDthbm9vQGxpbnV4LnZuZXQuaWJtLmNvbSZndDs8L2ZvbnQ+PC90dD48YnI+
PHR0Pjxmb250IHNpemU9IjIiPiZndDsgVG86IFN0ZXdhcnQgU21pdGggJmx0O3N0ZXdhcnRAbGlu
dXgudm5ldC5pYm0uY29tJmd0OzwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0
OyBDYzogT3BlbkJNQyBNYWlsbGlzdCAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozwv
Zm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyBEYXRlOiAwNi8yMC8yMDE3IDA5
OjM4IEFNPC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj4mZ3Q7IFN1YmplY3Q6IFJl
OiBPcGVuQk1DIEltYWdlIE1hbmFnZW1lbnQ8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9
IjIiPiZndDsgU2VudCBieTogJnF1b3Q7b3BlbmJtYyZxdW90OyAmbHQ7b3BlbmJtYy1ib3VuY2Vz
K2F1c3RlbmM9dXMuaWJtLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OzwvZm9udD48L3R0Pjxicj48
dHQ+PGZvbnQgc2l6ZT0iMiI+Jmd0OyA8YnI+Jmd0OyA8YnI+Jmd0OyAmZ3Q7IE9uIEp1biAxOSwg
MjAxNywgYXQgMTI6NDQgQU0sIFN0ZXdhcnQgU21pdGggPGJyPiZndDsgJmx0O3N0ZXdhcnRAbGlu
dXgudm5ldC5pYm0uY29tJmd0OyB3cm90ZTo8YnI+Jmd0OyAmZ3Q7IDxicj4mZ3Q7ICZndDsgQWRy
aWFuYSBLb2J5bGFrICZsdDthbm9vQGxpbnV4LnZuZXQuaWJtLmNvbSZndDsgd3JpdGVzOjxicj4m
Z3Q7ICZndDsmZ3Q7Jmd0OyBXaHkgaXMgdGhlcmUgbWJveGJyaWRnZSBzZXBhcmF0ZSBmcm9tIHBo
b3NwaG9yLW1ib3hkPzxicj4mZ3Q7ICZndDsmZ3Q7IDxicj4mZ3Q7ICZndDsmZ3Q7IEJlY2F1c2Ug
dGhlIG1ib3hicmlkZ2UgaXMgYmVpbmcgdXNlZCBieSBvdGhlciBjb21wYW5pZXMgYXMgYSByZWZl
cmVuY2U8YnI+Jmd0OyAmZ3Q7Jmd0OyB0byBiZSBhYmxlIHRvIGltcGxlbWVudCB0aGUgbWFpbGJv
eCBkYWVtb24gaW4gdGhlaXIgb3duIEJNQyBmaXJtd2FyZTxicj4mZ3Q7ICZndDsmZ3Q7IHN0YWNr
IGZvciBvdGhlciBvcGVucG93ZXIgc3lzdGVtcywgd2UgZGlkbuKAmXQgd2FudCB0byDigJxwb2xs
dXRl4oCdIHRoZTxicj4mZ3Q7ICZndDsmZ3Q7IHJlcG9zaXRvcnkgd2l0aCBvcGVuYm1jLXNwZWNp
ZmljIGFuZCBjKysgaW1wbGVtZW50YXRpb24gdGhhdCBjb3VsZDxicj4mZ3Q7ICZndDsmZ3Q7IGNv
bmZ1c2UgdGhlbS48YnI+Jmd0OyAmZ3Q7IDxicj4mZ3Q7ICZndDsgV2h5IGFyZSB0aGVyZSBPcGVu
Qk1DIHNwZWNpZmljIHRoaW5ncyBpbiBtYm94ZD88YnI+Jmd0OyAmZ3Q7IDxicj4mZ3Q7ICZndDsg
V2h5IGNhbid0IHRoZSByZWZlcmVuY2UgaW1wbGVtZW50YXRpb24gYmUgdXNlZD8gV2hhdCdzIGRl
ZmljaWVudCBpbiBpdD88YnI+Jmd0OyA8YnI+Jmd0OyBGb3IgT3BlbkJNQywgd2XigJlyZSBoYXZp
bmcgdGhlIFBOT1IgY2hpcCB3aXRoIGEgZmlsZXN5c3RlbSwgc28gbWJveGQgPGJyPiZndDsgd291
bGQgcmVhZC93cml0ZSBmaWxlcyBpbnN0ZWFkIG9mIGxvb2tpbmcgZm9yIHRoZSBkYXRhIGF0IGFu
IG9mZnNldCA8YnI+Jmd0OyBpbiB0aGUgY2hpcC4gTm90aGluZyBkZWZpY2llbnQgd2l0aCBpdCwg
anVzdCBhIGRpZmZlcmVudCA8YnI+Jmd0OyBpbXBsZW1lbnRhdGlvbiB0aGF0IG5lZWRzIHRvIGJl
IGhhbmRsZWQuPGJyPjwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+SSBoYXZlIGJl
ZW4gcmVjb21tZW5kaW5nIHRoYXQgaWYgeW91IHdhbnQgdG8gdHJ5IE9wZW5CTUMgb24geW91ciBz
eXN0ZW0gKHRoYXQgaXMgbm90IHJ1bm5pbmcgJm5ic3A7T3BlbkJNQyBub3cpIHRoYXQgdGhlIEJN
QyBjaGlwIGJlIHN3YXBwZWQuICZuYnNwO0RvZXMgdGhlIG9mZnNldCB2cyBmaWxlc3lzdGVtIGNo
YW5nZSBmb3JjZSB0aGUgUE5PUiBmbGFzaCBpbWFnZSB0byBiZSBmb3JldmVyIGNoYW5nZWQgdG9v
PzwvZm9udD48L3R0Pjxicj48YnI+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgPC9mb250PjwvdHQ+
PGJyPjx0dD48Zm9udCBzaXplPSIyIj4mZ3Q7ICZndDsgPGJyPiZndDsgJmd0OyAtLSA8YnI+Jmd0
OyAmZ3Q7IFN0ZXdhcnQgU21pdGg8YnI+Jmd0OyAmZ3Q7IE9QQUwgQXJjaGl0ZWN0LCBJQk0uPGJy
PiZndDsgPGJyPjwvZm9udD48L3R0Pjxmb250IHNpemU9IjIiPkNocmlzIEF1c3Rlbjxicj5QT1dF
UiBTeXN0ZW1zIEVuYWJsZW1lbnQgTWFuYWdlciA8L2ZvbnQ+PEJSPg0KPC9ib2R5PjwvaHRtbD4N
Cg==

--0__=09BB0BD6DFC1E7028f9e8a93df938690918c09BB0BD6DFC1E702--
