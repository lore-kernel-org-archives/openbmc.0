Return-Path: <prvs=5890bfcd82=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5890bfcd82=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="OgoseSVN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="SjvnKuLq"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43K6jV0m1czDqXZ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 05:58:01 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBIItgGA004841; Tue, 18 Dec 2018 10:57:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=cr3kqCZbnA0/2i9I/9d50wD6QMXJEilhQS97YM85yNo=;
 b=OgoseSVNvrxWzdvxOTscvesglo8qLBUcZKXxrG3YiM4a2jAEW6EfTr9fCnEC90hAo0Do
 IbJ61I9BvNC1Bly2O9Q+p9Qhvf6eCV4C9/rd3da8tEFg1lf5m48scMnKfiZ+8hfXKCyr
 xtNnCX31lspmG+lJPSdBUEbelX4JGTS6/eA= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pf4ts0g58-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 18 Dec 2018 10:57:54 -0800
Received: from frc-mbx03.TheFacebook.com (2620:10d:c0a1:f82::27) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 18 Dec 2018 10:57:50 -0800
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-mbx03.TheFacebook.com (2620:10d:c0a1:f82::27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 18 Dec 2018 10:57:50 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.71) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 18 Dec 2018 10:57:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr3kqCZbnA0/2i9I/9d50wD6QMXJEilhQS97YM85yNo=;
 b=SjvnKuLqwRcEC8zKG8pCHJlK9u11uwFEg1eq+iuoMav6i1VFBGQ2xoOuxC3cvIFS8oNOLkxJ+6RiCNMb8cPiYaPZcveLo8yEu2L5VHHkKIAlRnYdIc03DVtU98vMbrMS/BOZUA1fKMkzjKpo1qwkRIusrU4eI+PVcPpe6JCOot0=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1557.namprd15.prod.outlook.com (10.172.162.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.19; Tue, 18 Dec 2018 18:57:49 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1bd:fa86:857:9b04%10]) with mapi id 15.20.1446.018; Tue, 18 Dec 2018
 18:57:49 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>,
 =?utf-8?B?R2VvcmdlIExpdSjliJjplKHkvJ8p?= <liuxiwei@inspur.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Fan speed control
Thread-Topic: Fan speed control
Thread-Index: AQHUlmPa9RVzvtJvukS7iw8SULIx56WD/TCAgAC7RgD//5vIAA==
Date: Tue, 18 Dec 2018 18:57:49 +0000
Message-ID: <E60EE44E-09FB-4D78-897B-CD0D0567929A@fb.com>
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
 <a3125cb9-f3f8-2314-ea2f-1787b5292dd2@linux.intel.com>
In-Reply-To: <a3125cb9-f3f8-2314-ea2f-1787b5292dd2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:5cc9]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1557;
 20:QzL3qf+KOEaErMBIVxvnGhx6VBqRIn7AS9VfhOGoTkvpoy1YM1LDUTlqkcqU+jQUsEzUW7uNlAhLycLIviTiAUBsFKB17BDdQasd0CB9WIOYu++ARjGd9PDeGZMn3HNc1OzolL9doiU2/QS/08Znn6PY+zC7w0jVahZzqOVaU5A=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 74d9428e-e605-4316-b07e-08d6651ab4bd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1557; 
x-ms-traffictypediagnostic: CY4PR15MB1557:
x-microsoft-antispam-prvs: <CY4PR15MB1557A1C4BCA814FCFCFB746ADDBD0@CY4PR15MB1557.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(11241501185)(5005020)(6040522)(2401047)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1557; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1557; 
x-forefront-prvs: 08902E536D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(83716004)(3480700005)(71190400001)(71200400001)(229853002)(316002)(99286004)(110136005)(256004)(6116002)(6246003)(4326008)(6512007)(6306002)(53936002)(486006)(2906002)(33656002)(6486002)(6436002)(106356001)(105586002)(7736002)(8676002)(476003)(11346002)(446003)(2616005)(8936002)(81156014)(81166006)(14454004)(478600001)(82746002)(68736007)(46003)(554214002)(97736004)(86362001)(36756003)(186003)(305945005)(5660300001)(966005)(102836004)(76176011)(25786009)(6506007)(53546011)(7116003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1557;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: OlAJFoXdVinEZachV2VdjwFpeYCCdy1ilikqcKhHR3zeDP8zod2fAgjXsr6MdhwTBI7J7XclRKZ38Y7aeuly1VyAAYcBROddcdtBkWM6jp314xwKAEZv9cpJbNz4/BdOb9qdy1/0UJk/b2otPB0M5f/r2LapA3ZYFn/c3CGRCvWOVHhxEQzUj6NKaH/iZ09d/50f9EJKV9WLMl9LSAB4PNu1BpO3w5WSJ68/Id6DEyL6Pt6fz6xnYrCSS8N3H2lr2gQVdoOFuZUsC++ivZ+xDwzXuZuhMrXSDreXqIA1MiFv/7q+KQw1SrNKOfrpCEW7
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <806F612EB20A3743B1E9C1A7186C2D8D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d9428e-e605-4316-b07e-08d6651ab4bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2018 18:57:49.4058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1557
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-18_08:, , signatures=0
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
X-List-Received-Date: Tue, 18 Dec 2018 18:58:07 -0000

DQoNCu+7v09uIDEyLzE4LzE4LCA4OjU5IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSmFtZXMg
RmVpc3QiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAg
ICBPbiAxMi8xNy8xOCA5OjQ2IFBNLCBHZW9yZ2UgTGl1KOWImOmUoeS8nykgd3JvdGU6DQogICAg
PiBIaSBWaWpheQ0KICAgID4gDQogICAgPiBJIGFtIGFsc28gbGVhcm5pbmcgYWJvdXQgdGhlIGZh
biBjb25maWd1cmF0aW9uIHBhcnQgb2Ygb3BlbmJtYw0KICAgID4gVGhlcmUgaXMgYSBkcmFmdCBo
dHRwczovL2dpdGh1Yi5jb20vbHh3aW5zcHVyL29wZW5ibWMtZG9jLg0KICAgID4gSSBob3BlIGl0
IGNhbiBiZSB1c2VmdWwgZm9yIHlvdQ0KICAgID4gDQogICAgPiBSZWdhcmRzDQogICAgPiANCiAg
ICA+IC1HZW9yZ2UNCiAgICA+IA0KICAgID4gT24gVHVlLCBEZWMgMTgsIDIwMTggYXQgNzo1NSBB
TSBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPj4NCiAgICA+
PiBUZWFtLA0KICAgID4+DQogICAgPj4gSSBhbSBsb29raW5nIGZvciDigJxmYW4gc3BlZWQgY29u
dHJvbOKAnSBmZWF0dXJlIHRvIGVuYWJsZSBmb3IgVGlvZ2FwYXNzLiBJIHVuZGVyc3RhbmQgdGhh
dCB0aGVyZSBhcmUgbWFueSBhcHByb2FjaGVzIGZvciB0aGlzLiBQbGVhc2UgcG9pbnQgbWUgdG8g
YWxsIGltcGxlbWVudGF0aW9uIGFuZCBhbnkgZGV0YWlscyBhYm91dCBlYWNoIGFwcHJvYWNoLCBt
YXkgYmUgc29tZSBwcm9zIGFuZCBjb25zLg0KICAgID4+DQogICAgDQogICAgVG8gbXkga25vd2xl
ZGdlIGFsbCByZWNpcGVzIGFyZSBoZXJlIGZvciBmYW4gY29udHJvbDoNCiAgICANCiAgICBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9tZXRhLXBob3NwaG9yL3RyZWUvbWFzdGVyL3JlY2lwZXMt
cGhvc3Bob3IvZmFucw0KDQpUaGFua3MgSmFtZXMNCiAgICANCiAgICBvYm1jLWNvbnRyb2wtZmFu
X2dpdC5iYiAtIGxvb2tzIGxpa2UgYSBkZWZhdWx0IGZhbiBzcGVlZCBzY3JpcHQNCkkgZG9uJ3Qg
c2VlIGFueSBzb3VyY2UgY29kZSBmb3IgdGhpcy4NCiAgICANCiAgICBvYm1jLXBob3NwaG9yLWZh
bmQuYmINCkFuZCBmb3IgdGhpcyBhbHNvIEkgYW0gbm90IHNlZWluZyBhbnl0aGluZyBvdGhlciB0
aGFuIGEgc2ltcGxlIHdoaWxlIGxvb3AgaW4gb2JtYy1waG9zcGhvci1mYW5kLmMuIEkgbWlnaHQg
YmUgbWlzc2luZyBzcmMgZmlsZS4NCiAgICANCiAgICBwaG9zcGhvci1mYW5fZ2l0LmJiDQogICAg
DQogICAgcGhvc3Bob3ItcGlkLWNvbnRyb2xfZ2l0LmJiDQogICAgDQogICAgPj4NCiAgICA+Pg0K
ICAgID4+IFJlZ2FyZHMNCiAgICA+Pg0KICAgID4+IC1WaWpheQ0KICAgIA0KDQo=
