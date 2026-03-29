Return-Path: <openbmc+bounces-1741-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952C6FC97EA
	for <openbmc@archiver.kernel.org>; Sun, 29 Mar 2026 21:18:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fkS1370KSz2xQr;
	Mon, 30 Mar 2026 08:18:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c107::1"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774819127;
	cv=fail; b=gSCT1neWDkzm/LrPR/n25wh3RrkyneEpe7ozS3IoUrMYSTfMKUbX6BTueCNarC6XLiICt86qvPObQX7VFa7zqbv8utynG5nj0TPqqxK2RUJaXO8VUHbxw60/hDnqmDK09Mi53L83nxjMYwh8t0MR6aYbJgiXZjSmdhwJptox0IxjvWorTOZkw3qlS0Q2MiCSZ51akOwYCprvoOckgMR+lcZ9Gwy/OA2LU04zoaC3P4VyexvCKX3xcILkYXx6a+BMlj/JLFLwnVyq8595wLur7dm4VE6w02MxkS25IUDcuj6TPCKLTzsrQyC13WC7gK1XwFjJJFfb9WoiHNIX1djO+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774819127; c=relaxed/relaxed;
	bh=qsziyUzMVK/XSrai4np614CT1KPUUCvkcbzCf+5b/Ps=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gneuAfA7+b3Y0ls+pHEU2YtenymeDrGCFSL06Wh506RFfurMYGQh7mW8/+8f6dYSEAYxVSz5UODHIlqmy0ALHWwfKC6HONHG2WZIqgK2JL0wGnxGTnGvRIk4LWH9onemelR/5v0Vfk57qHZg6AuKbEHVRfsp/LZTY37+y9Rm5JPY8N+MmJT9YivVvEqNoSDG1gVhMGoV++X+taUnah8x42j6BRp0rMADnsR6wqze+DIlF4xHbIZCctMV+n4xMZfj4DePFwXMFZA1dJIfZNyGRrUQDclzBNSjsWeRoxjCBzv11yLlZKA2yiIjwqifgaS8slpoVr9EsciR2/bF4yZLKA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=SsueK14K; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=SsueK14K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fkS125nFHz2xLt
	for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2026 08:18:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Az1wpAMvjBXa449cnbybcZyBn/mxnAYYC15t5tEYBVamGfn7e/HUoKRTV2LiUnpvk6aX8dPuUtmdVDZVHkGwKlkCfaueuQoT1+QchFz0KCRJqPJPPzPGJPHbvPplpJ2g/2mw+M96AT9lnJ25iHRpPFPusssUmkojn6AY3qHCilNy3J8t1eICMer0BSZLw89HqwmJlNcyebMNfhUfQK+soQheuLcUpSsLtaMl0tSqzsNWvQSwqQ5+QUJR4WjJjcL7QYKcAmvFRcfNc5HDYKLtjTQ0gc6t7hv8jYIiagl9uUx+4nokVeeXkaRUqK8p86St17KuCyVaMOha+HjSReIAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsziyUzMVK/XSrai4np614CT1KPUUCvkcbzCf+5b/Ps=;
 b=BE00VXQxiR8aECzp9KjtXUXqq1Owja6XADM7x/orPjVTjAqt/XLzvJD08/DeThxa5pOAtcRw41swcJnGnZlXfqWrndAZyrwnsOSB63WYm5p0SWx/al3QHAKc+ZqtFkQSRZNZEwA1pkGlx9B/xITSRjoe7AW/BhnIL9R+GTSlAB53qSCaTy8lbZoVelPksT3iyjOBWuQs+GZSYIB8GbAoFj5S/+wDyaUo/USZMUcxQPmOjchG0Rl4+iFFToZeE1YWonJEb19Q5JuFG7GlI5W3YXB7hHI0TsdgR1iP9yTEUFaC8pUGsKv9IL+ioynRnTQ1OzEUJSgknuyulw/jwzDzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsziyUzMVK/XSrai4np614CT1KPUUCvkcbzCf+5b/Ps=;
 b=SsueK14KY+yP/U7jQuBQNNVapsrgfJLRrZpQ1++g29BD/lf2QJI6/QY7/Sr34meIdmKD7ATq9ul1yNnC4rFalgUh4WpaFx0/mFCCn1UGq5E9W2DP5P77IT6Hun8ZtE3MZiHoS5XCqOtGVhXcMuC9Q0QDn8/cdfm0TX1oWN6ilNU=
Received: from LV2PR21MB6760.namprd21.prod.outlook.com (2603:10b6:408:350::10)
 by LV0PR21MB6693.namprd21.prod.outlook.com (2603:10b6:408:336::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Sun, 29 Mar
 2026 21:18:24 +0000
Received: from LV2PR21MB6760.namprd21.prod.outlook.com
 ([fe80::dd7d:5598:a56c:893b]) by LV2PR21MB6760.namprd21.prod.outlook.com
 ([fe80::dd7d:5598:a56c:893b%6]) with mapi id 15.20.9654.022; Sun, 29 Mar 2026
 21:18:24 +0000
From: Gary Beihl <garybeihl@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia
	<Sagar.Dharia@microsoft.com>, Giri Mudusuru <girimudusuru@microsoft.com>
Subject: bmcweb ComponentIntegrity routes for SPDM attestation
Thread-Topic: bmcweb ComponentIntegrity routes for SPDM attestation
Thread-Index: Ady/wBb2+XnSZ2F5TDupeVCU581mJQ==
Date: Sun, 29 Mar 2026 21:18:24 +0000
Message-ID:
 <LV2PR21MB6760A3F8E6E54A1BFC53709FA655A@LV2PR21MB6760.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=fd96012c-3ac2-4c31-b4b4-d51566a56f20;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-03-29T20:55:42Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR21MB6760:EE_|LV0PR21MB6693:EE_
x-ms-office365-filtering-correlation-id: ec9cd306-23d5-441d-429b-08de8dd8b66d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|13003099007|8096899003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 8CjDYRXEFpWBoaBRXnyQTB/d927KdJkgKPCn+yyKeYMfAlGXa/oQcGBnnVz+v9AuNXsQ5owtvl7l2pZlCSI3Jmx+QA4p40Q6li92QDIhE16+MBTFgCuW8nMrijoOcXxoWL5opwE7ul09MGTYmWiaAwqSkVkh3tKaZj7tQKq+3ogLNUb1DV7rxIFU7UMwMdjZXltqIZ+WECG1fFc2dgwtL0VhURsFRJZT09YRGoy8SjHI6u+2H2gzz79cdkx63B7CG+kuaLYil1NKirnl4iSbBoF5sbN6ppAUg+oAa5K9A/li7b8PH2pfCPcP6Pnl2089LYJ1wNt4nL05HRhkEgSzWDpN1pvEBXb0Fk2OUBdmsPz1I2KNT0qC8cKA1LipF9QTSfC4gMZkLNPzzB77t73/uLJ3j/kPss/LN7v0yA0n0rKwVjMWptZPLFQ1hcK391wwGXVfgFX/vZZBZD8i/RuU6Rg16cbLJnGbpcUFFJHCmO4mQXrLYk51CcyCUXfI+4IwzBnV1ao7akMvhcdIe1+GyhD+0L3rtnQAS+e103vpp+XKPXQ0LUs4HRLIfc2z/x8luIS9gtevT9g756Sn+ryuAyYjKeUS9CZ2mUK8G4Sb2/tcwjJvYTRH/bMxsmPldoAyAzFz9K+jHW6Lf8yDsb0/oQBA8bqXTYRA1WnnlDgriYDmHuyrhfvqUp7K29/y+LJ4/7UuR8gwHn/8F4ywLV76ioxR09pQxbAdhjLWOKTv4WEP8CMdlWtpR+jw5n8w/WQj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR21MB6760.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(13003099007)(8096899003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CbAibcH1pKWvCKlcXCVJ2j2apCyJB8qZqm4lHhgn4HAONHrDwQWhbVfLm7W3?=
 =?us-ascii?Q?/wMfbGxMcgWonjjnbrjHQ4ZuWzytshgp1DPhEq/lDgEJHrspDnFJet20vdmF?=
 =?us-ascii?Q?R7V5fFzN43b2osTHTIWqica5rV508N4B+pXqkci8k7OHURMB40hpumfMFa0M?=
 =?us-ascii?Q?DL6Y9Qnf23qi252d+lhXB2an22aDsSfgPOK7IdM5K2yRxFcHpZ2kPu0gBz0H?=
 =?us-ascii?Q?yt2msxHL/8sCkf9MgNoAXNBOpnNyfxKVkbEDkytcYU9oFeCr3P6Z612HQiiF?=
 =?us-ascii?Q?cNG/T91hQPhjJ3m9nBAEmpNK+ABGUNMQc9hfsAQJaLNUk+T+IZnj5BD3pNU3?=
 =?us-ascii?Q?irnIvSC4T4uIqPp7PXu2HrZ1bR6S19bBPqwiEdIOBX+9N8iCxrZHLB4SujiI?=
 =?us-ascii?Q?XT9G0R7jeZvTJuNoGxvzhe0P1ESUFJTfRnrLmdgJeKl3szECLwPiNSfStLXX?=
 =?us-ascii?Q?9n2cYPKR3tGnzoKmYdcS/Kio291KqN1Vqr7pKBYGrTeuVFxa3/iISNQoMvCA?=
 =?us-ascii?Q?EHAaGmAFh/iVBTLUHAHXUryJOx05N9l6PQShFF0CHVtTSzI/GOtZgG9xEEbO?=
 =?us-ascii?Q?NC9JhTSOw8FFWaLbhmoI2onebM88z0UMCMr1nzMvysa/q1GLFXYabE5Un0EL?=
 =?us-ascii?Q?aoUnwf4vg43rDtebkG3Nevy/xt2uerqX2VU5B9XGbQmyS3ZmFIGUm8LTLz0d?=
 =?us-ascii?Q?6LMtZn55vaQ/RJckC4o6oNrVqxNv0UWV7cJ2uyNAvGUzKdFoMBgPfxjM5kSD?=
 =?us-ascii?Q?iY1QnDe1JfPUFt0ZG9fGzjvh4O8iDSldJ6/YSAc7XGfBrh98x8MKYL6MdPF9?=
 =?us-ascii?Q?EUcyWVHlqWRxZtvTbON3AJVLovKyrfGrokeWpy9VVsfyoN9EDz2CKJ2Q+Enp?=
 =?us-ascii?Q?dJ9f++LF21EW/J9+JOS0gMm3rY+gOa1fVEGAO/nS8Fj7hDDFle2RwEWxGd+m?=
 =?us-ascii?Q?OGOG3d6j8ayp59tonRhYTkxLEL5ozzcPzYEel2sNpEDAlusb0QxVe65nH6M7?=
 =?us-ascii?Q?7iv7pn0VkFxtNZ11+vR7YcCtXVwEI81ViC+98M50Ta+W1NhNGAzV0PwpWaks?=
 =?us-ascii?Q?JOhG7HfUFoLwf+giH+AaqNxelToTEi22CYfFYHiUpDU4I5PnTH19CoJ3Esn8?=
 =?us-ascii?Q?LtM618ZOTxghOGMXq34J50wfh0K7ljZGYUkSSWWVZVGG7xMjTP2jgq1++F3j?=
 =?us-ascii?Q?3GNyZovDfVm+FC3AF562QhSNRa1NHBfY3yZQUMH/x94MFaZk+H5yqwNA68gt?=
 =?us-ascii?Q?W2oqpsit97BkDf5135TQibLLdsL40CtWR9udupdFSMNVOIJGjWg/0Aot37QO?=
 =?us-ascii?Q?Ess/AGXIB6w+LvJzB1PjAGiCmzLHFxKO8RqG/4iN0WAUF581KcsGSkJu6x+J?=
 =?us-ascii?Q?Oy5gy4G6Tf14GuYaIFWtuRWPu0SZpfUcOFhhPv02m7UZu7Camsy63UbGUSzY?=
 =?us-ascii?Q?J6M9xw/Elk/4BuuXKLVzx4rs0zDgDdGtWmrr7KO+hdjCTO0NqMt2CJsFgLzq?=
 =?us-ascii?Q?apAcwKaJD6WcFAjSKBDt7igFq0BCFeba8wYbiJorBQsrkjribc+GjNZG+aI2?=
 =?us-ascii?Q?3glgdt1DR75Zwf5w/LhHqnESoXBMxc60sMLMh+u6h1DwiEQaItrpHEJsApTk?=
 =?us-ascii?Q?qGf9DL2rOwaJtyldJLl3GXm1GAqOHP7i18yD/gVlwnWp68TrZj3pWH3Q2uct?=
 =?us-ascii?Q?ci1i8M2QwuV/PnAwP9arbIT1ocRH7aymxrUdXSbxK8LXBhCulUDsMMvbGU2P?=
 =?us-ascii?Q?tYHjtxZazw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR21MB6760A3F8E6E54A1BFC53709FA655ALV2PR21MB6760namp_"
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR21MB6760.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9cd306-23d5-441d-429b-08de8dd8b66d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 21:18:24.6189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxL6Kq3x3rPLhutSSpm5wT5OAKWkKNcEAdWDiQvzDRsfGB2jLeu4YwL/sxgbansLmmt1AwbTyEnVco+oSVeTOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR21MB6693

--_000_LV2PR21MB6760A3F8E6E54A1BFC53709FA655ALV2PR21MB6760namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I have been looking at SPDM attestation end-to-end testing using Renode and=
 have a working bmcweb implementation of the Redfish ComponentIntegrity rou=
tes that consumes the D-Bus interfaces already merged in phosphor-dbus-inte=
rfaces [1]. I noticed that the previous bmcweb WIP for ComponentIntegrity w=
as auto-abandoned [2] and there does not appear to be an active effort to i=
mplement these routes upstream.

The routes are designed to complement the spdmd D-Bus backend work currentl=
y in review [3][4], providing the Redfish frontend needed to complete the a=
ttestation stack described in the design document [5].

I wanted to check whether anyone is already working on bmcweb routes downst=
ream before submitting to Gerrit. If not, I am happy to contribute and coll=
aborate on getting this piece upstream.

References:
1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/xyz=
/openbmc_project/Attestation
2. https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61702
3. https://gerrit.openbmc.org/c/openbmc/spdm/+/80272
4. https://gerrit.openbmc.org/c/openbmc/spdm/+/80274
5. https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attesta=
tion.md

Looking forward to your thoughts,

Gary Beihl
Firmware Engineering
Microsoft Corporation










--_000_LV2PR21MB6760A3F8E6E54A1BFC53709FA655ALV2PR21MB6760namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello everyone,<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I have been looking=
 at SPDM attestation end-to-end testing using Renode and have a working bmc=
web implementation of the Redfish ComponentIntegrity routes that consumes t=
he D-Bus interfaces already merged in
 phosphor-dbus-interfaces [1]. I noticed that the previous bmcweb WIP for C=
omponentIntegrity was auto-abandoned [2] and there does not appear to be an=
 active effort to implement these routes upstream.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The routes are desi=
gned to complement the spdmd D-Bus backend work currently in review [3][4],=
 providing the Redfish frontend needed to complete the attestation stack de=
scribed in the design document [5].<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I wanted to check w=
hether anyone is already working on bmcweb routes downstream before submitt=
ing to Gerrit. If not, I am happy to contribute and collaborate on getting =
this piece upstream.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">References:<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">1. <a href=3D"https=
://github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/xyz/openbmc=
_project/Attestation">
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/xyz/op=
enbmc_project/Attestation</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">2. <a href=3D"https=
://gerrit.openbmc.org/c/openbmc/bmcweb/+/61702">
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/61702</a><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">3. <a href=3D"https=
://gerrit.openbmc.org/c/openbmc/spdm/+/80272">
https://gerrit.openbmc.org/c/openbmc/spdm/+/80272</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">4. <a href=3D"https=
://gerrit.openbmc.org/c/openbmc/spdm/+/80274">
https://gerrit.openbmc.org/c/openbmc/spdm/+/80274</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">5. <a href=3D"https=
://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attestation.md"=
>
https://github.com/openbmc/docs/blob/master/designs/redfish-spdm-attestatio=
n.md</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Looking forward to =
your thoughts,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gary Beihl<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Firmware Engineerin=
g<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Microsoft Corporati=
on<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span s=
tyle=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_LV2PR21MB6760A3F8E6E54A1BFC53709FA655ALV2PR21MB6760namp_--

