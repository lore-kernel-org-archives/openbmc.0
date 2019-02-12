Return-Path: <prvs=794647f5a5=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=794647f5a5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="eQl+HSDJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GgoMC9c7"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zbWZ5BfszDqKJ
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 08:33:58 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1CLSafg010202; Tue, 12 Feb 2019 13:33:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=cbkVTR7UncEp+Pda9hKF3XSIq5bOz0ABmy6TrGf1NzI=;
 b=eQl+HSDJtvziT1dunwmgmLRn04uQ3urtKgGmmzxjk/t7spAZsXyWtlLh7TCXTEpTFAfE
 z7xHxIwEogr1XJoDeK5AquMRZPsyD+6uOzuWu3g4GsbnQhl7bTHVLzKjWZqbiEGPQy0O
 H1XRMkrwpqV/lEev4eD4SSYaAjno+U4lrRA= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qm37m0nh1-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 12 Feb 2019 13:33:53 -0800
Received: from frc-mbx08.TheFacebook.com (192.168.155.29) by
 frc-hub05.TheFacebook.com (192.168.177.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 12 Feb 2019 13:33:52 -0800
Received: from frc-hub06.TheFacebook.com (192.168.177.76) by
 frc-mbx08.TheFacebook.com (192.168.155.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 12 Feb 2019 13:33:51 -0800
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.76) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 12 Feb 2019 13:33:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbkVTR7UncEp+Pda9hKF3XSIq5bOz0ABmy6TrGf1NzI=;
 b=GgoMC9c7dA1GgnzFqyBFZ7R4hq2lCNDmaWGinS+wU9Yj9yHJo0L3BQShzAXbn/q+BySienSN1CWso0r7Mt+TNXCvs4Nvn1tailgdBjVVWjEIi+RnAxFKhqrBEviauYj6bxUyN5jk7XMhGspkQ+0cYuBSi3h6Q6FIRNfTBbFadCI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1173.namprd15.prod.outlook.com (10.172.177.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Tue, 12 Feb 2019 21:33:50 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6%2]) with mapi id 15.20.1601.023; Tue, 12 Feb 2019
 21:33:50 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>, William Kennington <wak@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: Re: Host-side tools
Thread-Topic: Host-side tools
Thread-Index: AQHUwiN5blX/bhX1i0epLOTsv/LX8aXa8R4AgAAQRICAADTUAIAAAqSAgADyCoA=
Date: Tue, 12 Feb 2019 21:33:50 +0000
Message-ID: <EC08735B-9BC7-4781-9DD9-2CC9DA63DCE5@fb.com>
References: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
 <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
 <CAPnigKm9Sce7DbBjKf7tGJrgVPyF=2u04GFPW4FTzeHKUHYhTg@mail.gmail.com>
 <CAO=notwCLir90VDFiNHWKwYHuKJ6k7TWrCECkWkAe3QKprc_hg@mail.gmail.com>
 <CAO=notyaqHWYHk3+wekPMLBK_==vwDT-+ccyNMxXPcRKwvPZDQ@mail.gmail.com>
In-Reply-To: <CAO=notyaqHWYHk3+wekPMLBK_==vwDT-+ccyNMxXPcRKwvPZDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:3bde]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d8aab3e-04b9-4fa3-ef56-08d69131c74d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1173; 
x-ms-traffictypediagnostic: CY4PR15MB1173:
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1173;
 20:4bQMf918PYjxEpLf2mcLGnDVRF+QiN2AGV29UKLPNHQXNeQcQfBFyWkKumFFQU6qa19wrzUADk1J/c05Q8ak8/yOa/ozNvfDoZJZu1rKaclVadW+kZuCZhHmOVEWTaZkOg7CYf9mwQbTRbbwvInLjREqhwg/1n3QZF8NIEoJg0k=
x-microsoft-antispam-prvs: <CY4PR15MB1173BD19D19E0D12D39789D4DD650@CY4PR15MB1173.namprd15.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(136003)(39860400002)(366004)(346002)(189003)(199004)(6246003)(256004)(3480700005)(7736002)(106356001)(8676002)(6506007)(81166006)(4326008)(83716004)(81156014)(53546011)(6436002)(86362001)(6116002)(93886005)(8936002)(305945005)(82746002)(36756003)(229853002)(186003)(2616005)(476003)(2906002)(46003)(446003)(11346002)(14454004)(99286004)(110136005)(6486002)(71200400001)(25786009)(71190400001)(54906003)(6512007)(97736004)(68736007)(76176011)(478600001)(105586002)(102836004)(33656002)(486006)(53936002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1173;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AsQQZIlHwgN7d42N361ufzX/b+WMdvybfGWRz86hEQf7G/5wdgCZ2h6GAerSpuPVEkEpYFU0Mt+sE1f6SRKHWSkWOS8Y6zGK4TQtPr49SpR/MCLiUdOPjr8glk0KfKXOQ9M3Dyfon/E1ECWenWklTV8oT4btkfWv2xIt4nxJuN1vOEZt0etA7rK0m4ZB2+RvpUdkHCPQOwECUy1eV77OHNdJwVM2PI7MKnQYklRdp94JwR3C+5iGxoyC+zpsoMYoe6x3qFY2xySqmAnMEoe/0DmC1pkgQMkTTgdj8TWIbXCzNkmVw+suaknnU8UvYS0RYa6CKFDHA6JewElvCnSwELx0BQYz0GaZusTP/fCSn4W6Fg4s44IO/aNsIkVoyydwZN+6aBbqSZemjJDfEdu0EiUT8UReQezThMcEOrZ7HYQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3336B5B439B1624D9133C385B4ECE722@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8aab3e-04b9-4fa3-ef56-08d69131c74d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 21:33:50.1661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1173
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_11:, , signatures=0
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
X-List-Received-Date: Tue, 12 Feb 2019 21:34:04 -0000

DQoNCu+7v09uIDIvMTEvMTksIDM6MDggUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBQYXRyaWNr
IFZlbnR1cmUiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQoNCiAgICBPbiBN
b24sIEZlYiAxMSwgMjAxOSBhdCAyOjU4IFBNIFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29n
bGUuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBPbiBNb24sIEZlYiAxMSwgMjAxOSBhdCAxMTo0
OSBBTSBXaWxsaWFtIEtlbm5pbmd0b24gPHdha0Bnb29nbGUuY29tPiB3cm90ZToNCiAgICA+ID4N
CiAgICA+ID4gQXMgbG9uZyBhcyBpdCdzIHBvc3NpYmxlIHRvIGJ1aWxkIHRoZSBob3N0IHNpZGUg
dG9vbGluZyB3aXRob3V0DQogICAgPiA+IGJ1aWxkaW5nIGFueSBvZiB0aGUgQk1DIHNpZGUgdG9v
bGluZyBhbmQgdmljZSB2ZXJzYSBpdCBzb3VuZHMgZmluZSB0bw0KICAgID4gPiBtZS4NCiAgICA+
DQogICAgPiBJJ3ZlIGJlZW4gZG9pbmcgYSBsb3Qgb2YgaG9zdC1zaWRlIGRldmVsb3BtZW50IGxh
dGVseSBhbmQgSSB3YXMNCiAgICA+IGludGVyZXN0ZWQgdG8ga25vdyB3aGF0IHRoZSBlbmQgcmVz
dWx0IHdvdWxkIGJlLiAgSWYgc29tZW9uZSByYW4gdGhlDQogICAgPiBjb25maWd1cmF0aW9uIGp1
c3QgdG8gdXNlIHRoZSB0b29sLCB0aGV5IG1pZ2h0IHJ1biBpbnRvIGlzc3Vlcy4gIEkndmUNCiAg
ICA+IGF2b2lkZWQgdXNpbmcgQk1DLXNpZGUgbGlicmFyaWVzIHdoZXJlIHBvc3NpYmxlIHRvIGF2
b2lkIGhvc3Qtc2lkZQ0KICAgID4gdG9vbCBwb2lzb25pbmcuDQogICAgPg0KICAgID4gPg0KICAg
ID4gPiBPbiBNb24sIEZlYiAxMSwgMjAxOSBhdCAxMDo1MSBBTSBCcmFkIEJpc2hvcA0KICAgID4g
PiA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiB3cm90ZToNCiAgICA+ID4gPg0KICAgID4g
PiA+IE9uIE1vbiwgRmViIDExLCAyMDE5IGF0IDA4OjAzOjE3QU0gLTA4MDAsIFBhdHJpY2sgVmVu
dHVyZSB3cm90ZToNCiAgICA+ID4gPiA+QnJhZCwNCiAgICA+ID4gPiA+DQogICAgPiA+ID4gPkl0
J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IGhvc3Qtc2lkZSB0b29scyB0aGF0IGNvb3BlcmF0ZSB3
aXRoIGJtYy1zaWRlDQogICAgPiA+ID4gPnRvb2xzIHNob3VsZCBiZSBpbiB0aGUgc2FtZSByZXBv
LA0KICAgID4gPiA+DQogICAgPiA+ID4gSXMgdGhpcyBzb21ldGhpbmcgSSBzYWlkIGF0IHNvbWUg
cG9pbnQ/ICBXaGVyZSBpcyB0aGlzIGNvbWluZyBmcm9tPw0KICAgID4NCiAgICA+IEkgZG9uJ3Qg
aGF2ZSB0aGUgZXhhY3QgZW1haWwsIGFuZCBpdCBtaWdodCBoYXZlIGJlZW4gdmVyeSB2ZXJ5IHN0
YWxlDQogICAgPiBpbmZvcm1hdGlvbi4gIEJ1dCBJJ20gZ2xhZCB0byBjbGVhciB0aGlzIHVwISA6
RA0KICAgID4NCiAgICA+ID4gPg0KICAgID4gPiA+ID5oZW5jZSB3aHkgdGhlIGhvc3Qtc2lkZSBi
bG9icyBzdHVmZiBpcyBpbiBwaG9zcGhvci1pcG1pLWZsYXNoLg0KICAgID4gPiA+ID5Ib3dldmVy
LCBpZiBJIGFkZCBhbnkgZGVwZW5kZW5jaWVzIHRvIHRoZSBjb25maWd1cmF0aW9uIGZvciB0aGUN
CiAgICA+ID4gPiA+Qk1DLXNpZGUsIHRob3NlIGdldCBpbiB0aGUgd2F5IG9mIGNvbmZpZ3VyaW5n
IGZvciB0aGUgaG9zdC1zaWRlLiAgV291bGQNCiAgICA+ID4gPiA+aXQgbm90IG1ha2Ugc2Vuc2Ug
dG8gc29tZXRpbWVzIGhhdmUgaXQgc3BsaXQ/ICBBbmQgaWYgc28sIEkgd291bGQgbGlrZQ0KICAg
ID4gPiA+ID50byBwcm9wb3NlIGNyZWF0aW5nIHR3byByZXBvcywgYSBibG9icyBsaWJyYXJ5IGhv
c3Qtc2lkZSwgYW5kIGEgZmxhc2gNCiAgICA+ID4gPiA+dG9vbCBob3N0LXNpZGUgcmVwbywgc28g
dGhvc2UgY2FuIGJlIG5lYXRseSBzcGxpdCBhbmQgbm90IGhhdmUgYW55dGhpbmcNCiAgICA+ID4g
PiA+aW4gdGhlaXIgY29uZmlndXJhdGlvbiBmaWxlIHRoYXQncyByZWFsbHkgYm1jLXNpZGUgc3Bl
Y2lmaWMsIGxpa2UNCiAgICA+ID4gPiA+aXBtaWQsIG9yIHBob3NwaG9yLWRidXMtaW50ZXJmYWNl
LCBvciBzb21ldGhpbmcuDQogICAgPiA+ID4NCiAgICA+ID4gPiBJIGNhbiBtYWtlIGEgcmVwbyBp
ZiB5b3Ugd291bGQgbGlrZS4gIEp1c3QgbGV0IG1lIGtub3cgd2hhdCB5b3Ugd291bGQNCiAgICA+
ID4gPiBsaWtlIGl0IGNhbGxlZC4NCiAgICA+DQogICAgPiBUaGFua3MuICBJJ20gd29ya2luZyBv
biBhbiBJUE1JIGJsb2IgdG9vbHNldCwgc3VjaCB0aGF0IHRoZXJlIGlzIGENCiAgICA+IGxpYnJh
cnkgdGhhdCBwcm92aWRlcyBob3N0LXNpZGUgYmxvYiB0b29saW5nLCBhbmQgdGhlbiB0aGUgZmxh
c2ggaG9zdA0KICAgID4gdG9vbHNldCBjYW4gbGluayBhZ2FpbnN0IHRoYXQgbGlicmFyeSBhbmQg
YmUgdXNlZCBvbiB0aGUgaG9zdC4NCiAgICA+DQogICAgPiBTbyB0aGF0J3MgbXkgZ29hbC4gIFRv
IGdldCB0aGVyZSBJIHdhcyB0aGlua2luZywNCiAgICA+IHBob3NwaG9yLWlwbWktYmxvYnMtdG9v
bCAob3IgaXBtaS1ibG9icy1saWIpIGFuZA0KICAgID4gcGhvc3Bob3ItaXBtaS1mbGFzaC10b29s
IGZvciB0aGF0IHNpZGUuICBUaGUgYXJndW1lbnQgYWdhaW5zdA0KICAgID4gaXBtaS1ibG9icy1s
aWIgaXMgdGhhdCB0aGVyZSBtYXkgZW5kIHVwIGJlaW5nIHNvbWUgYmFzaWMgdG9vbCB0aGVyZQ0K
ICAgID4gdG9vbCBhbmQgbm90IGp1c3QgdGhlIGxpYnJhcnkgLS0gZG8geW91IGhhdmUgYW55IHBy
ZWZlcmVuY2UgaW4gdGhpcw0KICAgID4gY2FzZT8NCiAgICANCiAgICBSZXZpZXdpbmcgbXkgZ29h
bHMgZnVydGhlciwgdGhlIGlkZWEgb2YgaGF2aW5nIGFuIGlwbWktYmxvYnMtbGliIG9yDQogICAg
aXBtaS1ibG9ic2xpYiByZXBvIHdvdWxkIGJlIGhlbHBmdWwuICBJIGNvdWxkIGRvIGFsbCB0aGUg
aG9zdC1zaWRlDQogICAgYmxvYiB0b29saW5nIHRoZXJlLCBhbmQgaGF2ZSB0aGF0IGJlIGEgZGVw
ZW5kZW5jeSBvZg0KICAgIHBob3NwaG9yLWlwbWktZmxhc2gtdG9vbC4gIFdoaWNoIGxlYXZlcyBt
ZSB3aXRoIHR3byByZXBvIHJlcXVlc3RzOg0KICAgIA0KICAgIGlwbWktYmxvYnNsaWINCiAgICBw
aG9zcGhvci1pcG1pLWZsYXNoLXRvb2wNCg0KQ2FuIHdlIG5hbWUgYXMgInBob3NwaG9yLWhvc3Qt
dG9vbHMgaW5zdGVhZCBvZiBjYWxsaW5nIGlwbWktYmxvYi4NCkFzIHdlIGNhbiBoYXZlIHNpbWls
YXIgdG9vbHMgcmVwbyBmb3IgYm1jIGFuZCB3ZSBjYW4gY2FsbCBpdCBhcyANCnBob3NwaG9yLWJt
Yy10b29scy4gQWxsIGhvc3QgcmVsYXRlZCB0b29scyBjYW4gYmUgaW4gb25lIHNpbmdsZSANCnJl
cG8gYW5kIGJtYyB0b29scyBjYW4gYmUgaW4gYW5vdGhlciBzaW5nbGUgcmVwby4NCiAgICANCiAg
ICBZb3UgY291bGQgYWRkIHRoZSBwaG9zcGhvciBwcmVmaXggdG8gdGhlIGlwbWktYmxvYnNsaWIg
aWYgeW91IHdhbnRlZA0KICAgIGZvciBjb25zaXN0ZW5jeSBzaW5jZSBpdHMnIG1lYW50IHRvIHdv
cmsgd2l0aCBhbmQgb24gdGhlIHBob3NwaG9yDQogICAgZW52aXJvbm1lbnQuDQogICAgDQogICAg
DQogICAgPg0KICAgID4gSSdtIGRlZmluaXRlbHkgc2Vla2luZyBzdWdnZXN0aW9ucyBvbiB0aGlz
Lg0KICAgID4NCiAgICA+ID4gPg0KICAgID4gPiA+IFRoYXQgc2FpZCwgSSB0aGluayB5b3UgY2Fu
IGFsc28gcHJvYmFibHkgZG8gdGhpcyBpbiB0aGUgc2FtZSByZXBvLCBpZg0KICAgID4gPiA+IHlv
dSB3YW50ZWQsIGJ5IGhhdmluZyBkaWZmZXJlbnQgYnVpbGQgdGFyZ2V0cyAtIGl0IG1pZ2h0IG5v
dCBtYWtlIGFueQ0KICAgID4gPiA+IHNlbnNlIHRvIHRyeSBhbmQgYnVpbGQgYm90aCBhcHBsaWNh
dGlvbnMgd2l0aCBhIHNpbmdsZSBpbnZvY2F0aW9uIG9mDQogICAgPiA+ID4gY29uZmlndXJlIC0g
YXMgeW91IHBvaW50IG91dCwgdGhleSBhcmUgYmVpbmcgImNvbmZpZ3VyZWQiIGZvciB2YXN0bHkN
CiAgICA+ID4gPiBkaWZmZXJlbnQgcnVudGltZSBlbnZpcm9ubWVudHMuDQogICAgDQoNCg==
