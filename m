Return-Path: <cakici@us.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3Y0c02fszDq5m
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 05:51:11 +1000 (AEST)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cakici@us.ibm.com>;
 Mon, 9 May 2016 13:51:09 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 9 May 2016 13:51:07 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: cakici@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 5749C1FF0057
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2016 13:50:52 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u49Jp7op41025668
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 12:51:07 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u49Jp7I2023080
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 13:51:07 -0600
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u49Jp5Qm023020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 9 May 2016 13:51:06 -0600
Message-Id: <201605091951.u49Jp5Qm023020@d03av04.boulder.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cakici@us.ibm.com>;
 Mon, 9 May 2016 15:51:05 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 9 May 2016 15:51:03 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: cakici@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <cakici@us.ibm.com>;
 Mon, 9 May 2016 19:51:01 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 9 May 2016 19:51:00 -0000
Received: from us1a3-mail86.a3.dal06.isc4sb.com ([10.146.21.208])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016050919510049-437674 ;
 Mon, 9 May 2016 19:51:00 +0000 
In-Reply-To: <1462578052.20290.61.camel@au1.ibm.com>
To: benh@ozlabs.au.ibm.com, "Raguraman Tumaati-Krishnan" <ragu@us.ibm.com>
Cc: Cyril Bur <cyrilbur@gmail.com>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
From: "Sertac Cakici" <cakici@us.ibm.com>
Date: Mon, 9 May 2016 14:51:00 -0500
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com> <20160506113218.4adf5db7@camb691>
 <1462578052.20290.61.camel@au1.ibm.com>
MIME-Version: 1.0
X-KeepSent: D2BE1CE9:4DD5A2AC-00257FAE:006CF634;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 17563
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 006D0C3E86257FAE_="
x-cbid: 16050919-0017-0000-0000-00002AD1633C
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0.033932; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005260; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00699796; UDB=6.00323785; UTC=2016-05-09
 19:51:01
x-cbparentid: 16050919-5938-0000-0000-000003865603
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Mailman-Approved-At: Fri, 13 May 2016 01:50:47 +1000
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
X-List-Received-Date: Mon, 09 May 2016 19:51:12 -0000


--=_alternative 006D0C3E86257FAE_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"

UmFndSBoYXMgbGV0IHVzIGJvcnJvdyBoaXMgc3lzdGVtLiBJdCdzIEdBIGxldmVsIEhXLg0KDQpC
TUM6IGZyOTk5LmF1cy5zdGdsYWJzLmlibS5jb20NClVidW50dTogZnI5OTlwMDEuYXVzLnN0Z2xh
YnMuaWJtLmNvbQ0KDQpTZXJ0YcOnDQrlj7LloZTlpYcNCg0KDQoNCg0KRnJvbTogICBCZW5qYW1p
biBIZXJyZW5zY2htaWR0IDxiZW5oQGF1MS5pYm0uY29tPg0KVG86ICAgICBDeXJpbCBCdXIgPGN5
cmlsYnVyQGdtYWlsLmNvbT4NCkNjOiAgICAgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4s
IE9wZW5CTUMgTWFpbGxpc3QgDQo8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPiwgR2F2aW4gU2hh
biA8Z3dzaGFuQGxpbnV4LnZuZXQuaWJtLmNvbT4sIFNlcnRhYyANCkNha2ljaS9BdXN0aW4vSUJN
QElCTVVTDQpEYXRlOiAgIDA1LzA2LzIwMTYgMDY6NDIgUE0NClN1YmplY3Q6ICAgICAgICBSZTog
W1BBVENIIDYvNl0gbmV0L3BoeTogRXhwb3NlIDEwMGJhc2UtVCBjYXBhYmlsaXR5IG9ubHkNCg0K
DQoNCk9uIEZyaSwgMjAxNi0wNS0wNiBhdCAxMTozMiArMTAwMCwgQ3lyaWwgQnVyIHdyb3RlOg0K
PiANCj4gVGhpcyBpcyBzb21ldGhpbmcgSSdtIHRyeWluZyB0byBjb25maXJtLiBUaGUgZmlyZXN0
b25lcyBJIGFuZCBHYXZpbg0KPiBoYXZlIGFjY2VzcyB0byBhcHBlYXIgdG8gYmUgcHJlcmVsZWFz
ZSwgc28gYW55dGhpbmdzIHBvc3NpYmxlLg0KPg0KPiBJIGFtIHN0cnVnZ2xpbmcgdG8gZ2V0IGFj
Y2VzcyB0byBhIHJlbGVhc2UgZmlyZXN0b25lLCB3aGVuIEkgZG8gSSdsbA0KPiBjaGVjayBpZiBH
YXZpbnMgcGF0Y2ggaXMgbmVjZXNzYXJ5IHRoZXJlLiBJZiBzbywgdGhlbiB3ZSdsbCBoYXZlIHRv
DQo+IHN0YXJ0IGFza2luZyB0aG9zZSBzb3J0cyBvZiBxdWVzdGlvbnMuDQoNClNvIEkgdGFsa2Vk
IHRvIFNlcnRhYyBhbmQgaGUnbGwgZ2V0IHlvdSBhY2Nlc3MgdG8gYSBHQSBsZXZlbCBGaXJlc3Rv
bmUNCm5leHQgd2Vlay4gSXQgc2hvdWxkIGJlIHdpcmVkIGFzIHByb3BlciBSR01JSSwgaWUsIGl0
IHNob3VsIHdvcmsuLi4NCg0KQ2hlZXJzLA0KQmVuLg0KDQoNCg0KDQo=

--=_alternative 006D0C3E86257FAE_=
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="UTF-8"

PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPlJhZ3UgaGFzIGxldCB1cyBib3Jyb3cgaGlz
IHN5c3RlbS4gSXQncw0KR0EgbGV2ZWwgSFcuPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0yIGZh
Y2U9InNhbnMtc2VyaWYiPkJNQzogZnI5OTkuYXVzLnN0Z2xhYnMuaWJtLmNvbTwvZm9udD48YnI+
PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPlVidW50dTogZnI5OTlwMDEuYXVzLnN0Z2xh
YnMuaWJtLmNvbTwvZm9udD48YnI+PGJyPjxmb250IHNpemU9MiBmYWNlPSJzYW5zLXNlcmlmIj5T
ZXJ0YcOnPGJyPuWPsuWhlOWlhzxicj48L2ZvbnQ+PGJyPjxicj48YnI+PGJyPjxmb250IHNpemU9
MSBjb2xvcj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYiPkZyb206ICZuYnNwOyAmbmJzcDsgJm5i
c3A7DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPkJlbmphbWlu
IEhlcnJlbnNjaG1pZHQNCiZsdDtiZW5oQGF1MS5pYm0uY29tJmd0OzwvZm9udD48YnI+PGZvbnQg
c2l6ZT0xIGNvbG9yPSM1ZjVmNWYgZmFjZT0ic2Fucy1zZXJpZiI+VG86ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPkN5cmls
IEJ1ciAmbHQ7Y3lyaWxidXJAZ21haWwuY29tJmd0OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0xIGNv
bG9yPSM1ZjVmNWYgZmFjZT0ic2Fucy1zZXJpZiI+Q2M6ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQom
bmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPkpvZWwgU3RhbmxleSAm
bHQ7am9lbEBqbXMuaWQuYXUmZ3Q7LA0KT3BlbkJNQyBNYWlsbGlzdCAmbHQ7b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnJmd0OywgR2F2aW4gU2hhbiAmbHQ7Z3dzaGFuQGxpbnV4LnZuZXQuaWJtLmNv
bSZndDssDQpTZXJ0YWMgQ2FraWNpL0F1c3Rpbi9JQk1ASUJNVVM8L2ZvbnQ+PGJyPjxmb250IHNp
emU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYiPkRhdGU6ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPjA1LzA2
LzIwMTYgMDY6NDIgUE08L2ZvbnQ+PGJyPjxmb250IHNpemU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9
InNhbnMtc2VyaWYiPlN1YmplY3Q6ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDs8L2ZvbnQ+
PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPlJlOiBbUEFUQ0ggNi82XQ0KbmV0L3BoeTog
RXhwb3NlIDEwMGJhc2UtVCBjYXBhYmlsaXR5IG9ubHk8L2ZvbnQ+PGJyPjxociBub3NoYWRlPjxi
cj48YnI+PGJyPjx0dD48Zm9udCBzaXplPTI+T24gRnJpLCAyMDE2LTA1LTA2IGF0IDExOjMyICsx
MDAwLCBDeXJpbCBCdXIgd3JvdGU6PGJyPiZndDsmbmJzcDs8YnI+Jmd0OyBUaGlzIGlzIHNvbWV0
aGluZyBJJ20gdHJ5aW5nIHRvIGNvbmZpcm0uIFRoZSBmaXJlc3RvbmVzIEkgYW5kIEdhdmluPGJy
PiZndDsgaGF2ZSBhY2Nlc3MgdG8gYXBwZWFyIHRvIGJlIHByZXJlbGVhc2UsIHNvIGFueXRoaW5n
cyBwb3NzaWJsZS48YnI+Jmd0Ozxicj4mZ3Q7IEkgYW0gc3RydWdnbGluZyB0byBnZXQgYWNjZXNz
IHRvIGEgcmVsZWFzZSBmaXJlc3RvbmUsIHdoZW4gSSBkbyBJJ2xsPGJyPiZndDsgY2hlY2sgaWYg
R2F2aW5zIHBhdGNoIGlzIG5lY2Vzc2FyeSB0aGVyZS4gSWYgc28sIHRoZW4gd2UnbGwgaGF2ZSB0
bzxicj4mZ3Q7IHN0YXJ0IGFza2luZyB0aG9zZSBzb3J0cyBvZiBxdWVzdGlvbnMuPGJyPjxicj5T
byBJIHRhbGtlZCB0byBTZXJ0YWMgYW5kIGhlJ2xsIGdldCB5b3UgYWNjZXNzIHRvIGEgR0EgbGV2
ZWwgRmlyZXN0b25lPGJyPm5leHQgd2Vlay4gSXQgc2hvdWxkIGJlIHdpcmVkIGFzIHByb3BlciBS
R01JSSwgaWUsIGl0IHNob3VsIHdvcmsuLi48YnI+PGJyPkNoZWVycyw8YnI+QmVuLjxicj48YnI+
PC9mb250PjwvdHQ+PGJyPjxCUj4NCg==
--=_alternative 006D0C3E86257FAE_=--
