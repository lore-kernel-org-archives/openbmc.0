Return-Path: <openbmc+bounces-1755-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE1C1061B28
	for <openbmc@archiver.kernel.org>; Tue, 31 Mar 2026 02:11:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4flBSR3KVZz2yd7;
	Tue, 31 Mar 2026 13:11:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774923095;
	cv=pass; b=R9uzYhI0NkGEMvCz0Rx+I+qzjCBvnUNTGnuF9wQmIBbfhsobufYxqFkxzi83Ro0KWoKJprLfTDIiiwfJRN1d14mhXxBC0RUUvV5rBgkzFyFrI52Z2bziDZO3sOONpm0IYG3hXTxl0BlYfDLpLkDIFTD1OBc2kcB5u/wnYwpsvTACHfNWQsKTJVqYhx3xmCg2ib+p0V+6nsSxKorYdqfqIXGFqjpVLqCEy4BKxxYTNTrDU/yKwGsAIsUs2KxQvr1Lwhy5Qz/B7Au9wa+r36skK1ACMfaXVrsXZ1/uaKM6pkQSHxKqefb05tUtlMWFZ1Qexz64xWg6QfvDj4aF39W/0w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774923095; c=relaxed/relaxed;
	bh=Y91MmBmqL/yKh04Qk9pBgaTqYIZkBDs69jCggcESd7M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GgLa8tCjfxkj7wmwk/azFl6G4J5z07JgeDZ3RCOMFI2sVDRh/7/LbVAzGThb6zbgdWeZKltLQq9rgg66yoyphkj5MuaYz5gdIw8hI2J1EeAL0+HWO56JvbL339CowB+lGQx4jBoZWrpF6DgYRiJzvmWrS0KJXjzjXf6LQOQU3wrMElFuIAoNyaw+UC6MF7cBk0TICl+8MrsPaWvgopM6Px0cDvTWriB2OTarIjQrdrXWgTGI+D8t+Fhs6pHYbfmtsz8DqyJ8dLKtWnmWxVkcGVDn1otYQTV5RwYqEkPJ1UteLZ196iATQ89Q8V/hk52YTGaRH9BczFEGkiSEejd3NQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Qf1zO41n; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Qf1zO41n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4flBSP55hyz2xSb
	for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2026 13:11:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T46CGjGz0dN15mQoUVvVtMVsDYOvq07/ZBiRAMp5GeQHkcA7jz7GdMgSOAwqowxHWBYGa8BwYutneqddkJ+mD1O8hIbvwyA31q/RpxtEKd6Cj/LXI3wwvzwcjJ2sQ53Rus4mChN6n21vTKU5Knfb+7BKKle5bNdF1aGSqlmTLhApeX4u9ST7nsa19ivU8FiuoCUeNJwyl6y1aDJEHSgebz/Gj4xzg2mxP0c5qV/0ssRM8Dl6dIB0tqonJ9iyLawy2RfdGpeDFQAWyhqKEnEPdXzcj83ihc58tlBOuGDwRHNf1o/SEXRNWZ+IwLKf4h2YAItlOvfDCQLSkYkwyVPkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y91MmBmqL/yKh04Qk9pBgaTqYIZkBDs69jCggcESd7M=;
 b=VZtgc62TGgPBTzeQSPFMqYGnbb91kyRIlymP7Z8Fqq7wZz1Xz1DBrRvtFxwaysLtUTv0GiJVxpuo3E7xTmss6XXOHmlxjgChPF6S3u77wJ9EkhAFZ2oel2C65npY+LUHuxSbhg/6rMrzNnOxzLiAg2l/FoTmsHQFfYiSurmHc5oYeQ1Sk/4DLSQDMRTv9B+SnE8CC6RgpUsC8l2l3QAAaeIA5nMJTDa5LWMoUD0uiePJx1CYsa7Q+fT6PGiLZrbK1S5JKFG3fefsD22XDcyh86ZD2nyculi4fx6U0FAevUdFMDXqU6OSGxL1Sxl/Lpx2ff/sA3Wd8wXCFApzYNAT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y91MmBmqL/yKh04Qk9pBgaTqYIZkBDs69jCggcESd7M=;
 b=Qf1zO41nnp1cbLIOQ5OIEDf8pUDLq91WiqFcpt+MmWKj+evjsg3f+NcT3YctTZdJwjQmSyMjk8p5LA00uTk1hKSD8K0/jkYDhfKc6C6cy4SGLtj9xVLQwlbXBNs8NH1FHG+jjZEwkWMQ0oCoYW6mvMlMlptgokxpd2dqRzO/XalHIo/nWhKzAk3y+Q4vj7y/fvQUOnL4D1hkGAuRc/gu/GyDVQA2FHyYpdhv3x6JmMCl4mdvtQFrrMQcxfgIkZVbSyj6OrNBVjYphyBS7ly8NcMM/7wq2hrwgUqlYUT2kDK739J3D0QfsOXNuuBUim6MPN4fQ8v0XuvP8NbOKnkktA==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by KU2PPF8E2519EC8.apcprd06.prod.outlook.com (2603:1096:d18::4a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 02:11:07 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::70ce:4bec:2757:dc37]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::70ce:4bec:2757:dc37%7]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 02:11:07 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: "patrick@stwcx.xyz" <patrick@stwcx.xyz>
CC: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>, Troy Lee
	<troy_lee@aspeedtech.com>, Hugo Hsu <hugo_hsu@aspeedtech.com>
Subject: OpenBMC add meta-zephyr for AST2700 A2
Thread-Topic: OpenBMC add meta-zephyr for AST2700 A2
Thread-Index: AdzAs3wlPGH6U7dNRZ2OrBTpqXi3Bw==
Date: Tue, 31 Mar 2026 02:11:07 +0000
Message-ID:
 <TY0PR06MB5707D3F95D8E083E479A5FD9E253A@TY0PR06MB5707.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|KU2PPF8E2519EC8:EE_
x-ms-office365-filtering-correlation-id: 2430a12b-54d7-4051-d53d-08de8ecac510
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|8096899003;
x-microsoft-antispam-message-info:
 817yAMahoxEnsVAxpag2EAhhAH2uqGPG+JlME1SktmzI/J/B6ToNAhTMu0NSAyZt37dYuqZZpBCygek4rDj2fUSkziiMOzTBQaAIaAqlP+90rZHkCzl27IJ3DnsxJ0x+S9kdfFo14Lyr0xc9L3pCP5Yc1Vti4oUnTKx2C66jJqWYq5Z2zAF5y6qXcOKH/6CwEp2SIoEA9fd0d2i3xPnrY+y7SA2Z1SYyvzAz0l+0fs6964KoknkxN9oyfqVSt8aSUw47n9KR6Olc2/4VlZQqoIDMcLXpsnjV91L3fPd3muYHXBQxwjPbYGkiAZA1CQ5jiKtpfhw4fmtGO+ghUd8ExwsQhWa4UI8WZJSn4GAoZ0B6BjPKdnnDy9/bdYkwIRYHGe8GlpRTy4ZSNDDbMnNSZLeZR4lOKT8ZjuV3+ndCu+SOIKhxnOSNixY82F5all5so1ubh+I8cspLMnIsHuauJzKtSXan8Funail05kkC/wG/UyrcOGhYeaudCq4j8rTBYQy/18rXEYWFNW+Oykn0mRWuYgRZaUzdDaTMtAr3A4Xqo71L61PpF1F8gwlXKuUbaA/vh8aqaaKknx/Ku9Hfx9t9EmkICIcQw38hoaB80x1+MYI49NKoXh5zsAWgOb2ECYJ5hSoYNZaZTUYOuAoPazBxR2sTscHEwBLtzJMgUYIRf9ohODLP5Qd6kiZG/9G8NYywX78Xkd1NGy6JhaIt0/+iOdwEp5rRMmQh5N9ZfUx6sSnaCZacmD/Fdoo3S93s1lTTUOXoMyVkj/6VhtKxhNKkv7xDbudtWWMnSUXOb3Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NosvqlHSjyMhMDowyNPwFxJE8jWLkr5TLsSdUaHdkRdHdinlO3X59zWtl4j8?=
 =?us-ascii?Q?n1W9DnYJfv5PxywQdYr8IUjpGbqz7W0YwdiIbJl/2AZ0CdVAwSbz1Wmi0PBt?=
 =?us-ascii?Q?3Ye+NxXQ3byhY3uQcIF+6u+bykd0cxvWCoki868pWQ/80i+FAPuzuEkI1ylS?=
 =?us-ascii?Q?DzY45MZUUrj7KGaec2NSDAGgsK2KW3sot0QyFQ1/9l9XgXZVaRs3DjQRRRfK?=
 =?us-ascii?Q?FN/96+p0Q9KV2D359Xv+w3bPPr+0dwEa1EAk2PNXulZ3YGxFz7sbDhgekf7i?=
 =?us-ascii?Q?gkUHSkZc9vz5B6LGimVIRChqtbAjmslAmBnq2kgIZKFmQqjhCGFNyEi8m6eZ?=
 =?us-ascii?Q?TvPOQwnlNsSAtSsQpl/gAUeeRqAShH1BOXloUODC8QKwieRYcAayvlk5wGXe?=
 =?us-ascii?Q?9uZ013KxycvqDSieEFfETC58kQngPr0JdkuU8UCF8/PfdulG1vuZQ51p6wVi?=
 =?us-ascii?Q?7B6+/4cLOpH5EfngZb12Vm7PGm7hknLIDag+80ZGI9weZ4K8y9DAW/Q3heGt?=
 =?us-ascii?Q?NW5IcqbewVUkaDFWN6JtoKSzFzxMxEet5VCa7qcH7TK+8mpElAQyGg8Wfddl?=
 =?us-ascii?Q?D4+c0KEww5vIZ+4tX8usKDSuq79hyRHerrIg1Eael0ero+qPwhi/xdKTpt7x?=
 =?us-ascii?Q?R8a1SWWjCNrlSvn+hZ84WOquX62nFKIZ55xfsQcazMIww91Q7VhuSn8yLarG?=
 =?us-ascii?Q?DrXDsAKRReTG5m+VjCVHzX25JRzPpSD2IyVhhqe1R3sv39CLYGFRmYrvPx7P?=
 =?us-ascii?Q?67kBEhWLrnGNIuwx/rsSxA/XPl/tSxIcltRGUVlcavDKqex3RdpF+SpVbUc0?=
 =?us-ascii?Q?nI8vZBnEfQ3u4Zcw95f5BF0rqfoVlfh9Xpkzb9VK657DyISAHfkPKfK4oEoI?=
 =?us-ascii?Q?uFnKvESF99TI+7cS521sWoT4+zGOPRY2pAZ4Fsaxvs/FY493hWTrQmDgorG4?=
 =?us-ascii?Q?wCBkepHpGeJ340eWF0iNV54tdsVPtgg07d1cFAZJQEBeNYpYEOfcS4UXGtu2?=
 =?us-ascii?Q?LxxOm90ZtGm8Tju+Y8LFCbl+CkIPg3piHnVBbcz3mpCi9OGY/g+uG1jjvgCN?=
 =?us-ascii?Q?758HDQ0la3CJv/2g77aWE8NZeyERRtQjX2bCQo32FkXkWc4dzx4yWDrjJ+fh?=
 =?us-ascii?Q?YQ4v3ObPgNUAUm4JntzhXIk8sY05tOXrXn20xdSP3pz9lO2xK4uvV8jK5J9a?=
 =?us-ascii?Q?R2qF+XPWTyeZkqthE4VdSsmGk6cSzW0LLvdlChaKV/fiG5cVwTs9vctZzWBd?=
 =?us-ascii?Q?jVSq+J6I1WqCKDo60DmrSRdVl3cY/uh0ISMAeD7DnGHOC4mNYIwqReEeS/0G?=
 =?us-ascii?Q?HgQFp1EuwwaB7UI+oMV1ABgfeHHb4z3HV71+v/LC5i7M1NLDxDZv5ArpATCJ?=
 =?us-ascii?Q?7J9UHwNgZPTRUsyrSGZZ5N6+OKCX02hHZiABwDmKZOvGQAC7dNuu/XSbY1Am?=
 =?us-ascii?Q?XWeBa54ZTFHvkG+JtOZZm4cxLIQgWfXvVnd6phwE20FNV0XiHJ3pfL6TsxDm?=
 =?us-ascii?Q?iMnPbEGxb7Cs2znfjCbjcUfsbO5+8ncLsPnJUW0G4En9s2n6Gp3nhXwCyEbL?=
 =?us-ascii?Q?HPxsYTIcrvvR/HX42lrOYScxINerSQKbUYAarkPUs2Amz+uxO8PxnDoFEqaP?=
 =?us-ascii?Q?1L4Re2FCWFrmZPfH+7PW/g93WfcuQg6ROMqQMbp2jOW4sBJiBLWO7oMbcH2i?=
 =?us-ascii?Q?JHugL7mS0LDM+vIrC77rG7b9LOIAd6jnxzVWF7wuixyQqEXa1hn9NkMdCR3S?=
 =?us-ascii?Q?2yXEsGXCzA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TY0PR06MB5707D3F95D8E083E479A5FD9E253ATY0PR06MB5707apcp_"
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
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2430a12b-54d7-4051-d53d-08de8ecac510
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 02:11:07.3744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lHA6IUtrkKJQ1TfegWCSNGY7/OEz5odLqeGyvZojEQOrUoEdDT8bzJBciLBFhiJCPBprDXU5aJi+123uTRhW13n3k7fAeeS0EiFU2jR12U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF8E2519EC8

--_000_TY0PR06MB5707D3F95D8E083E479A5FD9E253ATY0PR06MB5707apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

Could you help us add meta-zephyr into OpenBMC?
AST2700 A2 the BootMCU changed from SPL to Zephyr. Because of this change, =
we need meta-zephyr integrated in the OpenBMC build.

Thanks,
Vince


************* Email Confidentiality Notice ********************

DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.


--_000_TY0PR06MB5707D3F95D8E083E479A5FD9E253ATY0PR06MB5707apcp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:616907376;
	mso-list-template-ids:385535994;}
@list l0:level1
	{mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level4
	{mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level7
	{mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Patrick,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could you help us add meta-zeph=
yr into OpenBMC?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">AST2700 A2 the BootMCU changed =
from SPL to Zephyr. Because of this change, we need meta-zephyr integrated =
in the OpenBMC build.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Vince<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">************* Email Confidentia=
lity Notice ********************<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DISCLAIMER:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This message (and any attachmen=
ts) may contain legally privileged and/or other confidential information. I=
f you have received it in error, please notify the sender by reply e-mail a=
nd immediately delete the e-mail and
 any attachments without copying or disclosing the contents. Thank you.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TY0PR06MB5707D3F95D8E083E479A5FD9E253ATY0PR06MB5707apcp_--

