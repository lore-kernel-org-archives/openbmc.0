Return-Path: <prvs=38297c7ee2=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38297c7ee2=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="jch+yvgc"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="EVm9D2Ls"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bhq66bHMzF3FG
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 08:23:13 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9ILK8nL025189; Thu, 18 Oct 2018 14:23:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=EZQeDcSxQnHvb9vpoKk9jMKXXszhErxAv0B7xnJ8Noc=;
 b=jch+yvgcj933CUrxG7yXZq80+8UhGhvJcno8BqI0NkCSLN+LzB4pEwI0RVqgsS6XHqOk
 2e9zxyBC6y/UZkeNSmM3AQAzeuNh822/3veZqLcbj+cG+cd6iEnPpye9tS83QesjFzPq
 0uXkq6uekOgu72ZMLii9GDJ2rS8vU7X+ANI= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n6ype0e68-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 18 Oct 2018 14:23:07 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 18 Oct 2018 14:23:06 -0700
Received: from PRN-CHUB14.TheFacebook.com (2620:10d:c081:35::23) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Thu, 18 Oct 2018 14:23:06 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.24) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Thu, 18 Oct 2018 14:23:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZQeDcSxQnHvb9vpoKk9jMKXXszhErxAv0B7xnJ8Noc=;
 b=EVm9D2LsunqOfG9zVNCaIjK3fNIBS4p0wClHUXIEy61/NWKICUgdZGM6GeR3DPrzV6NMWKjbb5bi13C5ZomFUVv48jcI7H7oeOHnQ7cgUlzoRMZoBq1gpe2G2h7TAf7lcPjHFuq3nEMuu+O2rYm7YoE7l4CtRjS75GI9Cl0MU1A=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1317.namprd15.prod.outlook.com (10.172.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.20; Thu, 18 Oct 2018 21:23:04 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b%3]) with mapi id 15.20.1228.027; Thu, 18 Oct 2018
 21:23:04 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Emily Shaffer <emilyshaffer@google.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: Re: ipmi inventory
Thread-Topic: ipmi inventory
Thread-Index: AQHUZyGlNxc8kYE2dEKnN49gNGN33qUldmkA//+XfIA=
Date: Thu, 18 Oct 2018 21:23:04 +0000
Message-ID: <B8EF522B-102D-420F-90BC-9036285BFD8D@fb.com>
References: <3B781DAB-16CE-421D-BDCC-DDA2B74EF680@fb.com>
 <CAJoAoZmcMvu-JAW6WuTLm_cxth+p4DuSXGwMGPBik2VzMggGWw@mail.gmail.com>
In-Reply-To: <CAJoAoZmcMvu-JAW6WuTLm_cxth+p4DuSXGwMGPBik2VzMggGWw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:564f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1317;
 20:bflxQfQy4REpAS6MNlpowrFkuSVKjYYm/gjk1GInU0gTOM2DpRP9fLyYWpYZtFn9rTQuX+nuM2E2YMSvt3GCesWVHCiDFRmwLWYAv+9CZsmacgIXX/nQ0vpAQbVxqdsB6Ih/DOa0q34Atd/pHoJKnH5elintOVn/V0MhU8rEkWw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: bf0bd580-c15c-4f1a-964a-08d6353fe3e1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1317; 
x-ms-traffictypediagnostic: CY4PR15MB1317:
x-microsoft-antispam-prvs: <CY4PR15MB1317CDD81BE9518CEAE10B31DDF80@CY4PR15MB1317.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(211936372134217)(153496737603132)(67672495146484)(65623756079841)(72170088055959)(21748063052155)(28532068793085)(190501279198761)(227612066756510);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(11241501184)(944501410)(52105095)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1317; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1317; 
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(39860400002)(136003)(366004)(199004)(189003)(86362001)(316002)(6486002)(71200400001)(2906002)(221733001)(54906003)(5660300001)(7116003)(106356001)(6436002)(53546011)(6306002)(76176011)(99286004)(6116002)(83716004)(105586002)(6506007)(54896002)(33656002)(53936002)(6512007)(229853002)(71190400001)(256004)(97736004)(82746002)(8936002)(5250100002)(236005)(25786009)(46003)(102836004)(2616005)(476003)(6246003)(446003)(486006)(2900100001)(81166006)(68736007)(186003)(7736002)(36756003)(81156014)(3480700004)(478600001)(8676002)(11346002)(6916009)(14454004)(4326008)(111123002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1317;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: RgggiInBw44YQfSKr7uMZ4Q1dQAnqEvUgixIvFtc+HwaldraCb2yeld2UeNz53T3jUy3B03qc33xqEt0NYpAql0HzbNRTHRAoVWHZr71NfqhXherkIhKqwFKA0/EeY9f2WBrfILyWPdcE160zyKxwUPBw0BSM0Upl+wouxIzNAZUCLEoH5O56y+P9ha09n/x0+mf2CK34HwEAGMNnSG+h98/0PFWW58tWJHuV5irMVDJ3Kg//1nFQpgYqSkub8OZqr1cqXGJVIwhuixIi9O28NgTnpukZAr4PzWDNDExDYp493rMPMPLQhi7aV+HWBM1WnZtKdu3yOK2HR4twTCwITPqu85IPV9WsDtwUlkRU8w=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_B8EF522B102D420F90BC9036285BFD8Dfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0bd580-c15c-4f1a-964a-08d6353fe3e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 21:23:04.0816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1317
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-18_10:, , signatures=0
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
X-List-Received-Date: Thu, 18 Oct 2018 21:23:15 -0000

--_000_B8EF522B102D420F90BC9036285BFD8Dfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIEVtaWx5Lg0KDQpGcm9tOiBFbWlseSBTaGFmZmVyIDxlbWlseXNoYWZmZXJAZ29vZ2xl
LmNvbT4NCkRhdGU6IFRodXJzZGF5LCBPY3RvYmVyIDE4LCAyMDE4IGF0IDE6MzggUE0NClRvOiBW
aWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCkNjOiAib3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPiwgQnJhZCBCaXNob3AgPGJyYWRsZXli
QGZ1enppZXNxdWlycmVsLmNvbT4NClN1YmplY3Q6IFJlOiBpcG1pIGludmVudG9yeQ0KDQpGcm9t
IHRoZSBzcGVjOg0KIkluZGljYXRlcyB0aGUgcGh5c2ljYWwgZW50aXR5IHRoYXQgdGhlIHNlbnNv
ciBpcyBtb25pdG9yaW5nIG9yIGlzIG90aGVyd2lzZQ0KYXNzb2NpYXRlZCB3aXRoIHRoZSBzZW5z
b3IuIFNlZSBUYWJsZSA0My0sIEVudGl0eSBJRCBDb2Rlcy4iDQoNCkhlYWRlciBmb3IgdGhhdCB0
YWJsZToNCg0KIlRoZSBFbnRpdHkgSUQgZmllbGQgaXMgdXNlZCBmb3IgaWRlbnRpZnlpbmcgdGhl
IHBoeXNpY2FsIGVudGl0eSB0aGF0IGEgc2Vuc29yIG9yIGRldmljZSBpcyBhc3NvY2lhdGVkIHdp
dGguIElmIG11bHRpcGxlDQpzZW5zb3JzIHJlZmVyIHRvIHRoZSBzYW1lIGVudGl0eSwgdGhleSB3
aWxsIGhhdmUgdGhlIHNhbWUgRW50aXR5IElEIGZpZWxkIHZhbHVlLiBGb3IgZXhhbXBsZSwgaWYg
YSB2b2x0YWdlIHNlbnNvcg0KYW5kIGEgdGVtcGVyYXR1cmUgc2Vuc29yIGFyZSBib3RoIGZvciBh
IOKAmFBvd2VyIFN1cHBseSAx4oCZIGVudGl0eSB0aGUgRW50aXR5IElEIGluIHRoZWlyIHNlbnNv
ciBkYXRhIHJlY29yZHMgd291bGQNCmJvdGggYmUgMTAgKDBBaCksIHBlciB0aGUgRW50aXR5IElE
IHRhYmxlLiINCg0KQ2hlY2sgb3V0IHRoZSBzcGVjIG9uIHlvdXIgb3duIGZvciB0aGUgdGFibGUu
IEl0IHN0YXJ0cyBvbiBwYWdlIDU1MCBhcyB3cml0dGVuIGluIHRoZSBwZGYgKGFsdGhvdWdoIHRo
ZSBmaWxlIGl0c2VsZiBwdXRzIHRoYXQgb24gcGFnZSA1NzYpDQoNCk9uIFRodSwgT2N0IDE4LCAy
MDE4IGF0IDE6MzMgUE0gVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb208bWFpbHRvOnZp
amF5a2hlbWthQGZiLmNvbT4+IHdyb3RlOg0KSGksDQpJIGFtIHRyeWluZyB0byBmaW5kIHJlZmVy
ZW5jZSB0byBlbnRpdHlJRCBkZWZpbmVkIGluIGNvbmZpZy55YW1sIGZvciBpcG1pIHVudmVudG9y
eSBtYXAuIEkgc2VlIGRpZmZlcmVudCB2YWx1ZSBvZiBlbnRpdHlJRCBmb3IgZGlmZmVyZW50IHNl
Y3Rpb25zLiBJcyB0aGVyZSBhbnkgZG9jdW1lbnRhdGlvbiB3aGljaCBkZWZpbmVzIHdoYXQgc2hv
dWxkIGJlIGVudGl0eUlEIGFuZCBpbnN0YW5jZSBmb3IgZWFjaCBzZWN0aW9uLg0KDQpSZWdhcmRz
DQotVmlqYXkNCg==

--_000_B8EF522B102D420F90BC9036285BFD8Dfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B973A1216C7A6741A64FBAFB17422483@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6RGVuZ1hpYW47DQoJcGFub3NlLTE6
MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7
DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiXEBEZW5nWGlhbiI7DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBT
dHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05v
cm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6
MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bh
bi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJ
dGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5r
Rm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0
LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAubXNvbm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2
Lm1zb25vcm1hbDANCgl7bXNvLXN0eWxlLW5hbWU6bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9w
LWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1
dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5
cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJ
Y29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBv
cnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXpl
OjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2Lldv
cmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0K
PGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUiIHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFz
cz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rcyBFbWlseS48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3Bh
ZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkVtaWx5IFNoYWZmZXIgJmx0
O2VtaWx5c2hhZmZlckBnb29nbGUuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5UaHVyc2RheSwg
T2N0b2JlciAxOCwgMjAxOCBhdCAxOjM4IFBNPGJyPg0KPGI+VG86IDwvYj5WaWpheSBLaGVta2Eg
Jmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDs8YnI+DQo8Yj5DYzogPC9iPiZxdW90O29wZW5ibWNA
bGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Oywg
QnJhZCBCaXNob3AgJmx0O2JyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbSZndDs8YnI+DQo8Yj5T
dWJqZWN0OiA8L2I+UmU6IGlwbWkgaW52ZW50b3J5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9k
aXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8
L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTox
Mi4wcHQiPkZyb20gdGhlIHNwZWM6PG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+JnF1b3Q7SW5kaWNhdGVzIHRoZSBwaHlzaWNhbCBlbnRpdHkgdGhhdCB0aGUgc2Vu
c29yIGlzIG1vbml0b3Jpbmcgb3IgaXMgb3RoZXJ3aXNlPG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5hc3NvY2lhdGVkIHdpdGggdGhlIHNlbnNvci4g
U2VlIFRhYmxlIDQzLSwgRW50aXR5IElEIENvZGVzLiZxdW90OzxvOnA+PC9vOnA+PC9wPg0KPC9k
aXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8
L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IZWFkZXIgZm9yIHRoYXQgdGFibGU6
PGJyPg0KPGJyPg0KJnF1b3Q7VGhlIEVudGl0eSBJRCBmaWVsZCBpcyB1c2VkIGZvciBpZGVudGlm
eWluZyB0aGUgcGh5c2ljYWwgZW50aXR5IHRoYXQgYSBzZW5zb3Igb3IgZGV2aWNlIGlzIGFzc29j
aWF0ZWQgd2l0aC4gSWYgbXVsdGlwbGU8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPnNlbnNvcnMgcmVmZXIgdG8gdGhlIHNhbWUgZW50aXR5LCB0aGV5
IHdpbGwgaGF2ZSB0aGUgc2FtZSBFbnRpdHkgSUQgZmllbGQgdmFsdWUuIEZvciBleGFtcGxlLCBp
ZiBhIHZvbHRhZ2Ugc2Vuc29yPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5hbmQgYSB0ZW1wZXJhdHVyZSBzZW5zb3IgYXJlIGJvdGggZm9yIGEg4oCY
UG93ZXIgU3VwcGx5IDHigJkgZW50aXR5IHRoZSBFbnRpdHkgSUQgaW4gdGhlaXIgc2Vuc29yIGRh
dGEgcmVjb3JkcyB3b3VsZDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+Ym90aCBiZSAxMCAoMEFoKSwgcGVyIHRoZSBFbnRpdHkgSUQgdGFibGUuJnF1
b3Q7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PkNoZWNrIG91dCB0aGUgc3BlYyBvbiB5b3VyIG93biBmb3IgdGhlIHRhYmxlLiBJdCBzdGFydHMg
b24gcGFnZSA1NTAgYXMgd3JpdHRlbiBpbiB0aGUgcGRmIChhbHRob3VnaCB0aGUgZmlsZSBpdHNl
bGYgcHV0cyB0aGF0IG9uIHBhZ2UgNTc2KTxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiBUaHUsIE9jdCAxOCwgMjAxOCBhdCAxOjMzIFBNIFZp
amF5IEtoZW1rYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbSI+dmlqYXlr
aGVta2FAZmIuY29tPC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxibG9j
a3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0
O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0
OjBpbiI+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFy
Z2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+SGksPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1
dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPkkgYW0gdHJ5aW5nIHRvIGZpbmQgcmVmZXJl
bmNlIHRvIGVudGl0eUlEIGRlZmluZWQgaW4gY29uZmlnLnlhbWwgZm9yIGlwbWkgdW52ZW50b3J5
IG1hcC4gSSBzZWUgZGlmZmVyZW50IHZhbHVlIG9mIGVudGl0eUlEIGZvciBkaWZmZXJlbnQgc2Vj
dGlvbnMuIElzIHRoZXJlIGFueSBkb2N1bWVudGF0aW9uIHdoaWNoDQogZGVmaW5lcyB3aGF0IHNo
b3VsZCBiZSBlbnRpdHlJRCBhbmQgaW5zdGFuY2UgZm9yIGVhY2ggc2VjdGlvbi48bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0
bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdp
bi1ib3R0b20tYWx0OmF1dG8iPlJlZ2FyZHM8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+
DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRv
cC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+LVZpamF5PG86cD48L286cD48
L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_B8EF522B102D420F90BC9036285BFD8Dfbcom_--
