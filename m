Return-Path: <prvs=58727e8b49=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=58727e8b49=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="qwLvfmW1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Eh/UfDdi"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4368TY3cMczDrPy
 for <openbmc@lists.ozlabs.org>; Sat,  1 Dec 2018 09:39:43 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAUMcXIL005314; Fri, 30 Nov 2018 14:39:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=EG3vMkKklntwlLo/UP/ivhqGbzHSI+ObQhXODGrIVyg=;
 b=qwLvfmW1N/ihF3is7JTBh5Db/ZJN0K2PNFWXOfmkbxytU6Rcvm5waH/xPDatnwztec1A
 9m095hvZrKnRm+zDWOBuAdYyOmcXVGA89Z2oK78UAwaJwNM20E7xw5OoCRtlCj8UhMUj
 GQZ+gHH3OJHDUJcLJS4fEfCDEqXN2e+HR08= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p3ata8peq-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 30 Nov 2018 14:39:28 -0800
Received: from frc-mbx02.TheFacebook.com (2620:10d:c0a1:f82::26) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 30 Nov 2018 14:39:18 -0800
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-mbx02.TheFacebook.com (2620:10d:c0a1:f82::26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 30 Nov 2018 14:39:18 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.71) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 30 Nov 2018 14:39:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EG3vMkKklntwlLo/UP/ivhqGbzHSI+ObQhXODGrIVyg=;
 b=Eh/UfDdiKn0H+vZKK29bmvbNr8U/cJDK+wjWWQBcR/Z+zbCL+mzDV3bRicCB+gSegC5KVPSmCbp56NUie0cnOyBBNhxupf+wE1e7P8RSvldUHhs869hx8ruH9NSjLXE/OBi+ozzQN5bowo5ZC2KivpPZcNx3d6QsvPLeA107nWw=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1126.namprd15.prod.outlook.com (10.172.175.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.21; Fri, 30 Nov 2018 22:39:16 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::19df:d934:b961:5442%5]) with mapi id 15.20.1382.020; Fri, 30 Nov 2018
 22:39:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Samuel Jiang
 <chyishian.jiang@gmail.com>, qianlihu <wangzhiqiang8906@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUfAaAMP2kbKDNOUGRurHcg5+B4KVPg+eAgACO1QCAASihgIAVbPaAgACKdwCAAIbQgIAA0d+A//+zjgCAAI7agP//rwCA
Date: Fri, 30 Nov 2018 22:39:16 +0000
Message-ID: <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
In-Reply-To: <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:6414]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1126;
 20:UPrQBFEkuFzV+d0drMqyc6YUvuQcfASEA2TbAMpdukrp42YRRI4pLGNNwg36QtHLgi84cnpukxrk29iRv351XJQ915+w80npVharNKIGskiBqpF6+yjfmY3mrJSpTeLdsz6e+bi4MAOVSjTo+ELW99hkJBH4wJTfOkHWXBzBCJE=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8b36f260-ff9e-4241-dc60-08d65714a908
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1126; 
x-ms-traffictypediagnostic: CY4PR15MB1126:
x-microsoft-antispam-prvs: <CY4PR15MB112658E4D10F9E34FDFBDE13DDD30@CY4PR15MB1126.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231453)(999002)(11241501185)(944501469)(52105112)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1126; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1126; 
x-forefront-prvs: 087223B4DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(136003)(346002)(376002)(199004)(189003)(71200400001)(476003)(97736004)(7736002)(110136005)(82746002)(68736007)(256004)(486006)(316002)(46003)(6116002)(86362001)(39060400002)(33656002)(36756003)(305945005)(6246003)(4326008)(6436002)(6506007)(53546011)(6486002)(102836004)(6512007)(229853002)(478600001)(186003)(2906002)(53936002)(14454004)(446003)(11346002)(2616005)(5660300001)(106356001)(25786009)(8676002)(99286004)(83716004)(93886005)(165073002)(8936002)(81166006)(71190400001)(81156014)(76176011)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1126;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: RyIEkYhUABBEAetg/MTo5Q6s0x4Bor0dgoy0BoqPLkjxo0OOyZSiQYHE6YlrlhJCZ9iqNiJz9XO7cP8SKAXTcs4Ox/ruY3nMW2d3mHcsOoJNwpNYiBI9mWKf4x5KZzOzML6Aix8vTr9fPns+1nsxezVcM3zvE4n/qhfGLR8JViR54ukGWeGjRP8SAgsD+ijQVpO9UmkUjegk3lNTY7FUg6v2nLm10TUAnbnxiwrq/vtj+iBQoGaCyAu1E7tP2dmWmMR9FmrX1PSp1fqGtyKpP+xxL2OvTy/n8AMPk7IG4tM+n9oLQsJfb3+blJ1xpzeRY/MM9ID7XDdCu7xYShOkhupO72RRH8dAzG2bT6NiF48=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <40BAFE97B0EF04469A1412CD9F78ED65@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b36f260-ff9e-4241-dc60-08d65714a908
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2018 22:39:16.4805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1126
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-30_11:, , signatures=0
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
X-List-Received-Date: Fri, 30 Nov 2018 22:39:46 -0000

DQoNCu+7v09uIDExLzMwLzE4LCAxMToyOSBBTSwgIkphZSBIeXVuIFlvbyIgPGphZS5oeXVuLnlv
b0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KDQogICAgT24gMTEvMzAvMjAxOCAxMjo1NyBQTSwg
VmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gDQogICAgPiBPbiAxMS8zMC8xOCwgNzozMSBBTSwg
IkphZSBIeXVuIFlvbyIgPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KICAg
ID4gDQogICAgPiAgICAgIE9uIDExLzI5LzIwMTggOTowMCBQTSwgU2FtdWVsIEppYW5nIHdyb3Rl
Og0KICAgID4gICAgICA+IEhpIEphZSwNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IFdlIGFs
c28gZW5jb3VudGVyZWQgdGhlIHNhbWUgc2l0dWF0aW9uIGEgbW9udGggYWdvLg0KICAgID4gICAg
ICA+IFdlIHRyeSB0byBlbmFibGUgdGhlIExQQyBjbG9jayBvbiBkZXZpY2V0cmVlIHRvIHJlc29s
dmUgdGhpcyBwcm9ibGVtIG5vdA0KICAgID4gICAgICA+IGRpcmVjdCBtb2RpZnkgY2xvY2sgZHJp
dmVyLg0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gbHBjX2N0cmw6IGxwYy1jdHJsQDAgew0K
ICAgID4gICAgICA+IOKAgyBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLWxwYy1jdHJs4oCd
Ow0KICAgID4gICAgICA+IOKAgyByZWcgPSA8MHgwIDB4ODA+Ow0KICAgID4gICAgICA+IOKAgyBj
bG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0dBVEVfTENMSz47DQogICAgPiAgICAgID4gICAg
ICBzdGF0dXMgPSDigJxva2F54oCdOw0KICAgID4gICAgICA+IH07DQogICAgPiAgICAgID4NCiAg
ICA+ICAgICAgPiBIb3dldmVyLCBJ4oCZbSBub3Qgc3VyZSB3aGljaCBpcyBiZXR0ZXIgZm9yIExQ
Q19DTENLIHNldHRpbmcuDQogICAgPiAgICAgID4gV2hldGhlciB3ZSBzaG91bGQgbW9kaWZ5IGRy
aXZlciBpZiBvcmlnaW5hbCBkYXRhIGlzIGVuYWJsZWQgb3Igc2hvdWxkDQogICAgPiAgICAgID4g
ZW5hYmxlIG9uIHRoZSBkZXZpY2UgdHJlZSwgY29ycmVjdD8NCiAgICA+ICAgICAgPg0KICAgID4g
ICAgICA+DQogICAgPiAgICAgIA0KICAgID4gICAgICBIaSBTYW11ZWwsDQogICAgPiAgICAgIA0K
ICAgID4gICAgICBZZXMsIHlvdSBhcmUgcmlnaHQuIEkgcmVhbGl6ZWQgdGhhdCBrY3NfYm1jX2Fz
cGVlZC5jIGRvZXNuJ3QgaGF2ZSBhbnkNCiAgICA+ICAgICAgY2xvY2sgY29udHJvbCBjb2RlIHNv
IGFkZGluZyBhIGNsb2NrcyBzZXR0aW5nIGludG8ga2NzIGR0c2kgY29kZSBkb2Vzbid0DQogICAg
PiAgICAgIG1ha2UgYW55IGhlbHAuIEFsc28sIGl0IHdhcyB0aGUgcmVhc29uIHdoeSB0aGUgY2hh
bmdlIGlzIG5lZWRlZCBvbg0KICAgID4gICAgICBjbGstYXNwZWVkLmMuIEVuYWJsaW5nIGxwY19j
dHJsIG5vZGUgeW91IHN1Z2dlc3RlZCBzZWVtcyBhIHJpZ2h0IHdheS4NCiAgICA+ICAgICAgDQog
ICAgPiAgICAgIEhpIFZpamF5LA0KICAgID4gICAgICBDYW4geW91IHBsZWFzZSB0cnkgdGhlIHdh
eSBTYW11ZWwgc3VnZ2VzdGVkIGFmdGVyIHJlbW92aW5nIGNoYW5nZXMgSQ0KICAgID4gICAgICBn
YXZlIHlvdS4gU2FtdWVsJ3Mgc29sdXRpb24gbG9va3MgZ29vZCB0byBtZS4NCiAgICA+ICAgICAg
DQogICAgPiAgICAgIFRoYW5rcywNCiAgICA+ICAgICAgSmFlDQogICAgPiAgICAgIA0KICAgID4g
SmFlLA0KICAgID4gSSBjYW4gdHJ5LiBXZSBjYW4gY2VydGFpbmx5IGVuYWJsZSBscGNfY3RybCBu
b2RlIGJ1dCBpbiBteSB1bmRlcnN0YW5kaW5nIHRoYXQNCiAgICA+IHdlIHN0aWxsIG5lZWQgdGhp
cyBiZWxvdyBwYXRjaCB0byByZWRlZmluZSBBU1BFRURfQ0xLX0dBVEVfTENMSyB2YWx1ZSB0bw0K
ICAgID4gYWRkIENSSVRJQ0FMLiBJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUuDQog
ICAgPiAgICAgIC0gW0FTUEVFRF9DTEtfR0FURV9MQ0xLXSA9IHsgOCwgNSwgImxjbGstZ2F0ZSIs
IE5VTEwsIDAgfSwgLyogTFBDICovDQogICAgPiAgICAgKyBbQVNQRUVEX0NMS19HQVRFX0xDTEtd
ID0geyA4LCA1LCAibGNsay1nYXRlIiwgTlVMTCwgQ0xLX0lTX0NSSVRJQ0FMIH0sIC8qIExQQyAq
Lw0KICAgID4gDQogICAgDQogICAgVmlqYXksDQogICAgDQogICAgSSBjaGVja2VkIHRoYXQgbHBj
X2N0cmwgbW9kdWxlIGhhcyBjbG9ja3MgZHQgcHJvcGVydHkgaGFuZGxpbmcgY29kZSBpbg0KICAg
IHRoZSBtb2R1bGUgc28gSSB0aGluayB0aGUgTENMSyB3b3VsZCBiZSBlbmFibGVkIHdpdGhvdXQg
dGhlIGNsay1hc3BlZWQuYw0KICAgIGZpeC4gSSBjYW4ndCB0ZXN0IGl0IG5vdyBiZWNhdXNlIEkn
bSBpbiBhIGJ1c2luZXNzIHRyaXAgc28gcGxlYXNlIHRlc3QNCiAgICBpdC4gSSdsbCBhbHNvIGNo
ZWNrIGl0IHdoZW4gSSBiYWNrIHRvIG9mZmljZSBhIHdlZWsgYWZ0ZXIuDQogICAgDQogICAgVGhh
bmtzLA0KICAgIEphZQ0KICAgIA0KSmFlLA0KSSByZW1vdmVkIGFib3ZlIGFzcGVlZCBjbG9jayBk
cml2ZXIgcGF0Y2gsIGFuZCBlbmFibGVkIGxwYy1jdHJsIG5vZGUgaW4gZHRzIGFsc28gcmVtb3Zl
ZCBjbG9jayBkZWZpbml0aW9uIGZyb20ga2NzLiBBbmQgSSBkb24ndCBzZWUgaG9zdCBpcyBnZXR0
aW5nIHBvd2VyZWQgb24uIEl0IHdvcmtzIG9ubHkgd2l0aCBjbG9jayBkcml2ZXIgY2hhbmdlLg0K
DQpBbmQgSSBzdGlsbCBkaWRuJ3QgdW5kZXJzdGFuZCBob3cgZW5hYmxpbmcgbHBjLWN0cmwgbm9k
ZSB3aWxsIGluaXRpYWxpemUgQVNQRUVEX0NMS19HQVRFX0xDTEsgdG8gQ1JJVElDQUwuDQoNCi1W
aWpheQ0KDQo=
