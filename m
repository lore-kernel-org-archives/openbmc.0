Return-Path: <prvs=898122b368=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=898122b368=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Wa/VeqfC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="KdvxAAu9"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P5YW0PnGzDqHZ
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 08:20:10 +1100 (AEDT)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2JL7Hr3002304; Tue, 19 Mar 2019 14:20:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=JWGroYjmVUyJjpjKcEaVj5VCKYTr1a+le9xbS56V1bE=;
 b=Wa/VeqfCpesRODfb7pc05U1kwcKPzmhYskCjZ+5eaZEdF4XBDKem/+EtqjmZxbw5uNE0
 QpRNEpRtk2U1i3VYU/fQNw7pzQryR9XDxHG5ibfqRNVTmJ/qBWJTPsz0tGIQ09PCQW+O
 0J3svoREJAolMha9JZgaNwif49/SrcOXl2Y= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2rb0x59usj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2019 14:20:05 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 19 Mar 2019 14:20:04 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 19 Mar 2019 14:20:04 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 19 Mar 2019 14:20:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWGroYjmVUyJjpjKcEaVj5VCKYTr1a+le9xbS56V1bE=;
 b=KdvxAAu9Hj5irSfOl+khrAyv9+K6ggCGW7NOf8aKpBjTVW2XV4py74eCkO6JsOMf2gy8n79bhU6bSgqkEaTLWLrBHfN3/4ugJTEnlJIwS1CL3e9V9wO4f5yznp2HCqQ4qz8kHuEAixJZgaprVINJtNdkBUplXMA/AHvrfP4+3LA=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1704.namprd15.prod.outlook.com (10.174.53.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 19 Mar 2019 21:20:03 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 21:20:03 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: John Wang <wangzqbj@inspur.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: [fru-device and intel-ipmi-oem] ipmitool fru print can not output
 psu information
Thread-Topic: [fru-device and intel-ipmi-oem] ipmitool fru print can not
 output psu information
Thread-Index: AQHU3kRkrA04gU7aa0K3j0EqmgAGxaYTASaA
Date: Tue, 19 Mar 2019 21:20:03 +0000
Message-ID: <BEEDBD8E-30FE-46C9-9847-C4E06A67DA49@fb.com>
References: <CAHkHK08Otxm88OQGjG+b0QEgv_mExyObqOj6aZGSwmzMfZO_mw@mail.gmail.com>
In-Reply-To: <CAHkHK08Otxm88OQGjG+b0QEgv_mExyObqOj6aZGSwmzMfZO_mw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:dfbc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a964a3e-147d-4be6-5451-08d6acb0a718
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1704; 
x-ms-traffictypediagnostic: CY4PR15MB1704:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR15MB1704DB1A6A8CA43267AEEE7EDD400@CY4PR15MB1704.namprd15.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(366004)(346002)(39860400002)(199004)(189003)(53936002)(2906002)(478600001)(6246003)(8676002)(33656002)(25786009)(71190400001)(71200400001)(83716004)(11346002)(2616005)(476003)(446003)(82746002)(86362001)(106356001)(105586002)(966005)(486006)(7736002)(81166006)(81156014)(8936002)(97736004)(14454004)(229853002)(36756003)(6506007)(6306002)(256004)(6116002)(68736007)(6486002)(316002)(102836004)(5660300002)(110136005)(99286004)(186003)(6436002)(305945005)(46003)(6512007)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1704;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 792WMg0VyydLs7byV1MDm5Kk6wFEjj0ms0BQXk7uZhjYB2JmLA1LQubzPh3Vl0OqcwlsJANTNrsnYKDkiVCVf79l6cuCTQIr5Xc1ucoOS+FVzvTk7LePqWigEnNuPUC90A+/fh8cvUsPaZc1iCdk3Ge9/RXoGV5FOGVeWMsN7hqUijjujTbwgH/CKZKKmsYXEngTuY4hQqGUGuvvd9rk+6QlTJNRih2KACVSs9JGvJ9S58cQdU9IOFMl8wGmxszBM/QdYSCmSoOBwJ4gyyqKl1FcZ7oGXY5iMkHd7+dDlc+kxztQm0UMvtZVzh+WFHFQVFaY7EBOIDs/aRj12ztZGbeR8Z9RB+V9q1sSJBfAm/roRqP75lV+a3JveIZh/lnqbqmQxftxIS75AlzgUsu1fBDwE3WBiAFB0fbF+Ho9NPU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1844262016D0B24FAE8A3841D35306AD@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a964a3e-147d-4be6-5451-08d6acb0a718
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 21:20:03.6334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1704
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-19_10:, , signatures=0
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
X-List-Received-Date: Tue, 19 Mar 2019 21:20:16 -0000

SGkgSm9obiwNCllvdSBuZWVkIHRvIGRlZmluZSB5b3VyIGZydSBkZXZpY2UgbmFtZSBpbiBhIGNv
bmZpZ3VyYXRpb24gZmlsZSB3aGljaCBpcyAuanNvbiBmb3IgZW50aXR5IG1hbmFnZXIgcHJvYmUg
dG8gc3VjY2VlZC4gUGxlYXNlIGxvb2sgYXQgDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9l
bnRpdHktbWFuYWdlci90cmVlL21hc3Rlci9jb25maWd1cmF0aW9ucw0KDQpZb3UgbmVlZCBhIHNl
cGFyYXRlIGNvbmZpZ3VyYXRpb24gZm9yIHlvdXIgYm9hcmQuDQoNClJlZ2FyZHMNCi1WaWpheQ0K
DQrvu79PbiAzLzE5LzE5LCA0OjEwIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSm9obiBXYW5n
IiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9u
IGJlaGFsZiBvZiB3YW5nenFiakBpbnNwdXIuY29tPiB3cm90ZToNCg0KICAgIEJ5IGNoZWNraW5n
IHRoZSBjb2RlLCBJIGZvdW5kIHRoYXQgZnJ1LWRldmljZSBzZWVtcyB0byBuZWVkIHRvIGJlIHVz
ZWQNCiAgICB3aXRoIGludGVsLWlwbWktb2VtLA0KICAgIGFuZCBpdCBzZWVtcyB0aGF0IG5vIGFk
ZGl0aW9uYWwgY29uZmlndXJhdGlvbiBpcyByZXF1aXJlZChjb3JyZWN0Pz8pLg0KICAgIA0KICAg
IE9uIG15IG1hY2hpbmUsdGhlcmUgYXJlIHR3byBGUlUsb25lIGlzIC9ldGMvZnJ1L2Jhc2Vib2Fy
ZC5mcnUuYmluLHRoZQ0KICAgIG90aGVyIGlzIHBzdSBmcnUuDQogICAgKFRoZXJlIGlzIG9ubHkg
b25lIHBzdSkuDQogICAgDQogICAgQnV0LGlwbWl0b29sIGZydSBwcmludCBjYW4gb25seSBvdXRw
dXQgdGhlIGZydSBvZiBiYXNlYm9hcmQuDQogICAgJCBpcG1pdG9vbCAtSSBsYW5wbHVzIC1IIDEw
MC4yLjc2LjIxMyAtVSByb290IC1QIDBwZW5CbWMgZnJ1IHByaW50DQogICAgRlJVIERldmljZSBE
ZXNjcmlwdGlvbiA6IEJ1aWx0aW4gRlJVIERldmljZSAoSUQgMCkNCiAgICANCiAgICBmcnUtZGV2
aWNlIGZvdW5kIHBzdSBpdHNlbGYgYW5kIGhhZCB0aGUgY29ycmVjdCBvdXRwdXQgb24gZGJ1czoN
CiAgICBidXNjdGwgdHJlZSB4eXoub3BlbmJtY19wcm9qZWN0LkZydURldmljZQ0KICAgIOKUlOKU
gC94eXoNCiAgICAgIOKUlOKUgC94eXovb3BlbmJtY19wcm9qZWN0DQogICAgICAgIOKUlOKUgC94
eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZQ0KICAgICAgICAgIOKUnOKUgC94eXovb3BlbmJt
Y19wcm9qZWN0L0ZydURldmljZS9EUFNfODAwQUJfMTZfQQ0KICAgICAgICAgIOKUlOKUgC94eXov
b3BlbmJtY19wcm9qZWN0L0ZydURldmljZS9PTjUyNjNNNQ0KICAgIGJ1c2N0bCBpbnRyb3NwZWN0
IHh5ei5vcGVuYm1jX3Byb2plY3QuRnJ1RGV2aWNlDQogICAgL3h5ei9vcGVuYm1jX3Byb2plY3Qv
RnJ1RGV2aWNlL0RQU184MDBBQl8xNl9BOiAgICAgIC0NCiAgICAuQUREUkVTUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwcm9wZXJ0eSAgdSAgICAgICAgIDgwDQogICAgICBlbWl0cy1jaGFu
Z2UNCiAgICAuQlVTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcm9wZXJ0eSAgdSAg
ICAgICAgIDUNCiAgICAgIGVtaXRzLWNoYW5nZQ0KICAgIC5Db21tb25fRm9ybWF0X1ZlcnNpb24g
ICAgICAgICAgICAgIHByb3BlcnR5ICBzICAgICAgICAgIjEiDQogICAgICBlbWl0cy1jaGFuZ2UN
CiAgICAuUFJPRFVDVF9MQU5HVUFHRV9DT0RFICAgICAgICAgICAgICBwcm9wZXJ0eSAgcyAgICAg
ICAgICIyNSINCiAgICAgIGVtaXRzLWNoYW5nZQ0KICAgIC5QUk9EVUNUX01BTlVGQUNUVVJFUiAg
ICAgICAgICAgICAgIHByb3BlcnR5ICBzICAgICAgICAgIkRFTFRBIg0KICAgICAgZW1pdHMtY2hh
bmdlDQogICAgLlBST0RVQ1RfUEFSVF9OVU1CRVIgICAgICAgICAgICAgICAgcHJvcGVydHkgIHMg
ICAgICAgICAiICAgICAgICAgICINCiAgICAgIGVtaXRzLWNoYW5nZQ0KICAgIC5QUk9EVUNUX1BS
T0RVQ1RfTkFNRSAgICAgICAgICAgICAgIHByb3BlcnR5ICBzICAgICAgICAgIkRQUy04MDBBQi0x
Ng0KICAgIEEiIGVtaXRzLWNoYW5nZQ0KICAgIC5QUk9EVUNUX1NFUklBTF9OVU1CRVIgICAgICAg
ICAgICAgIHByb3BlcnR5ICBzDQogICAgIkhFUkQxNjI5MDAyMzA5IiBlbWl0cy1jaGFuZ2UNCiAg
ICAuUFJPRFVDVF9WRVJTSU9OICAgICAgICAgICAgICAgICAgICBwcm9wZXJ0eSAgcyAgICAgICAg
ICJTMkYiDQogICAgICBlbWl0cy1jaGFuZ2UNCiAgICANCiAgICBJbnRlbC1pcG1pLW9lbToNCiAg
ICBDb21taXQgZmNjZTgzZGY3OTlkOTU4MGY0OGI3Zjc5Mzk4OWM5Yzk2YmM4ODJlMA0KICAgIEF1
dGhvcjogSmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4NCiAgICBEYXRl
OiBGcmkgTWFyIDEgMTU6NDY6MTkgMjAxOSAtMDgwMA0KICAgIA0KICAgIFRoZSBjb25maWd1cmF0
aW9uIG9mIHBzdSBpbiBlbnRpdHktbWFuYWdlciBpcyBhcyBmb2xsb3dzOg0KICAgIFsNCiAgICAg
ICAgew0KICAgICAgICAgICAgIkV4cG9zZXMiOiBbDQogICAgICAgICAgICAgICAgew0KICAgICAg
ICAgICAgICAgICAgICAiQWRkcmVzcyI6ICIweDU4IiwNCiAgICAgICAgICAgICAgICAgICAgIkJ1
cyI6ICIkYnVzIiwNCiAgICAgICAgICAgICAgICAgICAgIk5hbWUiOiAiRGVsdGEgRFBTLTgwMEFC
LTE2IFBTVSBEZXZpY2UiLA0KICAgICAgICAgICAgICAgICAgICAiVHlwZSI6ICJwbWJ1cyINCiAg
ICAgICAgICAgICAgICB9LA0KICAgIHsNCiAgICAgICAgICAgICAgICAgICAgIkFkZHJlc3MiOiAi
JGFkZHJlc3MiLA0KICAgICAgICAgICAgICAgICAgICAiQnVzIjogIiRidXMiLA0KICAgICAgICAg
ICAgICAgICAgICAiTmFtZSI6ICJEZWx0YSBEUFMtODAwQUItMTYgUFNVIEZSVSIsDQogICAgICAg
ICAgICAgICAgICAgICJUeXBlIjogIkVFUFJPTSINCiAgICAgICAgICAgICAgICB9DQogICAgDQog
ICAgICAgICAgICBdLA0KICAgICAgICAgICAgIk5hbWUiOiAiUFNVIiwNCiAgICAgICAgICAgICJQ
cm9iZSI6DQogICAgInh5ei5vcGVuYm1jX3Byb2plY3QuRnJ1RGV2aWNlKHsnUFJPRFVDVF9QUk9E
VUNUX05BTUUnOiAnRFBTLTgwMEFCLTE2DQogICAgQSd9KSIsDQogICAgICAgICAgICAiVHlwZSI6
ICJQb3dlclN1cHBseSIsDQogICAgICAgICAgICAieHl6Lm9wZW5ibWNfcHJvamVjdC5JbnZlbnRv
cnkuRGVjb3JhdG9yLkFzc2V0Ijogew0KICAgICAgICAgICAgICAgICJNYW51ZmFjdHVyZXIiOiAi
JFBST0RVQ1RfTUFOVUZBQ1RVUkVSIiwNCiAgICAgICAgICAgICAgICAiTW9kZWwiOiAiJFBST0RV
Q1RfUFJPRFVDVF9OQU1FIiwNCiAgICAgICAgICAgICAgICAiUGFydE51bWJlciI6ICIkUFJPRFVD
VF9QQVJUX05VTUJFUiIsDQogICAgICAgICAgICAgICAgIlNlcmlhbE51bWJlciI6ICIkUFJPRFVD
VF9TRVJJQUxfTlVNQkVSIg0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgXQ0KICAgIA0K
ICAgIA0KICAgIENhbiBhbnlvbmUgaGVscCBtZSBmaWd1cmUgb3V0IHdoYXQgY29uZmlndXJhdGlv
biBpbmZvcm1hdGlvbiBpcyBtaXNzaW5nPw0KICAgIA0KDQo=
