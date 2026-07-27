Return-Path: <openbmc+bounces-2317-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8385CC531FC
	for <openbmc@archiver.kernel.org>; Mon, 27 Jul 2026 05:30:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h7nGz43Hdz2ygl;
	Mon, 27 Jul 2026 15:30:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=148.163.156.1 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785130203;
	cv=pass; b=e8nYZUHyGuhcYKjKjNtqLOV+Q0dDwUN7RWp4bRp6WQQ4V4LiYVkGGb4+eywefdqQswO11PPzoLyVQSYWCMPX3XoMBSAXeNcv4NU3ik3iUjXTzktgB0N63gDWySsm2MHLnetV7X1VyZOFhjGZeOnFmCEyqhyRQ6PMT/QmUgS1k3EUowtTan0dVm2WIw14EivOtGqVJW5xgCB1QGO6v2shmnD91P+7jsGLdENQAtCkP0qQedToWU0tWpDwjXVV3m2QBzY5iHGbyGs7xF1ZqRFDqPp66x7sMBfhUBO/JGSobjAr9pM4mRiFY9m+BeUiH098FsZADTzOAgd8pyf3sod0QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785130203; c=relaxed/relaxed;
	bh=ptwsyVqjm+fDAykauIrrOz6L/kf18T+xO1MWPBZ07+0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=glGN2anpQPNePd+K4PlE80hpniCpn7RcgsIAi0aO88Iebd5b6odrVJ+sfrqUT6t1jscZTfiKwLo0KXGI5SOsIPNxnuzXLlX0zDtof9xj1MWJgxb3f0Q/ROJfnS/cwx21NF2EJPx8CKXcklTE0SXt7pVikEoq//7FiL+cMW+/akrq2NFrXyVOeCfjAjYDw6f2px/XD/45ToQ5CdgNhpfkRGWHwhH4anT59gdEwKgwN6UZIdwhp495z16Ha+TKZS+k7rxalMbvY2wo0zKE3IA9FXnJ2mohu/FzrWQtmz3ODjSW6bj/F0dQQ3mfUvgE7Gyc/fohLde94PJ13c2jXrpFIA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BZI8reHR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=abhilash.raju@ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BZI8reHR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=abhilash.raju@ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h7nGx1dT8z2xll
	for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2026 15:30:00 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1mU9K3188062;
	Mon, 27 Jul 2026 05:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pp1; bh=ptwsyVqjm+fDAykauIrrOz6L/kf18T+xO1MWPBZ07+0=; b=BZI8reHR
	W2uoaBJzQnYaqlv+Oy5T37U0w+gney5kFLSeIz43q40T7of5k6Ssbqt60AwDaFxP
	m6lZRt87sVMPiyaGi4aSHDSfa0GCp5XdduifpXZwDLpSN2CgHIrC43JNeBuu8y88
	iOZoyytzl6YiLhT+KTxzwYPLkxUj1uJFU+VE+7ATxXOZpWmP/XQMiNnVTs7LYXcN
	ZDYtEdLmMHoDaEIDOpyMQRXWIzmMG7F6bAyg4Ni0waMzQ0clvvuviPi1lJLk7nS8
	Zt2F8Z6lxN5/pEnxKfYRI7lXGvH6inN/hSZpzTd7f7o9zqbFCSQX6jRJbfrzVHhG
	5elEFgT1LA6plA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuyc68e5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 05:29:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhTLZND4T5TDtcOtzWA36ziGZyffy4dT0SzGl19oNoju4BV4MHpaWqyvIwnXe6utpUQ7wGTD1dKkSDu4QNDIiE4rNcxeWNYgGSRAHbREYORxt2N06fWfmCr78SpP3Q0X6o64PqDqiq6KkZ5T2joT9BHc9ifXxrX9L9x5O4MrpEO08SJSO99cjbOR5g/DVTebb8PrMIJDp4E0d5ivTPS2im2EpZ4U7aqkNMyYuJBrpQsV0XxkwUOhq5gY0bmnZd7YsriMXvS1esdHFbUNN4KcokbChiM00eeWhJbCh1LSe4uMCCj+3UexNe8laTFjJ8sczxH5/r1kBRDQewvWAduKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptwsyVqjm+fDAykauIrrOz6L/kf18T+xO1MWPBZ07+0=;
 b=Rjg7PRH8FGFLQpcOn1/27mcjuxVFcv4/CvwLF1zpVv2HO4bgJCSn/EbquoLVAJ3lyZXbt+Ft7cHgNBxqpBOmdHcXA0R1Dswdbtq8loihB39pC6gh1EZYiiWQjv9Mh+/lP9Yr+rLQxb/IcDagqpUZX5hnYOZcpxgqLiOwFljNN2Z9NH6dgoPvhHqEDZE0vUE7AN4opf6y6ohdJ8FkcfXqIrODFPBx3y8rr7hSaivUySgCK+mg9UPvQaFa9YEOiEucDOfk06J2Ezp2s18MGOwxSpTFBXHgWXGIcYjIcSk0AP44dmazOAaQgMzpm1zZ7/zYWcEouemkApKqWBJ7y5LqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from MW4PR15MB4732.namprd15.prod.outlook.com (2603:10b6:303:10d::15)
 by EAYPR15MB735157.namprd15.prod.outlook.com (2603:10b6:303:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 05:29:57 +0000
Received: from MW4PR15MB4732.namprd15.prod.outlook.com
 ([fe80::4fd6:80e7:a382:8f8a]) by MW4PR15MB4732.namprd15.prod.outlook.com
 ([fe80::4fd6:80e7:a382:8f8a%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 05:29:57 +0000
From: Abhilash Raju <Abhilash.Raju@ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: "openbmc-bmcweb@lists.ozlabs.org" <openbmc-bmcweb@lists.ozlabs.org>
Subject: [bmcweb] Proposal: RFC 9110 Range Request support for large file-body
 responses (BMC dump offload)
Thread-Topic: [bmcweb] Proposal: RFC 9110 Range Request support for large
 file-body responses (BMC dump offload)
Thread-Index: AQHdHX+RTwfaGrOsJU2wGpIhBxF5eA==
Date: Mon, 27 Jul 2026 05:29:57 +0000
Message-ID:
 <MW4PR15MB4732A5606EC4B75814BC9421E5CC2@MW4PR15MB4732.namprd15.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR15MB4732:EE_|EAYPR15MB735157:EE_
x-ms-office365-filtering-correlation-id: 2d1d3283-8ae6-469a-d247-08deeba01888
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|13003099007|6133799003|18002099003|10067099003|11063799006|5023799004|56012099006|38070700021|8096899003|3613699012|3023799007;
x-microsoft-antispam-message-info:
 UkdmNedqlMIwuxgl7eRpM/j0cuzfmGI17Q5zAmcecncXhPzWVvUSeOfCY7cTgztv1FjU16KOV5b9g3GPG2j/R9UpyyvaTJiT/eY7dpzVXxVBJMdOtQ0Zp48M3Zf6r3uXrqBsLsNbKEr9CrOSc1pPUC0MXtOVBfOp4Oaqll15laghq4n5r2uoxVaRUx8A3ikYOOmWhF8oMTPCFzDsQC/lMVuTRhvks3lMTmQz3jVkrK0VLu43ZbWIrEWxDaWNOxkGtkb44LgaawiaFI2HnW4oB0a81u3KuWp5+ekupW2L0iRFXjMQXWXSclVLP+pLY9ZwEz9Mshbftfm7/DavtuAUcATjBYG6/5Qe2Ot8lyd9ZphXV8rbdZ8OR2Wfmxyw362DIU5S1m+DpDYYLPHrpujUZ3fX0O79V4FzahxHbQWyMUkOHgAoEqx5fkmlo8SHfnYR8OieA9z0Rj7TfkPoZtB6ehNH6XUbeav8WDHhC5gvG7ReFfl6yJPpDLk62d9L7q4OMGSEKhwdL+xazH8lpnkPrSsv/7tM/oAzUXVAM1oNDG/Z0GnuKUNEuDg7cH6ffaFhagR9H6vLDeZLWqF5gQp4SH2X+jGXv+ejVV9Ar0DWr73qbK5cuJy8Cp8yHDSz4cEHTh3cfp4TJmFmMGtjee0EIppX+5OO1Jtds/royt0Jw29yfiMY48kLjkv+3LF0g3IqIK/UaR3+fCYe2ePNFXKIlg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR15MB4732.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(13003099007)(6133799003)(18002099003)(10067099003)(11063799006)(5023799004)(56012099006)(38070700021)(8096899003)(3613699012)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8t/5aDfuvcz6IDCiY+YaWKIH+lrFRBlRcr/grc2J5F+Q49mEnFeVZmSFEc?=
 =?iso-8859-1?Q?jiN3mkelGsSRifexGFeaE9MaGZ+Su8bHU9QLOqM7aYlLYmka3liDqSm2sF?=
 =?iso-8859-1?Q?NvmyWxrl0bfbJwcVI6XS0mYUlQEJyiYaLx2VhHZg3GqVVOU0fcr+sjnUZk?=
 =?iso-8859-1?Q?h2k101pqE+jjxFR2kl+dsB0J410QbBdnlR18++qJhy1+cJGp1bMqGvL1Bc?=
 =?iso-8859-1?Q?ybL2Rzvq8ijP8eixZd9St3yumH6AX0n5jsdYuUh2lV0BslaYtevCOFnaEV?=
 =?iso-8859-1?Q?gBJYnJhsjb60i8ezjoJVcGMuE9tmgOSuN8VVfVFyTS2ok6d73ii93Rwjak?=
 =?iso-8859-1?Q?77zHQSDx+LmZrm3LxtpZT5TMfFHTcDtK9CbgqmxurqJdlBTDlHaMWVsPBV?=
 =?iso-8859-1?Q?zs74u8u4ZZ0Lb4b9HT1twXYhsyW2IbS4pGrzBgPZYTOSfVNk1/HAOKtaD3?=
 =?iso-8859-1?Q?+l1lo1JNaHg40+M/iswVFvzBpvu4mnau9Ph1OveC/MpXzny6SEIqYPU/is?=
 =?iso-8859-1?Q?twkrjwKWPyWoQYrAx/xzsh3wxyzap5RNEw6o5ptTmvNoJoE0NMxstgAUZo?=
 =?iso-8859-1?Q?OzxOsqkluqGA+v3IQHlwkiLFee2HFY98cRxr/kW5ZVu1Ogw1aYjsOhM91F?=
 =?iso-8859-1?Q?o4aEUjL/iiHBpj8rxHtgYihAPTIQbSayTX+gsBpYwZWyXsdNJH3uTYxpSW?=
 =?iso-8859-1?Q?g3C57C13NpIN3ebVLoQn5cE7JLfP6OQRPBWOcV5skGwmvFPLqYPHsePlkx?=
 =?iso-8859-1?Q?0+86tWRrp11yWksBIUMXnqyXdlWBRt3Tb4GTTFWI/V6h+25k2A0oVFRb2G?=
 =?iso-8859-1?Q?J8dxisSqsYsfjC3NFw6OIvYXtP5TzWucKtR6t8xXFtd0b9N2wjn/x0bQq/?=
 =?iso-8859-1?Q?wt2Bj3Wak45T47bbLnrj86cZZRFUNHKjwCXCYo0su37t+Q73aoununYhkT?=
 =?iso-8859-1?Q?EWRT5xwYyWvmakVLwveLUMiP9JZ6Aj7PwsxfizlhJkjFdo8HkJxS//5dSN?=
 =?iso-8859-1?Q?P8l8YmdB9Z6H864/hMzSiM/PpsBAUprLUlg6kJ/owOQQWfPxqE1jJrhYQe?=
 =?iso-8859-1?Q?dqmYFaVGwdaQdS6AQbQIl8uGkGUDjjBsu0oAtBjVA/BUhcHvUzmFgNM0aq?=
 =?iso-8859-1?Q?ftjbBykRGzhmNl7S/FEk5rtsw7Zi3mearTQkmg2/7KQxjJqA9/aYLgk/yw?=
 =?iso-8859-1?Q?Ij9nTpupEo5iBb7m/7ZxoYXyO7g+PRF11z26eSjz69zbNwtkiXH1uiW654?=
 =?iso-8859-1?Q?002xUe/1rgFiKRCi+b4Zq/mynweUJiogaRbNwPRyxnFE4f+BUGeRQXo+n1?=
 =?iso-8859-1?Q?RcTe1D+hqdXkgPIJ0Y6Dr7WLFy7o3GGOR7c8Xmd8CVABQdFO5tGVXkFiLJ?=
 =?iso-8859-1?Q?46QL/b4X28ITQpH88g8hFQFTMe42fMugGzljXSrUjbQi0/Pw/FMjoqARuL?=
 =?iso-8859-1?Q?y0vcJ8g3/HKiNQBODAWvY4NauiNRPwvWwQpBAT8gH/asY4ItfB8/PcxcgK?=
 =?iso-8859-1?Q?0ypCgeL33Liy9ggKPzcYKfCwXcXO35k7BSY6CVpozyuAzf0ELkrKJt+9TU?=
 =?iso-8859-1?Q?Le1SG7QL83y0ImzLNORmAMwRqrEKWea95+OqtYVWTBRfCAc2US7xI9VtB0?=
 =?iso-8859-1?Q?cbFO9HH0BbbeYDoS/ZM3W9QiSFCnfL8oDJGq9nSSKikX+K2DJiZiFgonea?=
 =?iso-8859-1?Q?o4Dxt5e0eqGRlD4O37kUQ933hV8ArpnckEXMbUsyjWq5cv2hWJAYCy9R1A?=
 =?iso-8859-1?Q?EFxqk5MkTscfJGB19IxuhIENY4kU6qklPX53sI6jX7uwc7pnPEbSHkH3yk?=
 =?iso-8859-1?Q?kyZaGRB47lONL5T4b8nlIZyldareKvE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR15MB4732A5606EC4B75814BC9421E5CC2MW4PR15MB4732namp_"
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
X-Exchange-RoutingPolicyChecked:
	qGN3IU8b8ACxLJQzpauIIiJx/1HX859VE8qLUaneug1GzuDfWQaV+OvRgf4zCTUlS5CEXIJq9FX8Lc0zn0JHJ8wBgPfpD6cK7TMS1zEJgLBxC9j96G8UAo/TBjgeLXE26tx7IcucEimrysjhoj7uz0XqodxQmTdJmu61bQ0R2E4lyOYsE675sC1egsKtgntv4LuWqwkx0IV+vfon70laXAndhEaCCUDvOqjFgXb72sI6qanC99oIKbh3IH9ZpzXS+2vQP/SLDTLD8jhNO3qNpBwGzKznFw99kTEkE4j6dG+u01gL9MjWiQRnT6NCM5sfczKVkmdOgJ6fakkCADnbSw==
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR15MB4732.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1d3283-8ae6-469a-d247-08deeba01888
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 05:29:57.1857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51FSuGJnS4MqcgW4wgEKFLIO5A7P/iwnmMnVmlbA+Ro3KuGrTDMfzRDGguQq85AmJkwXzYWKtY/CLPrn0yUyBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR15MB735157
X-Proofpoint-ORIG-GUID: RU-NBktQkbjGpYdjbhqXy_JZGLilqJVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1MCBTYWx0ZWRfX6wtUSMLfJ4vL
 rJuOvhw5dbkUnSJ7LAu3vXEhUWN5aUEQWemi83OOuL9PC/YDafxmREvEQChKmrnF4iJyeAGD439
 QOnuZhdRnwbLHrem17V2/IrZ5k/TRlpAprLKxBBQgzvm+GehxiaDm5oTAU40CfyhuWZI39ZPto2
 N+s8tEyqoAWBvhXrOgMyr2tJWNvLYTEp7ojRUQT915WtJ4bV8fVdWgYO/AwUrm+lASHOL4IoG1E
 iJgeSD4cZ7aCTUheCIp7+fXJbU38RCZGdnHfP/DV0+ikhz5iSQIXZ5BFbVMYMV55wxqWVvDucWq
 zjzbTLEZIyTs3IJBw1R0RVqaZv7E/wjVe44EzJ7oXLVlvVZ7vWItN9fWAjLwzEhWjqrxdKGXBVp
 l2nZhpQ2aCEAwdXw2rgh3yeLBMLoXe4PPjxyaajcLjUbpqLGO6tPLxi3NzgoK6nOuQVqN7EDH8n
 B/WevHraw0aeGa2LfGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1MCBTYWx0ZWRfXx5Et6Fy3Aq+b
 4DtWEuFurtNvICKx/XlxySiOwAmGDmaxLWIT+zy3YNS/Noht8TI28+LhsRCj0l+atTQ2HyS4RA2
 TWsKbBkjjI3qQBQS9u6CLlTAEpM1Xnc=
X-Authority-Analysis: v=2.4 cv=AZeB2XXG c=1 sm=1 tr=0 ts=6a66ecd6 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22
 a=e-GSelqVAAAA:8 a=RY7bKbEQqGCzrs8eb7kA:9 a=wPNLvfGTeEIA:10
 a=1QAUG2bRj42nk5xI:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=VTQqQez33RekakbJVocy:22
X-Proofpoint-GUID: RU-NBktQkbjGpYdjbhqXy_JZGLilqJVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270050

--_000_MW4PR15MB4732A5606EC4B75814BC9421E5CC2MW4PR15MB4732namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'd like to propose adding RFC 9110 =A714 (Range Requests) support to
bmcweb's HTTP file-body layer, driven by a concrete operational problem
with BMC diagnostic dump offload.


THE PROBLEM
-----------

Offloading a BMC diagnostic dump over Redfish today means issuing a
single GET against the dump attachment URI:

  GET /redfish/v1/Managers/bmc/LogServices/Dump/Entries/<id>/attachment/

Dump files routinely fall in the 500 MB - 1 GB range. This creates
two failure modes on constrained or out-of-band management networks:

1. Timeout mid-transfer. The connection's idle timer fires before the
   transfer completes, killing an otherwise healthy transfer. There is
   no way to resume -- the client must restart from byte zero.

2. All-or-nothing cost. Any network interruption forces a full restart.
   There is no mechanism to fetch parts in parallel or retry only the
   failed segment.


PROPOSED SOLUTION: TWO COMPLEMENTARY PATCHES
---------------------------------------------

Patch 1 -- Per-chunk deadline reset

Install a chunkCallback in HttpBody::value_type that fires after each
file chunk is acknowledged by the client. The connection uses it to
cancel and restart the idle deadline timer, giving the client a fresh
idle window per chunk rather than a single wall-clock deadline covering
the entire transfer. A truly stalled connection still times out; a
slow-but-making-progress one does not.

This is a transparent fix -- no API or client change required.

Patch 2 -- RFC 9110 Range Request support

Add setFdWithRange() / openFdWithRange() to the HTTP body layer so a
file descriptor can be streamed from an arbitrary offset for a given
byte count. Wire this into the existing BMC dump attachment URI to
honour the standard Range request header:

  GET /redfish/v1/Managers/bmc/LogServices/Dump/Entries/<id>/attachment/
  Range: bytes=3D0-524287

The server responds with:

  206 Partial Content
  Content-Range: bytes 0-524287/1073741824
  Accept-Ranges: bytes

Clients can split the file into N byte ranges, fetch them concurrently
across independent connections, and reassemble the parts locally. A
failed segment is retried in isolation -- not the whole file. This is
fully interoperable with standard HTTP clients (curl, wget, Java's
HttpClient) without any custom tooling.

Implementation details:

- clampLengthToFileContent() uses fstat(2) on the returned D-Bus
  unix_fd to resolve the total file size and clamp any over-estimated
  length, guarding against stale AdditionalDataSizeBytes values.

- Ranges are validated per RFC 9110 =A714.1; an out-of-range request
  returns 416 Range Not Satisfiable with a Content-Range: bytes */
  body as required by =A714.4.

- The existing full-download path is unchanged. Clients that do not
  send a Range header receive the same 200 OK full response as today,
  now with Accept-Ranges: bytes to advertise the capability.

- The 20 MB checkSizeLimit guard in downloadEntryCallback is
  intentionally bypassed on the ranged path -- the client is responsible
  for splitting the file into suitably sized requests.


WHAT THIS DOES NOT DO
---------------------

This proposal does not implement HTTP multi-range
(Range: bytes=3D0-99,200-299) -- only single contiguous ranges, which is
all that is needed for parallel chunked offload. Multi-range can be
added later if there is demand.

This also does not change the Redfish schema or add any new URI
surface. The capability is expressed entirely through standard HTTP
headers on an existing URI.


OPEN QUESTIONS FOR THE COMMUNITY
---------------------------------

1. Is the per-chunk deadline reset granularity in Patch 1 acceptable,
   or would a different idle-timeout strategy be preferred for large
   responses?

2. The checkSizeLimit 20 MB cap was originally added to "accommodate
   BMC dumps" but in practice blocks any dump larger than 20 MB from
   being downloaded at all via the full-download path. Should this
   limit be revisited independently of this proposal?

3. Are there concerns about advertising Accept-Ranges: bytes on the
   BMC dump attachment endpoint that I have not considered?


PATCHES
-------

The two patches are posted on Gerrit for review:

- Patch 1: http: add per-chunk deadline reset for file-body responses
  https://gerrit.openbmc.org/c/openbmc/bmcweb/+/92612

- Patch 2: http: add ranged file-body support with send-limit enforcement
  https://gerrit.openbmc.org/c/openbmc/bmcweb/+/92729

Both are independent and can be reviewed and merged separately.

Any feedback, concerns, or alternative approaches are very welcome.

Thanks,
Abhilash Raju


--_000_MW4PR15MB4732A5606EC4B75814BC9421E5CC2MW4PR15MB4732namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<pre style=3D"margin: 0px;"><div style=3D"text-align: left; text-indent: 0p=
x; line-height: 1.65; white-space: pre-wrap; text-transform: none; font-siz=
e: 13px;"><span style=3D"color: rgb(31, 35, 40);">Hi all,=0A=
=0A=
I'd like to propose adding RFC 9110 =A714 (Range Requests) support to=0A=
bmcweb's HTTP file-body layer, driven by a concrete operational problem=0A=
with BMC diagnostic dump offload.=0A=
=0A=
=0A=
THE PROBLEM=0A=
-----------=0A=
=0A=
Offloading a BMC diagnostic dump over Redfish today means issuing a=0A=
single GET against the dump attachment URI:=0A=
=0A=
 &nbsp;GET /redfish/v1/Managers/bmc/LogServices/Dump/Entries/&lt;id&gt;/att=
achment/=0A=
=0A=
Dump files routinely fall in the 500 MB - 1 GB range. This creates=0A=
two failure modes on constrained or out-of-band management networks:=0A=
=0A=
1. Timeout mid-transfer. The connection's idle timer fires before the=0A=
 &nbsp; transfer completes, killing an otherwise healthy transfer. There is=
=0A=
 &nbsp; no way to resume -- the client must restart from byte zero.=0A=
=0A=
2. All-or-nothing cost. Any network interruption forces a full restart.=0A=
 &nbsp; There is no mechanism to fetch parts in parallel or retry only the=
=0A=
 &nbsp; failed segment.=0A=
=0A=
=0A=
PROPOSED SOLUTION: TWO COMPLEMENTARY PATCHES=0A=
---------------------------------------------=0A=
=0A=
Patch 1 -- Per-chunk deadline reset=0A=
=0A=
Install a chunkCallback in HttpBody::value_type that fires after each=0A=
file chunk is acknowledged by the client. The connection uses it to=0A=
cancel and restart the idle deadline timer, giving the client a fresh=0A=
idle window per chunk rather than a single wall-clock deadline covering=0A=
the entire transfer. A truly stalled connection still times out; a=0A=
slow-but-making-progress one does not.=0A=
=0A=
This is a transparent fix -- no API or client change required.=0A=
=0A=
Patch 2 -- RFC 9110 Range Request support=0A=
=0A=
Add setFdWithRange() / openFdWithRange() to the HTTP body layer so a=0A=
file descriptor can be streamed from an arbitrary offset for a given=0A=
byte count. Wire this into the existing BMC dump attachment URI to=0A=
honour the standard Range request header:=0A=
=0A=
 &nbsp;GET /redfish/v1/Managers/bmc/LogServices/Dump/Entries/&lt;id&gt;/att=
achment/=0A=
 &nbsp;Range: bytes=3D0-524287=0A=
=0A=
The server responds with:=0A=
=0A=
 &nbsp;206 Partial Content=0A=
 &nbsp;Content-Range: bytes 0-524287/1073741824=0A=
 &nbsp;Accept-Ranges: bytes=0A=
=0A=
Clients can split the file into N byte ranges, fetch them concurrently=0A=
across independent connections, and reassemble the parts locally. A=0A=
failed segment is retried in isolation -- not the whole file. This is=0A=
fully interoperable with standard HTTP clients (curl, wget, Java's=0A=
HttpClient) without any custom tooling.=0A=
=0A=
Implementation details:=0A=
=0A=
- clampLengthToFileContent() uses fstat(2) on the returned D-Bus=0A=
 &nbsp;unix_fd to resolve the total file size and clamp any over-estimated=
=0A=
 &nbsp;length, guarding against stale AdditionalDataSizeBytes values.=0A=
=0A=
- Ranges are validated per RFC 9110 =A714.1; an out-of-range request=0A=
 &nbsp;returns 416 Range Not Satisfiable with a Content-Range: bytes */=0A=
 &nbsp;body as required by =A714.4.=0A=
=0A=
- The existing full-download path is unchanged. Clients that do not=0A=
 &nbsp;send a Range header receive the same 200 OK full response as today,=
=0A=
 &nbsp;now with Accept-Ranges: bytes to advertise the capability.=0A=
=0A=
- The 20 MB checkSizeLimit guard in downloadEntryCallback is=0A=
 &nbsp;intentionally bypassed on the ranged path -- the client is responsib=
le=0A=
 &nbsp;for splitting the file into suitably sized requests.=0A=
=0A=
=0A=
WHAT THIS DOES NOT DO=0A=
---------------------=0A=
=0A=
This proposal does not implement HTTP multi-range=0A=
(Range: bytes=3D0-99,200-299) -- only single contiguous ranges, which is=0A=
all that is needed for parallel chunked offload. Multi-range can be=0A=
added later if there is demand.=0A=
=0A=
This also does not change the Redfish schema or add any new URI=0A=
surface. The capability is expressed entirely through standard HTTP=0A=
headers on an existing URI.=0A=
=0A=
=0A=
OPEN QUESTIONS FOR THE COMMUNITY=0A=
---------------------------------=0A=
=0A=
1. Is the per-chunk deadline reset granularity in Patch 1 acceptable,=0A=
 &nbsp; or would a different idle-timeout strategy be preferred for large=
=0A=
 &nbsp; responses?=0A=
=0A=
2. The checkSizeLimit 20 MB cap was originally added to &quot;accommodate=
=0A=
 &nbsp; BMC dumps&quot; but in practice blocks any dump larger than 20 MB f=
rom=0A=
 &nbsp; being downloaded at all via the full-download path. Should this=0A=
 &nbsp; limit be revisited independently of this proposal?=0A=
=0A=
3. Are there concerns about advertising Accept-Ranges: bytes on the=0A=
 &nbsp; BMC dump attachment endpoint that I have not considered?=0A=
=0A=
=0A=
PATCHES=0A=
-------=0A=
=0A=
The two patches are posted on Gerrit for review:=0A=
=0A=
- Patch 1: http: add per-chunk deadline reset for file-body responses=0A=
 &nbsp;</span><span style=3D"color: rgb(0, 0, 0);"><a href=3D"https://gerri=
t.openbmc.org/c/openbmc/bmcweb/+/92612" data-outlook-id=3D"3af7d3cc-9a5e-42=
bd-8525-fe0a8e4d8106">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/92612</=
a>&nbsp;</span><span style=3D"color: rgb(31, 35, 40);">=0A=
=0A=
- Patch 2: http: add ranged file-body support with send-limit enforcement=
=0A=
 &nbsp;</span><span style=3D"color: rgb(0, 0, 0);"><a href=3D"https://gerri=
t.openbmc.org/c/openbmc/bmcweb/+/92729" data-outlook-id=3D"c45ff4ee-a10b-4b=
dd-8219-fbef91c2c626">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/92729</=
a>&nbsp;</span><span style=3D"color: rgb(31, 35, 40);">=0A=
=0A=
Both are independent and can be reviewed and merged separately.=0A=
=0A=
Any feedback, concerns, or alternative approaches are very welcome.=0A=
=0A=
Thanks,=0A=
Abhilash Raju</span></div></pre>
<div style=3D"direction: ltr; font-family: -apple-system, &quot;Segoe UI&qu=
ot;, system-ui, sans-serif; font-size: 13.5px; color: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(247, 248, 250);"><br>
</span></div>
</body>
</html>

--_000_MW4PR15MB4732A5606EC4B75814BC9421E5CC2MW4PR15MB4732namp_--

