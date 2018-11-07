Return-Path: <prvs=4849d1eef9=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4849d1eef9=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="njHIIrgG"; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="K9UOVPgl"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qxmZ4PdGzF3Gm
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 06:48:28 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA7JTn6I020650; Wed, 7 Nov 2018 11:32:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=gktQVLGIvJrCtby/RGUA2WRBNEx/Ob1hPWtrF+/W370=;
 b=njHIIrgGDv/qCx2Rf1MItgmJdNVFiErJUpC8p2hVvMaeDnwUw/CWs3yjOgNXyI43tbmB
 F/3yjB3SS5X+oP7IWNla7Iu3/+NccwD4TprRMuzgjsYt9FT7w2bW9bCa3aODH+D7gv0b
 I9rDNRvV2hYvNsvyeFxvSX1Zyrqg4dvKEAk= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nm65dg11f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 07 Nov 2018 11:32:38 -0800
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 7 Nov 2018 11:32:37 -0800
Received: from FRC-CHUB14.TheFacebook.com (2620:10d:c021:18::33) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 7 Nov 2018 11:32:37 -0800
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.34) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Wed, 7 Nov 2018 14:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm+zQT3+29hvNuqPwpnfA0boAuqoXhWds6M+TkESm9E=;
 b=K9UOVPglcjWJXfcIyOYo6qccPggQDHEmaJj6CpXS/X6QO7JydqO/R1wxLZTN/rlTj42riFriwp/9hfezt9UjfGGVWJ4AGgxKeF+WMduKBTcilrKSWZykjynQV94qFa+7w27NHnDrvp+Px60aMU04rjVIRWBf5F2ugebmuYhR7UM=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1952.namprd15.prod.outlook.com (10.175.8.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Wed, 7 Nov 2018 19:32:35 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56%2]) with mapi id 15.20.1294.034; Wed, 7 Nov 2018
 19:32:35 +0000
From: Sai Dasari <sdasari@fb.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: pull request to the u-boot-aspeed
Thread-Topic: pull request to the u-boot-aspeed
Thread-Index: AQHUdms1fdBLenHzmkOwOFO/q9XDLqVELk+A
Date: Wed, 7 Nov 2018 19:32:34 +0000
Message-ID: <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
In-Reply-To: <3ff8d429943e44139b73cb16199a560e@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:fcc3]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1952;
 20:pqGVl3Dfgabhnd5zXVLn0uqpffhpscNm8bs9Ni6tZTQh1Mvi0oN9q6n9zS+WrjhytRumO/t9m/QSBem/oZJ/8r0MgGym6zl3HNvWE4JtWvaqPc277HkgFuUe1yA+Vb2XH8FPS3iJsHbOZuyWY1OR0s9ZjhqClgMHEh9zA2k/Vhc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 4b8d16d4-d9f1-4f97-4531-08d644e7c4eb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(49563074)(7193020);
 SRVR:MWHPR15MB1952; 
x-ms-traffictypediagnostic: MWHPR15MB1952:
x-microsoft-antispam-prvs: <MWHPR15MB195264BEBC6A2547BE3B6704CEC40@MWHPR15MB1952.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(65623756079841);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(102415395)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231382)(11241501184)(944501410)(4983020)(52105095)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1952; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1952; 
x-forefront-prvs: 08497C3D99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(136003)(39860400002)(346002)(129404003)(43234003)(53754006)(189003)(199004)(256004)(316002)(83716004)(102836004)(229853002)(76176011)(71190400001)(6506007)(305945005)(7736002)(110136005)(5024004)(36756003)(8676002)(71200400001)(81156014)(6436002)(86362001)(99286004)(478600001)(2501003)(6116002)(82746002)(11346002)(25786009)(46003)(14454004)(446003)(105586002)(106356001)(5660300001)(81166006)(6512007)(6306002)(8936002)(68736007)(99936001)(97736004)(2616005)(476003)(6246003)(33656002)(6486002)(966005)(2900100001)(186003)(53936002)(2906002)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1952;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: sZwNSCwzzGYfcwj08tQqDDRFK4FrlLVeFdGP5Hz2aQA8Vnq7WxtygTU9dBKna+cSTuMzPK8P2eY7VXa/SmxIWOm6pa1g9Xggo/Y/hCA/XRCfu8ONyMoaE0oiNAcoP+8+NSeVCvevJNsnHE45an+T/NxHeean3oIQSi1UVl486f/r5U2Xkc7kC25kchzSUd1IqAiiDo+a5JNWPKRb4NF04K+aLNd36tjZCwwWN4ZiF+kNBO6Icyburyq4VE9mDF6VsrofOuBhfFBTqRJQoE62n8kEShSeWyVqgDaqH2aZNclYV6xp7Ed3pd/4IBTusm2TeBZTpht0/rM3t4womsNjFzbPinvyToFX0AZOQGdF6T8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/mixed;
 boundary="_002_3D1C8267BC6F44F1B12F020E147B225Bfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8d16d4-d9f1-4f97-4531-08d644e7c4eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2018 19:32:34.9672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1952
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-07_15:, , signatures=0
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
X-List-Received-Date: Wed, 07 Nov 2018 19:48:32 -0000

--_002_3D1C8267BC6F44F1B12F020E147B225Bfbcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4CF57F1BD539546A2CCC872BF747E2F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgQWxleGFuZGVyLA0KDQpUaGUgcHJvY2VzcyBmb3IgdS1ib290IGNoYW5nZXMgaXMgc2ltaWxh
ciB0byBrZXJuZWwgY2hhbmdlcyB3aGljaCBpcyBkb2N1bWVudGVkQCBodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2tlcm5lbC1kZXZlbG9wbWVudC5tZC4gSSBiZWxp
ZXZlIGl0IGRvZXMgbm90IGludm9sdmUgZ2Vycml0IHdoaWNoIGlzIGZvciBjb3JlIE9wZW5CTUMg
dXNlcmxhbmQgZmVhdHVyZSBkZXZlbG9wbWVudC4NCg0KQXR0YWNoZWQgaXMgYW4gZXhhbXBsZSBz
dWJtaXNzaW9uIGZvciBhIHVib290IGNoYW5nZSAoZmlyc3Qgb25lIG9mIDE3IHBhdGNoZXMpLiBI
b3BlIHRoaXMgaGVscHMhDQoNCi1TYWkuDQoNCu+7v09uIDExLzYvMTgsIDExOjMzIFBNLCAib3Bl
bmJtYyBvbiBiZWhhbGYgb2YgQWxleGFuZGVyIEEuIEZpbGlwcG92IiA8b3BlbmJtYy1ib3VuY2Vz
K3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGEuZmlsaXBwb3ZA
eWFkcm8uY29tPiB3cm90ZToNCg0KICAgIEhlbGxvIGV2ZXJ5Ym9keSwNCiAgICANCiAgICBJIHdv
dWxkIGxpa2UgdG8gcHVibGlzaCBmb3IgcmV2aWV3IGFuZCBkaXNjdXNzaW9uIG91ciBpbXBsZW1l
bnRhdGlvbiBvZiB0aGUgYXNwZWVkIGkyYyBkcml2ZXIgYW5kIHRoZSBWUEQgcGFyc2VyIGZvciB0
aGUgdS1ib290LWFzcGVlZCwgYnV0IHRoZSBnZXJyaXQgc2FpZCB0aGF0IGl0IGhhdmUgbm8gc3Vj
aCByZXBvc2l0b3J5Lg0KICAgIA0KICAgIFdoaWNoIHRoZSBiZXN0IHdheSB0byBkbyB0aGF0Pw0K
ICAgIA0KICAgIC0tDQogICAgUmVnYXJkcywNCiAgICBBbGV4YW5kZXIgRmlsaXBwb3YNCiAgICBT
b2Z0d2FyZSBFbmdpbmVlciwgWUFEUk8uIA0KDQo=

--_002_3D1C8267BC6F44F1B12F020E147B225Bfbcom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 07 Nov 2018 19:32:34 GMT";
	modification-date="Wed, 07 Nov 2018 19:32:34 GMT"
Content-ID: <02E5368100145A4DB3D6D9A865B01BEE@namprd15.prod.outlook.com>

Received: from BN6PR15MB1699.namprd15.prod.outlook.com (10.174.117.142) by
 DM5PR15MB1706.namprd15.prod.outlook.com (10.174.109.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.947.12 via Mailbox Transport; Thu, 16 Mar 2017 21:37:25 +0000
Received: from DM5PR15CA0039.namprd15.prod.outlook.com (10.174.245.153) by
 BN6PR15MB1699.namprd15.prod.outlook.com (10.174.117.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.961.17; Thu, 16 Mar 2017 21:37:25 +0000
Received: from BL2FFO11FD043.protection.gbl (2a01:111:f400:7c09::132) by
 DM5PR15CA0039.outlook.office365.com (2603:10b6:4:4b::25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.977.11 via Frontend Transport; Thu, 16 Mar 2017 21:37:24 +0000
Authentication-Results: spf=neutral (sender IP is 199.201.64.23)
 smtp.mailfrom=lists.ozlabs.org; fb.mail.onmicrosoft.com; dkim=fail (signature
 did not verify) header.d=google.com;fb.mail.onmicrosoft.com; dmarc=fail
 action=oreject header.from=google.com;
Received-SPF: Neutral (protection.outlook.com: 199.201.64.23 is neither
 permitted nor denied by domain of lists.ozlabs.org)
Received: from mail.thefacebook.com (199.201.64.23) by
 BL2FFO11FD043.mail.protection.outlook.com (10.173.161.139) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
 id 15.1.961.10 via Frontend Transport; Thu, 16 Mar 2017 21:37:23 +0000
Received: from mx0a-00082601.pphosted.com (192.168.54.13) by
 PRN-CHUB14.TheFacebook.com (192.168.16.24) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 16 Mar 2017 14:37:00 -0700
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])	by
 mx0a-00082601.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2GLK01w016513
	for <sdasari@fb.com>; Thu, 16 Mar 2017 14:36:59 -0700
Authentication-Results: fb.com;
	spf=pass smtp.mailfrom=openbmc-bounces+sdasari=fb.com@lists.ozlabs.org
Received: from lists.ozlabs.org (lists.ozlabs.org [103.22.144.68])	by
 mx0a-00082601.pphosted.com with ESMTP id 2980qnrh15-1	(version=TLSv1.2
 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)	for <sdasari@fb.com>;
 Thu, 16 Mar 2017 14:36:59 -0700
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])	by
 lists.ozlabs.org (Postfix) with ESMTP id 3vkhd54bdwzDqYw	for
 <sdasari@fb.com>; Fri, 17 Mar 2017 08:36:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v6OLTPdy";
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233]) (using TLSv1.2 with cipher
 ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkhcl28YhzDqY5 for
 <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 08:36:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v6OLTPdy"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id x63so24676777pfx.2 for
 <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0merasIJ/Z6fow3Dwt5TAYovpOrX2AjSLa1pxQIpcBI=;
 b=v6OLTPdywQqylNg3360n7O00/NTUPgPd4PcYO6ojXg1+pVPXy6oTTWOtaFuvOONqBW
 YwxkGQmJ6hXuZiAbhq1P3ti9tHqOL4vRBAjIW0WiOWTXgYaglbbBSGy+eH1UPyXp+VUy
 xp+K4R2NF4EGYBNf45Tw4mBX+22BKowkSdTPAWGqTTFfvPRWdd7b8KvG6nHhfBgN8loa
 Ya4dRMOSPsYcd4KWiPUZVXjrREcS3dfnDeCekFL7PTAJag6kcr13yVVlMsiqQhpgi3qw
 +PCvv30gWufJ/gUzRX6BxyZexL59TH0fAHe/AnMVqQVqqre++A87x7PrJpmzmXON0NjE
 YVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0merasIJ/Z6fow3Dwt5TAYovpOrX2AjSLa1pxQIpcBI=;
 b=UG3Y1QvWXZ9AINatE4e6/rrxVGlpqwMqRlJzSjvYuV33OrIFvmOdNijmd7VxywCuRp
 D/3U4l9OoG9ACwKCi7cl9xmWrHNM5doWph3eqGmvZf16+hwqgh0/KduRI83VMsD5D7aO
 G0gU8ZAOOlWeUCbQi9Pwo0GSR3PMNwJoirUf3MGDgyTNz7jU0mRXE/FxEOiia+C6uaQa
 gpUzOoTHllPHgzcVOpZO2I58M8CQkUx0UEEPQ05Slih9RQUJTQk8GZ+qvO7GrGdFu5JP
 djDYEhJUq0+Htvklv2Nmf4dw37GE/YP4HGIEXLub0J5007zn8ICcLswl1jBNFphRFasw
 NMtQ==
X-Gm-Message-State: AFeK/H2WLMBXpdUaGEaxx8qCYu6jZuvW0OMJolG/c8qJHam/I/a5SDBEctJHebwTKmL3ZEN9
X-Received: by 10.84.141.129 with SMTP id 1mr15205168plv.166.1489700196217;
 Thu, 16 Mar 2017 14:36:36 -0700 (PDT)
Received: from mxsl.svl.corp.google.com ([100.123.242.80]) by smtp.gmail.com
 with ESMTPSA id v17sm2191375pgc.20.2017.03.16.14.36.34 (version=TLS1_2
 cipher=ECDHE-RSA-AES128-SHA bits=128/128); Thu, 16 Mar 2017 14:36:35 -0700
 (PDT)
From: Maxim Sloyko <maxims@google.com>
To: <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>
Subject: [PATCH 00/17] Expand Aspeed AST2500 Support
Date: Thu, 16 Mar 2017 14:36:07 -0700
Message-ID: <20170316213624.140344-1-maxims@google.com>
X-Mailer: git-send-email 2.12.0.367.g23dc2f6d3c-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
CC: Albert Aribaud <albert.u.boot@aribaud.net>, Stefan Roese <sr@denx.de>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Daniel Schwierzeck
	<daniel.schwierzeck@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
	<openbmc@lists.ozlabs.org>, Minkyu Kang <mk7.kang@samsung.com>, Kever Yang
	<kever.yang@rock-chips.com>, Wenyou Yang <wenyou.yang@atmel.com>, "Beniamino
 Galvani" <b.galvani@gmail.com>, Masahiro Yamada
	<yamada.masahiro@socionext.com>, Wills Wang <wills.wang@live.com>, "Thomas
 Abraham" <thomas.ab@samsung.com>, Tom Warren <twarren@nvidia.com>, Konstantin
 Porotchkin <kostap@marvell.com>, Stephen Warren <swarren@nvidia.com>, Heiko
 Schocher <hs@denx.de>
Errors-To: openbmc-bounces+sdasari=fb.com@lists.ozlabs.org
Sender: openbmc <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2017-03-16_16:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703160165
X-FB-Internal: deliver
Return-Path: openbmc-bounces+sdasari=fb.com@lists.ozlabs.org
X-OrganizationHeadersPreserved: PRN-CHUB14.TheFacebook.com
X-MS-Exchange-Organization-Network-Message-Id: f6b54c19-2050-464b-ec42-08d46cb4a299
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:199.201.64.23;IPV:NLI;CTRY:;EFV:NLI;SFV:NSPM;SFS:(6009001)(2980300002)(3190300001)(189002)(156002)(176002)(199003)(9170700003)(63966002)(42882006)(6392003)(5660300001)(76786999)(53936002)(1076002)(81166006)(19810500001)(63696999)(47976999)(7846003)(76482005)(189998001)(6666003)(54906002)(956001)(8936002)(105586002)(146002)(47776003)(16670700002)(60616004)(8676002)(4326008)(5003940100001)(107886003)(50986999)(78456001)(76806002)(50226002)(33646002)(50466002)(9036002)(305945005)(36756003)(81442002)(1096003)(55446002)(60626007)(61266001)(106466001);DIR:INB;SFP:;SCL:1;SRVR:BN6PR15MB1699;H:mail.thefacebook.com;FPR:;SPF:Neutral;MLV:sfv;MX:1;A:1;LANG:en;
X-Microsoft-Exchange-Diagnostics: 1;BL2FFO11FD043;1:cBIuZlQYSi2s+kiuSdbUGJGOObqZu7DumHi+t3vqCKlhZdCaU5BevvaNZx8pvtqw7HMPc3Juf+3EGuNcbzeDZOOxbCivDF/Gkhld3iYBz6h02vDbh+S+pXT2VpUhtQ0JT3wm4UsqH8Dm6qr0gi3/JdqGE81qqqAOMVmslFXnWBayFTVEypQ8K+PItLnGBTYX5u1BJM6pjnrZvvYGpq4P/xJu3hgeV3P/U4U7jN/h8EGH9WIuoJtIQoKCffIcF1PfGLer3skTqlgty4PD1di9w7hnvZhSpmvbOfR82+SEPT6kH9YZtZFRzUDHVdzJ+1gG3JBQ0B3k4DhWtUoJwl2DhEwx+RFH7bjryJKK+beLn2hfS5eLkCFTpHgBcStnmPCmQUB2KtB1t6DaPSLkAvg9Vu0yF415rjXAXNipse/nm0l/ipHXGLMnRDGMsjnwLorycu2zhmmywiHVtfzHtyYaYaKvHtQ/rrhrysJklQrNnv8vGFR/zzx8G1eQIHmkM2OmRyPdj4ZkgGbGsAK3skrKs/iLL/eyq6UPFjo/dfeBQHo=
X-CrossPremisesHeadersPromoted: BL2FFO11FD043.protection.gbl
X-CrossPremisesHeadersFiltered: BL2FFO11FD043.protection.gbl
X-MS-Office365-Filtering-Correlation-Id: f6b54c19-2050-464b-ec42-08d46cb4a299
X-DkimResult-Test: Failed
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001)(421252002)(3002016);SRVR:BN6PR15MB1699;
X-Microsoft-Exchange-Diagnostics: 1;BN6PR15MB1699;3:s0pYCEnLut7AsF953iuLdHAndQB7VUPxJhSGmoe0IMDBPKG0qmvwY2nym1oaTWtVWXpNsRyxtm8B5eEIJtZxYR9E0/ywjpkrl0iiVC5n8S+eCIHwY12Ekq7mHumVFfbLStrEMMKKmxbLL/bW474PaenTmBTe8yBdGiZz5rWDNg/bM8DjEn/t2mUdtoiEy89bgDBg3WJ2eg1u9VbgYEmg0WWeDvXjDxQzqjOaLRugDhVorp0mYr2/W2Af0uQHzQmFT0zRaNrHO1WVUSy8EHucnjMNkzxuLfMmBSLDfGZRR10S80uIYkNUujgsko4EQwEx/n3cXIwjz5kEbiR74sUJ0ksPWSTnJEflEmBcPbEpvQi8GYg5H3CuHhw1vAXCcjUWcZzD+HE3b7x4jP2glCOjbQ==;25:vAfwiAyX1fSEX+qQYQLWPUxr1lZe0SItBgZYWGFqNGJgRaWvi0FS+bzYb6qkhpbSE2vJNNal3m9BWL5Vun0sX7uaN28S/4eKqBrhUGFHwuYVkmxDL8c5U9D9Ha2/uHoGW2uc9BZyXZPWWsCu+VqCEGwxeKvvK1RYYM04W9T3DFhDrwj2nU8rLEk7/9Le15IedzDQY7wLFtbzuhxWciSVvckxewZlHZwiC8EOMCcPvrbc9r2uX5mF2vLU5dN70THrpUP2asc4U7Ef5SdotU26gvrUZXzj5MQ+xeuZKcF+79+96KG9RnbIVA5iasVT0Wz6ls+d2DQ/wdHhb2scGdqLmrbR5RZS6YQW/mH5AI7or8BVnXqwXDUoIdwr2cNrvezpNxwHFLNsC/AGmkDkJsNNsGDjTW8b0p3/sg/ubtqyVt1a33lYqjAk9dLMyail9tsnMlLScLkCFdc8VUHtDOaXjA==
X-MS-Exchange-Organization-AVStamp-Service: 1.0
X-Microsoft-Exchange-Diagnostics: 1;BN6PR15MB1699;31:xhVR+wXJ0J263JIr58Ab+J/Mf8d3oqjA8g6Il3EUQHk/iDX3XhL7HpboZ7DAmKD2EacUC36QUkRj9MjaeKJdZ1F0gRL0a2nQvsBgkJ9oP3iRjaHg89Lr6brB1GlkgYxfqU5xnph9PGC08bPyjYeySXUFwAuVnAjvUpkuFikOymyQe+MNhJChN3YyrPS3S7pUDz/5GukWBLIs1Ymlg5VFUaZFz7bVshWuD8sp1yVVVRp0a/UWt6vuLEFkEVJWcntqSP3fbP7HhI11xo6aG/DnEg==;20:dzYQ1/lZ+6WspkvDTHTa7qf976+ZygGcqP5UFLUbWyD3I+ybHyTbg1IDHQdOfJg7svhIzOnLmibO8WXrBbndiYAhk9hoQEziQf4IWZIlmR0ObSJb/eOiiVY3robc51FciDEKL5ZTbsxewds2AB8LNVkXrJ/BgfyopajbuXin98er1PAUSj4+yNS23Y5vuFA2RWPFbCVIy5LSLIG2Xd5bUDsVDOt0zPAyRT3F6VMEinT1MVHID7gp3lD4YXPenfaDlcc0qfA9jz24AY/TCneL6qp2shkPQ+A1TYQbeAhHqhVxMGLUWyCFRufnME8GDxD4PgGDGSU6B2bvJPp/3LvJgNOwvzfSDy4XeLb5VfP0xVilDEqe/KYRhJ4F/dBcb153FxKdfsJB6YZuu82FdfLOMYIT5CtaCBmgzqCgjbHvMASwodFI1OB7BUvZG6/4eNLmfxTU/nop7wEYmIjiF/aZOZ7lXoeJm3ZqQZkmTaKP8pqCvi9b1jlGM7EcLkKZkC8s
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(601004)(2401047)(8121501046)(13016025)(13018025)(3002001)(10201501046);SRVR:BN6PR15MB1699;BCL:0;PCL:0;RULEID:;SRVR:BN6PR15MB1699;
X-Microsoft-Exchange-Diagnostics: 1;BN6PR15MB1699;4:Q3tdtMQtoj9Lc4tmKtzLYdPjrGqAAp8hv758XAnL9OJi8/5FC122lKYgx/jgnhWiL7GRKoh3aclmqxkST1l8lILGHxG/o9BkqRy/qbA2ZxRu06Hul2EP1c9nRfwPX/8x7RyvDyhSKXvbhm025BvVZMsjyJfzsd1jHxrbFVPFdoHbdKVvW4y0zVQEHVRKge8CzhVZbk2igr0jWN7CjsShsoBdjrzml52lHTmD+AayzhLWBya5e2QNcwDD+2bjPKKRryIRKnIktvG5ouxdS0LB5eJJHKQmlIP8FcNhk/pyetu3fJqqICKlDKGqsjb0bT9e/TavIl39wzDDwGk62Jdp2HOfDAEZKNx6OUe7lDqaOOyL7LyPF5JZvIVpBRck/QixcTQG7wXwCFdNsg+K68Ne3w==
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;BN6PR15MB1699;23:gs7odFGBNznlYlplhMuu5qRkNIHPiXkYhqrdau6zB?=
 =?us-ascii?Q?MNYnK4Ev7ndRQ7ptl+RRALveTvkG1tXIE6CF8rwSBLqwVvVo82XJvUn2YIZJ?=
 =?us-ascii?Q?0+OUvbXt2w0bx961w+s6B7NlDkLfxIfQJt0yr2V9S+Z7LxWU1Wlq9iAQrdLd?=
 =?us-ascii?Q?MF1VKfViOvHugiQPU3nD543DieFPG5aWOoMTJ6rD/a6LgNKv19igIWWAt5ZG?=
 =?us-ascii?Q?OTPC0O4O9dgzBEGuSOhnwH/3sVEhMvk//Z7EQ5UkIMdAJdnDpRlgqFkMd4H5?=
 =?us-ascii?Q?al5kKJnpY/a6IKqSHajQOwCYSfLxrfXuAtLmK8Vpz/SHG/ouqdcpxBnqcHB7?=
 =?us-ascii?Q?k5IR71jlCVEurs76DGp3fVjfvQBSTDFqbqqwTxchlLE+we0ad8Zb1cHfc7Qh?=
 =?us-ascii?Q?CSn171U0va9fdNwKP+y5Q5oAdQHEvI/6s0HKwuVEg6QwBYhriom9gyPOnAPM?=
 =?us-ascii?Q?t5LSq/v5tgnW4cwcExsJPLSr3rcD/oqEsIjTWeiyb5v57e53oHistjgiQs5v?=
 =?us-ascii?Q?zFAkqb/RGSGB5P4Ae8NRq6mBoAH5D96ZNKNhupDCFSzw7R7FpC4Ajo9Ml79W?=
 =?us-ascii?Q?TcIlUOHZIGMpv8pmwjUYu4gTUa/PaRScBeYarHu1YlvRZt5cSCVmjIYnnxBy?=
 =?us-ascii?Q?+82HrKKNVQ+rN5sb2abPI8tNFFlC+at0EEY/PCbVwJE07jFnsaSeD0ob6l2q?=
 =?us-ascii?Q?+XpuH7vgz44CgedDEwd7cTCAtBRdZFr6nlhvEZotfajhtowVVg1ReXEyyTxl?=
 =?us-ascii?Q?xBiBUjeMKXYY7sIIoXekmEPKX1r8Ox4PiPLHhTO553sV8I/d3K9r5pQf5qwi?=
 =?us-ascii?Q?5E4sh07UExqYZfi1++5sY13qOIg/fR1AOz96uI5YqT24x+NgdYsNHZM+LWtC?=
 =?us-ascii?Q?FPRHoxCjQ/va2p+UxLMN6hRymgwRMnlpK3i7J+UfNrp2VWhC1jxjvVcpV8Cw?=
 =?us-ascii?Q?8XhySsUznyVe++uat+JIcNe3qzlfULHfzjRAwjOB1i/2jjL9b4D9zlXUkc/2?=
 =?us-ascii?Q?kAfbeqXtK2JVNiKjmUsW6xvD5bFnJ7324inl0HTj4olCxrq9o0DmLe1jg883?=
 =?us-ascii?Q?3DkPpXtt9PmGrpQCKbZZWu7vOvKCN/R34Wj6LkpNLtqIkwwJUrp8pt3hcQBg?=
 =?us-ascii?Q?/WdZBBkX9KLHdQ90xkCibiOqJdDuIiWuSKdRFrtwI7kGVGjWoIHx1GaeoIBy?=
 =?us-ascii?Q?6iRv916hFacuro=3D?=
X-Microsoft-Exchange-Diagnostics: 1;BN6PR15MB1699;6:/8r3JniIReCnWDXnBZsURRWVWWoGAyV3PkNDpFrc3OuTKmF4ibWKQ2wd6G6Ep0EgyG8HkKCyjkfH6bzEDfTqbsCPZr46d83EtqVwSl93QFbnF4pLK6zPa5hVRpePBY3qbtEZBHciT1se63qlsQtmF4lDtakGd7sD9M4U+xcOjeGcBb7/XHrXPx/hoJy3AeUknANeoVNxGJkGJh3pC+Z9mvgPQHDwhkdkPiq6nfINaov0NvxDnSajc5xEdkfJx94C5whEKOQDhRZvMgPhNidcXcEAIUFD+6aAGi95NS8iavl+/rBZLtt/e/vNqKFiRHZpYEQmpN7/5fhVPJUnON8DuKb06VhtEWJF1ohOx+l2DlJ7QQbeEI59EYYMNs+YWkR82TeSYT74O9F5BBX/rFM6drK+GcQWoaCSX85oGFwdGBU=;5:C1mjty7Z5LcB1B/vr48MoSaIIEsXgAnPGqIMd86GBKSsUktZcJcRlTqVf+jUTCxyy8XCuyyaZEcEFFMJ729Txd4oc2QQ/oi+W5hX3pZxg+Uo3N/QuhUFovu+JZbV/AzdGSURON/g9nK0HbhN1ciuyw==;24:XljGFyKMH/o7fzph76Ep/vPqn/5jVUp0DxGnlQ/j8HoOd2i9Ce9Cm2slo+xaZ+XvYeXOiIlth1Yq5afaSnkHzBp+E9x6b45CMJ3hfGkpicQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1;BN6PR15MB1699;7:a5cr8q630MK5G8MbxPUEWHM0GdgHKuxr1c70Nx3wG6DFAuTIJcHMaDTuKMm8Rbma9+msUPbc9SzHQ0hZWCzxlPFogTMInV5nefgCivJPkWVtP2oz7h/PFoQ6jO7k1n90H09Ai2wMvkrS9V9Ilx9vppROuZfpYaC8KiitVTAE0PWBTN5N2Tdy1lQW9IJvROF7NM4CoAJyzqhx7tbhnOGtsoBNKSFWDCvpa1NARIEKTMV/0CryP6kA2rIvLKNrpTp+240tg4oRX6MjFUG72iub6tTIXcvKL6XTUz5MDqjWOgLgPOJjrh5pHN6csu5nDtnzv/ZsHA+YatvtSJZWhKDx2CuzaQLIruFJRIxrmsGj6bWnNTaaMtzF6CYbP/ughdXl;20:UrC2ghwlw+Z8iECk4hw0kXVSneDgzpnC2G8XdnBAhxIygDZcZHgx8yGk2n228i4YpisGzQgrQdJYdalhowNhoRDrjoSAzL7pVBgcBwEtGe/065J2bBqJghl5YGLYrf+sIJELvEkhBcHo23uJQotyAt0wYVX5HrA9Z++qSDjsfAM=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2017 21:37:23.9936
 (UTC)
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=8ae927fe-1255-47a7-a2af-5f3a069daaa2;Ip=[199.201.64.23];Helo=[mail.thefacebook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1699
X-MS-Exchange-Organization-AuthSource: PRN-CHUB14.TheFacebook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: thefacebook.com
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.0946491
X-Microsoft-Exchange-Diagnostics: 1;DM5PR15MB1706;9:6H//qAjV3FwURCWnlaiGWQPHxisqBJneSqHsU6FTV7wGkPDo5KD4IJoAKf8Jtzz6LPp1UY3AYmD/CLCEsCsSSxO7GFJY441xUZVW5PRcWdrFPhl9I1FhJlPP8+oCEaORAOz8uY95yQPHf0eX9S6mrXmE9tVB2DwgcnJ3D4DkYXhEqQeXcOHcPyBuZn5rTCWWGwIzpEshGONOdQXzgokBzTogGtgtZlehZPSJypOGkeE=
X-Microsoft-Exchange-Diagnostics: 1;DM5PR15MB1706;27:6bQe5MPMoTNhAYBfqwZQC1CbeWoI9tW8hcKW35co6useosHl/5alSO99wt64nIFe4nALf5T8YCeYXGMkRXsi51Ia3bG1R6ytbQ19ieEm/PUyGxzFvmO2pB4mdnaCNrlSxP37NPwheZQdsG1WssvloA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0

This series expands support for Aspeed AST2500 SoC, commonly used as
Board Management Controller in many servers, to the point where it can
actually be useful.

The main goal of this series is I2C and Network drivers, the rest are
either cleanups or supporting patches. Most notable among them is
addition of Watchdog Uclass, so that watchdog drivers can now use Driver
Model.

One notable thing that is *missing* from this series is Device Tree
configuration for I2C driver. The Linux Kernel I2C driver is still under
review and it may affect the details of how devices need to be
configured in the Device Tree. So, I decided to wait until it will show
up in Linux Kernel DT and then pull it into U-Boot.


Maxim Sloyko (17):
  aspeed: Update ast2500 Device Tree
  dm: Simple Watchdog uclass
  aspeed: Watchdog Timer Driver
  aspeed: Make SCU lock/unlock functions part of SCU API
  aspeed: Reset Driver
  aspeed: Device Tree configuration for Reset Driver
  aspeed: Refactor AST2500 RAM Driver and Sysreset Driver
  aspeed: AST2500 Pinctrl Driver
  aspeed: Enable Pinctrl Driver in AST2500 EVB
  aspeed: Add P-Bus clock in ast2500 clock driver
  aspeed: Add I2C Driver
  aspeed: Enable I2C in EVB defconfig
  aspeed: Add support for Clocks needed by MACs
  aspeed: Refactor SCU to use consistent mask & shift
  aspeed: Cleanup ast2500-u-boot.dtsi Device Tree
  aspeed: Add AST2500/AST2400 compatible NIC Driver
  aspeed: Network Driver configuration for EVB

 arch/arm/dts/ast2500-evb.dts                   |  29 +
 arch/arm/dts/ast2500-u-boot.dtsi               |  59 +-
 arch/arm/dts/ast2500.dtsi                      | 881 ++++++++++++++++++++++++-
 arch/arm/include/asm/arch-aspeed/pinctrl.h     |  52 ++
 arch/arm/include/asm/arch-aspeed/scu_ast2500.h | 132 +++-
 arch/arm/include/asm/arch-aspeed/wdt.h         |  38 +-
 arch/arm/mach-aspeed/Kconfig                   |   8 +-
 arch/arm/mach-aspeed/ast2500/clk_ast2500.c     |  15 +
 arch/arm/mach-aspeed/ast2500/sdram_ast2500.c   |  17 +-
 arch/arm/mach-aspeed/ast_wdt.c                 |  47 +-
 configs/evb-ast2500_defconfig                  |  13 +
 drivers/clk/aspeed/clk_ast2500.c               | 321 +++++++--
 drivers/i2c/Kconfig                            |   9 +
 drivers/i2c/Makefile                           |   1 +
 drivers/i2c/ast_i2c.c                          | 355 ++++++++++
 drivers/i2c/ast_i2c.h                          | 132 ++++
 drivers/net/Kconfig                            |   8 +
 drivers/net/Makefile                           |   1 +
 drivers/net/ast_nic.c                          | 584 ++++++++++++++++
 drivers/net/ast_nic.h                          | 198 ++++++
 drivers/pinctrl/Kconfig                        |   9 +
 drivers/pinctrl/Makefile                       |   1 +
 drivers/pinctrl/aspeed/Makefile                |   1 +
 drivers/pinctrl/aspeed/pinctrl_ast2500.c       | 127 ++++
 drivers/reset/Kconfig                          |  10 +
 drivers/reset/Makefile                         |   1 +
 drivers/reset/ast2500-reset.c                  | 109 +++
 drivers/sysreset/sysreset_ast.c                |  24 +-
 drivers/watchdog/Kconfig                       |  24 +
 drivers/watchdog/Makefile                      |   2 +
 drivers/watchdog/ast_wdt.c                     | 125 ++++
 drivers/watchdog/wdt-uclass.c                  |  79 +++
 include/dm/uclass-id.h                         |   1 +
 include/dt-bindings/clock/ast2500-scu.h        |   2 +
 include/dt-bindings/reset/ast2500-reset.h      |  45 ++
 include/wdt.h                                  |  97 +++
 36 files changed, 3390 insertions(+), 167 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-aspeed/pinctrl.h
 create mode 100644 drivers/i2c/ast_i2c.c
 create mode 100644 drivers/i2c/ast_i2c.h
 create mode 100644 drivers/net/ast_nic.c
 create mode 100644 drivers/net/ast_nic.h
 create mode 100644 drivers/pinctrl/aspeed/Makefile
 create mode 100644 drivers/pinctrl/aspeed/pinctrl_ast2500.c
 create mode 100644 drivers/reset/ast2500-reset.c
 create mode 100644 drivers/watchdog/ast_wdt.c
 create mode 100644 drivers/watchdog/wdt-uclass.c
 create mode 100644 include/dt-bindings/reset/ast2500-reset.h
 create mode 100644 include/wdt.h

-- 
2.12.0.367.g23dc2f6d3c-goog



--_002_3D1C8267BC6F44F1B12F020E147B225Bfbcom_--
