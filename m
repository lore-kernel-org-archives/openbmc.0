Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=113.96.223.80; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="vsbv63VR"; 
 dkim-atps=neutral
X-Greylist: delayed 451 seconds by postgrey-1.36 at bilbo;
 Thu, 14 Mar 2019 13:29:34 AEDT
Received: from qq.com (unknown [113.96.223.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44KXjB2y9VzDqLH
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 13:29:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1552530078; bh=MYUmR98bUUdQpiBZHazFLR60/8ztmqyvUIXw5BVeMF4=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=vsbv63VRmi1wZPxeqRMw22r0ZY37W/T+NHdL1xpslOUizF6jJf2gZ9sncF+b5JVMU
 b+u+MlwfhCfUuZ1Wsnohgku0WsAg43AYDOBZzbYnpPxTpuDHkPBOfhXDXiIaRbyy04
 ARiVgqkHfnCcdhByhg6/phpSdmAguOhAlz6uIs3Y=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1552530077t806297
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?ZWQ=?=" <ed@tanous.net>,
 "=?ISO-8859-1?B?RWRkaWUgSmFtZXM=?=" <eajames@linux.vnet.ibm.com>
Subject: Does obmc-ikvm work with bmcweb?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5C89BA9D_0AE987D0_4977D892"
Content-Transfer-Encoding: 8Bit
Date: Thu, 14 Mar 2019 10:21:17 +0800
X-Priority: 3
Message-ID: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 14 Mar 2019 10:21:18 +0800 (CST)
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
X-List-Received-Date: Thu, 14 Mar 2019 02:29:39 -0000

This is a multi-part message in MIME format.

------=_NextPart_5C89BA9D_0AE987D0_4977D892
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLCBFZCwNCiAgICBJIHVwZGF0ZWQgdGhlIHNvdXJjZSB0byBvcGVuYm1jIGxhdGVz
dCB2ZXJzaW9uIHdoaWNoIHVzZXMgYm1jd2ViIGluc3RlYWQgb2YgcGhvc3Bob3ItcmVzdC4N
CiAgIEl0IHNlZW1lZCB0aGF0IGlrdm0gY2Fubm90IHdvcmsgb24gYm1jd2ViLg0KVGhlIHdl
YnNpdCBlcnJvcjoNCmFwcC5idW5kbGUuanM6NDMgUmVmdXNlZCB0byBjb25uZWN0IHRvICd3
c3M6Ly8xOTIuMTY4LjIwMC4xMzIva3ZtLzAnIGJlY2F1c2UgaXQgdmlvbGF0ZXMgdGhlIGZv
bGxvd2luZyBDb250ZW50IFNlY3VyaXR5IFBvbGljeSBkaXJlY3RpdmU6ICJkZWZhdWx0LXNy
YyAnc2VsZiciLiBOb3RlIHRoYXQgJ2Nvbm5lY3Qtc3JjJyB3YXMgbm90IGV4cGxpY2l0bHkg
c2V0LCBzbyAnZGVmYXVsdC1zcmMnIGlzIHVzZWQgYXMgYSBmYWxsYmFjay4NClRoZW4gSSBt
b2RpZnkgdGhlIGJtY3dlYiBmaWxlIGluY2x1ZGUvc2VjdXJpdHlfaGVhZGVyc19taWRkbGV3
YXJlLmhwcCBMNDA6DQogICAgICAgIC8vIFRoZSBLVk0gY3VycmVudGx5IG5lZWRzIHRvIGxv
YWQgaW1hZ2VzIGZyb20gYmFzZTY0IGVuY29kZWQgc3RyaW5ncy4NCiAgICAgICAgLy8gaW1n
LXNyYyAnc2VsZicgZGF0YTogaXMgdXNlZCB0byBhbGxvdyB0aGF0Lg0KICAgICAgICAvLyBo
dHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy8xODQ0Nzk3MC9jb250ZW50LXNl
Y3VyaXR5LXBvbGljeS1kYXRhLW5vdC13b3JraW5nLWZvci1iYXNlNjQtaW1hZ2VzLWluLWNo
cm9tZS0yOA0KICAgICAgICByZXMuYWRkSGVhZGVyKCJDb250ZW50LVNlY3VyaXR5LVBvbGlj
eSIsDQogICAgICAgICAgICAgICAgICAgICAgImRlZmF1bHQtc3JjICdzZWxmJzsgaW1nLXNy
YyAnc2VsZicgZGF0YToiKTsNCg0KdG86DQpwb2xpY3ktZGF0YS1ub3Qtd29ya2luZy1mb3It
YmFzZTY0LWltYWdlcy1pbi1jaHJvbWUtMjgNCiAgICAgICAgcmVzLmFkZEhlYWRlcigiQ29u
dGVudC1TZWN1cml0eS1Qb2xpY3kiLA0KICAgICAgICAgICAgICAgICAgICAgICJzY3JpcHQt
c3JjICdzZWxmJzsgaW1nLXNyYyAnc2VsZicgZGF0YToiKTsNCg0KDQoNClRoZSB3ZWJzaXRl
IGVycm86DQoiYXBwLmJ1bmRsZS5qczo0MyBXZWJTb2NrZXQgb24tZXJyb3IgZXZlbnQiDQoi
V2ViU29ja2V0IGNvbm5lY3Rpb24gdG8gJ3dzczovLzE5Mi4xNjguMjAwLjEzMi9rdm13cycg
ZmFpbGVkOiBXZWJTb2NrZXQgb3BlbmluZyBoYW5kc2hha2UgdGltZWQgb3V0Ig0KICBXaGF0
IGlzIHdyb25nIHdpdGggaXQ/DQogICBCZXN0LA0KWGl1emhp

------=_NextPart_5C89BA9D_0AE987D0_4977D892
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBKYWUsIEVkLDwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBJIHVwZGF0ZWQgdGhl
IHNvdXJjZSB0byBvcGVuYm1jIGxhdGVzdCB2ZXJzaW9uIHdoaWNoIHVzZXMgYm1jd2ViIGlu
c3RlYWQgb2YgcGhvc3Bob3ItcmVzdC48L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDtJdCBzZWVt
ZWQgdGhhdCBpa3ZtIGNhbm5vdCB3b3JrIG9uIGJtY3dlYi48L2Rpdj48ZGl2PlRoZSB3ZWJz
aXQgZXJyb3I6PC9kaXY+PGRpdj5hcHAuYnVuZGxlLmpzOjQzIFJlZnVzZWQgdG8gY29ubmVj
dCB0byAnd3NzOi8vMTkyLjE2OC4yMDAuMTMyL2t2bS8wJyBiZWNhdXNlIGl0IHZpb2xhdGVz
IHRoZSBmb2xsb3dpbmcgQ29udGVudCBTZWN1cml0eSBQb2xpY3kgZGlyZWN0aXZlOiAiZGVm
YXVsdC1zcmMgJ3NlbGYnIi4gTm90ZSB0aGF0ICdjb25uZWN0LXNyYycgd2FzIG5vdCBleHBs
aWNpdGx5IHNldCwgc28gJ2RlZmF1bHQtc3JjJyBpcyB1c2VkIGFzIGEgZmFsbGJhY2suPC9k
aXY+PGRpdj5UaGVuIEkgbW9kaWZ5IHRoZSBibWN3ZWIgZmlsZSBpbmNsdWRlL3NlY3VyaXR5
X2hlYWRlcnNfbWlkZGxld2FyZS5ocHAgTDQwOjwvZGl2PjxkaXY+PGRpdj4mbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgLy8gVGhlIEtWTSBjdXJyZW50bHkgbmVlZHMgdG8gbG9hZCBp
bWFnZXMgZnJvbSBiYXNlNjQgZW5jb2RlZCBzdHJpbmdzLjwvZGl2PjxkaXY+Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7IC8vIGltZy1zcmMgJ3NlbGYnIGRhdGE6IGlzIHVzZWQgdG8g
YWxsb3cgdGhhdC48L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAvLyBo
dHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy8xODQ0Nzk3MC9jb250ZW50LXNl
Y3VyaXR5LXBvbGljeS1kYXRhLW5vdC13b3JraW5nLWZvci1iYXNlNjQtaW1hZ2VzLWluLWNo
cm9tZS0yODwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHJlcy5hZGRI
ZWFkZXIoIkNvbnRlbnQtU2VjdXJpdHktUG9saWN5Iiw8L2Rpdj48ZGl2PiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgImRlZmF1bHQtc3JjICdzZWxmJzsgaW1nLXNyYyAnc2VsZicgZGF0YToi
KTs8L2Rpdj48L2Rpdj48ZGl2PnRvOjwvZGl2PjxkaXY+PGRpdj5wb2xpY3ktZGF0YS1ub3Qt
d29ya2luZy1mb3ItYmFzZTY0LWltYWdlcy1pbi1jaHJvbWUtMjg8L2Rpdj48ZGl2PiZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyByZXMuYWRkSGVhZGVyKCJDb250ZW50LVNlY3VyaXR5
LVBvbGljeSIsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICJzY3JpcHQtc3Jj
ICdzZWxmJzsgaW1nLXNyYyAnc2VsZicgZGF0YToiKTs8L2Rpdj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PlRoZSB3ZWJzaXRlIGVycm86PC9kaXY+PGRpdj4iYXBwLmJ1bmRsZS5qczo0
MyBXZWJTb2NrZXQgb24tZXJyb3IgZXZlbnQiPC9kaXY+PGRpdj4iV2ViU29ja2V0IGNvbm5l
Y3Rpb24gdG8gJ3dzczovLzE5Mi4xNjguMjAwLjEzMi9rdm13cycgZmFpbGVkOiBXZWJTb2Nr
ZXQgb3BlbmluZyBoYW5kc2hha2UgdGltZWQgb3V0IjwvZGl2PjxkaXY+Jm5ic3A7IFdoYXQg
aXMgd3Jvbmcgd2l0aCBpdD88L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDtCZXN0LDwvZGl2Pjxk
aXY+WGl1emhpPC9kaXY+PGRpdj48YnI+PC9kaXY+

------=_NextPart_5C89BA9D_0AE987D0_4977D892--
