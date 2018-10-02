Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.218; helo=esa8.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="LS5aHaVV"; 
 dkim-atps=neutral
Received: from esa8.dell-outbound.iphmx.com (esa8.dell-outbound.iphmx.com
 [68.232.149.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PmYX0vWJzF39y;
 Wed,  3 Oct 2018 03:37:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1538501824; x=1570037824;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R+qLfZ4+YkgLE17DUGwVl7/NEo/BZuXa08ov/UoQ7b8=;
 b=LS5aHaVVvQQ/3bcqfMVqGf8FuSdG65ZyttW3pFoWYg/esV7OCiUN+d7Y
 cOKLfVukvoTq2PNbwyy/RevlYDBdUw39Yra3KUBJoKqkEs7H8NkNi5bAG
 u9T+XbPpGwuVFMp4Zd+1fA+QFsYOqHXAORhPlGE5HW3qIb5+dR7ZriB2Q c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETAABNq7NbhyWd50NaGgEBAQEBAgE?=
 =?us-ascii?q?BAQEHAgEBAQGBUYJ0fygKg2qIFV+LPDuBUoM9hAaPGYF6CyMLhD4CF4N4ITQ?=
 =?us-ascii?q?YAQMBAQIBAQIBAQIQAQEBFQkIKSMMgjUiEUtrAQEBAQEBIwINYwEBAQECARI?=
 =?us-ascii?q?RBA1FBQsCAQgYAgIfBwICAkUQAQEEAQkEBQgagn8BgXkID5x8iVcBAQFtezO?=
 =?us-ascii?q?EKwGFa4ELiVImgheBEYJlLod/glcCgSgBkTmKWgYBAoZIgw2GWx+CFI1GjBC?=
 =?us-ascii?q?JCQIEAgQFAhSBQjeBV3CBboFOCYIqGohJhT5vjTWBHwEB?=
X-IPAS-Result: =?us-ascii?q?A2ETAABNq7NbhyWd50NaGgEBAQEBAgEBAQEHAgEBAQGBU?=
 =?us-ascii?q?YJ0fygKg2qIFV+LPDuBUoM9hAaPGYF6CyMLhD4CF4N4ITQYAQMBAQIBAQIBA?=
 =?us-ascii?q?QIQAQEBFQkIKSMMgjUiEUtrAQEBAQEBIwINYwEBAQECARIRBA1FBQsCAQgYA?=
 =?us-ascii?q?gIfBwICAkUQAQEEAQkEBQgagn8BgXkID5x8iVcBAQFtezOEKwGFa4ELiVImg?=
 =?us-ascii?q?heBEYJlLod/glcCgSgBkTmKWgYBAoZIgw2GWx+CFI1GjBCJCQIEAgQFAhSBQ?=
 =?us-ascii?q?jeBV3CBboFOCYIqGohJhT5vjTWBHwEB?=
Received: from mx0b-00154901.pphosted.com ([67.231.157.37])
 by esa8.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Oct 2018 12:37:00 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w92HXPIt027966; Tue, 2 Oct 2018 13:36:59 -0400
Received: from esa2.dell-outbound2.iphmx.com (esa2.dell-outbound2.iphmx.com
 [68.232.153.202])
 by mx0b-00154901.pphosted.com with ESMTP id 2mv8gxtaxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Oct 2018 13:36:59 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 02 Oct 2018 23:36:52 +0600
X-LoopCount0: from 10.166.135.91
X-IronPort-AV: E=Sophos;i="5.54,332,1534827600"; d="scan'208";a="258452465"
To: <sam@mendozajonas.com>, <joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <netdev@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <amithash@fb.com>, <christian@cmd.nu>,
 <vijaykhemka@fb.com>
Subject: RE: [PATCH net v2] net/ncsi: Extend NC-SI Netlink interface to allow
 user space to send NC-SI command
Thread-Topic: [PATCH net v2] net/ncsi: Extend NC-SI Netlink interface to allow
 user space to send NC-SI command
Thread-Index: AdRXVsR4fRwK5ubSQ2OHaqPrycIEsgC4YNWAAA9pMoA=
Date: Tue, 2 Oct 2018 17:36:55 +0000
Message-ID: <89f75d6666e7489ab011cb71090646e5@AUSX13MPS306.AMER.DELL.COM>
References: <58fff61ffd8d4038b59f32b696e76bbc@AUSX13MPS306.AMER.DELL.COM>
 <18e571bb7c5879a12754b1df20f51fd87ea48712.camel@mendozajonas.com>
In-Reply-To: <18e571bb7c5879a12754b1df20f51fd87ea48712.camel@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-02_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810020168
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
X-List-Received-Date: Tue, 02 Oct 2018 17:37:06 -0000

SGkgU2FtLA0KDQpTdXJlLCBJIHdpbGwgZ2VuZXJhdGUgdjMgYWZ0ZXIgVmlqYXkncyBwYXRjaCBp
cyBhcHByb3ZlZC4NCg0KVGhhbmtzLA0KSnVzdGluDQoNCg0KPiBPbiBGcmksIDIwMTgtMDktMjgg
YXQgMTg6MTUgKzAwMDAsIEp1c3Rpbi5MZWUxQERlbGwuY29tIHdyb3RlOg0KPiA+IFRoZSBuZXcg
Y29tbWFuZCAoTkNTSV9DTURfU0VORF9DTUQpIGlzIGFkZGVkIHRvIGFsbG93IHVzZXIgc3BhY2Ug
YXBwbGljYXRpb24gDQo+ID4gdG8gc2VuZCBOQy1TSSBjb21tYW5kIHRvIHRoZSBuZXR3b3JrIGNh
cmQuDQo+ID4gQWxzbywgYWRkIGEgbmV3IGF0dHJpYnV0ZSAoTkNTSV9BVFRSX0RBVEEpIGZvciB0
cmFuc2ZlcnJpbmcgcmVxdWVzdCBhbmQgcmVzcG9uc2UuDQo+ID4gDQo+ID4gVGhlIHdvcmsgZmxv
dyBpcyBhcyBiZWxvdy4gDQo+ID4gDQo+ID4gUmVxdWVzdDoNCj4gPiBVc2VyIHNwYWNlIGFwcGxp
Y2F0aW9uIC0+IE5ldGxpbmsgaW50ZXJmYWNlIChtc2cpDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG5ldyBOZXRsaW5rIGhhbmRsZXIgLSBuY3Np
X3NlbmRfY21kX25sKCkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLT4gbmNzaV94bWl0X2NtZCgpDQo+ID4gUmVzcG9uc2U6DQo+ID4gUmVzcG9uc2Ug
cmVjZWl2ZWQgLSBuY3NpX3Jjdl9yc3AoKSAtPiBpbnRlcm5hbCByZXNwb25zZSBoYW5kbGVyIC0g
bmNzaV9yc3BfaGFuZGxlcl94eHgoKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG5jc2lfcnNwX2hh
bmRsZXJfbmV0bGluaygpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbmNzaV9zZW5kX25ldGxpbmtf
cnNwICgpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gTmV0bGluayBpbnRlcmZhY2UgKG1zZykNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtPiB1c2VyIHNwYWNlIGFwcGxpY2F0aW9uDQo+ID4gQ29tbWFuZCB0
aW1lb3V0IC0gbmNzaV9yZXF1ZXN0X3RpbWVvdXQoKSAtPiBuY3NpX3NlbmRfbmV0bGlua190aW1l
b3V0ICgpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBOZXRsaW5r
IGludGVyZmFjZSAobXNnIHdpdGggemVybyBkYXRhIGxlbmd0aCkNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0+IHVzZXIgc3BhY2UgYXBwbGljYXRpb24NCj4gPiBFcnJv
cjoNCj4gPiBFcnJvciBkZXRlY3RlZCAtPiBuY3NpX3NlbmRfbmV0bGlua19lcnIgKCkgLT4gTmV0
bGluayBpbnRlcmZhY2UgKGVyciBtc2cpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLT4gdXNlciBzcGFjZSBhcHBsaWNhdGlvbg0KPiA+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEp1c3RpbiBMZWUgPGp1c3Rpbi5sZWUxQGRlbGwuY29tPg0KPiANCj4gSGkgSnVzdGluLA0K
PiANCj4gVGhpcyBpcyBsb29raW5nIHByZXR0eSBnb29kLCBjb21iaW5lZCB3aXRoIFZpamF5J3Mg
YmFzZSBwYXRjaCB0aGUgdHdvDQo+IGFwcHJvYWNoZXMgc2hvdWxkIGZpdCB0b2dldGhlciBuaWNl
bHkgKA0KPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvOTc2NTEwLykuDQo+IA0K
PiBBIGdvb2QgbWVyZ2Ugb3JkZXIgd291bGQgcHJvYmFibHkgYmUgdGhlIGFib3ZlIHBhdGNoIGZp
cnN0LCB0aGVuIHRoaXMNCj4gcGF0Y2ggYW5kIFZpamF5J3MgZnVydGhlciBPRU0gcGF0Y2hlcyBi
YXNlZCBvbiB0b3Agb2YgdGhhdCB0byByZWR1Y2UNCj4gY29uZmxpY3RzLg0KPiANCj4gQ2hlZXJz
LA0KPiBTYW0NCg==
