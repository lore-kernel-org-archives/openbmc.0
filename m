Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=184.105.206.29; helo=smtpbg202.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="Oarhg0F3"; 
 dkim-atps=neutral
Received: from smtpbg202.qq.com (smtpbg202.qq.com [184.105.206.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44G1wt4c7wzDqDT
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 20:12:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1552036341; bh=lpWRzSRtLTDeotca93utWOFZ/ZmHgM807mRXPWf0kJs=;
 h=In-Reply-To:References:From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=Oarhg0F3YuIX8rfwXpXC5gnl+6EbWvf7zXyaGIVE4710d5cpoFBdaPwLAUmzXpcN6
 bidLFVacqlhGv2Q0w/5TYuIFd40G0v8P9qTgdeVUMlpLziVUgYMiaLsBJ2qaTifTM3
 D2BvKcBiVHpsI7zgoY/v5s0PV5B+hhKLEooLGIhQ=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <mailman.324.1552021133.24888.openbmc@lists.ozlabs.org>
References: <mailman.324.1552021133.24888.openbmc@lists.ozlabs.org>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1552036339t238847
From: "=?gb18030?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Can't login the bmc website on  release version  2.7.0-dev
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5C8231F3_0C4B7B68_67486AC3"
Content-Transfer-Encoding: 8Bit
Date: Fri, 8 Mar 2019 17:12:19 +0800
X-Priority: 3
Message-ID: <tencent_4567487C23414C1A5FC71137@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1858553710
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 08 Mar 2019 17:12:20 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
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
X-List-Received-Date: Fri, 08 Mar 2019 09:12:35 -0000

This is a multi-part message in MIME format.

------=_NextPart_5C8231F3_0C4B7B68_67486AC3
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KICAgIEJtYyBjYW4ndCBsb2dpbiAgd2Vic2l0ZSBvbiB2ZXJzaW9uICAgMi43
LjAtZGV2DQoNCg0KVGhlIHdlYiBicm93c2VyIGVycm9yIHdoZW4gYWNjZXNzaW5nIG15IGJt
YyB3ZWIgSVAgaHR0cHM6Ly8xOTIuMTY4Lnh4eC54eHggOg0KDQoNClRoaXMgc2l0ZSBjYW6h
r3QgYmUgcmVhY2hlZA0KaHR0cHM6Ly8xOTIuMTY4Lnh4eC54eHgvIGlzIHVucmVhY2hhYmxl
Lg0KRVJSX0FERFJFU1NfVU5SRUFDSEFCTEUNCg0KDQoNCnJvb3RAcm9tdWx1czp+IyBuZXRz
dGF0IC1uYXxncmVwIDQ0MyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCnRjcCAgICAgICAgMCAgICAgIDAgOjo6NDQzICAgICAgICAgICAgICAgICAgOjo6
KiAgICAgICAgICAgICAgICAgICAgTElTVEVOICAgDQoNCg0KDQpyb290QHJvbXVsdXM6fiNq
b3VybmFsY3RsIC11IGJtY3dlYg0KDQoNCi0tIExvZ3MgYmVnaW4gYXQgVGh1IDIwMTktMDMt
MDcgMDk6MTY6MjEgVVRDLCBlbmQgYXQgVGh1IDIwMTktMDMtMDcgMDk6MzA6NTUgVVRDLiAN
Ci0tDQpNYXIgMDcgMDk6MTY6Mzcgcm9tdWx1cyBzeXN0ZW1kWzFdOiBTdGFydGVkIFN0YXJ0
IGJtY3dlYiBzZXJ2ZXIuDQpNYXIgMDcgMDk6MTY6NDkgcm9tdWx1cyBibWN3ZWJbMTA4OF06
IEJ1aWxkaW5nIFNTTCBDb250ZXh0DQpNYXIgMDcgMDk6MTY6NDkgcm9tdWx1cyBibWN3ZWJb
MTA4OF06IENoZWNraW5nIGNlcnRzIGluIGZpbGUgc2VydmVyLnBlbQ0KTWFyIDA3IDA5OjE2
OjQ5IHJvbXVsdXMgYm1jd2ViWzEwODhdOiBFcnJvciBpbiB2ZXJpZnlpbmcgc2lnbmF0dXJl
LCByZWdlbmVyYXRpbmcNCk1hciAwNyAwOToxNjo0OSByb211bHVzIGJtY3dlYlsxMDg4XTog
R2VuZXJhdGluZyBuZXcga2V5cw0KTWFyIDA3IDA5OjE2OjQ5IHJvbXVsdXMgYm1jd2ViWzEw
ODhdOiBHZW5lcmF0aW5nIEVDIGtleQ0KTWFyIDA3IDA5OjE2OjUwIHJvbXVsdXMgYm1jd2Vi
WzEwODhdOiBHZW5lcmF0aW5nIHg1MDkgQ2VydGlmaWNhdGUNCg0KDQoNCldoeT8NCkJlc3Qs
DQpYaXV6aGk=

------=_NextPart_5C8231F3_0C4B7B68_67486AC3
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj48ZGl2PjxkaXY+SGkgQWxsLDwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBCbWMgY2Fu
J3QgbG9naW4mbmJzcDsgd2Vic2l0ZSBvbiB2ZXJzaW9uJm5ic3A7Jm5ic3A7Jm5ic3A7Mi43
LjAtZGV2PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgd2ViIGJyb3dzZXIgZXJyb3Ig
d2hlbiBhY2Nlc3NpbmcgbXkgYm1jIHdlYiBJUCBodHRwczovLzE5Mi4xNjgueHh4Lnh4eCA6
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PlRoaXMgc2l0ZSBjYW6hr3QgYmUgcmVh
Y2hlZDwvZGl2PjxkaXY+aHR0cHM6Ly8xOTIuMTY4Lnh4eC54eHgvIGlzIHVucmVhY2hhYmxl
LjwvZGl2PjxkaXY+RVJSX0FERFJFU1NfVU5SRUFDSEFCTEU8L2Rpdj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PnJvb3RAcm9tdWx1czp+IyBuZXRzdGF0IC1uYXxncmVwIDQ0MyZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOzwvZGl2PjxkaXY+dGNw
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDAmbmJzcDsgJm5ic3A7ICZuYnNwOyAwIDo6
OjQ0MyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IDo6OiombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgTElTVEVOJm5ic3A7ICZuYnNwOzwv
ZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+cm9vdEByb211bHVzOn4jam91cm5hbGN0
bCAtdSBibWN3ZWI8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0tIExvZ3MgYmVnaW4gYXQg
VGh1IDIwMTktMDMtMDcgMDk6MTY6MjEgVVRDLCBlbmQgYXQgVGh1IDIwMTktMDMtMDcgMDk6
MzA6NTUgVVRDLiZuYnNwOzwvZGl2PjxkaXY+LS08L2Rpdj48ZGl2Pk1hciAwNyAwOToxNjoz
NyByb211bHVzIHN5c3RlbWRbMV06IFN0YXJ0ZWQgU3RhcnQgYm1jd2ViIHNlcnZlci48L2Rp
dj48ZGl2Pk1hciAwNyAwOToxNjo0OSByb211bHVzIGJtY3dlYlsxMDg4XTogQnVpbGRpbmcg
U1NMIENvbnRleHQ8L2Rpdj48ZGl2Pk1hciAwNyAwOToxNjo0OSByb211bHVzIGJtY3dlYlsx
MDg4XTogQ2hlY2tpbmcgY2VydHMgaW4gZmlsZSBzZXJ2ZXIucGVtPC9kaXY+PGRpdj5NYXIg
MDcgMDk6MTY6NDkgcm9tdWx1cyBibWN3ZWJbMTA4OF06IEVycm9yIGluIHZlcmlmeWluZyBz
aWduYXR1cmUsIHJlZ2VuZXJhdGluZzwvZGl2PjxkaXY+TWFyIDA3IDA5OjE2OjQ5IHJvbXVs
dXMgYm1jd2ViWzEwODhdOiBHZW5lcmF0aW5nIG5ldyBrZXlzPC9kaXY+PGRpdj5NYXIgMDcg
MDk6MTY6NDkgcm9tdWx1cyBibWN3ZWJbMTA4OF06IEdlbmVyYXRpbmcgRUMga2V5PC9kaXY+
PGRpdj5NYXIgMDcgMDk6MTY6NTAgcm9tdWx1cyBibWN3ZWJbMTA4OF06IEdlbmVyYXRpbmcg
eDUwOSBDZXJ0aWZpY2F0ZTwvZGl2PjwvZGl2PjxkaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5X
aHk/PC9kaXY+PGRpdj5CZXN0LDwvZGl2PjxkaXY+WGl1emhpPC9kaXY+PGRpdj48YnI+PC9k
aXY+PC9kaXY+

------=_NextPart_5C8231F3_0C4B7B68_67486AC3--
