Return-Path: <bjlinan@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFfD719BmzDqT6
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 16:21:10 +1000 (AEST)
Received: from pps.filterd (m0049461.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u4Q6JIDb043011
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 02:21:08 -0400
Message-Id: <201605260621.u4Q6JIDb043011@mx0a-001b2d01.pphosted.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 235ebx9qp3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 02:21:08 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Thu, 26 May 2016 16:21:05 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 26 May 2016 16:21:03 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: bjlinan@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 140153578065
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 16:21:03 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4Q6KTDK48496706
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 16:20:37 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4Q6Jp7d020632
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 16:19:51 +1000
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4Q6JnU1020341
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 16:19:50 +1000
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Thu, 26 May 2016 00:19:41 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 26 May 2016 00:19:40 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: bjlinan@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Thu, 26 May 2016 06:19:39 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 26 May 2016 06:19:38 -0000
Received: from us1a3-mail166.a3.dal06.isc4sb.com ([10.146.71.123])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016052606193765-47284 ;
 Thu, 26 May 2016 06:19:37 +0000 
In-Reply-To: <20160526133714.7dcb60cf@camb691>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openpower-host-ipmi-oem v2] Fix endianness issue5
From: "Nan KX Li" <bjlinan@cn.ibm.com>
Date: Thu, 26 May 2016 14:19:37 +0800
References: <20160526020044.1213-1-openbmc-patches@stwcx.xyz><20160526020044.1213-2-openbmc-patches@stwcx.xyz><57465E9E.2000502@ozlabs.org>
 <20160526133714.7dcb60cf@camb691>
MIME-Version: 1.0
X-KeepSent: 1AD56557:79D5E170-48257FBF:00218E67;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 17395
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 00228B4B48257FBF_="
x-cbid: 16052606-1617-0000-0000-000001244904
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005302; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000167; SDB=6.00707495; UDB=6.00328404; UTC=2016-05-26
 06:19:38
x-cbparentid: 16052606-5938-0000-0000-000003CEDF6B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-05-26_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=7
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1605260070
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 May 2016 06:21:11 -0000


--=_alternative 00228B4B48257FBF_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="GB2312"

SGkgQ3lyaWwgYW5kIEplcmVteSwNCkknbSBzb3JyeSBmb3IgdGhhdC4gDQpUaGlzIG1vcm5pbmcg
SSBjaGFuZ2VkIG15IGNvZGUgYW5kIGFjY2lkZW50YWxseSBwdXNoZWQgdG8gZ2l0aHViIGJlZm9y
ZSBJIA0KZm91bmQgeW91ciByZXZpZXdzLiBJIHdpbGwgYmUgbW9yZSBjYXJlZnVsIGluIGZ1dHVy
ZS4NCg0KUmVnYXJkcywNCg0KV2lsbGlhbSBMaSAoIExpIE5hbiwgwO7pqiApIA0KIA0KDQpGaXJt
d2FyZSBFbmdpbmVlcmluZyBQcm9mZXNzaW9uYWwNCk9wZW5Qb3dlciBBRSBUZWFtIHwgSUJNIFN5
c3RlbSAmIFRlY2hub2xvZ3kgTGFiDQpNb2JpbGU6ICs4Ni0xODYtMTA4MSA2NjA1DQoNCkJlaWpp
bmcsIENoaW5hDQoNCg0KDQpGcm9tOiAgIEN5cmlsIEJ1ciA8Y3lyaWxidXJAZ21haWwuY29tPg0K
VG86ICAgICBOYW4gS1ggTGkvQ2hpbmEvSUJNQElCTUNODQpDYzogICAgIEplcmVteSBLZXJyIDxq
a0BvemxhYnMub3JnPiwgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpEYXRlOiAgIDA1LzI2LzIw
MTYgMTI6MDQNClN1YmplY3Q6ICAgICAgICBSZTogW1BBVENIIG9wZW5wb3dlci1ob3N0LWlwbWkt
b2VtIHYyXSBGaXggZW5kaWFubmVzcyANCmlzc3VlNQ0KDQoNCg0KT24gVGh1LCAyNiBNYXkgMjAx
NiAxMDoyNTozNCArMDgwMA0KSmVyZW15IEtlcnIgPGprQG96bGFicy5vcmc+IHdyb3RlOg0KDQo+
IEhpIE5hbiwNCj4gDQoNCkhpIE5hbiwNCg0KSSByZXNwb25kZWQgdG8gdjEgb2YgeW91ciBwYXRj
aC4gWW91IGhhdmUgc2VudCBleGFjdGx5IHRoZSBzYW1lIGNvZGUgYXMgDQp2Mi4gDQoNCk9uZSBv
ZiB0d28gdGhpbmdzIGhhcyBoYXBwZW5lZDoNCk9uZSB5b3UgYWNjaWRlbnRhbGx5IHRyaWdnZXJl
ZCBnaXRodWIgdG8gc2VuZCBhIHYyICh3aGljaCBhZG1pdHRlZGx5IGlzIA0KZWFzeSB0bw0KZG8p
LCBwbGVhc2UgdHJ5IHRvIGJlIG1vcmUgY2FyZWZ1bCBpbiBmdXR1cmUsIHRoaXMgY3JlYXRlcyBh
IGxvdCBvZiANCnBvaW50bGVzcw0Kbm9pc2Ugb24gdGhlIGxpc3QgYW5kIGxlYWRzIHRvIGRvdWJs
ZSByZXZpZXdzLCBKZXJlbXkgaGFzIG1hZGUgdGhlIHNhbWUgDQpwb2ludA0KSSBwcmV2aW91c2x5
IGhhdmUuDQpUd28geW91J3JlIGlnbm9yaW5nIHJldmlld3MgdG8geW91ciBwYXRjaGVzIGFuZCBz
ZW5kaW5nIHN1YnNlcXVlbnQgDQp2ZXJzaW9ucy4uLg0Kd2h5IGRvIHlvdSBkbyB0aGlzPw0KDQo+
IFlvdSBzZWVtIHRvIGhhdmUgYSBtaW5vciB0eXBvIGluIHRoZSBjb21taXQgdGl0bGUgdGhlcmUu
DQo+IA0KPiA+IC0gICAgICAgICAgICAvLyBUT0RPOiBJc3N1ZSA1OiBUaGlzIGlzIG5vdCBlbmRp
YW4tc2FmZS4NCj4gPiAtICAgICAgICAgICAgc2hvcnQgKnJlY2lkICA9ICAoc2hvcnQqKSAmcmVx
cHRyLT5zZWxyZWNvcmRsczsNCj4gPiAtICAgICAgICAgICAgc2hvcnQgKm9mZnNldCA9ICAoc2hv
cnQqKSAmcmVxcHRyLT5vZmZzZXRsczsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVk
IHNob3J0IHJlY2lkICA9ICAoKHVuc2lnbmVkIHNob3J0KSANCnJlcXB0ci0+c2VscmVjb3JkbXMp
IDw8IDggKyByZXFwdHItPnNlbHJlY29yZGxzOw0KPiA+ICsgICAgICAgICAgICB1bnNpZ25lZCBz
aG9ydCBvZmZzZXQgPSAgKCh1bnNpZ25lZCBzaG9ydCkgDQpyZXFwdHItPm9mZnNldG1zKSA8PCA4
ICsgcmVxcHRyLT5vZmZzZXRsczsgDQo+IA0KPiBUaGF0IHdvbid0IGRvIHRoZSBlbmRpYW4gY29u
dmVyc2lvbiBjb3JyZWN0bHkuIENhbiB5b3UgdXNlIG9uZSBvZiB0aGUNCj4gZXhpc3RpbmcgZW5k
aWFuIGNvbnZlcnNpb24gZnVuY3Rpb25zPw0KPiANCj4gVGhlIGxlMTZ0b2goKSBmdW5jdGlvbiBp
cyBwcm9iYWJseSB3aGF0IHlvdSB3YW50IGhlcmUsIGZyb20gZW5kaWFuLmguDQo+IA0KPiBBbHNv
LCBiZSBjYXJlZnVsIG9mIHRoZSBjaGFuZ2UgZnJvbSAnc2hvcnQnIHRvICd1bnNpZ25lZCBzaG9y
dCcuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gDQo+IEplcmVteQ0KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBvcGVuYm1jIG1haWxpbmcgbGlzdA0K
PiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xp
c3RpbmZvL29wZW5ibWMNCg0KDQoNCg0K

--=_alternative 00228B4B48257FBF_=
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="GB2312"

PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPkhpIEN5cmlsIGFuZCBKZXJlbXksPC9mb250
Pjxicj48Zm9udCBzaXplPTIgZmFjZT0ic2Fucy1zZXJpZiI+SSdtIHNvcnJ5IGZvciB0aGF0LiA8
L2ZvbnQ+PGJyPjxmb250IHNpemU9MiBmYWNlPSJzYW5zLXNlcmlmIj5UaGlzIG1vcm5pbmcgSSBj
aGFuZ2VkIG15IGNvZGUgYW5kIDwvZm9udD48dHQ+PGZvbnQgc2l6ZT0yPmFjY2lkZW50YWxseQ0K
cHVzaGVkIHRvIGdpdGh1YjwvZm9udD48L3R0Pjxmb250IHNpemU9MiBmYWNlPSJzYW5zLXNlcmlm
Ij4gYmVmb3JlIEkgZm91bmQNCnlvdXIgcmV2aWV3cy4gSSB3aWxsIDwvZm9udD48dHQ+PGZvbnQg
c2l6ZT0yPmJlIG1vcmUgY2FyZWZ1bCBpbiBmdXR1cmUuPC9mb250PjwvdHQ+PGJyPjxicj48Zm9u
dCBzaXplPTMgY29sb3I9IzQyNDI4MiBmYWNlPSJDYWxpYnJpIj5SZWdhcmRzLDwvZm9udD48YnI+
PGJyPjxmb250IHNpemU9MyBjb2xvcj0jNDI0MjgyIGZhY2U9IkNhbGlicmkiPldpbGxpYW0gTGkg
KCBMaSBOYW4sIMDu6aoNCikgPC9mb250Pjxicj48Zm9udCBzaXplPTMgY29sb3I9IzQyNDI4MiBm
YWNlPSJDYWxpYnJpIj4mbmJzcDsgJm5ic3A7PC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0zIGNv
bG9yPSM0MjQyODIgZmFjZT0iQ2FsaWJyaSI+RmlybXdhcmUgRW5naW5lZXJpbmcgUHJvZmVzc2lv
bmFsPC9mb250Pjxicj48Zm9udCBzaXplPTMgY29sb3I9IzQyNDI4MiBmYWNlPSJDYWxpYnJpIj5P
cGVuUG93ZXIgQUUgVGVhbSB8IElCTSBTeXN0ZW0NCiZhbXA7IFRlY2hub2xvZ3kgTGFiPC9mb250
Pjxicj48Zm9udCBzaXplPTMgY29sb3I9IzQyNDI4MiBmYWNlPSJDYWxpYnJpIj5Nb2JpbGU6ICs4
Ni0xODYtMTA4MSA2NjA1PC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0zIGNvbG9yPSM0MjQyODIg
ZmFjZT0iQ2FsaWJyaSI+QmVpamluZywgQ2hpbmE8L2ZvbnQ+PGJyPjxicj48YnI+PGJyPjxmb250
IHNpemU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYiPkZyb206ICZuYnNwOyAmbmJz
cDsgJm5ic3A7DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPkN5
cmlsIEJ1ciAmbHQ7Y3lyaWxidXJAZ21haWwuY29tJmd0OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0x
IGNvbG9yPSM1ZjVmNWYgZmFjZT0ic2Fucy1zZXJpZiI+VG86ICZuYnNwOyAmbmJzcDsgJm5ic3A7
DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPk5hbiBLWCBMaS9D
aGluYS9JQk1ASUJNQ048L2ZvbnQ+PGJyPjxmb250IHNpemU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9
InNhbnMtc2VyaWYiPkNjOiAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KJm5ic3A7PC9mb250Pjxmb250
IHNpemU9MSBmYWNlPSJzYW5zLXNlcmlmIj5KZXJlbXkgS2VyciAmbHQ7amtAb3psYWJzLm9yZyZn
dDssDQpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8L2ZvbnQ+PGJyPjxmb250IHNpemU9MSBjb2xv
cj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYiPkRhdGU6ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQom
bmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPjA1LzI2LzIwMTYgMTI6
MDQ8L2ZvbnQ+PGJyPjxmb250IHNpemU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYi
PlN1YmplY3Q6ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0x
IGZhY2U9InNhbnMtc2VyaWYiPlJlOiBbUEFUQ0ggb3BlbnBvd2VyLWhvc3QtaXBtaS1vZW0NCnYy
XSBGaXggZW5kaWFubmVzcyBpc3N1ZTU8L2ZvbnQ+PGJyPjxociBub3NoYWRlPjxicj48YnI+PGJy
Pjx0dD48Zm9udCBzaXplPTI+T24gVGh1LCAyNiBNYXkgMjAxNiAxMDoyNTozNCArMDgwMDxicj5K
ZXJlbXkgS2VyciAmbHQ7amtAb3psYWJzLm9yZyZndDsgd3JvdGU6PGJyPjxicj4mZ3Q7IEhpIE5h
biw8YnI+Jmd0OyA8YnI+PGJyPkhpIE5hbiw8YnI+PGJyPkkgcmVzcG9uZGVkIHRvIHYxIG9mIHlv
dXIgcGF0Y2guIFlvdSBoYXZlIHNlbnQgZXhhY3RseSB0aGUgc2FtZSBjb2RlIGFzDQp2Mi4gPGJy
Pjxicj5PbmUgb2YgdHdvIHRoaW5ncyBoYXMgaGFwcGVuZWQ6PGJyPk9uZSB5b3UgYWNjaWRlbnRh
bGx5IHRyaWdnZXJlZCBnaXRodWIgdG8gc2VuZCBhIHYyICh3aGljaCBhZG1pdHRlZGx5IGlzDQpl
YXN5IHRvPGJyPmRvKSwgcGxlYXNlIHRyeSB0byBiZSBtb3JlIGNhcmVmdWwgaW4gZnV0dXJlLCB0
aGlzIGNyZWF0ZXMgYSBsb3Qgb2YgcG9pbnRsZXNzPGJyPm5vaXNlIG9uIHRoZSBsaXN0IGFuZCBs
ZWFkcyB0byBkb3VibGUgcmV2aWV3cywgSmVyZW15IGhhcyBtYWRlIHRoZSBzYW1lDQpwb2ludDxi
cj5JIHByZXZpb3VzbHkgaGF2ZS48YnI+VHdvIHlvdSdyZSBpZ25vcmluZyByZXZpZXdzIHRvIHlv
dXIgcGF0Y2hlcyBhbmQgc2VuZGluZyBzdWJzZXF1ZW50IHZlcnNpb25zLi4uPGJyPndoeSBkbyB5
b3UgZG8gdGhpcz88YnI+PGJyPiZndDsgWW91IHNlZW0gdG8gaGF2ZSBhIG1pbm9yIHR5cG8gaW4g
dGhlIGNvbW1pdCB0aXRsZSB0aGVyZS48YnI+Jmd0OyA8YnI+Jmd0OyAmZ3Q7IC0gJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KLy8gVE9ETzog
SXNzdWUgNTogVGhpcyBpcyBub3QgZW5kaWFuLXNhZmUuPGJyPiZndDsgJmd0OyAtICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCnNob3J0ICpy
ZWNpZCAmbmJzcDs9ICZuYnNwOyhzaG9ydCopICZhbXA7cmVxcHRyLSZndDtzZWxyZWNvcmRsczs8
YnI+Jmd0OyAmZ3Q7IC0gJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOw0Kc2hvcnQgKm9mZnNldCA9ICZuYnNwOyhzaG9ydCopICZhbXA7cmVxcHRy
LSZndDtvZmZzZXRsczs8YnI+Jmd0OyAmZ3Q7ICs8YnI+Jmd0OyAmZ3Q7ICsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KdW5zaWduZWQgc2hv
cnQgcmVjaWQgJm5ic3A7PSAmbmJzcDsoKHVuc2lnbmVkIHNob3J0KSByZXFwdHItJmd0O3NlbHJl
Y29yZG1zKQ0KJmx0OyZsdDsgOCArIHJlcXB0ci0mZ3Q7c2VscmVjb3JkbHM7PGJyPiZndDsgJmd0
OyArICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsNCnVuc2lnbmVkIHNob3J0IG9mZnNldCA9ICZuYnNwOygodW5zaWduZWQgc2hvcnQpIHJlcXB0
ci0mZ3Q7b2Zmc2V0bXMpICZsdDsmbHQ7DQo4ICsgcmVxcHRyLSZndDtvZmZzZXRsczsgJm5ic3A7
PGJyPiZndDsgPGJyPiZndDsgVGhhdCB3b24ndCBkbyB0aGUgZW5kaWFuIGNvbnZlcnNpb24gY29y
cmVjdGx5LiBDYW4geW91IHVzZSBvbmUgb2YNCnRoZTxicj4mZ3Q7IGV4aXN0aW5nIGVuZGlhbiBj
b252ZXJzaW9uIGZ1bmN0aW9ucz88YnI+Jmd0OyA8YnI+Jmd0OyBUaGUgbGUxNnRvaCgpIGZ1bmN0
aW9uIGlzIHByb2JhYmx5IHdoYXQgeW91IHdhbnQgaGVyZSwgZnJvbSBlbmRpYW4uaC48YnI+Jmd0
OyA8YnI+Jmd0OyBBbHNvLCBiZSBjYXJlZnVsIG9mIHRoZSBjaGFuZ2UgZnJvbSAnc2hvcnQnIHRv
ICd1bnNpZ25lZCBzaG9ydCcuPGJyPiZndDsgPGJyPiZndDsgUmVnYXJkcyw8YnI+Jmd0OyA8YnI+
Jmd0OyA8YnI+Jmd0OyBKZXJlbXk8YnI+Jmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXzxicj4mZ3Q7IG9wZW5ibWMgbWFpbGluZyBsaXN0PGJyPiZndDsg
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPGJyPiZndDsgPC9mb250PjwvdHQ+PGEgaHJlZj1odHRw
czovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vb3BlbmJtYz48dHQ+PGZvbnQgc2l6ZT0yPmh0
dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9vcGVuYm1jPC9mb250PjwvdHQ+PC9hPjx0
dD48Zm9udCBzaXplPTI+PGJyPjxicj48L2ZvbnQ+PC90dD48YnI+PEJSPg0K
--=_alternative 00228B4B48257FBF_=--
