Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=184.105.206.84; helo=smtpproxy19.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="TQBxkXKf"; 
 dkim-atps=neutral
Received: from smtpproxy19.qq.com (smtpproxy19.qq.com [184.105.206.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fWTt3Qf0zDqLp
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 13:33:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1547605990; bh=6t+a0AAaefov2C0VIblytBLcjvm6bzOUhvwXw17L4NA=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=TQBxkXKfotlbo1u5O5kRrlCohD/mE0K/DSoHMYSZeNTCz3FqJMMnpN69bIaa5bX5E
 828It4uT8383toGc3Cx+iUIo3x/0e0A9UdZF4mga6yI0N/NRu3+j3WqCPBLJMU4tjP
 4yb1wD/JxjZZ2Oh7OSyso0XHNw+gfosB0R7x17yg=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1547605988t687746
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Why can't /dev/ipmi0 on host   be created stably 
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5C3E97E4_0AE1A890_1A2A41E7"
Content-Transfer-Encoding: 8Bit
Date: Wed, 16 Jan 2019 10:33:08 +0800
X-Priority: 3
Message-ID: <tencent_46EA11C87A97937C3140CAC7@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1526478312
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 16 Jan 2019 10:33:09 +0800 (CST)
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
X-List-Received-Date: Wed, 16 Jan 2019 02:33:27 -0000

This is a multi-part message in MIME format.

------=_NextPart_5C3E97E4_0AE1A890_1A2A41E7
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KICAgSSBhbSB0ZXN0aW5nIHRoZSBibWMgaXBtaS1rY3MgcmVsaWFiaWxpdHku
DQogICBUaGUgL2Rldi9pcG1pMCBvbiBob3N0IHdpbGwgbm90ICBiZSBhdmFpbGFibGUgIGlu
IHNldmVyYWwgY29uc2VjdXRpdmUgYm1jIHJlYm9vdCB0ZXN0LiAgVGhlIENBMyB2YWx1ZSBp
cyAweDA0IHdoaWNoIGNhbiBiZSBnb3QgYnkgdGhlIGNvbW1hbmQgIm1tIC1pbyBjYTMiIG9u
IGhvc3QgYmlvcyBzaGVsbCB3aGVuIGZhaWxpbmcgdG8gY3JlYXRlIHRoZSBpcG1pMCAgLg0K
VGhlIENBMyB2YWx1ZSAweDA0IG1lYW5zIHRoYXQgU01TX0FUTiBpcyBzZXQgdG8gMSwgd2hp
Y2ggbWVhczoNCiJTZXQgdG8gMSB3aGVuIHRoZSBCTUMgaGFzIG9uZSBvciBtb3JlIG1lc3Nh
Z2VzIGluIHRoZSBSZWNlaXZlIE1lc3NhZ2UgUXVldWUsIG9yIHdoZW4gYSB3YXRjaGRvZyB0
aW1lciBwcmUtdGltZW91dCwgb3IgZXZlbnQgbWVzc2FnZSBidWZmZXIgZnVsbCBjb25kaXRp
b24gZXhpc3RzIFsyXSAuIE9FTXMgbWF5IGFsc28gZWxlY3QgdG8gc2V0IHRoaXMgZmxhZyBp
cyBvbmUgb2YgdGhlIE9FTSAxLCAyLG9yIDMgZmxhZ3MgZnJvbSB0aGUgR2V0IE1lc3NhZ2Ug
RmxhZ3MgY29tbWFuZCBiZWNvbWVzIHNldC4gUi9PIFRoaXMgYml0IGlzIHJlbGF0ZWQgdG8g
aW5kaWNhdGluZyB3aGVuIHRoZSBCTUMgaXMgdGhlIHNvdXJjZSBvZiBhIHN5c3RlbSBpbnRl
cnJ1cHQuIFJlZmVyIHRvIHNlY3Rpb25zIDkuMTIsIEtDUyBDb21tdW5pY2F0aW9uIGFuZCBO
b24tY29tbXVuaWNhdGlvbiAsIDkuMTMsIFBoeXNpY2FsIEludGVycnVwdCBMaW5lIFNoYXJp
bmcsIGFuZCA5LjE0LCBBZGRpdGlvbmFsIFNwZWNpZmljYXRpb25zIGZvciB0aGUgS0NTIGlu
dGVyZmFjZSBmb3IgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBvbiB0aGUgdXNlIGFuZCByZXF1
aXJlbWVudHMgZm9yIHRoZSBTTVNfQVROIGJpdC4iDQoNCiBzZWUgdGhlIFRhYmxlIDktLCBL
Q1MgSW50ZXJmYWNlIFN0YXR1cyBSZWdpc3RlciBCaXRzIGluIHNlY3Rpb24gOS43IG9mICBJ
bnRlbGxpZ2VudCBQbGF0Zm9ybSBNYW5hZ2VCbWVudCBJbnRlcmZhY2UgU3BlY2lmaWNhdGlv
biAuDQogICBXaGF0ICBjYXVzZXMgdGhpcyBwcm9ibGVtPw0KIEJlc3QsDQpYaXV6aGk=

------=_NextPart_5C3E97E4_0AE1A890_1A2A41E7
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7SSBhbSB0ZXN0aW5nIHRoZSBi
bWMgaXBtaS1rY3MgcmVsaWFiaWxpdHkuPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7VGhlIC9k
ZXYvaXBtaTAgb24gaG9zdCB3aWxsIG5vdCZuYnNwOyBiZSBhdmFpbGFibGUmbmJzcDsgaW4g
c2V2ZXJhbCBjb25zZWN1dGl2ZSBibWMgcmVib290IHRlc3QuJm5ic3A7IFRoZSBDQTMgdmFs
dWUgaXMgMHgwNCB3aGljaCBjYW4gYmUgZ290IGJ5IHRoZSBjb21tYW5kICJtbSAtaW8gY2Ez
IiBvbiBob3N0IGJpb3Mgc2hlbGwgd2hlbiBmYWlsaW5nIHRvIGNyZWF0ZSB0aGUgaXBtaTAm
bmJzcDsgLjwvZGl2PjxkaXY+VGhlIENBMyB2YWx1ZSAweDA0IG1lYW5zIHRoYXQgU01TX0FU
TiBpcyBzZXQgdG8gMSwgd2hpY2ggbWVhczo8L2Rpdj48ZGl2PjxkaXY+IlNldCB0byAxIHdo
ZW4gdGhlIEJNQyBoYXMgb25lIG9yIG1vcmUgbWVzc2FnZXMgaW4gdGhlIFJlY2VpdmUgTWVz
c2FnZSBRdWV1ZSwgb3Igd2hlbiBhIHdhdGNoZG9nIHRpbWVyIHByZS10aW1lb3V0LCBvciBl
dmVudCBtZXNzYWdlIGJ1ZmZlciBmdWxsIGNvbmRpdGlvbiBleGlzdHMgWzJdIC4gT0VNcyBt
YXkgYWxzbyBlbGVjdCB0byBzZXQgdGhpcyBmbGFnIGlzIG9uZSBvZiB0aGUgT0VNIDEsIDIs
b3IgMyBmbGFncyBmcm9tIHRoZSBHZXQgTWVzc2FnZSBGbGFncyBjb21tYW5kIGJlY29tZXMg
c2V0LiBSL08gVGhpcyBiaXQgaXMgcmVsYXRlZCB0byBpbmRpY2F0aW5nIHdoZW4gdGhlIEJN
QyBpcyB0aGUgc291cmNlIG9mIGEgc3lzdGVtIGludGVycnVwdC4gUmVmZXIgdG8gc2VjdGlv
bnMgOS4xMiwgS0NTIENvbW11bmljYXRpb24gYW5kIE5vbi1jb21tdW5pY2F0aW9uICwgOS4x
MywgUGh5c2ljYWwgSW50ZXJydXB0IExpbmUgU2hhcmluZywgYW5kIDkuMTQsIEFkZGl0aW9u
YWwgU3BlY2lmaWNhdGlvbnMgZm9yIHRoZSBLQ1MgaW50ZXJmYWNlIGZvciBhZGRpdGlvbmFs
IGluZm9ybWF0aW9uIG9uIHRoZSB1c2UgYW5kIHJlcXVpcmVtZW50cyBmb3IgdGhlIFNNU19B
VE4gYml0LiI8L2Rpdj48L2Rpdj48ZGl2PiZuYnNwO3NlZSB0aGUgVGFibGUgOS0sIEtDUyBJ
bnRlcmZhY2UgU3RhdHVzIFJlZ2lzdGVyIEJpdHMgaW4gc2VjdGlvbiA5Ljcgb2YmbmJzcDsg
SW50ZWxsaWdlbnQgUGxhdGZvcm0gTWFuYWdlQm1lbnQgSW50ZXJmYWNlIFNwZWNpZmljYXRp
b24gLjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwO1doYXQmbmJzcDsgY2F1c2VzIHRoaXMgcHJv
YmxlbT88L2Rpdj48ZGl2PiZuYnNwO0Jlc3QsPC9kaXY+PGRpdj5YaXV6aGk8L2Rpdj4=

------=_NextPart_5C3E97E4_0AE1A890_1A2A41E7--
