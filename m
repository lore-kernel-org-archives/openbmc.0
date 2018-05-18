Return-Path: <Henbin-Chang@mic.com.tw>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=mic.com.tw
 (client-ip=220.130.36.7; helo=micmsefe02.mic.com.tw;
 envelope-from=henbin-chang@mic.com.tw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mic.com.tw
X-Greylist: delayed 6702 seconds by postgrey-1.36 at bilbo;
 Fri, 18 May 2018 15:31:55 AEST
Received: from MICMSEFE02.mic.com.tw (mail22.mic.com.tw [220.130.36.7])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40nGy32JWbzF29B
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 15:31:55 +1000 (AEST)
Received: from MICMSEFE02.mic.com.tw (localhost [127.0.0.2] (may be forged))
 by MICMSEFE02.mic.com.tw with ESMTP id w4I3eDWX033540
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:40:13 +0800 (GMT-8)
 (envelope-from Henbin-Chang@mic.com.tw)
Received: from MICEXVCAS01.mitacad.com (micexvcas01.mitacad.com [10.88.2.25])
 by MICMSEFE02.mic.com.tw with ESMTP id w4I3dtZs033306
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:39:55 +0800 (GMT-8)
 (envelope-from Henbin-Chang@mic.com.tw)
Received: from MICEXVMS02.mitacad.com ([10.88.2.28]) by
 MICEXVCAS01.mitacad.com ([10.88.2.25]) with mapi id 14.03.0210.002; Fri, 18
 May 2018 11:39:56 +0800
From: <Henbin-Chang@mic.com.tw>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.13] clk:aspeed: Fix reset bits for PCI/VGA and PECI
Thread-Topic: [PATCH linux dev-4.13] clk:aspeed: Fix reset bits for PCI/VGA
 and PECI
Thread-Index: AdPuWQDHE3Zy4MS9S6a4steCaVvQnA==
Date: Fri, 18 May 2018 03:39:55 +0000
Message-ID: <7B70FEB8C93F7E4EB9716251FA088E1DB17108EE@MICEXVMS02.mitacad.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.25.29]
Content-Type: multipart/alternative;
 boundary="_000_7B70FEB8C93F7E4EB9716251FA088E1DB17108EEMICEXVMS02mitac_"
MIME-Version: 1.0
X-MAIL: MICMSEFE02.mic.com.tw w4I3dtZs033306
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 05:31:56 -0000

--_000_7B70FEB8C93F7E4EB9716251FA088E1DB17108EEMICEXVMS02mitac_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFlLA0KDQpJIHRyaWVkIHRvIGFkZCB0aGUgcGF0Y2ggdG8gbXkgS2VybmVsIGNvZGUgYnV0
IHRoZSBQRUNJIGNvbnRyb2xsZXIgc3RpbGwgd2FzIHJlc2V0Lg0KDQpkZXZtZW0gMHgxZTZlMjAw
NCAzMg0KMHhGNzhGRTREOA0KDQpDb3VsZCB5b3UgaGVscCBjaGVjayBpZiBzb21ldGhpbmcgd3Jv
bmc/DQoNClRoYW5rcy4NCkhlbmJpbi4NCg==

--_000_7B70FEB8C93F7E4EB9716251FA088E1DB17108EEMICEXVMS02mitac_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTQgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
5paw57Sw5piO6auUOw0KCXBhbm9zZS0xOjIgMiA1IDAgMCAwIDAgMCAwIDA7fQ0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTrmlrDntLDmmI7pq5Q7DQoJcGFub3NlLTE6MiAyIDUgMCAwIDAgMCAw
IDAgMDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAx
NSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToiXEDmlrDntLDm
mI7pq5QiOw0KCXBhbm9zZS0xOjIgMiA1IDAgMCAwIDAgMCAwIDA7fQ0KLyogU3R5bGUgRGVmaW5p
dGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFy
Z2luOjBjbTsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsNCglm
b250LWZhbWlseToiQ2FsaWJyaSIsInNhbnMtc2VyaWYiO30NCmE6bGluaywgc3Bhbi5Nc29IeXBl
cmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNv
cmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQN
Cgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRp
b246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLCJzYW5zLXNlcmlmIjsNCgljb2xv
cjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1v
bmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIiwic2Fucy1zZXJpZiI7fQ0KLyogUGFnZSBEZWZp
bml0aW9ucyAqLw0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6NjEyLjBwdCA3OTIuMHB0Ow0K
CW1hcmdpbjo3Mi4wcHQgOTAuMHB0IDcyLjBwdCA5MC4wcHQ7fQ0KZGl2LldvcmRTZWN0aW9uMQ0K
CXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1s
Pg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1s
PjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpl
eHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVs
YXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJaSC1UVyIgbGlu
az0iYmx1ZSIgdmxpbms9InB1cnBsZSIgc3R5bGU9InRleHQtanVzdGlmeS10cmltOnB1bmN0dWF0
aW9uIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBsYW5nPSJFTi1VUyI+SGkgSmFlLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+SSB0cmllZCB0byBh
ZGQgdGhlIHBhdGNoIHRvIG15IEtlcm5lbCBjb2RlIGJ1dCB0aGUgUEVDSSBjb250cm9sbGVyIHN0
aWxsIHdhcyByZXNldC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPmRldm1lbSAweDFlNmUyMDA0IDMyPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4t
VVMiPjB4Rjc4RkU8Yj40PC9iPkQ4PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5Db3VsZCB5b3UgaGVscCBj
aGVjayBpZiBzb21ldGhpbmcgd3Jvbmc/PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5UaGFua3MuPG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMi
PkhlbmJpbi48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4N
Cg==

--_000_7B70FEB8C93F7E4EB9716251FA088E1DB17108EEMICEXVMS02mitac_--
