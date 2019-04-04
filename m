Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=184.105.206.84; helo=smtpproxy19.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Received: from smtpproxy19.qq.com (smtpproxy19.qq.com [184.105.206.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZWWm37mHzDq5h
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 16:21:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1554355262; bh=hVcHkrehujxPu/ON2qHsmhtOA4OlFUAnk8GHKAU3ieg=;
 h=In-Reply-To:References:From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=ci8rznxoVM6vezYgROa6cJE6JceV0aD+QlelSe8VF+ZAj/GbIljlWXXFj9WwOmc3H
 28r3erMI8AK414rjFCDhe85SWDcFEJ4kddNtAXgZmlZysngt9TqJpC5D1OZVqKbz7R
 nAJJV0uLv9lEcvQ4hXPcX7pMlev/kIei5uW4gsVM=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <tencent_77BC148C0E378EFD5F488CE6@qq.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1554355260t41661
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?ZWQ=?=" <ed@tanous.net>,
 "=?ISO-8859-1?B?RWRkaWUgSmFtZXM=?=" <eajames@linux.vnet.ibm.com>
Subject: ikvm refresh failed on host screen 1680x1050 resolution
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5CA5943C_0D4753C0_79BEDE1F"
Content-Transfer-Encoding: 8Bit
Date: Thu, 4 Apr 2019 13:21:00 +0800
X-Priority: 3
Message-ID: <tencent_5AE0AA7B303EB67F5ABF0001@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 2441483230
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 04 Apr 2019 13:21:01 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign2
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
X-List-Received-Date: Thu, 04 Apr 2019 05:21:33 -0000

This is a multi-part message in MIME format.

------=_NextPart_5CA5943C_0D4753C0_79BEDE1F
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLCBFZCwNCiAgICBUaGUgaWt2bSBzY3JlZW4gY2Fubid0IHJlZnJlc2ggb24gaWt2
bSB3ZWJ1aSBzY3JlZW4gd2hlbiBzZXR0aW5nIHRoZSBob3N0IHNjcmVlbiByZXNvbHV0aW9u
IHRvIDE2ODAqMTA1MCAuIEkgbXVzdCBjbGljayB0aGUgIlJlZnJlc2giIGJ1dHRvbiB0byBn
ZXQgdGhlIG5ldyBob3N0IHNjcmVlbi4gIE90aGVyIHJlc29sdXRpb25zIHdvcmtzIHZlcnkg
d2VsbC4gDQogIFBsZWFzZSBjaGVjayBpdC4NCkJlc3QsDQp4aXV6aGk=

------=_NextPart_5CA5943C_0D4753C0_79BEDE1F
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBKYWUsIEVkLDwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBUaGUgaWt2bSBzY3Jl
ZW4gY2Fubid0IHJlZnJlc2ggb24gaWt2bSB3ZWJ1aSBzY3JlZW4gd2hlbiBzZXR0aW5nIHRo
ZSBob3N0IHNjcmVlbiByZXNvbHV0aW9uIHRvIDE2ODAqMTA1MCAuIEkgbXVzdCBjbGljayB0
aGUgIlJlZnJlc2giIGJ1dHRvbiB0byBnZXQgdGhlIG5ldyBob3N0IHNjcmVlbi4mbmJzcDsg
T3RoZXIgcmVzb2x1dGlvbnMgd29ya3MgdmVyeSB3ZWxsLiZuYnNwOzwvZGl2PjxkaXY+Jm5i
c3A7IFBsZWFzZSBjaGVjayBpdC48L2Rpdj48ZGl2PkJlc3QsPC9kaXY+PGRpdj54aXV6aGkm
bmJzcDs8L2Rpdj4=

------=_NextPart_5CA5943C_0D4753C0_79BEDE1F--
