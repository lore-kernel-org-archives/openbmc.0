Return-Path: <wen.yang99@zte.com.cn>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=202.103.147.172; helo=mxct.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
Received: from mxct.zte.com.cn (out1.zte.com.cn [202.103.147.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CzmW46b4zDqGM
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 12:28:07 +1100 (AEDT)
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
 by Forcepoint Email with ESMTPS id 6A5DDF726F468D4A253C;
 Tue,  5 Mar 2019 09:28:02 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
 by mse01.zte.com.cn with SMTP id x251RtkC037230;
 Tue, 5 Mar 2019 09:27:55 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from mapi (kjyxapp05[null]) by mapi (Zmail) with MAPI id mid14;
 Tue, 5 Mar 2019 09:27:55 +0800 (CST)
Date: Tue, 5 Mar 2019 09:27:55 +0800 (CST)
X-Zmail-TransId: 2b075c7dd09bbcf7ae7f
X-Mailer: Zmail v1.0
Message-ID: <201903050927558424426@zte.com.cn>
In-Reply-To: <20190304144606.GA7466@e107155-lin>
References: 1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn,
 20190304144606.GA7466@e107155-lin
Mime-Version: 1.0
From: <wen.yang99@zte.com.cn>
To: <sudeep.holla@arm.com>
Cc: <liviu.dudau@arm.com>, <lorenzo.pieralisi@arm.com>,
 <linux@armlinux.org.uk>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kgene@kernel.org>, <krzk@kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <michal.simek@xilinx.com>,
 <afaerber@suse.de>, <manivannan.sadhasivam@linaro.org>,
 <dinguyen@kernel.org>, <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>, <f.fainelli@gmail.com>,
 <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <linus.walleij@linaro.org>,
 <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <venture@google.com>,
 <yuenn@google.com>, <brendanhiggins@google.com>,
 <openbmc@lists.ozlabs.org>, <xuwei5@hisilicon.com>,
 <maxime.ripard@bootlin.com>, <wens@csie.org>,
 <catalin.marinas@arm.com>, <will.deacon@arm.com>, <horms@verge.net.au>,
 <magnus.damm@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <fabio.estevam@nxp.com>, <linux-imx@nxp.com>,
 <wang.yi59@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxMi8xNV0gQVJNOiB2ZXhwcmVzczogZml4IGEgbGVha2VkIHJlZmVyZW5jZSBieWFkZGluZ21pc3Npbmcgb2Zfbm9kZV9wdXQ=?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn x251RtkC037230
X-Mailman-Approved-At: Thu, 07 Mar 2019 12:31:42 +1100
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
X-List-Received-Date: Tue, 05 Mar 2019 01:28:12 -0000



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PiA+IFRoZSBjYWxsIHRvIG9mX2dldF9uZXh0X2NoaWxkIHJldHVybnMgYSBub2RlIHBvaW50ZXIg
d2l0aCByZWZjb3VudAo+ID4gaW5jcmVtZW50ZWQgdGh1cyBpdCBtdXN0IGJlIGV4cGxpY2l0bHkg
ZGVjcmVtZW50ZWQgYWZ0ZXIgdGhlIGxhc3QKPiA+IHVzYWdlLgo+ID4KPiA+IERldGVjdGVkIGJ5
IGNvY2NpbmVsbGUgd2l0aCB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOgo+ID4gLi9hcmNoL2FybS9t
YWNoLXZleHByZXNzL2Rjc2NiLmM6MTUwOjItODogRVJST1I6IG1pc3Npbmcgb2Zfbm9kZV9wdXQ7
IGFjcXVpcmVkIGEgbm9kZSBwb2ludGVyIHdpdGggcmVmY291bnQgaW5jcmVtZW50ZWQgb24gbGlu
ZSAxNDUsIGJ1dCB3aXRob3V0IGEgY29ycmVzcG9uZGluZyBvYmplY3QgcmVsZWFzZSB3aXRoaW4g
dGhpcyBmdW5jdGlvbi4KPiA+IC4vYXJjaC9hcm0vbWFjaC12ZXhwcmVzcy9kY3NjYi5jOjE2MDoy
LTg6IEVSUk9SOiBtaXNzaW5nIG9mX25vZGVfcHV0OyBhY3F1aXJlZCBhIG5vZGUgcG9pbnRlciB3
aXRoIHJlZmNvdW50IGluY3JlbWVudGVkIG9uIGxpbmUgMTQ1LCBidXQgd2l0aG91dCBhIGNvcnJl
c3BvbmRpbmcgb2JqZWN0IHJlbGVhc2Ugd2l0aGluIHRoaXMgZnVuY3Rpb24uCj4gPiAuL2FyY2gv
YXJtL21hY2gtdmV4cHJlc3MvZGNzY2IuYzoxNzE6MS03OiBFUlJPUjogbWlzc2luZyBvZl9ub2Rl
X3B1dDsgYWNxdWlyZWQgYSBub2RlIHBvaW50ZXIgd2l0aCByZWZjb3VudCBpbmNyZW1lbnRlZCBv
biBsaW5lIDE0NSwgYnV0IHdpdGhvdXQgYSBjb3JyZXNwb25kaW5nIG9iamVjdCByZWxlYXNlIHdp
dGhpbiB0aGlzIGZ1bmN0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlbiBZYW5nIDx3ZW4u
eWFuZzk5QHp0ZS5jb20uY24+Cj4gPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5j
b20+Cj4gPiBDYzogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiAKPiBMb29r
cyBnb29kLCBhc3N1bWluZyB5b3Ugd2FudCB0byB0YWtlIHRoaXMgYXMgYSBzZXJpZXMuIFBsZWFz
ZSBzaG91dCBpZgo+IHlvdSB3YW50IHVzIHRvIHRha2UgdGhpcy4KPiAKPiBBY2tlZC1ieTogU3Vk
ZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KClRoYW5rIHlvdSB2ZXJ5IG11Y2gsIHdl
IHdpbGwgc3VibWl0IGEgdjIgc2VyaWVzIHBhdGNoIHRoYXQgd2lsbCBmaXggYSB0eXBvIHNvb246
CmFkZCBhIG1pc3Npbmcgc3BhY2UgYmV0d2VlbiAiYWRkaW5nIiBhbmQgIm1pc3NpbmciCgotLQpS
ZWdhcmRzLApXZW4=


--=====_003_next=====--

--=====_001_next=====--
