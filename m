Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.220; helo=esa2.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="oaF20/+j"; 
 dkim-atps=neutral
X-Greylist: delayed 618 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Sep 2018 03:56:57 AEST
Received: from esa2.dell-outbound.iphmx.com (esa2.dell-outbound.iphmx.com
 [68.232.149.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LjDn0tv0zF37c;
 Fri, 28 Sep 2018 03:56:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1538071017; x=1569607017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eofVuyH+wk2wnjP+6fSPG/dEiZPf+y7EZX/YE2omn/M=;
 b=oaF20/+jKjmGXa2EiJnUKXFtDr+GP/BH9Leo63TeqnYzhorp5OCgDB/t
 RqHJyY0IzaE2r/XjFQNnklx2vEaH+LgE7sbihCWsDKj0+vf6wF0/GrDdM
 +ibhOrrAPUiKSOseQh7quFIMrEYsBIsRdvv+v/+sLdolRrpbVFQU33KT5 g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F9AADtFK1bhyeV50NbHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUYNzMoNqiBVfjWCDPZMVgXoLhGwCF4NxITQYAQMBAQIBAQIBAQIQAQE?=
 =?us-ascii?q?BCgsJCCkvgjUigmIBAQEBAgESERFFBQsCAQgaAiYCAgJFEAIEDg0agn+Begi?=
 =?us-ascii?q?ZPYlXAQEBbYEuig6BC4lzgheBEoJkLoVLgjSCVwKBKAGbaAYBApAmH4FHhFa?=
 =?us-ascii?q?JHZRzAgQCBAUCFIFCgg5wUIEegU+CMo4hjgGBHwEB?=
X-IPAS-Result: =?us-ascii?q?A2F9AADtFK1bhyeV50NbHAEBAQQBAQcEAQGBUYNzMoNqi?=
 =?us-ascii?q?BVfjWCDPZMVgXoLhGwCF4NxITQYAQMBAQIBAQIBAQIQAQEBCgsJCCkvgjUig?=
 =?us-ascii?q?mIBAQEBAgESERFFBQsCAQgaAiYCAgJFEAIEDg0agn+BegiZPYlXAQEBbYEui?=
 =?us-ascii?q?g6BC4lzgheBEoJkLoVLgjSCVwKBKAGbaAYBApAmH4FHhFaJHZRzAgQCBAUCF?=
 =?us-ascii?q?IFCgg5wUIEegU+CMo4hjgGBHwEB?=
Received: from mx0a-00154901.pphosted.com ([67.231.149.39])
 by esa2.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Sep 2018 12:46:36 -0500
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8RHc6dJ009723; Thu, 27 Sep 2018 13:46:36 -0400
Received: from esa1.dell-outbound2.iphmx.com (esa1.dell-outbound2.iphmx.com
 [68.232.153.201])
 by mx0a-00154901.pphosted.com with ESMTP id 2mnfyqwth4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 Sep 2018 13:46:35 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Sep 2018 23:46:30 +0600
X-LoopCount0: from 10.166.135.91
X-IronPort-AV: E=Sophos;i="5.54,311,1534827600"; d="scan'208";a="255866010"
To: <joel@jms.id.au>
CC: <amithash@fb.com>, <vijaykhemka@fb.com>, <sam@mendozajonas.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <sdasari@fb.com>, <netdev@vger.kernel.org>, <christian@cmd.nu>
Subject: RE: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Topic: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Index: AQHUVGQiHiJXHZ5Q3Euxbr6KTObLUqUAeN2AgAEqCQCAAKxhAIAA0qKAgAAQ0QD//8rz4IAAz1eAgACbTXA=
Date: Thu, 27 Sep 2018 17:46:32 +0000
Message-ID: <9553a4168a7e4134a3d6d7e2572bace0@AUSX13MPS306.AMER.DELL.COM>
References: <20180925000840.4111212-1-vijaykhemka@fb.com>
 <CACPK8XcDExGvCNBcFqOOP+1zQFFs6pMao+7rsZrJFqxPgcY+1Q@mail.gmail.com>
 <F570466E-4F6C-4AE1-91E0-0B4ECC193BE0@fb.com>
 <7cd8a49a057f1032e126b1e104fcf61e4956e06d.camel@mendozajonas.com>
 <FC2694E0-2F55-4089-8544-668243C6ECA2@fb.com>
 <MWHPR15MB14861AED8F8AF652CE5E62B3B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
 <5e9c8e3f8fd54845b15cd460efe9090d@AUSX13MPS306.AMER.DELL.COM>
 <CACPK8XfuXa19dGRqL+Ycdgh1LKmoQNuqGvtrrOgeNyvTZR01kQ@mail.gmail.com>
In-Reply-To: <CACPK8XfuXa19dGRqL+Ycdgh1LKmoQNuqGvtrrOgeNyvTZR01kQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-27_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=644 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809270164
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
X-List-Received-Date: Thu, 27 Sep 2018 17:56:59 -0000

DQo+IFRoYW5rcyBmb3IgdGhlIG92ZXJ2aWV3LiBXZSBsb29rIGZvcndhcmQgdG8geW91ciBwYXRj
aGVzOyBwbGVhc2UNCj4gaW5jbHVkZSB0aGUgc2FtZSBjYyBsaXN0IGFzIHRoaXMgc2VyaWVzLg0K
DQo+IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gaGF2ZSBzb21lIE9FTSBOQ1NJIGhhbmRpbmcg
cHVyZWx5IGluIHRoZQ0KPiBrZW5yZWwuIFRoaXMgd291bGQgYWxsb3cgZWcuIHRoZSBNQUMgYWRk
cmVzcyBvZiBhbiBpbnRlcmZhY2UgdG8gYmUNCj4gY29ycmVjdCBhdCBib290LCB3aXRob3V0IHJl
cXVpcmluZyB1c2Vyc3BhY2UgdG8gY29tZSB1cCBmaXJzdC4NCg0KPiBJIGhhdmUgYWxzbyBoZWFy
ZCBzdG9yaWVzIG9mIHRlbXBlcmF0dXJlIHNlbnNvcnMgb3ZlciBOQ1NJLiBUaG9zZQ0KPiB3b3Vs
ZCBtYWtlIHNlbnNlIHRvIGJlIGh3bW9uIGRyaXZlcnMsIHdoaWNoIGFnYWluIHdvdWxkIG1lYW4g
aGFuZGxpbmcNCj4gdGhlbSBpbiB0aGUga2VybmVsLg0KDQo+IEp1c3RpbiwgVmlqYXksIGNhbiB5
b3UgcGxlYXNlIGxpc3QgdGhlIGtub3duIE5DU0kgT0VNDQo+IGNvbW1hbmRzL2V4dGVuc2lvbnMg
dGhhdCB3ZSBwbGFuIG9uIGltcGxlbWVudGluZz8NCg0KSW4gb3VyIGltcGxlbWVudGF0aW9uLCBB
bGwgT0VNIGNvbW1hbmRzIGFyZSB0cmFuc3BhcmVudCB0byBLZXJuZWwuDQpXZSBkb24ndCBwbGFu
IHRvIGFkZCBhbnkgc3BlY2lmaWMgaGFuZGxlciBpbiB0aGUgS2VybmVsLiANCg0KVGhhbmtzLA0K
SnVzdGluDQo=
