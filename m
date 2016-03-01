Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0C1881A074D
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 14:53:40 +1100 (AEDT)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 1 Mar 2016 13:53:39 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 1 Mar 2016 13:53:36 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 9E7542BB0057
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 14:53:32 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u213rOxs63242488
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 14:53:32 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u213r0v9024309
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 14:53:00 +1100
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u213qvF0024100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 1 Mar 2016 14:52:59 +1100
Message-Id: <201603010352.u213qvF0024100@d23av06.au.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 29 Feb 2016 22:52:49 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 29 Feb 2016 22:52:46 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 1 Mar 2016 03:52:44 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Mar 2016 03:52:44 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016030103524375-10260 ;
 Tue, 1 Mar 2016 03:52:43 +0000 
In-Reply-To: <B7312321-087F-4E7A-8450-D8489ABEA3C6@bwbmail.net>
Subject: Re: [PATCH skeleton v3] skeleton: fixed hard-coding of master OCC
 hwmon sysfs path for PowerCap object
To: Brad Bishop <brad@bwbmail.net>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Tue, 1 Mar 2016 11:52:40 +0800
References: <1456488645-11725-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456488645-11725-2-git-send-email-openbmc-patches@stwcx.xyz>
 <B7312321-087F-4E7A-8450-D8489ABEA3C6@bwbmail.net>
X-KeepSent: BEDADD95:785648EC-00257F69:00149DEC;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 8999
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBBF5FADF871B7C8f9e8a93df938690918c8FBBF5FADF871B7C"
Content-Disposition: inline
x-cbid: 16030103-1618-0000-0000-0000272093E4
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0.130683; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004980; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000149; SDB=6.00666910; UDB=6.00304176; UTC=2016-03-01
 03:52:44
x-cbparentid: 16030103-5920-0000-0000-0000065B9999
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 03:53:41 -0000


--0__=8FBBF5FADF871B7C8f9e8a93df938690918c8FBBF5FADF871B7C
Content-Transfer-Encoding: base64
Content-type: text/plain; charset=UTF-8

QnJhZCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBQbGVhc2Ugc2VlIHJlcGx5IGJlbGxvdzoN
Cg0KIm9wZW5ibWMiIDxvcGVuYm1jLWJvdW5jZXMrc2hsaXlpPWNuLmlibS5jb21AbGlzdHMub3ps
YWJzLm9yZz4gd3JvdGUgb24NCjAyLzI2LzIwMTYgMDg6NTI6MTAgUE06DQoNCj4gRnJvbTogQnJh
ZCBCaXNob3AgPGJyYWRAYndibWFpbC5uZXQ+DQo+IFRvOiBPcGVuQk1DIFBhdGNoZXMgPG9wZW5i
bWMtcGF0Y2hlc0BzdHdjeC54eXo+DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4g
RGF0ZTogMDIvMjYvMjAxNiAwODo1MyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHNrZWxldG9u
IHYzXSBza2VsZXRvbjogZml4ZWQgaGFyZC1jb2Rpbmcgb2YNCj4gbWFzdGVyIE9DQyBod21vbiBz
eXNmcyBwYXRoIGZvciBQb3dlckNhcCBvYmplY3QNCj4gU2VudCBieTogIm9wZW5ibWMiIDxvcGVu
Ym1jLWJvdW5jZXMrc2hsaXlpPWNuLmlibS5jb21AbGlzdHMub3psYWJzLm9yZz4NCj4NCj4NCj4g
PiArICAgICAgICAgICAgYnJlYWsNCj4gPiArICAgICAgZWxzZToNCj4gPiArICAgICAgICAgcmFp
c2UgZGJ1cy5leGNlcHRpb25zLkRCdXNFeGNlcHRpb24oDQo+ID4gKyAgICAgICAgICAgICJDYW5u
b3QgZmluZCB1c2VyX3Bvd2VyY2FwIGh3bW9uIGF0dHJpYnV0ZSwgIisNCj4gPiArICAgICAgICAg
ICAgImNoZWNrIG9jYyBzdGF0dXMuIiwNCj4gPiArICAgICAgICAgICAgbmFtZT0nb3JnLmZyZWVk
ZXNrdG9wLkRCdXMuUHl0aG9uLlR5cGVFcnJvcuKAmSkNCj4NCj4gWW91IGRvbuKAmXQgbmVlZCBh
IHJldHVybiBzdGF0ZW1lbnQgYWZ0ZXIgdGhyb3dpbmcgYW4gZXhjZXB0aW9uLg0KPg0KPiA+ICsg
ICAgICAgICByZXR1cm4NCg0KT0suIFdpbGwgZml4Lg0KDQo+ID4gICAgICAgdHJ5Og0KPiA+IC0g
ICAgICAgICBjbWRfc3RyID0gImVjaG8gIitzdHIodmFsdWUpKyIgPiAiK3NlbGYuc3lzZnNfYXR0
cg0KPiA+ICsgICAgICAgICBjbWRfc3RyID0gJ2VjaG8gJytzdHIodmFsdWUpKycgPiAnK3NlbGYu
c3lzZnNfYXR0cg0KPiA+ICAgICAgICAgIHJldCA9IHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KGNt
ZF9zdHIsIHNoZWxsPVRydWUpDQo+ID4gICAgICAgZXhjZXB0IHN1YnByb2Nlc3MuQ2FsbGVkUHJv
Y2Vzc0Vycm9yIGFzIHBvd2VyZXhjOg0KPiA+IC0gICAgICAgICBwcmludCAiU2V0IFBvd2VyQ2Fw
IEVycm9yIiwgcG93ZXJleGMucmV0dXJuY29kZSwNCj4gPiAtICAgICAgICAgcG93ZXJleGMub3V0
cHV0DQo+DQo+IFdvdWxkIGJlIG5pY2UgdG8ga25vdyBpZiB0aGlzIHdhcyBhIHJlYWwgZXJyb3Ig
b3IganVzdCB1c2VyLWVycm9yLg0KPiBTaW5jZSB0aGlzIGlzIGV4dGVybmFsLCB1c2VyIGlucHV0
LCBpdCBwcm9iYWJseSBtYWtlcyBzZW5zZSB0byBkbw0KPiBhbGwgc29ydHMgb2YgdmFsaWRhdGlv
biB1cCBmcm9udCBiZWZvcmUgcGFzc2luZyBpdCBkb3duIGxvd2VyIGluIHRoZQ0KPiBzdGFjayBy
YXRoZXIgdGhhbiBqdXN0IHJlbHlpbmcgb24gdGhlIGNhbGxlZCBwcm9jZXNzIHRvIGRvIGl0Lg0K
Pg0KDQpUaGUgcmVhc29uIEkgZGlkIG5vdCB2YWxpZGF0ZSB1c2VyIGlucHV0IGhlcmUsIGlzIHRo
ZSBrZXJuZWwgZHJpdmVyIGl0c2VsZg0KKGFjdHVhbGx5IE9DQyBpdHNlbGYpIHdvdWxkIHJlc3Bv
bmQgd3Jvbmcgc3RhdHVzDQp3aGVuIHNldHRpbmcgaW52YWxpZCB1c2VyIHBvd2VyIGNhcCwgZS5n
Og0KDQpyb290QGJhcnJlbGV5ZTovIyBlY2hvIDQwMDAgPiAvc3lzL2NsYXNzL2h3bW9uL2h3bW9u
My91c2VyX3Bvd2VyY2FwDQpvY2MtaTJjIDMtMDA1MDogU2V0IFVzZXIgUG93ZXJjYXA6IHdyb25n
IHJldHVybiBzdGF0dXM6IDEzDQpvY2MtaTJjIDMtMDA1MDogaW52YWxpZCBwb3dlcmNhcCB2YWx1
ZTogZmEwDQotc2g6IGVjaG86IHdyaXRlIGVycm9yOiBJbnZhbGlkIGFyZ3VtZW50DQoNCkJ1dCBJ
IGFncmVlIHRoYXQgd2UgbmVlZCB0byBwdXQgdGhlIHBvbGljeSBpbiB1c2VyIHNwYWNlLCByYXRo
ZXIgdGhhbg0KcmVseWluZyBvbiBrZXJuZWwgYW5kIE9DQyB0byBoYW5kbGUgZXJyb3IuDQoNCkkg
d2lsbCBhZGQgdXNlciBpbnB1dCB2YWxpZGF0aW9uIGhlcmUuDQoNClRoYW5rcywNCi1ZaQ0KDQo=

--0__=8FBBF5FADF871B7C8f9e8a93df938690918c8FBBF5FADF871B7C
Content-Transfer-Encoding: base64
Content-type: text/html; charset=UTF-8
Content-Disposition: inline

PGh0bWw+PGJvZHk+PHA+QnJhZCw8YnI+PGJyPlRoYW5rcyBmb3IgdGhlIHJldmlldy4gUGxlYXNl
IHNlZSByZXBseSBiZWxsb3c6PGJyPjxicj48dHQ+JnF1b3Q7b3BlbmJtYyZxdW90OyAmbHQ7b3Bl
bmJtYy1ib3VuY2VzK3NobGl5aT1jbi5pYm0uY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IHdyb3Rl
IG9uIDAyLzI2LzIwMTYgMDg6NTI6MTAgUE06PGJyPjxicj4mZ3Q7IEZyb206IEJyYWQgQmlzaG9w
ICZsdDticmFkQGJ3Ym1haWwubmV0Jmd0OzwvdHQ+PGJyPjx0dD4mZ3Q7IFRvOiBPcGVuQk1DIFBh
dGNoZXMgJmx0O29wZW5ibWMtcGF0Y2hlc0BzdHdjeC54eXomZ3Q7PC90dD48YnI+PHR0PiZndDsg
Q2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvdHQ+PGJyPjx0dD4mZ3Q7IERhdGU6IDAyLzI2
LzIwMTYgMDg6NTMgUE08L3R0Pjxicj48dHQ+Jmd0OyBTdWJqZWN0OiBSZTogW1BBVENIIHNrZWxl
dG9uIHYzXSBza2VsZXRvbjogZml4ZWQgaGFyZC1jb2Rpbmcgb2YgPGJyPiZndDsgbWFzdGVyIE9D
QyBod21vbiBzeXNmcyBwYXRoIGZvciBQb3dlckNhcCBvYmplY3Q8L3R0Pjxicj48dHQ+Jmd0OyBT
ZW50IGJ5OiAmcXVvdDtvcGVuYm1jJnF1b3Q7ICZsdDtvcGVuYm1jLWJvdW5jZXMrc2hsaXlpPWNu
LmlibS5jb21AbGlzdHMub3psYWJzLm9yZyZndDs8L3R0Pjxicj48dHQ+Jmd0OyA8YnI+Jmd0OyA8
YnI+Jmd0OyAmZ3Q7ICsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDti
cmVhazxicj4mZ3Q7ICZndDsgKyAmbmJzcDsgJm5ic3A7ICZuYnNwO2Vsc2U6PGJyPiZndDsgJmd0
OyArICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyByYWlzZSBkYnVzLmV4Y2VwdGlvbnMuREJ1
c0V4Y2VwdGlvbig8YnI+Jmd0OyAmZ3Q7ICsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsmcXVvdDtDYW5ub3QgZmluZCB1c2VyX3Bvd2VyY2FwIGh3bW9uIGF0dHJpYnV0
ZSwgJnF1b3Q7Kzxicj4mZ3Q7ICZndDsgKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyZxdW90O2NoZWNrIG9jYyBzdGF0dXMuJnF1b3Q7LDxicj4mZ3Q7ICZndDsgKyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO25hbWU9J29yZy5mcmVlZGVz
a3RvcC5EQnVzLlB5dGhvbi5UeXBlRXJyb3LigJkpPGJyPiZndDsgPGJyPiZndDsgWW91IGRvbuKA
mXQgbmVlZCBhIHJldHVybiBzdGF0ZW1lbnQgYWZ0ZXIgdGhyb3dpbmcgYW4gZXhjZXB0aW9uLjxi
cj4mZ3Q7IDxicj4mZ3Q7ICZndDsgKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgcmV0dXJu
PGJyPjwvdHQ+PGJyPjx0dD5PSy4gV2lsbCBmaXguPC90dD48YnI+PGJyPjx0dD4mZ3Q7ICZndDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgdHJ5Ojxicj4mZ3Q7ICZndDsgLSAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgY21kX3N0ciA9ICZxdW90O2VjaG8gJnF1b3Q7K3N0cih2YWx1ZSkrJnF1b3Q7
ICZndDsgJnF1b3Q7K3NlbGYuc3lzZnNfYXR0cjxicj4mZ3Q7ICZndDsgKyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgY21kX3N0ciA9ICdlY2hvICcrc3RyKHZhbHVlKSsnICZndDsgJytzZWxm
LnN5c2ZzX2F0dHI8YnI+Jmd0OyAmZ3Q7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDtyZXQgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChjbWRfc3RyLCBzaGVsbD1UcnVlKTxicj4m
Z3Q7ICZndDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgZXhjZXB0IHN1YnByb2Nlc3MuQ2FsbGVkUHJv
Y2Vzc0Vycm9yIGFzIHBvd2VyZXhjOjxicj4mZ3Q7ICZndDsgLSAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgcHJpbnQgJnF1b3Q7U2V0IFBvd2VyQ2FwIEVycm9yJnF1b3Q7LCBwb3dlcmV4Yy5y
ZXR1cm5jb2RlLDxicj4mZ3Q7ICZndDsgLSAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgcG93
ZXJleGMub3V0cHV0PGJyPiZndDsgPGJyPiZndDsgV291bGQgYmUgbmljZSB0byBrbm93IGlmIHRo
aXMgd2FzIGEgcmVhbCBlcnJvciBvciBqdXN0IHVzZXItZXJyb3IuICZuYnNwOzxicj4mZ3Q7IFNp
bmNlIHRoaXMgaXMgZXh0ZXJuYWwsIHVzZXIgaW5wdXQsIGl0IHByb2JhYmx5IG1ha2VzIHNlbnNl
IHRvIGRvIDxicj4mZ3Q7IGFsbCBzb3J0cyBvZiB2YWxpZGF0aW9uIHVwIGZyb250IGJlZm9yZSBw
YXNzaW5nIGl0IGRvd24gbG93ZXIgaW4gdGhlPGJyPiZndDsgc3RhY2sgcmF0aGVyIHRoYW4ganVz
dCByZWx5aW5nIG9uIHRoZSBjYWxsZWQgcHJvY2VzcyB0byBkbyBpdC48YnI+Jmd0OyA8YnI+PC90
dD48YnI+PHR0PlRoZSByZWFzb24gSSBkaWQgbm90IHZhbGlkYXRlIHVzZXIgaW5wdXQgaGVyZSwg
aXMgdGhlIGtlcm5lbCBkcml2ZXIgaXRzZWxmIChhY3R1YWxseSBPQ0MgaXRzZWxmKSB3b3VsZCBy
ZXNwb25kIHdyb25nIHN0YXR1czwvdHQ+PGJyPjx0dD53aGVuIHNldHRpbmcgaW52YWxpZCB1c2Vy
IHBvd2VyIGNhcCwgZS5nOjwvdHQ+PGJyPjxicj48dHQ+cm9vdEBiYXJyZWxleWU6LyMgZWNobyA0
MDAwICZndDsgL3N5cy9jbGFzcy9od21vbi9od21vbjMvdXNlcl9wb3dlcmNhcDwvdHQ+PGJyPjx0
dD5vY2MtaTJjIDMtMDA1MDogU2V0IFVzZXIgUG93ZXJjYXA6IHdyb25nIHJldHVybiBzdGF0dXM6
IDEzPC90dD48YnI+PHR0Pm9jYy1pMmMgMy0wMDUwOiBpbnZhbGlkIHBvd2VyY2FwIHZhbHVlOiBm
YTA8L3R0Pjxicj48dHQ+LXNoOiBlY2hvOiB3cml0ZSBlcnJvcjogSW52YWxpZCBhcmd1bWVudDwv
dHQ+PGJyPjxicj48dHQ+QnV0IEkgYWdyZWUgdGhhdCB3ZSBuZWVkIHRvIHB1dCB0aGUgcG9saWN5
IGluIHVzZXIgc3BhY2UsIHJhdGhlciB0aGFuIHJlbHlpbmcgb24ga2VybmVsIGFuZCBPQ0MgdG8g
aGFuZGxlIGVycm9yLjwvdHQ+PGJyPjxicj48dHQ+SSB3aWxsIGFkZCB1c2VyIGlucHV0IHZhbGlk
YXRpb24gaGVyZS48L3R0Pjxicj48YnI+PHR0PlRoYW5rcyw8L3R0Pjxicj48dHQ+LVlpICZuYnNw
OzwvdHQ+PGJyPjxicj48QlI+DQo8L2JvZHk+PC9odG1sPg0K

--0__=8FBBF5FADF871B7C8f9e8a93df938690918c8FBBF5FADF871B7C--
