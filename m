Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.30; helo=mtaout005-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout005-public.msg.strl.va.charter.net
 (mtaout005-public.msg.strl.va.charter.net [68.114.190.30])
 by lists.ozlabs.org (Postfix) with ESMTP id 428nrC4F5ZzF387
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 00:49:46 +1000 (AEST)
Received: from impout006 ([68.114.189.21]) by mtaout005.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180911144943.QGBS7356.mtaout005.msg.strl.va.charter.net@impout006>
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 09:49:43 -0500
Received: from [192.168.2.7] ([97.86.254.207]) by impout006 with charter.net
 id aEpj1y0034VFKzV01EpjeR; Tue, 11 Sep 2018 09:49:43 -0500
X-Authority-Analysis: v=2.2 cv=O5xJhF1W c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=8pif782wAAAA:8 a=B6KMzFptAAAA:20
 a=NEAV23lmAAAA:8 a=gv0Xer5SS4Fokm5QPNQA:9 a=QEXdDO2ut3YA:10
 a=cigG_iPxlxL6dHM9vUMA:9 a=F8xH0-cXI3bPqu-p:21 a=_W_S_7VecoQA:10
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
From: Joseph Reynolds <joseph-reynolds@charter.net>
Subject: Proposal: Security show & tell sessions
To: openbmc@lists.ozlabs.org
Message-ID: <8dba67ed-2489-4795-4f3a-c56abae5ed94@charter.net>
Date: Tue, 11 Sep 2018 09:49:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------DBEB9C14E7C48A92FEADF41C"
Content-Language: en-US
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
X-List-Received-Date: Tue, 11 Sep 2018 14:49:48 -0000

This is a multi-part message in MIME format.
--------------DBEB9C14E7C48A92FEADF41C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I am proposing a series of security show & tell sessions. Each week's 
session would be focused on a single area such as bmcweb, using LDAP, or 
secure code update and would bring together developers and security pros 
to talk about that area's security considerations. I hope to distill 
baseline documentation from each discussion.

The discussion I have in mind is structured for a security review.  It 
begins by explaining the area to a software engineer new to the area: 
what the area does, where the docs are, the main sets of interfaces, 
etc.  That helps to make implicit knowledge explicit.  Then we talk 
about interfaces,especially those that are interesting to security.  
That helps provide a shared context to discuss assets, threats, and 
security controls.  The discussion is over at the end of the hour; we 
can do followup sessions later.

The cost to development leaders is half a day (for prep, discussion, and 
review) for each area. The benefits to the project include a security 
review of each area, with documentation usable by new developers, to 
encourage peer review, and for security professionals as a starting 
point for more thorough analysis such as here: 
https://en.wikipedia.org/wiki/Information_security.

I plan to discuss details of the proposal in the OpenBMC Security 
Working Group meeting (agenda: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI). 
The meeting is Wednesday 2018-09-12 at 10 PDT (noon CDT). Access 
information for the meeting is here: 
https://github.com/openbmc/openbmc/wiki/Security-working-group.


--------------DBEB9C14E7C48A92FEADF41C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+DQogIDxoZWFkPg0KDQogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBl
IiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KICA8L2hlYWQ+DQogIDxi
b2R5IHRleHQ9IiMwMDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPg0KICAgIDx0dD5JIGFtIHBy
b3Bvc2luZyBhIHNlcmllcyBvZiBzZWN1cml0eSBzaG93ICZhbXA7IHRlbGwgc2Vzc2lvbnMu
wqANCiAgICAgIEVhY2ggd2VlaydzIHNlc3Npb24gd291bGQgYmUgZm9jdXNlZCBvbiBhIHNp
bmdsZSBhcmVhIHN1Y2ggYXMNCiAgICAgIGJtY3dlYiwgdXNpbmcgTERBUCwgb3Igc2VjdXJl
IGNvZGUgdXBkYXRlIGFuZCB3b3VsZCBicmluZyB0b2dldGhlcg0KICAgIDwvdHQ+PHR0Pjxz
cGFuIHN0eWxlPSJmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tn
cm91bmQtY29sb3I6IHRyYW5zcGFyZW50OyBmb250LXdlaWdodDogNDAwOyBmb250LXN0eWxl
OiBub3JtYWw7IGZvbnQtdmFyaWFudDogbm9ybWFsOyB0ZXh0LWRlY29yYXRpb246IG5vbmU7
IHZlcnRpY2FsLWFsaWduOiBiYXNlbGluZTsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyIgaWQ9
ImRvY3MtaW50ZXJuYWwtZ3VpZC0xMzNjNGEzNS03ZmZmLWFiYzctZjQ5ZC0wYWIxY2Y5MDgy
ZDUiPmRldmVsb3BlcnMgYW5kIHNlY3VyaXR5IHByb3MgdG8gdGFsayBhYm91dCB0aGF0IGFy
ZWEncyBzZWN1cml0eSBjb25zaWRlcmF0aW9ucy4gIEkgaG9wZSB0byBkaXN0aWxsIGJhc2Vs
aW5lIGRvY3VtZW50YXRpb24gZjwvc3Bhbj48L3R0Pjx0dD48c3BhbiBzdHlsZT0iZm9udC1z
aXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiB0cmFu
c3BhcmVudDsgZm9udC13ZWlnaHQ6IDQwMDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZh
cmlhbnQ6IG5vcm1hbDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyB2ZXJ0aWNhbC1hbGlnbjog
YmFzZWxpbmU7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiIGlkPSJkb2NzLWludGVybmFsLWd1
aWQtMTMzYzRhMzUtN2ZmZi1hYmM3LWY0OWQtMGFiMWNmOTA4MmQ1Ij5yb20gZWFjaCBkaXNj
dXNzaW9uPC9zcGFuPjwvdHQ+PHR0Pi48YnI+DQogICAgPC90dD48dHQ+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xv
cjogdHJhbnNwYXJlbnQ7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtc3R5bGU6IG5vcm1hbDsg
Zm9udC12YXJpYW50OiBub3JtYWw7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgdmVydGljYWwt
YWxpZ246IGJhc2VsaW5lOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IiBpZD0iZG9jcy1pbnRl
cm5hbC1ndWlkLTEzM2M0YTM1LTdmZmYtYWJjNy1mNDlkLTBhYjFjZjkwODJkNSI+PC9zcGFu
PjwvdHQ+PHR0Pjxicj4NCiAgICAgIFRoZSBkaXNjdXNzaW9uIEkgaGF2ZSBpbiBtaW5kIGlz
IHN0cnVjdHVyZWQgZm9yIGEgc2VjdXJpdHkNCiAgICAgIHJldmlldy7CoCBJdCBiZWdpbnMg
YnkgZXhwbGFpbmluZyB0aGUgYXJlYSB0byBhIHNvZnR3YXJlIGVuZ2luZWVyDQogICAgICBu
ZXcgdG8gdGhlIGFyZWE6IHdoYXQgdGhlIGFyZWEgZG9lcywgd2hlcmUgdGhlIGRvY3MgYXJl
LCB0aGUgbWFpbg0KICAgICAgc2V0cyBvZiBpbnRlcmZhY2VzLCBldGMuwqAgVGhhdCBoZWxw
cyB0byBtYWtlIGltcGxpY2l0IGtub3dsZWRnZQ0KICAgICAgZXhwbGljaXQuwqAgVGhlbiB3
ZSB0YWxrIGFib3V0IGludGVyZmFjZXMsZXNwZWNpYWxseSB0aG9zZSB0aGF0IGFyZQ0KICAg
ICAgaW50ZXJlc3RpbmcgdG8gc2VjdXJpdHkuwqAgVGhhdCBoZWxwcyBwcm92aWRlIGEgc2hh
cmVkIGNvbnRleHQgdG8NCiAgICAgIGRpc2N1c3MgYXNzZXRzLCB0aHJlYXRzLCBhbmQgc2Vj
dXJpdHkgY29udHJvbHMuwqAgVGhlIGRpc2N1c3Npb24gaXMNCiAgICAgIG92ZXIgYXQgdGhl
IGVuZCBvZiB0aGUgaG91cjsgd2UgY2FuIGRvIGZvbGxvd3VwIHNlc3Npb25zIGxhdGVyLjxi
cj4NCiAgICAgIDxicj4NCiAgICAgIFRoZSBjb3N0IHRvIGRldmVsb3BtZW50IGxlYWRlcnMg
aXMgaGFsZiBhIGRheSAoZm9yIHByZXAsDQogICAgICBkaXNjdXNzaW9uLCBhbmQgcmV2aWV3
KSA8L3R0Pjx0dD48dHQ+Zm9yIGVhY2ggYXJlYTwvdHQ+LsKgIDwvdHQ+PHR0PjxzcGFuIHN0
eWxlPSJmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGJhY2tncm91bmQt
Y29sb3I6IHRyYW5zcGFyZW50OyBmb250LXdlaWdodDogNDAwOyBmb250LXN0eWxlOiBub3Jt
YWw7IGZvbnQtdmFyaWFudDogbm9ybWFsOyB0ZXh0LWRlY29yYXRpb246IG5vbmU7IHZlcnRp
Y2FsLWFsaWduOiBiYXNlbGluZTsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyIgaWQ9ImRvY3Mt
aW50ZXJuYWwtZ3VpZC0xMzNjNGEzNS03ZmZmLWFiYzctZjQ5ZC0wYWIxY2Y5MDgyZDUiPlRo
ZSBiZW5lZml0cyB0byB0aGUgcHJvamVjdCBpbmNsdWRlIGEgc2VjdXJpdHkgcmV2aWV3IG9m
IGVhY2ggYXJlYSwgd2l0aCBkb2N1bWVudGF0aW9uIHVzYWJsZSBieSBuZXcgZGV2ZWxvcGVy
cywgdG8gZW5jb3VyYWdlIHBlZXIgcmV2aWV3LCBhbmQgZm9yIHNlY3VyaXR5IHByb2Zlc3Np
b25hbHMgYXMgYSBzdGFydGluZyBwb2ludCBmb3IgbW9yZSB0aG9yb3VnaCBhbmFseXNpcyBz
dWNoIGFzIGhlcmU6IDwvc3Bhbj48L3R0Pjx0dD48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAx
MXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNvbG9yOiB0cmFuc3BhcmVu
dDsgZm9udC13ZWlnaHQ6IDQwMDsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQ6
IG5vcm1hbDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyB2ZXJ0aWNhbC1hbGlnbjogYmFzZWxp
bmU7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiIGlkPSJkb2NzLWludGVybmFsLWd1aWQtMTMz
YzRhMzUtN2ZmZi1hYmM3LWY0OWQtMGFiMWNmOTA4MmQ1Ij48YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9JbmZv
cm1hdGlvbl9zZWN1cml0eSI+aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvSW5mb3Jt
YXRpb25fc2VjdXJpdHk8L2E+Ljwvc3Bhbj48L3R0Pjx0dD48YnI+DQogICAgPC90dD48dHQ+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFj
a2dyb3VuZC1jb2xvcjogdHJhbnNwYXJlbnQ7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtc3R5
bGU6IG5vcm1hbDsgZm9udC12YXJpYW50OiBub3JtYWw7IHRleHQtZGVjb3JhdGlvbjogbm9u
ZTsgdmVydGljYWwtYWxpZ246IGJhc2VsaW5lOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IiBp
ZD0iZG9jcy1pbnRlcm5hbC1ndWlkLTEzM2M0YTM1LTdmZmYtYWJjNy1mNDlkLTBhYjFjZjkw
ODJkNSI+PC9zcGFuPjwvdHQ+PHR0Pjxicj4NCiAgICA8L3R0Pjx0dD5JIHBsYW4gdG8gZGlz
Y3VzcyBkZXRhaWxzIG9mIHRoZSBwcm9wb3NhbCBpbiB0aGUgPC90dD48dHQ+PHR0Pk9wZW5C
TUMNCiAgICAgICAgU2VjdXJpdHkgV29ya2luZyBHcm91cCBtZWV0aW5nICg8L3R0PmFnZW5k
YToNCjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZG9j
cy5nb29nbGUuY29tL2RvY3VtZW50L2QvMWI3eDlCYXhzZmN1a1FEcWJ2WnNVMmVoTXE0eG9K
UlF2THh4c0RVV21BT0kiPmh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3VtZW50L2QvMWI3
eDlCYXhzZmN1a1FEcWJ2WnNVMmVoTXE0eG9KUlF2THh4c0RVV21BT0k8L2E+KS7CoA0KICAg
IDwvdHQ+PHR0PlRoZSBtZWV0aW5nIGlzIFdlZG5lc2RheSAyMDE4LTA5LTEyIGF0IDEwIFBE
VCAobm9vbiBDRFQpLsKgDQogICAgPC90dD48dHQ+QWNjZXNzIGluZm9ybWF0aW9uIGZvciB0
aGUgbWVldGluZyBpcyBoZXJlOg0KICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVl
dGV4dCIgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL1Nl
Y3VyaXR5LXdvcmtpbmctZ3JvdXAiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5i
bWMvd2lraS9TZWN1cml0eS13b3JraW5nLWdyb3VwPC9hPjwvdHQ+PHR0Pi48YnI+DQogICAg
ICA8YnI+DQogICAgPC90dD48dHQ+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTFwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogdHJhbnNwYXJlbnQ7IGZvbnQt
d2VpZ2h0OiA0MDA7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50OiBub3JtYWw7
IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgdmVydGljYWwtYWxpZ246IGJhc2VsaW5lOyB3aGl0
ZS1zcGFjZTogcHJlLXdyYXA7IiBpZD0iZG9jcy1pbnRlcm5hbC1ndWlkLTEzM2M0YTM1LTdm
ZmYtYWJjNy1mNDlkLTBhYjFjZjkwODJkNSI+PC9zcGFuPjwvdHQ+DQogIDwvYm9keT4NCjwv
aHRtbD4NCg==
--------------DBEB9C14E7C48A92FEADF41C--
