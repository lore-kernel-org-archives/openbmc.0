Return-Path: <prvs=896296bd48=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=896296bd48=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Cy5Lh5d6"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="C5ses2s8"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449Pgr2hHdzDqM4
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 07:45:07 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x1SKaX2t024317;
 Thu, 28 Feb 2019 12:45:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=dht8BXrIoG4jjcuq6/7uvWdu5ULjKawXbMtsRMHcrgU=;
 b=Cy5Lh5d6NMqxEp2mpwy2N2VTIxkfcyYyQ3zr42yZfq48JkpU8f/F56fFC6aQTmZgHmj2
 8HVwxTE4geDovfjRdSEM/2fdC5QZEH6/qsLPP5Au0CxpxSZG+H5nZkKRlx6xZrtxldGo
 ElyE5zMURucNkFScv3CIEX8bLt64HcSsPSA= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2qxkjb0s15-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 28 Feb 2019 12:45:00 -0800
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 28 Feb 2019 12:43:53 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 28 Feb 2019 12:43:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dht8BXrIoG4jjcuq6/7uvWdu5ULjKawXbMtsRMHcrgU=;
 b=C5ses2s8Df2j5C8+vUv4kHO4/ErbE18q5Ugm1ojTxCb/LHpKwwECbbmPheeVqhLMNyN/QFDpswPiOCDauqYwUDCoI/v1IP7l7X63I7o9hVWfelcWO9Ao7dBWABg0OcmexLc2QOOBBFV6Pzs8/CKdZJpnc7JYFNMq3+UrL22yGys=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1894.namprd15.prod.outlook.com (10.174.54.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.15; Thu, 28 Feb 2019 20:43:52 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c47c:32d3:4b03:adea]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c47c:32d3:4b03:adea%3]) with mapi id 15.20.1643.019; Thu, 28 Feb 2019
 20:43:52 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Wim Vervoorn <wvervoorn@eltan.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Building intel s2600wf image
Thread-Topic: Building intel s2600wf image
Thread-Index: AdTFSt2alieuRaKeTgaddnrT2vklLAKGGQCA
Date: Thu, 28 Feb 2019 20:43:51 +0000
Message-ID: <C8BA2205-EAB7-4225-B879-B5D43D2CC2D7@fb.com>
References: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
In-Reply-To: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::cad0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daae0b93-bf5e-432a-1671-08d69dbd72f8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1894; 
x-ms-traffictypediagnostic: CY4PR15MB1894:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1894;
 20:0NygqcExHQUjcI+CePB+8IrlQbye0/REw+cfVy5SldGc1OYL+LEGHvaNJr8fenOzbdGeh0z8GRCym7yARLLgeoNoPJ08kzlCSmj8rGsTEQl0z4IkUe/dxQdiBUDvyJyel2l5R7/hF/z/UD4Cm8zw7Jiui82LeSp6l0g3JE4lGjc=
x-microsoft-antispam-prvs: <CY4PR15MB18943BBE5D61C3429A3A8CF2DD750@CY4PR15MB1894.namprd15.prod.outlook.com>
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(39860400002)(346002)(366004)(199004)(189003)(476003)(2616005)(2906002)(446003)(6486002)(6512007)(186003)(6306002)(229853002)(33656002)(53546011)(25786009)(486006)(6506007)(106356001)(102836004)(11346002)(46003)(6436002)(68736007)(6246003)(86362001)(105586002)(97736004)(99286004)(53936002)(256004)(305945005)(110136005)(7736002)(6116002)(316002)(5660300002)(2501003)(966005)(8676002)(81166006)(81156014)(71190400001)(71200400001)(14454004)(8936002)(478600001)(76176011)(82746002)(83716004)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1894;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5G82ODN21w5Rn9tx9WSj1QZA2UTKR+w4WeR6DZ7xKZegeFYVzUaDuUC/i9yZoDYo0Uvy+0+TfMpV2fgFTX6uRZPw67GP+LnezOMeyBl+xNL6bh4PGRbB1xeHasdM7ChV+X4i3fNsglajwgJe48okwUtGdeCjS5qSogEn7VSB8qE0HnL+3SIngWVzaXKGLV5HoGw/M7umpEgfDN/v7h2Dm2knGwKKBciCZVbxWQlSEqTYUcUiN/xnnKj98c/kV9kvkY3cdNsiw8Wzcaw5LvBQndj3EqBkotaxXWxof5vtMG6Trc8RDEWWl0idWxoDbjkyMvXuP50mjQzyJ0EhpRYrl5JN2ilZAgXvJATI1x+cBQL4o/CXpc3QZXX5dM9l2Vng2VdRLG/4Xj0vJVjstvbvWXWz4je5eo7ryoAqKnn9yD0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1F95E35781BBC4A865651726E8CF845@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: daae0b93-bf5e-432a-1671-08d69dbd72f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2019 20:43:52.1143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1894
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-28_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Thu, 28 Feb 2019 20:45:13 -0000

SGkgV2ltLA0KSG93IGRpZCB5b3UgZ2V0IHBhc3MgdGhyb3VnaCBiZWxvdyBidWlsZCBpc3N1ZSBh
cyBJIGFtIHN0aWxsIHNlZWluZyBpdC4NCg0KL2hvbWUvdmlqYXlraGVta2EvcHJvai9vcGVuYm1j
L2xmL2ZlYjA0LWxmL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtdjYtb3BlbmJtYy1saW51eC1n
bnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2NhYzk3YTUzM2ItcjAvZ2l0L3Ny
Yy91dGlscy5jcHA6MToxMDogZmF0YWwgZXJyb3I6IHBob3NwaG9yLWlwbWktaG9zdC91dGlscy5o
cHA6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCnwgICNpbmNsdWRlICJwaG9zcGhvci1pcG1p
LWhvc3QvdXRpbHMuaHBwIg0KDQpSZWdhcmRzDQotVmlqYXkNCg0K77u/T24gMi8xNS8xOSwgODoz
MyBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFdpbSBWZXJ2b29ybiIgPG9wZW5ibWMtYm91bmNl
cyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2Ygd3ZlcnZv
b3JuQGVsdGFuLmNvbT4gd3JvdGU6DQoNCiAgICBIZWxsbyBKYW1lcywNCiAgICANCiAgICBJIGdv
dCB0aGUgdHJlZSBidWlsZGluZyBub3cuDQogICAgDQogICAgSSBoYXZlIGJlZW4gcGVyZm9ybWlu
ZyBzb21lIHRlc3RzIGFzIHdlbGwuIE9uZSB0aGluZyB0aGF0IHBvcHBlZCB1cCBpbW1lZGlhdGVs
eSBpcyB0aGF0IHRoZXJlIGFyZSBubyBkZXZpY2VzIGNyZWF0ZWQgZm9yIHRoZSBrY3MgaW50ZXJm
YWNlIHdoaWxlIHRoZSBzZXJ2aWNlIGZvciB0aGlzIGlzIHN0YXJ0ZWQuDQogICAgDQogICAgSSBu
b3RpY2VkIHRoYXQgdGhlIGZhY2Vib29rLXRpb2dhcGFzcy5kdHMgaGFzIHRoZSBpdGVtcyBmb3Ig
a2NzMiBhbmQgMyBpbmNsdWRlZCB3aGlsZSB0aGUgczI2MDB3Zi5kdHMgZG9lc24ndCBhc3NpZ24g
YWRkcmVzc2VzIGZvciB0aGVzZSBkZXZpY2VzIChsZWF2aW5nIHRoZSBrY3NfYWRkciBhdCAwIGNh
dXNpbmcgdGhlIGRyaXZlciBub3QgdG8gbG9hZCkuDQogICAgDQogICAgSSB0aGlzIGludGVudGlv
bmFsIGFuZCBkbyBzdGFydCB0aGUgZHJpdmVyIGluIGFub3RoZXIgd2F5IG9yIHNob3VsZCBJIGNo
YW5nZSB0aGUgZHRzPw0KICAgIA0KICAgIEJlc3QgcmVnYXJkcywNCiAgICANCiAgICBXaW0gVmVy
dm9vcm4NCiAgICANCiAgICANCiAgICBNZXNzYWdlOiA0DQogICAgRGF0ZTogVGh1LCAxNCBGZWIg
MjAxOSAxNjowMTo1NyAtMDgwMA0KICAgIEZyb206IEphbWVzIEZlaXN0IDxqYW1lcy5mZWlzdEBs
aW51eC5pbnRlbC5jb20+DQogICAgVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KICAgIFN1
YmplY3Q6IFJlOiBCdWlsZGluZyBpbnRlbCBzMjYwMHdmIGltYWdlDQogICAgTWVzc2FnZS1JRDog
PDBhZjYwM2Y5LTMzZTYtMGRjYi03ZTljLTJjZmExM2NjMmEwMkBsaW51eC5pbnRlbC5jb20+DQog
ICAgQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PXV0Zi04OyBmb3JtYXQ9Zmxvd2Vk
DQogICAgDQogICAgT24gMi8xNC8xOSAzOjQ5IFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCiAg
ICA+IEhpIFdpbSwNCiAgICA+IA0KICAgID4gT24gRnJpLCAxNSBGZWIgMjAxOSwgYXQgMDI6NTEs
IFdpbSBWZXJ2b29ybiB3cm90ZToNCiAgICA+PiBIZWxsbywNCiAgICA+Pg0KICAgID4+IFdlIGFy
ZSB0cnlpbmcgdG8gYnVpbGQgdGhlIEludGVsIHMyNjAwd2YgaW1hZ2UgdXNpbmcgdGhlIGxhdGVz
dCANCiAgICA+PiBPcGVuQk1DIHRyZWUuIElmIHdlIGRvIHRoYXQgd2UgYXJlIHJ1bm5pbmcgaW50
byBidWlsZCBlcnJvcnMuDQogICAgPj4NCiAgICA+PiBCZWZvcmUgZGlnZ2luZyBpbnRvIHRoaXMg
Y2FuIHlvdSB0ZWxsIG1lIHdoaWNoIGNvbW1pdCBvZiB0aGUgdHJlZSBjYW4gDQogICAgPj4gYmUg
dXNlZCB0byBidWlsZCBhbiBpbWFnZSBmb3IgIHRoaXMgZGV2aWNlIHdpdGhvdXQgZXJyb3JzLiBU
aGlzIA0KICAgID4+IGFsbG93cyB1cyB0byBoYXZlIGEgc3RhYmxlIHZlcnNpb24gZm9yIHJlZmVy
ZW5jZS4NCiAgICANCiAgICBJIHRyaWVkIHRvIGJ1aWxkIHRvZGF5IHdpdGggbGF0ZXN0IHRydW5r
IGFuZCB0aGVyZSB3ZXJlIHNvbWUgaXNzdWVzLCBJIGZpeGVkIHRoZW0gYWxsIHRvZGF5IGJ1dCBh
bGwgdGhlIGJ1bXBzIGhhdmUgdG8gZ28gdGhyb3VnaCBmaXJzdC4gDQogICAgU3BlY2lmaWNhbGx5
IHRoaXMgb25lOiANCiAgICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJs
P3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJEcHJvamVjdC54eXpfLTIzX2Nfb3BlbmJtY19t
ZXRhLTJEaW50ZWxfLTJCXzE4NDEwXyZkPUR3SUZBZyZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcm
cj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09UVJwb2EtNHRH
anJhU3g4a3hldG8yZ2lqaGs0ZHQ0WFB3aG0yUlY4OFJkSSZzPXI1TVpRZlNUaFRkOEhKcjU3SG5I
RWFsVlliTlZFbmQyU1NFaHUwRlpUVlEmZT0NCiAgICANCiAgICBUaGVuIGl0IG5lZWRzIHRvIGdl
dCBzeW5jZWQgaW50byBvcGVuYm1jLW9wZW5ibWMsIG9yIHlvdSBjYW4gY2hlY2tvdXQgdGhlIHBh
dGNoIHdpdGggdGhlIGFib3ZlIHZlcnNpb24gb2YgbWV0YS1waG9zcGhvciBhbmQgaXQgc2hvdWxk
IGJ1aWxkLg0KICAgIA0KICAgIFRoYW5rcw0KICAgIA0KICAgIC1KYW1lcw0KICAgIA0KICAgIA0K
ICAgIEVuZCBvZiBvcGVuYm1jIERpZ2VzdCwgVm9sIDQyLCBJc3N1ZSAzNg0KICAgICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KICAgIA0KICAgIA0KICAgIA0KDQo=
