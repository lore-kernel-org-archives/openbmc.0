Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v81yr2w6tzDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 10:50:59 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0PNnO5p082685
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 18:50:57 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2874nktec3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 18:50:56 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 25 Jan 2017 18:50:56 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 25 Jan 2017 18:50:55 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id EDAD538C8041
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 18:50:55 -0500 (EST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0PNor0515860190
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 23:50:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D87A1AC040
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 18:50:54 -0500 (EST)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS id 9A1DCAC046
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 18:50:54 -0500 (EST)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 25 Jan 2017 16:50:53 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Wed, 25 Jan 2017 16:50:51 -0700
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 25 Jan 2017 23:50:50 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 25 Jan 2017 23:50:48 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2017012523504819-550250 ;
 Wed, 25 Jan 2017 23:50:48 +0000 
MIME-Version: 1.0
In-Reply-To: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
Subject: Re: OpenBMC Image Management
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Wed, 25 Jan 2017 17:50:46 -0600
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
X-KeepSent: 3E869A3E:DB3E43DE-862580B3:008284D7;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF692 April 27, 2016
X-LLNOutbound: False
X-Disclaimed: 1927
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0A20DF1102478f9e8a93df938690918c09BB0A20DF110247"
Content-Disposition: inline
x-cbid: 17012523-0040-0000-0000-00000275BD92
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0.075162; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006498; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000200; SDB=6.00812700; UDB=6.00396376; UTC=2017-01-25
 23:50:49
x-cbparentid: 17012523-5102-0000-0000-00000350089A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006498; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000200; SDB=6.00812700; UDB=6.00396376; IPR=6.00590119; 
 BA=6.00005090; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014050; XFM=3.00000011;
 UTC=2017-01-25 23:50:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-25_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701250223
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
X-List-Received-Date: Wed, 25 Jan 2017 23:51:00 -0000


--0__=09BB0A20DF1102478f9e8a93df938690918c09BB0A20DF110247
Content-Transfer-Encoding: base64
Content-type: text/plain; charset=UTF-8

Im9wZW5ibWMiIDxvcGVuYm1jLWJvdW5jZXMrYXVzdGVuYz11cy5pYm0uY29tQGxpc3RzLm96bGFi
cy5vcmc+IHdyb3RlIG9uDQowMS8yNS8yMDE3IDA0OjE1OjI3IFBNOg0KDQo+IEZyb206IEFkcmlh
bmEgS29ieWxhayA8YW5vb0BsaW51eC52bmV0LmlibS5jb20+DQo+IFRvOiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNCj4gRGF0ZTogMDEvMjUvMjAxNyAwNDozMiBQTQ0KPiBTdWJqZWN0OiBPcGVu
Qk1DIEltYWdlIE1hbmFnZW1lbnQNCj4gU2VudCBieTogIm9wZW5ibWMiIDxvcGVuYm1jLWJvdW5j
ZXMrYXVzdGVuYz11cy5pYm0uY29tQGxpc3RzLm96bGFicy5vcmc+DQo+DQo+IEhpLA0KPg0KPiBI
ZXJlIGlzIGEgZmlyc3QgZHJhZnQgcHJvcG9zYWwgZm9yIGltYWdlIG1hbmFnZW1lbnQgKGNvZGUg
dXBkYXRlKSBpbg0KPiBPcGVuQk1DIGZvciBmZWVkYmFjay4NCj4NCj4gR2VuZXJhbDoNCj4gKiBN
b3ZlIHRvIFVCSSB2b2x1bWUgbWFuYWdlbWVudCAob24gdGhlIEJNQyBhbmQgUE5PUiBjaGlwcyks
IHdoaWNoDQo+IHByb3ZpZGVzIGR5bmFtaWMgcGFydGl0aW9uaW5nIGFuZCB3ZWFyLWxldmVsaW5n
LiBJbiBhIGxpbWl0ZWQgZmxhc2gNCj4gc3BhY2UgZW52aXJvbm1lbnQgdGhlcmUgbWlnaHQgYmUg
dGhlIG5lZWQgdG8gcmUtYWxsb2NhdGUgcGFydGl0aW9uDQo+IHNwYWNlIGFuZCByZXNpemluZyBp
biBhIHN0YXRpYyBwYXJ0aXRpb25pbmcgaW1wbGVtZW50YXRpb24gY2FuIGJlDQo+IHZlcnkgcGFp
bmZ1bC4NCj4gKiBVc2UgQ1JBTUZTIGZvciByZWFkLW9ubHkgcGFydGl0aW9ucywgYW5kIFVCSUZT
IGZvciByZWFkLXdyaXRlDQpwYXJ0aXRpb25zLg0KPg0KPiBQTk9SOg0KPiAqIEltcGxlbWVudCBh
IG5ldyBtYm94ZCBiYXNlZCBvbiBDeXJpbOKAmXMgKHNlZSBDeXJpbOKAmXMgZW1haWwg4oCcTWFp
bGJveA0KPiBkYWVtb27igJ0pIHRoYXQgaGFuZGxlcyBkYnVzIG9iamVjdHMsIGdlbmVyYXRlcyBh
IHZpcnR1YWwgUE5PUiBmb3IgVUJJDQo+IGNvbnRlbnQsIGV0Yy4NCj4gKiBNb3ZlIHRvIG1lbW9y
eS1iYXNlZCBhY2Nlc3MgaW5zdGVhZCBvZiB0aGUgY3VycmVudCBMUEMtdG8tQUhEIHBhdGguDQo+
ICogQWxsb2NhdGUganVzdCBlbm91Z2ggc3BhY2UgaW4gdGhlIGluaXRpYWwgd2luZG93IGZvciBI
b3N0Ym9vdOKAmXMNCj4gVE9DLCBIQkIsIGFuZCBIQkkgcGFydGl0aW9ucywgZ3JvdyBhcyByZXF1
aXJlZC4NCj4gKiBBYmlsaXR5IHRvIOKAmHBhdGNo4oCZIGJ5IGNvcHlpbmcgYSBIb3N0Ym9vdCBp
bWFnZSAqLmJpbiBpbnRvIGENCj4gZGVzaWduYXRlZCBkaXJlY3RvcnkgKC91c3IvbG9jYWwvIGZv
ciBleGFtcGxlKS4NCj4gKiBUb29sIHRvIHdyaXRlIGZyb20gUE5PUiBpbWFnZSB0byBCTUMgZm9y
bWF0LiBJbXBsZW1lbnQgVUJJDQo+IGluaXRpYWxseSBidXQgaXQgY291bGQgYmUgZXh0ZW5kZWQg
dG8gc3VwcG9ydCBkaWZmZXJlbnQgdm9sdW1lDQo+IG1hbmFnZW1lbnRzIG9uIG90aGVyIEJNQ3Mu
DQo+DQo+IEJNQzoNCj4gKlNhdmUgbXVsdGlwbGUgZmlybXdhcmUgdmVyc2lvbnMsIHN0YXJ0aW5n
IHdpdGggMiwgdG8gcHJvdmlkZSB0aGUNCj4gYWJpbGl0eSB0byByb2xsLWJhY2sgaWYgbmVlZGVk
LiBJZiBzaW5nbGUgQk1DIGNoaXAgc3lzdGVtLCBzYXZlIGJvdGgNCj4gdmVyc2lvbnMgdGhlcmUu
IElmIHR3byBCTUMgY2hpcCBzeXN0ZW0sIHNhdmUgb3RoZXIgdmVyc2lvbiBpbiAybmQgY2hpcC4N
Cj4gKiBJbXBsZW1lbnQgdmFyaW91cyBsZXZlbHMgb2Yg4oCYcGVyc2lzdGVuY3nigJksIHN1Y2gg
YXMgZGV2LCBmYWN0b3J5LA0KPiBmaWVsZC4gRGV2IHBlcnNpc3RlbmN5IHdvdWxkIGFsbG93IGZv
ciBsb2NhbCBwYXRjaGVzICgvdXNyL2xvY2FsLw0KPiBmb3IgZXhhbXBsZSkgdGhhdCBjYW4gYmUg
Y2xlYXJlZCBiZWZvcmUgc2hpcHBpbmcgdG8gY3VzdG9tZXJzLg0KPiBGYWN0b3J5IG1vZGUgY291
bGQgZGVsZXRlIHRoZSBsb2NhdGlvbiB3aGVyZSB1c2VyIGRhdGEgc3VjaCBhcw0KPiBuZXR3b3Jr
IHNldHRpbmdzIHJlc2lkZXMgYnV0IHByZXNlcnZlcyB0aGUgbWFjIGFkZHJlc3MgYW5kIHV1aWQg
Zm9yDQo+IGV4YW1wbGUuIEV0Yy4NCj4NCj4gVGhhbmtzLA0KPg0KPiBBZHJpYW5hDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IG9wZW5ibWMgbWFp
bGluZyBsaXN0DQo+IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBodHRwczovL2xpc3RzLm96
bGFicy5vcmcvbGlzdGluZm8vb3BlbmJtYw0KDQoNClNvIGFyZSB0aGUgZ29hbHMgb2YgSW1hZ2Ug
TWFuYWdlbWVudC4uDQoNCjEpIEFjdGl2ZWx5IG1hbmFnZSB3ZWFyLWxldmVsaW5nDQoyKSBQcm92
aWRlIGFuIGFwaSBmb3IgQklPUy9Ib3N0IGluYmFuZCB1cGRhdGUNCjMpIFByb3ZpZGUgYSB3YXkg
dG8gYm9vdCBhbiBpbWFnZSB0aGF0IGlzIG5vdCBmcm9tIGZsYXNoDQo0KSBEdWVsIGltYWdlIHN1
cHBvcnQNCjUpIER1ZWwgZmxhc2ggY2hpcCBzdXBwb3J0DQo2KSBTdXBwb3J0IG11bHRpcGxlIHRp
ZXJzIG9mIHNhbml0aXphdGlvbg0KDQpBcmUgdGhlcmUgYW55IHNlY3VyaXR5IGdvYWxzIHRoYXQg
bmVlZCB0byBiZSBjb25zaWRlcmVkPw0KDQo=

--0__=09BB0A20DF1102478f9e8a93df938690918c09BB0A20DF110247
Content-Transfer-Encoding: base64
Content-type: text/html; charset=UTF-8
Content-Disposition: inline

PGh0bWw+PGJvZHk+PHA+PHR0PiZxdW90O29wZW5ibWMmcXVvdDsgJmx0O29wZW5ibWMtYm91bmNl
cythdXN0ZW5jPXVzLmlibS5jb21AbGlzdHMub3psYWJzLm9yZyZndDsgd3JvdGUgb24gMDEvMjUv
MjAxNyAwNDoxNToyNyBQTTo8YnI+PGJyPiZndDsgRnJvbTogQWRyaWFuYSBLb2J5bGFrICZsdDth
bm9vQGxpbnV4LnZuZXQuaWJtLmNvbSZndDs8L3R0Pjxicj48dHQ+Jmd0OyBUbzogb3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPC90dD48YnI+PHR0PiZndDsgRGF0ZTogMDEvMjUvMjAxNyAwNDozMiBQ
TTwvdHQ+PGJyPjx0dD4mZ3Q7IFN1YmplY3Q6IE9wZW5CTUMgSW1hZ2UgTWFuYWdlbWVudDwvdHQ+
PGJyPjx0dD4mZ3Q7IFNlbnQgYnk6ICZxdW90O29wZW5ibWMmcXVvdDsgJmx0O29wZW5ibWMtYm91
bmNlcythdXN0ZW5jPXVzLmlibS5jb21AbGlzdHMub3psYWJzLm9yZyZndDs8L3R0Pjxicj48dHQ+
Jmd0OyA8YnI+Jmd0OyBIaSw8YnI+Jmd0OyA8YnI+Jmd0OyBIZXJlIGlzIGEgZmlyc3QgZHJhZnQg
cHJvcG9zYWwgZm9yIGltYWdlIG1hbmFnZW1lbnQgKGNvZGUgdXBkYXRlKSBpbjxicj4mZ3Q7IE9w
ZW5CTUMgZm9yIGZlZWRiYWNrLjxicj4mZ3Q7IDxicj4mZ3Q7IEdlbmVyYWw6PGJyPiZndDsgKiBN
b3ZlIHRvIFVCSSB2b2x1bWUgbWFuYWdlbWVudCAob24gdGhlIEJNQyBhbmQgUE5PUiBjaGlwcyks
IHdoaWNoIDxicj4mZ3Q7IHByb3ZpZGVzIGR5bmFtaWMgcGFydGl0aW9uaW5nIGFuZCB3ZWFyLWxl
dmVsaW5nLiBJbiBhIGxpbWl0ZWQgZmxhc2ggPGJyPiZndDsgc3BhY2UgZW52aXJvbm1lbnQgdGhl
cmUgbWlnaHQgYmUgdGhlIG5lZWQgdG8gcmUtYWxsb2NhdGUgcGFydGl0aW9uIDxicj4mZ3Q7IHNw
YWNlIGFuZCByZXNpemluZyBpbiBhIHN0YXRpYyBwYXJ0aXRpb25pbmcgaW1wbGVtZW50YXRpb24g
Y2FuIGJlIDxicj4mZ3Q7IHZlcnkgcGFpbmZ1bC48YnI+Jmd0OyAqIFVzZSBDUkFNRlMgZm9yIHJl
YWQtb25seSBwYXJ0aXRpb25zLCBhbmQgVUJJRlMgZm9yIHJlYWQtd3JpdGUgcGFydGl0aW9ucy48
YnI+Jmd0OyA8YnI+Jmd0OyBQTk9SOjxicj4mZ3Q7ICogSW1wbGVtZW50IGEgbmV3IG1ib3hkIGJh
c2VkIG9uIEN5cmls4oCZcyAoc2VlIEN5cmls4oCZcyBlbWFpbCDigJxNYWlsYm94PGJyPiZndDsg
ZGFlbW9u4oCdKSB0aGF0IGhhbmRsZXMgZGJ1cyBvYmplY3RzLCBnZW5lcmF0ZXMgYSB2aXJ0dWFs
IFBOT1IgZm9yIFVCSTxicj4mZ3Q7IGNvbnRlbnQsIGV0Yy48YnI+Jmd0OyAqIE1vdmUgdG8gbWVt
b3J5LWJhc2VkIGFjY2VzcyBpbnN0ZWFkIG9mIHRoZSBjdXJyZW50IExQQy10by1BSEQgcGF0aC48
YnI+Jmd0OyAqIEFsbG9jYXRlIGp1c3QgZW5vdWdoIHNwYWNlIGluIHRoZSBpbml0aWFsIHdpbmRv
dyBmb3IgSG9zdGJvb3TigJlzIDxicj4mZ3Q7IFRPQywgSEJCLCBhbmQgSEJJIHBhcnRpdGlvbnMs
IGdyb3cgYXMgcmVxdWlyZWQuPGJyPiZndDsgKiBBYmlsaXR5IHRvIOKAmHBhdGNo4oCZIGJ5IGNv
cHlpbmcgYSBIb3N0Ym9vdCBpbWFnZSAqLmJpbiBpbnRvIGEgPGJyPiZndDsgZGVzaWduYXRlZCBk
aXJlY3RvcnkgKC91c3IvbG9jYWwvIGZvciBleGFtcGxlKS48YnI+Jmd0OyAqIFRvb2wgdG8gd3Jp
dGUgZnJvbSBQTk9SIGltYWdlIHRvIEJNQyBmb3JtYXQuIEltcGxlbWVudCBVQkkgPGJyPiZndDsg
aW5pdGlhbGx5IGJ1dCBpdCBjb3VsZCBiZSBleHRlbmRlZCB0byBzdXBwb3J0IGRpZmZlcmVudCB2
b2x1bWUgPGJyPiZndDsgbWFuYWdlbWVudHMgb24gb3RoZXIgQk1Dcy48YnI+Jmd0OyA8YnI+Jmd0
OyBCTUM6PGJyPiZndDsgKlNhdmUgbXVsdGlwbGUgZmlybXdhcmUgdmVyc2lvbnMsIHN0YXJ0aW5n
IHdpdGggMiwgdG8gcHJvdmlkZSB0aGUgPGJyPiZndDsgYWJpbGl0eSB0byByb2xsLWJhY2sgaWYg
bmVlZGVkLiBJZiBzaW5nbGUgQk1DIGNoaXAgc3lzdGVtLCBzYXZlIGJvdGg8YnI+Jmd0OyB2ZXJz
aW9ucyB0aGVyZS4gSWYgdHdvIEJNQyBjaGlwIHN5c3RlbSwgc2F2ZSBvdGhlciB2ZXJzaW9uIGlu
IDJuZCBjaGlwLjxicj4mZ3Q7ICogSW1wbGVtZW50IHZhcmlvdXMgbGV2ZWxzIG9mIOKAmHBlcnNp
c3RlbmN54oCZLCBzdWNoIGFzIGRldiwgZmFjdG9yeSwgPGJyPiZndDsgZmllbGQuIERldiBwZXJz
aXN0ZW5jeSB3b3VsZCBhbGxvdyBmb3IgbG9jYWwgcGF0Y2hlcyAoL3Vzci9sb2NhbC8gPGJyPiZn
dDsgZm9yIGV4YW1wbGUpIHRoYXQgY2FuIGJlIGNsZWFyZWQgYmVmb3JlIHNoaXBwaW5nIHRvIGN1
c3RvbWVycy4gPGJyPiZndDsgRmFjdG9yeSBtb2RlIGNvdWxkIGRlbGV0ZSB0aGUgbG9jYXRpb24g
d2hlcmUgdXNlciBkYXRhIHN1Y2ggYXMgPGJyPiZndDsgbmV0d29yayBzZXR0aW5ncyByZXNpZGVz
IGJ1dCBwcmVzZXJ2ZXMgdGhlIG1hYyBhZGRyZXNzIGFuZCB1dWlkIGZvciA8YnI+Jmd0OyBleGFt
cGxlLiBFdGMuPGJyPiZndDsgPGJyPiZndDsgVGhhbmtzLDxicj4mZ3Q7IDxicj4mZ3Q7IEFkcmlh
bmE8YnI+Jmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xzxicj4mZ3Q7IG9wZW5ibWMgbWFpbGluZyBsaXN0PGJyPiZndDsgb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnPGJyPiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZv
L29wZW5ibWMiPmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9vcGVuYm1jPC9hPjxi
cj48L3R0Pjxicj48YnI+PHR0PlNvIGFyZSB0aGUgZ29hbHMgb2YgSW1hZ2UgTWFuYWdlbWVudC4u
PC90dD48YnI+PGJyPjx0dD4xKSBBY3RpdmVseSBtYW5hZ2Ugd2Vhci1sZXZlbGluZzwvdHQ+PGJy
Pjx0dD4yKSBQcm92aWRlIGFuIGFwaSBmb3IgQklPUy9Ib3N0IGluYmFuZCB1cGRhdGU8L3R0Pjxi
cj48dHQ+MykgUHJvdmlkZSBhIHdheSB0byBib290IGFuIGltYWdlIHRoYXQgaXMgbm90IGZyb20g
Zmxhc2g8L3R0Pjxicj48dHQ+NCkgRHVlbCBpbWFnZSBzdXBwb3J0PC90dD48YnI+PHR0PjUpIER1
ZWwgZmxhc2ggY2hpcCBzdXBwb3J0PC90dD48YnI+PHR0PjYpIFN1cHBvcnQgbXVsdGlwbGUgdGll
cnMgb2Ygc2FuaXRpemF0aW9uIDwvdHQ+PGJyPjxicj48dHQ+QXJlIHRoZXJlIGFueSBzZWN1cml0
eSBnb2FscyB0aGF0IG5lZWQgdG8gYmUgY29uc2lkZXJlZD8gJm5ic3A7PC90dD48YnI+PGJyPjxC
Uj4NCjwvYm9keT48L2h0bWw+DQo=

--0__=09BB0A20DF1102478f9e8a93df938690918c09BB0A20DF110247--
