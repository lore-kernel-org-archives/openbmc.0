Return-Path: <prvs=38297c7ee2=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38297c7ee2=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="PF5lwHra"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="g/It6H4d"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bgj23htszF3Hw
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 07:32:49 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w9IKNRvp010485;
 Thu, 18 Oct 2018 13:32:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=ehw0pHxiq9SuCu91M2b+yqFWScwlrgIqIaYI6cNLifs=;
 b=PF5lwHrat4RIDfJxISIS2jrCFO279ebCPXiaeBR/2PZ/CbYAcYxuzAa3qaJoRxPPmXlp
 1vdMy4HMtn3QT8UrRNqEA0pp7Wx3C+wO1oqQvRKRcVCtYgsDQv3jHJUw5DNvk3uObj29
 VNRo1TGA8cRMOqANeQaDZ7pdN1QyDgnHt+4= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2n70yt82sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 18 Oct 2018 13:32:46 -0700
Received: from frc-hub06.TheFacebook.com (2620:10d:c021:18::176) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 18 Oct 2018 13:32:12 -0700
Received: from FRC-CHUB07.TheFacebook.com (2620:10d:c021:18::26) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Thu, 18 Oct 2018 13:32:12 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.27) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Thu, 18 Oct 2018 16:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehw0pHxiq9SuCu91M2b+yqFWScwlrgIqIaYI6cNLifs=;
 b=g/It6H4dRImSLbB/TsMFRRk2VXjzKWqOAeIlr5Z4b/auFU5tWtGiIcM7BQHEsWhQwpHXLKORtKiJKXfw4IhsTy3gOfs0Y6KsVdKqEdX8CTQyPVrNilW5H6S3fA/B6a+ffDCqhyIeSDNTkEAmWkmCLm1rqHWLj2EscqHFbPdYgXQ=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1366.namprd15.prod.outlook.com (10.172.159.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.24; Thu, 18 Oct 2018 20:32:10 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b%3]) with mapi id 15.20.1228.027; Thu, 18 Oct 2018
 20:32:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: ipmi inventory
Thread-Topic: ipmi inventory
Thread-Index: AQHUZyGlNxc8kYE2dEKnN49gNGN33g==
Date: Thu, 18 Oct 2018 20:32:10 +0000
Message-ID: <3B781DAB-16CE-421D-BDCC-DDA2B74EF680@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:564f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1366;
 20:khYR2xsqloaJ2wMD/GY2FemNSWg43vivMBzBV54pzzB/JlfCFHBEac9ksPhZ9iu9dMODzczkQIIBEaSVO5eN2xx7tZ5MkEc7u6esF1uOhbnk97NYkzPPQGwouHHLdK9w6G2Qu+oFbSv+KJ41vpwcqCRKJE3Dn+DeB+pWUSNPHM0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: c4b11d78-db95-4b9e-3c5c-08d63538c7a0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1366; 
x-ms-traffictypediagnostic: CY4PR15MB1366:
x-microsoft-antispam-prvs: <CY4PR15MB1366665E83A5157CC4B5A264DDF80@CY4PR15MB1366.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(11241501184)(944501410)(52105095)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1366; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1366; 
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(136003)(376002)(396003)(189003)(199004)(316002)(102836004)(106356001)(2906002)(5250100002)(105586002)(14454004)(82746002)(46003)(2501003)(478600001)(2900100001)(25786009)(2616005)(486006)(476003)(33656002)(53936002)(256004)(6116002)(81166006)(8676002)(558084003)(110136005)(86362001)(221733001)(81156014)(36756003)(5660300001)(7116003)(186003)(3480700004)(9326002)(71200400001)(71190400001)(83716004)(99286004)(7736002)(97736004)(6436002)(6506007)(6306002)(8936002)(68736007)(54896002)(6512007)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1366;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: iCfFzJXc+VQHFLfoE1zS15trBhbK95tzdkbh8u9RVpSwNVxnNGQ+mN4dET9Khl7Hvq5rnghGphp625wQAgdkKqCbxzudTrCvS1Zeml/UwXbwJqdvT1e3YKKu9EwvPm4SyVGbv8KD8m/CApAuFqHSr9yH8S6qmYa0+oTz5iXj2s5bl80MdvVAoK+9cCFhLZp7UxbqQDWNtuxdN1PIX3pWjoCTveGDcn4drujH7rjOqxuUopl02gx49Hj45U5BPBjzkfP0Z7v9SiDbtXyAE9cboEquCoStUC/Ky4eaGxBjEreF1HDauqr4QAFVN6LXmqjWUaOUYV282f3ll6UFZlX7eBpb5CzcBm/9B8ZcNID4GwE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_3B781DAB16CE421DBDCCDDA2B74EF680fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b11d78-db95-4b9e-3c5c-08d63538c7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 20:32:10.1060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1366
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-18_08:, , signatures=0
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
X-List-Received-Date: Thu, 18 Oct 2018 20:32:56 -0000

--_000_3B781DAB16CE421DBDCCDDA2B74EF680fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIGFtIHRyeWluZyB0byBmaW5kIHJlZmVyZW5jZSB0byBlbnRpdHlJRCBkZWZpbmVkIGlu
IGNvbmZpZy55YW1sIGZvciBpcG1pIHVudmVudG9yeSBtYXAuIEkgc2VlIGRpZmZlcmVudCB2YWx1
ZSBvZiBlbnRpdHlJRCBmb3IgZGlmZmVyZW50IHNlY3Rpb25zLiBJcyB0aGVyZSBhbnkgZG9jdW1l
bnRhdGlvbiB3aGljaCBkZWZpbmVzIHdoYXQgc2hvdWxkIGJlIGVudGl0eUlEIGFuZCBpbnN0YW5j
ZSBmb3IgZWFjaCBzZWN0aW9uLg0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_3B781DAB16CE421DBDCCDDA2B74EF680fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <79E24D17F8CA1B42885727DA5C0B77B4@namprd15.prod.outlook.com>
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
MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bh
bi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7
DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJs
aW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJ
dGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5
bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBh
Z2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBp
biAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30N
Ci0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIg
dmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+SSBhbSB0cnlpbmcgdG8gZmluZCByZWZlcmVuY2UgdG8gZW50aXR5SUQgZGVmaW5lZCBp
biBjb25maWcueWFtbCBmb3IgaXBtaSB1bnZlbnRvcnkgbWFwLiBJIHNlZSBkaWZmZXJlbnQgdmFs
dWUgb2YgZW50aXR5SUQgZm9yIGRpZmZlcmVudCBzZWN0aW9ucy4gSXMgdGhlcmUgYW55IGRvY3Vt
ZW50YXRpb24gd2hpY2ggZGVmaW5lcyB3aGF0IHNob3VsZCBiZSBlbnRpdHlJRA0KIGFuZCBpbnN0
YW5jZSBmb3IgZWFjaCBzZWN0aW9uLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+UmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_3B781DAB16CE421DBDCCDDA2B74EF680fbcom_--
