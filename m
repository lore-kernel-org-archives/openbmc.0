Return-Path: <prvs=6925d468ca=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6925d468ca=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="X3bOHEio"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="K3m4sTZS"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43khTY0zKBzDqKX
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 08:32:30 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x0MLTm0Z030976;
 Tue, 22 Jan 2019 13:32:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=vB2xtzCf2zWtmZ84uuGbTBFfQDtRzLdxcmAL3hWN4yk=;
 b=X3bOHEioaK7Btf9XC0WJCD9MqEjkqJlfQRFZRoMGR6/UBjhA+KITmjapYgWNv1HjWSDU
 +ML51ODReKphChL9XDL3BMBhfkXz+vsZwsym86VQekxNUJEu2TEY9RiPSJYyYJyAl9g7
 mze+FAo6Feo+/+K1t83HMPFYhVE0bfA8eO4= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2q69p78ay3-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 22 Jan 2019 13:32:27 -0800
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 22 Jan 2019 13:32:14 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 22 Jan 2019 13:32:14 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 22 Jan 2019 13:32:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB2xtzCf2zWtmZ84uuGbTBFfQDtRzLdxcmAL3hWN4yk=;
 b=K3m4sTZS3CTXOf/HvTLfoW66hG/l1ZNMj7HLcAm9xz6oX03BhUzr6HtqFqwkvQd1d05nyPpbQeXmapVcxm81TmWvi5IVlkKPrLGA/WPPqMHuH7BjamL6bVlTKiSCElEov9UK7h+b+71WRQVa39Q1C8Wp1d1BMPvf7pzLNaDiV88=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1733.namprd15.prod.outlook.com (10.174.53.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Tue, 22 Jan 2019 21:31:59 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 21:31:58 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Intel-ipmi-oem repo
Thread-Topic: Intel-ipmi-oem repo
Thread-Index: AQHUsn6T2PovaFK5IEGTS1z8ksaC/qW7xBsA//+EmgA=
Date: Tue, 22 Jan 2019 21:31:58 +0000
Message-ID: <3C01A4B5-928C-4767-85B5-29B4A15A199D@fb.com>
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <20190122205338.m2giw4ghhievyssc@thinkpad>
In-Reply-To: <20190122205338.m2giw4ghhievyssc@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:5da0]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1733;
 20:L75WlShy+Ocnh5DDQ9Tx/5rm2k1NOHlqKSMWYWI8KhMDG+dOBZI0wD5DsyL6RgtKIZgIO1pSjtJfkOrOX27E9nWUDx5UfX9raEQpI2tQAaLidBuv6kWgGvkbw5zhjwydjsbOHFOAyi0qBwlWdj2zGEuwaULyEdl8fOHCUbb1nI4=
x-ms-office365-filtering-correlation-id: f09f7c33-df08-4c4b-71ed-08d680b10a44
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1733; 
x-ms-traffictypediagnostic: CY4PR15MB1733:
x-microsoft-antispam-prvs: <CY4PR15MB1733B522B61C64B5E1998BBADD980@CY4PR15MB1733.namprd15.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(316002)(11346002)(46003)(33656002)(256004)(76176011)(14444005)(2616005)(476003)(486006)(97736004)(14454004)(99286004)(6916009)(86362001)(446003)(81166006)(81156014)(478600001)(8676002)(53936002)(8936002)(106356001)(105586002)(2906002)(4326008)(305945005)(7736002)(6116002)(25786009)(6246003)(36756003)(229853002)(102836004)(6486002)(6436002)(82746002)(83716004)(71190400001)(71200400001)(68736007)(6512007)(3480700005)(6506007)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1733;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VamFN4ojSFIOuERwqmP2x/EhBFXNyhJqd2aPS0sFfeRDG2T8PS/0u4a8NrQjNHPooLhAeUX1NtJQPwGvi2pnDnds+x1XA442DuWJiSOt3yt0AJ0RwbiBWlfDyXeDU1UFi2+Gx5TE0FGY6suT9+BnCDaw8wNdT+m+uhUKtM7CEvOeUsANHtKz2Ho3PeN1VwrCSp9UK8iXr9fvZmaG/R+o0/yZHUSGobqBRA+v/umFP/VQvcpC5OKxVgLCNImVYNGSHOHhfYm82LfvOvE+ksbhl+fehN1BNfhyGctosTUbXGiBuPfQ3XN80hu2FsuS0vme6LjYy3rgthsHnxgrrA49newTJWunaC7xGvGt7iwWtEd7F377MHpC8kzIS559aiCVq53mgV6R4FiYu2a8oYOJb7FLuxkNmVphyxx9EFFOEeQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA9CEFE29AD92147B9F555FAB4DA7A4D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f09f7c33-df08-4c4b-71ed-08d680b10a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 21:31:58.7453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1733
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-22_11:, , signatures=0
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
X-List-Received-Date: Tue, 22 Jan 2019 21:32:34 -0000

DQoNCu+7v09uIDEvMjIvMTksIDEyOjUzIFBNLCAiQnJhZCBCaXNob3AiIDxicmFkbGV5YkBmdXp6
aWVzcXVpcnJlbC5jb20+IHdyb3RlOg0KDQogICAgT24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgMDY6
MTY6MjBQTSArMDAwMCwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gVGVhbSwNCiAgICA+IElu
dGVsLWlwbWktb2VtIHNob3VsZCBiZSBicm9rZW4gYW5kIDIgcGFydHMsIGdlbnJpYyBhbmQgb2Vt
IHNwZWNpZmljLiBJIHNlZSBzZXZlcmFsIGZ1bmN0aW9uYWxpdHkgaW4gdGhpcyByZXBvIGxpa2Ug
c2Vuc29ycyBhbmQgc3RvcmFnZSBjb21tYW5kcyBhcmUgZ2VuZXJpYyBlbm91Z2ggdG8gYmUgdXNl
ZCBieSBvdGhlciBwbGF0Zm9ybSB3aG8gaXMgdXNpbmcgZW50aXR5IG1hbmFnZXIuIFNvIEkgZmVl
bCB0aGF0IHdlIHNob3VsZCBoYXZlIHRoZXNlIGZ1bmN0aW9uYWxpdGllcyB0byBiZSBtb3ZlZCB0
byBhIHNlcGFyYXRlIGNvbW1vbiByZXBvIHdoaWNoIGNhbiBiZSB1c2VkIGJ5IGV2ZXJ5b25lIGFu
ZCB0aGlzIHJlcG8gY2FuIG9ubHkgY29udGFpbiBJbnRlbCBPRU0gc3BlY2lmaWMgSVBNSSBjb21t
YW5kIHN1cHBvcnQuDQogICAgPiANCiAgICA+IE15IDIgY2VudHMg8J+Yig0KICAgIA0KICAgIElu
IGdlbmVyYWwgSSBzdXBwb3J0IHRoZSBnb2FsIGhlcmUuDQogICAgDQogICAgTW9yZSByZXBvcywg
c3VyZS4gIExldCBtZSBrbm93IHdoYXQgeW91IHdhbnQgdGhlbSBjYWxsZWQsIHdobyB0aGUNCiAg
ICBtYWludGFpbmVycyBvZiBlYWNoIHNob3VsZCBiZSwgYW5kIGNvbmZpcm0gdGhhdCB0aGV5IGNh
biBiZSBsaWNlbnNlZA0KICAgIGFzIEFwYWNoZS0yLjAuDQpZZXMsIEkgd291bGQgcHJlZmVyIG1v
cmUgb2YgZ2VuZXJpYyBjb2RlIGFwcHJvYWNoIHdoaWNoIGNhbiBiZW5lZml0IG1hbnkgdXNlcnMu
DQpVbHRpbWF0ZSBnb2FsIGlzIG1vcmUgbWFuYWdlYWJsZSBjb2RlIGFuZCB1c2VmdWwgdG8gZXZl
cnlvbmUuDQogICAgDQogICAgU29ycnkgVmlqYXkgLSBJJ20gZ29pbmcgdG8gaGlqYWNrIHlvdXIg
dGhyZWFkLiAgVGhpcyBpcyBzb21ldGhpbmcNCiAgICBJJ3ZlIGJlZW4gdGhpbmtpbmcgYWJvdXQg
bGF0ZWx5IGFuZCB5b3VyIG5vdGUgcHV0IGl0IGF0IGEgdGlwcGluZw0KICAgIHBvaW50IGZvciBt
ZS4NCk5vIGlzc3VlIEJyYWQuIA0KICAgIA0KICAgIFdlIGhhdmUgZXZvbHZlZCBpbnRvIGEgYml0
IG9mIGEgd2lsZC13ZXN0IGN1bHR1cmUgYXMgZmFyIGFzIHB1dHRpbmcgY29kZQ0KICAgIChyZXBv
cykgdXAgaW4gdGhlIG9wZW5ibWMgbmFtZXNwYWNlLiAgVGhlcmUgYXJlIHNpbXBseSBubyBydWxl
cyBhdCBhbGwuDQogICAgQW55b25lIGNhbiBzaW1wbHkgYXNrIEJyYWQgZm9yIGEgcmVwbyBhbmQg
aXQgZ2V0cyBjcmVhdGVkLCBubyBxdWVzdGlvbnMNCiAgICBhc2tlZCwgbm8gYWNjb3VudGFiaWxp
dHkuDQogICAgDQogICAgU28gSSBndWVzcyBhIHF1aWNrIHBvbGwgLSBkb2VzIGFueW9uZSBmaW5k
IHRoaXMgY29uY2VybmluZyAob3Igbm90KT8NCiAgICANCiAgICBmd2l3LCBJIHRoaW5rIEknbSBv
ayB3aXRoIHRoaXMgbW9kZWwgYXQgdGhpcyBwb2ludCBpbiB0aGUgcHJvamVjdCwNCiAgICBhc3N1
bWluZyB0aGF0IHRoZSBydWxlcyAob3IgbGFjayB0aGVyZW9mKSBhcHBseSB0byBldmVyeW9uZSBl
cXVhbGx5Lg0KICAgIA0KICAgIHRoeCAtIGJyYWQNCiAgICANCg0K
