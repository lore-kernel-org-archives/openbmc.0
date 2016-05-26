Return-Path: <bjlinan@cn.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFblp1bQ5zDqR6
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 14:29:57 +1000 (AEST)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Thu, 26 May 2016 14:29:53 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 26 May 2016 14:29:52 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: bjlinan@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id CEEB82CE8079
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 14:28:51 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4Q4SOqc3604882
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 14:28:46 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4Q4S0hD023119
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 14:28:00 +1000
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4Q4RwCk022856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 14:27:59 +1000
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Wed, 25 May 2016 23:17:23 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 25 May 2016 23:17:23 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: bjlinan@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <bjlinan@cn.ibm.com>;
 Thu, 26 May 2016 03:17:21 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 26 May 2016 03:17:19 -0000
Received: from us1a3-mail166.a3.dal06.isc4sb.com ([10.146.71.123])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016052603171961-640244 ;
 Thu, 26 May 2016 03:17:19 +0000 
In-Reply-To: <57465E9E.2000502@ozlabs.org>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openpower-host-ipmi-oem v2] Fix endianness issue5
From: "Nan KX Li" <bjlinan@cn.ibm.com>
Date: Thu, 26 May 2016 11:17:19 +0800
References: <20160526020044.1213-1-openbmc-patches@stwcx.xyz>
 <20160526020044.1213-2-openbmc-patches@stwcx.xyz>
 <57465E9E.2000502@ozlabs.org>
MIME-Version: 1.0
X-KeepSent: A9F5704C:1FDCD278-48257FBF:000FD0F9;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 29007
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0011A2E948257FBF_="
x-cbid: 16052604-0021-0000-0000-000009BC7017
X-IBM-ISS-SpamDetectors: Score=0.429909; BY=0.078676; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.429909; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005302; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000167; SDB=6.00707434; UDB=6.00328367; UTC=2016-05-26
 03:17:20
x-cbparentid: 16052603-3202-0000-0000-000000756253
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFA9F5704C.1FDCD278-ON48257FBF.000FD0F9-48257FBF.00121101@notes.na.collabserv.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Thu, 26 May 2016 04:29:58 -0000


--=_alternative 0011A2E948257FBF_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="GB2312"

SGkgSmVyZW15LA0KVGhhbmtzLiANCihJIG1pc3NlZCBDeXJpbCdzIG1haWwuKSANCkknZCB1c2Ug
dGhlIGNvbnZlcnNpb24gZnVuY3Rpb24gdG8gY2hhbmdlIG15IGNvbW1pdC4NCg0KUmVnYXJkcywN
Cg0KV2lsbGlhbSBMaSAoIExpIE5hbiwgwO7pqiApIA0KIA0KDQpGaXJtd2FyZSBFbmdpbmVlcmlu
ZyBQcm9mZXNzaW9uYWwNCk9wZW5Qb3dlciBBRSBUZWFtIHwgSUJNIFN5c3RlbSAmIFRlY2hub2xv
Z3kgTGFiDQpNb2JpbGU6ICs4Ni0xODYtMTA4MSA2NjA1DQoNCkJlaWppbmcsIENoaW5hDQoNCg0K
DQpGcm9tOiAgIEplcmVteSBLZXJyIDxqa0BvemxhYnMub3JnPg0KVG86ICAgICBPcGVuQk1DIFBh
dGNoZXMgPG9wZW5ibWMtcGF0Y2hlc0BzdHdjeC54eXo+LCANCm9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZw0KQ2M6ICAgICBOYW4gS1ggTGkvQ2hpbmEvSUJNQElCTUNODQpEYXRlOiAgIDA1LzI2LzIw
MTYgMTA6MjcNClN1YmplY3Q6ICAgICAgICBSZTogW1BBVENIIG9wZW5wb3dlci1ob3N0LWlwbWkt
b2VtIHYyXSBGaXggZW5kaWFubmVzcyANCmlzc3VlNQ0KDQoNCg0KSGkgTmFuLA0KDQpZb3Ugc2Vl
bSB0byBoYXZlIGEgbWlub3IgdHlwbyBpbiB0aGUgY29tbWl0IHRpdGxlIHRoZXJlLg0KDQo+IC0g
ICAgICAgICAgICAgIC8vIFRPRE86IElzc3VlIDU6IFRoaXMgaXMgbm90IGVuZGlhbi1zYWZlLg0K
PiAtICAgICAgICAgICAgICBzaG9ydCAqcmVjaWQgID0gIChzaG9ydCopICZyZXFwdHItPnNlbHJl
Y29yZGxzOw0KPiAtICAgICAgICAgICAgICBzaG9ydCAqb2Zmc2V0ID0gIChzaG9ydCopICZyZXFw
dHItPm9mZnNldGxzOw0KPiArDQo+ICsgICAgICAgICAgICAgIHVuc2lnbmVkIHNob3J0IHJlY2lk
ICA9ICAoKHVuc2lnbmVkIHNob3J0KSANCnJlcXB0ci0+c2VscmVjb3JkbXMpIDw8IDggKyByZXFw
dHItPnNlbHJlY29yZGxzOw0KPiArICAgICAgICAgICAgICB1bnNpZ25lZCBzaG9ydCBvZmZzZXQg
PSAgKCh1bnNpZ25lZCBzaG9ydCkgDQpyZXFwdHItPm9mZnNldG1zKSA8PCA4ICsgcmVxcHRyLT5v
ZmZzZXRsczsNCg0KVGhhdCB3b24ndCBkbyB0aGUgZW5kaWFuIGNvbnZlcnNpb24gY29ycmVjdGx5
LiBDYW4geW91IHVzZSBvbmUgb2YgdGhlDQpleGlzdGluZyBlbmRpYW4gY29udmVyc2lvbiBmdW5j
dGlvbnM/DQoNClRoZSBsZTE2dG9oKCkgZnVuY3Rpb24gaXMgcHJvYmFibHkgd2hhdCB5b3Ugd2Fu
dCBoZXJlLCBmcm9tIGVuZGlhbi5oLg0KDQpBbHNvLCBiZSBjYXJlZnVsIG9mIHRoZSBjaGFuZ2Ug
ZnJvbSAnc2hvcnQnIHRvICd1bnNpZ25lZCBzaG9ydCcuDQoNClJlZ2FyZHMsDQoNCg0KSmVyZW15
DQoNCg0KDQoNCg==

--=_alternative 0011A2E948257FBF_=
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="GB2312"

PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPkhpIEplcmVteSw8L2ZvbnQ+PGJyPjxmb250
IHNpemU9MiBmYWNlPSJzYW5zLXNlcmlmIj5UaGFua3MuIDwvZm9udD48YnI+PGZvbnQgc2l6ZT0y
IGZhY2U9InNhbnMtc2VyaWYiPihJIG1pc3NlZCBDeXJpbCdzIG1haWwuKSA8L2ZvbnQ+PGJyPjxm
b250IHNpemU9MiBmYWNlPSJzYW5zLXNlcmlmIj5JJ2QgdXNlIHRoZSBjb252ZXJzaW9uIGZ1bmN0
aW9uIHRvIGNoYW5nZQ0KbXkgY29tbWl0LjwvZm9udD48YnI+PGJyPjxmb250IHNpemU9MyBjb2xv
cj0jNDI0MjgyIGZhY2U9IkNhbGlicmkiPlJlZ2FyZHMsPC9mb250Pjxicj48YnI+PGZvbnQgc2l6
ZT0zIGNvbG9yPSM0MjQyODIgZmFjZT0iQ2FsaWJyaSI+V2lsbGlhbSBMaSAoIExpIE5hbiwgwO7p
qg0KKSA8L2ZvbnQ+PGJyPjxmb250IHNpemU9MyBjb2xvcj0jNDI0MjgyIGZhY2U9IkNhbGlicmki
PiZuYnNwOyAmbmJzcDs8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPTMgY29sb3I9IzQyNDI4MiBm
YWNlPSJDYWxpYnJpIj5GaXJtd2FyZSBFbmdpbmVlcmluZyBQcm9mZXNzaW9uYWw8L2ZvbnQ+PGJy
Pjxmb250IHNpemU9MyBjb2xvcj0jNDI0MjgyIGZhY2U9IkNhbGlicmkiPk9wZW5Qb3dlciBBRSBU
ZWFtIHwgSUJNIFN5c3RlbQ0KJmFtcDsgVGVjaG5vbG9neSBMYWI8L2ZvbnQ+PGJyPjxmb250IHNp
emU9MyBjb2xvcj0jNDI0MjgyIGZhY2U9IkNhbGlicmkiPk1vYmlsZTogKzg2LTE4Ni0xMDgxIDY2
MDU8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPTMgY29sb3I9IzQyNDI4MiBmYWNlPSJDYWxpYnJp
Ij5CZWlqaW5nLCBDaGluYTwvZm9udD48YnI+PGJyPjxicj48YnI+PGZvbnQgc2l6ZT0xIGNvbG9y
PSM1ZjVmNWYgZmFjZT0ic2Fucy1zZXJpZiI+RnJvbTogJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZu
YnNwOzwvZm9udD48Zm9udCBzaXplPTEgZmFjZT0ic2Fucy1zZXJpZiI+SmVyZW15IEtlcnIgJmx0
O2prQG96bGFicy5vcmcmZ3Q7PC9mb250Pjxicj48Zm9udCBzaXplPTEgY29sb3I9IzVmNWY1ZiBm
YWNlPSJzYW5zLXNlcmlmIj5UbzogJm5ic3A7ICZuYnNwOyAmbmJzcDsNCiZuYnNwOzwvZm9udD48
Zm9udCBzaXplPTEgZmFjZT0ic2Fucy1zZXJpZiI+T3BlbkJNQyBQYXRjaGVzICZsdDtvcGVuYm1j
LXBhdGNoZXNAc3R3Y3gueHl6Jmd0OywNCm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvZm9udD48
YnI+PGZvbnQgc2l6ZT0xIGNvbG9yPSM1ZjVmNWYgZmFjZT0ic2Fucy1zZXJpZiI+Q2M6ICZuYnNw
OyAmbmJzcDsgJm5ic3A7DQombmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2Vy
aWYiPk5hbiBLWCBMaS9DaGluYS9JQk1ASUJNQ048L2ZvbnQ+PGJyPjxmb250IHNpemU9MSBjb2xv
cj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYiPkRhdGU6ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQom
bmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0xIGZhY2U9InNhbnMtc2VyaWYiPjA1LzI2LzIwMTYgMTA6
Mjc8L2ZvbnQ+PGJyPjxmb250IHNpemU9MSBjb2xvcj0jNWY1ZjVmIGZhY2U9InNhbnMtc2VyaWYi
PlN1YmplY3Q6ICZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDs8L2ZvbnQ+PGZvbnQgc2l6ZT0x
IGZhY2U9InNhbnMtc2VyaWYiPlJlOiBbUEFUQ0ggb3BlbnBvd2VyLWhvc3QtaXBtaS1vZW0NCnYy
XSBGaXggZW5kaWFubmVzcyBpc3N1ZTU8L2ZvbnQ+PGJyPjxociBub3NoYWRlPjxicj48YnI+PGJy
Pjx0dD48Zm9udCBzaXplPTI+SGkgTmFuLDxicj48YnI+WW91IHNlZW0gdG8gaGF2ZSBhIG1pbm9y
IHR5cG8gaW4gdGhlIGNvbW1pdCB0aXRsZSB0aGVyZS48YnI+PGJyPiZndDsgLSAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQovLyBUT0RPOiBJ
c3N1ZSA1OiBUaGlzIGlzIG5vdCBlbmRpYW4tc2FmZS48YnI+Jmd0OyAtICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsNCnNob3J0ICpyZWNpZCAm
bmJzcDs9ICZuYnNwOyhzaG9ydCopICZhbXA7cmVxcHRyLSZndDtzZWxyZWNvcmRsczs8YnI+Jmd0
OyAtICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsNCnNob3J0ICpvZmZzZXQgPSAmbmJzcDsoc2hvcnQqKSAmYW1wO3JlcXB0ci0mZ3Q7b2Zmc2V0
bHM7PGJyPiZndDsgKzxicj4mZ3Q7ICsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOw0KdW5zaWduZWQgc2hvcnQgcmVjaWQgJm5ic3A7PSAmbmJz
cDsoKHVuc2lnbmVkIHNob3J0KSByZXFwdHItJmd0O3NlbHJlY29yZG1zKQ0KJmx0OyZsdDsgOCAr
IHJlcXB0ci0mZ3Q7c2VscmVjb3JkbHM7PGJyPiZndDsgKyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7DQp1bnNpZ25lZCBzaG9ydCBvZmZzZXQg
PSAmbmJzcDsoKHVuc2lnbmVkIHNob3J0KSByZXFwdHItJmd0O29mZnNldG1zKSAmbHQ7Jmx0Ow0K
OCArIHJlcXB0ci0mZ3Q7b2Zmc2V0bHM7PGJyPjxicj5UaGF0IHdvbid0IGRvIHRoZSBlbmRpYW4g
Y29udmVyc2lvbiBjb3JyZWN0bHkuIENhbiB5b3UgdXNlIG9uZSBvZiB0aGU8YnI+ZXhpc3Rpbmcg
ZW5kaWFuIGNvbnZlcnNpb24gZnVuY3Rpb25zPzxicj48YnI+VGhlIGxlMTZ0b2goKSBmdW5jdGlv
biBpcyBwcm9iYWJseSB3aGF0IHlvdSB3YW50IGhlcmUsIGZyb20gZW5kaWFuLmguPGJyPjxicj5B
bHNvLCBiZSBjYXJlZnVsIG9mIHRoZSBjaGFuZ2UgZnJvbSAnc2hvcnQnIHRvICd1bnNpZ25lZCBz
aG9ydCcuPGJyPjxicj5SZWdhcmRzLDxicj48YnI+PGJyPkplcmVteTxicj48YnI+PC9mb250Pjwv
dHQ+PGJyPjxCUj4NCg==
--=_alternative 0011A2E948257FBF_=--
