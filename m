Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.96; helo=esa7.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="uFCeP1ev"; 
 dkim-atps=neutral
Received: from esa7.dell-outbound.iphmx.com (esa7.dell-outbound.iphmx.com
 [68.232.153.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42W09X4fmLzF0RC;
 Thu, 11 Oct 2018 16:37:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1539236239; x=1570772239;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MGPVnWNpdu5xL3kVUMXH7cPP0iuziYponZgNFy06NFg=;
 b=uFCeP1evU+Vjg3pOE53FLvIw9LmVxGGI/vd8n6SRGoot9tx20gO8GVkX
 5TZismyeTfS6W2QVKSlNiAyTKEgCeVXiC+bKlfmpyf5hw3FsZquEM7ECN
 lH7wS/yk2KI57kmb6bDCm5mSIHJElDD0PVXKRHfIn25ADVNWsuubCAyhQ E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EGAAAM4L5bhyeV50NjGgEBAQEBAgE?=
 =?us-ascii?q?BAQEHAgEBAQGBUQUBAQEBCwGDaCgKg2uIFl+LV4INgz+TQYF6CwEBhGwCF4Q?=
 =?us-ascii?q?6ITQNDQEDAQECAQECAQECEAEBARUJCCkvgjYigmIBAQEBAgESEQQNRQULAgE?=
 =?us-ascii?q?IGAICHwcCAgJFEAEBBAENBQgagn+BegibYYlXAQEBbXsziWCBC4o5gheBEQG?=
 =?us-ascii?q?DEoQ4XYJqglcCgSgBhzSVMAYBApBMH5APlWsCBAIEBQIUgUI3gVdwgW6BToI?=
 =?us-ascii?q?mDgkRjgdvin0HCBeBCIEfAQE?=
X-IPAS-Result: =?us-ascii?q?A2EGAAAM4L5bhyeV50NjGgEBAQEBAgEBAQEHAgEBAQGBU?=
 =?us-ascii?q?QUBAQEBCwGDaCgKg2uIFl+LV4INgz+TQYF6CwEBhGwCF4Q6ITQNDQEDAQECA?=
 =?us-ascii?q?QECAQECEAEBARUJCCkvgjYigmIBAQEBAgESEQQNRQULAgEIGAICHwcCAgJFE?=
 =?us-ascii?q?AEBBAENBQgagn+BegibYYlXAQEBbXsziWCBC4o5gheBEQGDEoQ4XYJqglcCg?=
 =?us-ascii?q?SgBhzSVMAYBApBMH5APlWsCBAIEBQIUgUI3gVdwgW6BToImDgkRjgdvin0HC?=
 =?us-ascii?q?BeBCIEfAQE?=
Received: from mx0a-00154901.pphosted.com ([67.231.149.39])
 by esa7.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Oct 2018 00:37:16 -0500
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9B5pOLc114683; Thu, 11 Oct 2018 01:55:55 -0400
Received: from esa4.dell-outbound2.iphmx.com (esa4.dell-outbound2.iphmx.com
 [68.232.154.98])
 by mx0a-00154901.pphosted.com with ESMTP id 2n1yv6r9w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Oct 2018 01:55:55 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 11 Oct 2018 11:37:47 +0600
X-LoopCount0: from 10.166.135.93
X-IronPort-AV: E=Sophos;i="5.54,367,1534827600"; d="scan'208";a="263351722"
To: <sam@mendozajonas.com>, <joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <netdev@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <amithash@fb.com>, <christian@cmd.nu>,
 <vijaykhemka@fb.com>
Subject: RE: [PATCH net-next v5] net/ncsi: Extend NC-SI Netlink interface to
 allow user space to send NC-SI command
Thread-Topic: [PATCH net-next v5] net/ncsi: Extend NC-SI Netlink interface to
 allow user space to send NC-SI command
Thread-Index: AdRgwpcklsOmnJfcTI6m5yXrIVY+2wAfYUUAAAb7aeA=
Date: Thu, 11 Oct 2018 05:37:46 +0000
Message-ID: <62f859a161f64f7a8f11ba1a99369169@AUSX13MPS302.AMER.DELL.COM>
References: <245b32d9a3dd463f9334b9704b639ec4@AUSX13MPS302.AMER.DELL.COM>
 <e26c7aa664a2dad4f5bcf4efaa1b3eb655548b01.camel@mendozajonas.com>
In-Reply-To: <e26c7aa664a2dad4f5bcf4efaa1b3eb655548b01.camel@mendozajonas.com>
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
 definitions=2018-10-11_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810110053
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
X-List-Received-Date: Thu, 11 Oct 2018 05:37:54 -0000

DQo+IE9uIFdlZCwgMjAxOC0xMC0xMCBhdCAxODoxMSArMDAwMCwgSnVzdGluLkxlZTFARGVsbC5j
b20gd3JvdGU6DQo+IDxzbmlwPg0KPiA+ICsNCj4gPiArCWxlbiA9IG5sYV9sZW4oaW5mby0+YXR0
cnNbTkNTSV9BVFRSX0RBVEFdKTsNCj4gPiArCWlmIChsZW4gPCBzaXplb2Yoc3RydWN0IG5jc2lf
cGt0X2hkcikpIHsNCj4gPiArCQluZXRkZXZfaW5mbyhuZHAtPm5kZXYuZGV2LCAiTkNTSTogbm8g
Y29tbWFuZCB0byBzZW5kICV1XG4iLA0KPiA+ICsJCQkgICAgcGFja2FnZV9pZCk7DQo+ID4gKwkJ
cmV0ID0gLUVJTlZBTDsNCj4gPiArCQlnb3RvIG91dF9uZXRsaW5rOw0KPiA+ICsJfSBlbHNlIHsN
Cj4gPiArCQlkYXRhID0gKHVuc2lnbmVkIGNoYXIgKilubGFfZGF0YShpbmZvLT5hdHRyc1tOQ1NJ
X0FUVFJfREFUQV0pOw0KPiA+ICsJfQ0KPiANCj4gSSBvbmx5IGp1c3Qgbm90aWNlZCB0aGlzLCB0
aGUgY2FsbCB0byBubGFfbGVuKCkgY2FuIGNhdXNlIGEgbnVsbC1kZXJlZmVyZW5jZSBpZg0KPiB0
aGUgTkNTSV9BVFRSX0RBVEEgYXR0cmlidXRlIGlzbid0IHByZXNlbnQ7IHdlIG5lZWQgdG8gbWFr
ZSBzdXJlIGl0IGV4aXN0cw0KPiBiZWZvcmUgYWNjZXNzaW5nIGl0IGluIGluZm8tPmF0dHJzLg0K
PiANCj4gZWc6DQo+IA0KPiByb290QG96cm9tMi1ibWM6fiMgLi9uY3NpLW5ldGxpbmsgLWwgMiAt
cCAwIC1jIDAgLS1jbWQNCj4gWyAgIDgxLjM5OTgzN10gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMA0KPiBb
ICAgODEuNDA5MDkyXSBwZ2QgPSBkZGFhOWZhNg0KPiBbICAgODEuNDEzMDg0XSBbMDAwMDAwMDBd
ICpwZ2Q9OTcwMmM4MzEsICpwdGU9MDAwMDAwMDAsICpwcHRlPTAwMDAwMDAwDQo+IFsgICA4MS40
MjA3MjldIEludGVybmFsIGVycm9yOiBPb3BzOiAxNyBbIzFdIEFSTQ0KPiBbICAgODEuNDI2NDQ3
XSBDUFU6IDAgUElEOiAxMDI4IENvbW06IG5jc2ktbmV0bGluayBOb3QgdGFpbnRlZCA0LjE4Ljgt
c2FtbWotMDAxNDQtZ2JjMTI5ZjMxYmZhNSAjMTINCj4gLi4uDQo+IFsgICA4MS44NzQ0MzRdIEtl
cm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBGYXRhbCBleGNlcHRpb24NCj4gDQo+IENoZWVycywN
Cj4gU2FtDQoNCkdvb2QgY2F0Y2ghIEkgd2lsbCBhZGRyZXNzIHRoaXMgYW5kIGdlbmVyYXRlIHRo
ZSBuZXcgcGF0Y2guDQoNClRoYW5rcywNCkp1c3Rpbg0K
