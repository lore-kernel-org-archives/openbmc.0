Return-Path: <gkeishin@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xKV1T1vMrzDqsB
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 01:26:37 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6TFNgML121870
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 11:26:34 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c0pf0b2nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 11:26:34 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Sat, 29 Jul 2017 15:26:33 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Sat, 29 Jul 2017 15:26:32 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.45.236])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2017072915263190-277227 ;
 Sat, 29 Jul 2017 15:26:31 +0000 
To: openbmc@lists.ozlabs.org
Cc: "Edward James" <eajames@us.ibm.com>, "Andrew Geissler" <andrewg@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Sat, 29 Jul 2017 20:56:31 +0530
MIME-Version: 1.0
X-KeepSent: 7F65C83F:30C1D00D-0025816C:00536807;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 August 18, 2016
X-LLNOutbound: False
X-Disclaimed: 41507
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 005484496525816C_="
x-cbid: 17072915-5101-0000-0000-000005F88450
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00007447; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00894636; UDB=6.00447362; IPR=6.00674802; 
 BA=6.00005499; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016441; XFM=3.00000015;
 UTC=2017-07-29 15:26:33
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-07-29 14:40:57 - 6.00007098
x-cbparentid: 17072915-5102-0000-0000-0000724C32E1
Message-Id: <OF7F65C83F.30C1D00D-ON0025816C.00536807-6525816C.0054D29A@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-29_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Sat, 29 Jul 2017 15:26:37 -0000


--=_alternative 005484496525816C_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"

VGVzdGVkLWJ5OiBHZW9yZ2UgS2Vpc2hpbmcgICAgZ2tlaXNoaW5AaW4uaWJtLmNvbSANCg0KDQpU
aGFua3MgYW5kIFJlZ2FyZHMsDQogICBHZW9yZ2UgS2Vpc2hpbmcNCiAgIElCTSBTeXN0ZW1zICZU
ZWNobm9sb2d5IExhYiwgRmlybXdhcmUgRGV2ZWxvcG1lbnQsDQrigJwgVGhlcmUgaXNuJ3QgZW5v
dWdoIHRpbWUgaW4gYSBkYXkgdG8gYmUgbGF6eSEhISAu4oCdDQoNCg0KDQo=

--=_alternative 005484496525816C_=
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="UTF-8"

PGZvbnQgc2l6ZT0yIGZhY2U9InNhbnMtc2VyaWYiPlRlc3RlZC1ieTogR2VvcmdlIEtlaXNoaW5n
ICZuYnNwOyAmbmJzcDtna2Vpc2hpbkBpbi5pYm0uY29tDQo8L2ZvbnQ+PGJyPjxicj48YnI+PGZv
bnQgc2l6ZT0yIGNvbG9yPWJsdWUgZmFjZT0ic2Fucy1zZXJpZiI+PGI+VGhhbmtzIGFuZCBSZWdh
cmRzLDwvYj48L2ZvbnQ+PGJyPjxmb250IHNpemU9MiBjb2xvcj1ibHVlIGZhY2U9InNhbnMtc2Vy
aWYiPiZuYnNwOyAmbmJzcDtHZW9yZ2UgS2Vpc2hpbmc8L2ZvbnQ+PGJyPjxmb250IHNpemU9MiBj
b2xvcj1ibHVlIGZhY2U9InNhbnMtc2VyaWYiPiZuYnNwOyAmbmJzcDtJQk0gU3lzdGVtcw0KJmFt
cDtUZWNobm9sb2d5IExhYiwgRmlybXdhcmUgRGV2ZWxvcG1lbnQsPC9mb250Pjxicj48Zm9udCBz
aXplPTIgZmFjZT0ic2Fucy1zZXJpZiI+PGk+4oCcPC9pPjwvZm9udD48Zm9udCBzaXplPTM+IFRo
ZXJlDQppc24ndCBlbm91Z2ggdGltZSBpbiBhIGRheSB0byBiZSBsYXp5ISEhIDwvZm9udD48Zm9u
dCBzaXplPTEgZmFjZT0ic2Fucy1zZXJpZiI+LuKAnTwvZm9udD48YnI+PGJyPjxCUj4NCg==
--=_alternative 005484496525816C_=--
