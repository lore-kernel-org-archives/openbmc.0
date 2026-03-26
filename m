Return-Path: <openbmc+bounces-1728-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9EA109E52B
	for <openbmc@archiver.kernel.org>; Thu, 26 Mar 2026 01:30:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fh5n14T8fz2yhD;
	Thu, 26 Mar 2026 12:30:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.153.30 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774488613;
	cv=pass; b=M3DqMUVbYrxP2ee3s/d57BogxGJDpwSnE0m4JxiO7m8YMeysmHdon7sO4mbE0Ric+U27gq+vzh2rU9mAmYbhOZWDo8DawnuXBVPFz0pw03+hj83VB075KB7FiTMtIjP2VWFe5Mk7soeTXiS2cPv1ObBc/gvaKb3R3GuIs1ye0tpkup9s/cHw6tNGcp3UReinXGTAOR2J7mICEAt0Kmp9whrZs9b1ZTzG5gC0gxEUSbFCDXrd6I6wRd4y8M4a1xngTkuesSm/EqD46t9tyjBw9O8PxM5/mVjWEmbq5uLOvPX/51qzkc4f6xKBBUiFo/ZCQH/aATaGNVxBays7xkBBqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774488613; c=relaxed/relaxed;
	bh=mHYeZyD9V+7Pop2dvSUsdZ/akVRnjkc1Xy/SwuoUZiM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GMmHXzi3xQyb4qJAFqpchgxrpJdneY8rOou+uJU9c7Lu/HOrIz5rrxIAZEXP1LFACu3HFmptStaRFr5ksM9KyrPcwsIIV8GuHB/HaUWBOFCGvf2CQz+dcBf5Q5D99lm7oaHOz54AH6xvvUH1hFydxekLvtZPa7itDunn6I+LrqP5tEdLB+vVKX6TBr1kFrfojEUcL4Zk6QcNgYZqeVOEzWREnaE7wJ3zYvUwIZ85q0hxZudw+FAPwcl0+ULyhS0duwny6QXLfCDvKii48ESjMWF7bX5ha7QDxAWET8CxkQm/Wxk9spzefFCzTTvFjalCo+TscteEsbmDzzRkItN3jQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=KDOCx2wP; dkim-atps=neutral; spf=pass (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=154552cf1a=jagpalgill@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=KDOCx2wP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=154552cf1a=jagpalgill@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 592 seconds by postgrey-1.37 at boromir; Thu, 26 Mar 2026 12:30:11 AEDT
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fh5mz1LxYz2xlP
	for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2026 12:30:09 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 62PMUFmL2096840;
	Wed, 25 Mar 2026 18:20:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=mHYeZyD9V+7Pop2dvSUs
	dZ/akVRnjkc1Xy/SwuoUZiM=; b=KDOCx2wPr7XNeibUOsFr1xAmY6VEdPSj7atB
	UBYe/2qqNBrFLA2pyzjiuEZk3sHRNFMd7d8XPUldVgaDSM/RiZK3kcq5kxpkPd3+
	MPEdymzsjuzjynY3knaZ0pdW05Qhhj6H6GcSZZd+SRGdwDfD1zBqA9UmMxlDxEjd
	s1ynfYinaVMFq8YptYqnu5HpGU4piZd0Twf0Oz5+OHtGY6TiI2C3XYbO9nqH+tcf
	cJ57yvfG2j2KeMsOjd3AJyTRnPQ8iX2Q1kQnEKJfYLRMJT0eg1/ofn56PVmPJZyP
	DElTHX0PRg+OeRRuIoPhXY9GCg/hbpm2M9E846aL0G2K6P+Qaw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by m0001303.ppops.net (PPS) with ESMTPS id 4d4397yq0p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 18:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIgDi3dv2Lx1zlguLBrmI7Qu+Vij6JeEtSir0uqJTHORyCeZPlftbIfNUXMIQbPYhgmRrkBrSX/AOSGN6QmaWA28sXripsrd4TyblYXtQjLNBUH5W+aEbuAI4Y5r2Mw+G3NIlPCF0Qai1Q5B7cdEdYuuR0G9e58na3JGUE8Yq44sSlYcNisbTKdeAcWHFAoUf9lJ6k95quPDyQPVgjec06k2r+7qOapsM5RW/wfTf8Rn3bAOV1zkT1GAtyUQH6CvSxnzTmJhzvFeysAYoarV7F/U2FTDgbE5EOFKW7/YYgTXQWjqTq8M9zC+1ahNVUFt5SrblRbI+8DPb2k76RPR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHYeZyD9V+7Pop2dvSUsdZ/akVRnjkc1Xy/SwuoUZiM=;
 b=y0dBlGGnNxc5XcalE8Z8n5eZkXVEatfk6VRJ8t+0YDxmfwczOwPWrm5s/UWAzTPgLEpSAf83CbE3yWv2LXjx2NQ+UGBey9GdgSbJiyvI8fU1ybpla+wNZt+ItZoWCEpkHfusO+Ouwp1mgt01ApBID7HantNrMNkDvA7H3a5pZE0HPPxKBGqbyeXSmWtmzB5xX+p5tunrrmILr0lFRejibNIOCKGFMQevKKnraYB4xldU+NKhWcrKHYj9xtnvIjcOs9KOKZ1pxOPH/ABw7uiwyDbIOpaHQ7lbN4WcjQs0kM4T+SINZIVjrafXo3Wi1nRclwGs9Xko7A0PY2B3a8Xs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6411.namprd15.prod.outlook.com (2603:10b6:408:1a8::20)
 by LV3PR15MB6556.namprd15.prod.outlook.com (2603:10b6:408:273::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:20:10 +0000
Received: from LV3PR15MB6411.namprd15.prod.outlook.com
 ([fe80::774e:d784:6bcc:a990]) by LV3PR15MB6411.namprd15.prod.outlook.com
 ([fe80::774e:d784:6bcc:a990%6]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 01:20:10 +0000
From: Jagpal Singh Gill <jagpalgill@meta.com>
To: Patrick Williams <patrick@stwcx.xyz>,
        OpenBMC List
	<openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2026H1
Thread-Topic: TOF elections for 2026H1
Thread-Index: AQHciuR/6+Q2ymkGzkCqnmOWwvAAQLW1EReAgAtWcgA=
Date: Thu, 26 Mar 2026 01:20:10 +0000
Message-ID: <6D2DEF77-3C66-4105-B92C-7FC136EB81DD@meta.com>
References: <aXDmS4BmR6AGXKGW@heinlein> <absG_8pQilMHGMnO@heinlein>
In-Reply-To: <absG_8pQilMHGMnO@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR15MB6411:EE_|LV3PR15MB6556:EE_
x-ms-office365-filtering-correlation-id: f97cd199-4fbb-4a74-ac5b-08de8ad5d319
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|8096899003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 DqwoJmGYqZygi2KFRNSaVNEyJUeZYeuEzRSAlu3Ly+AVK4j5bzlhnjivrB9kMTpY5p73ehtJe2pWgAxhAuOskl1wTlxOZ0y9Bhet94b/Pg/Vt9eSezOtJCyy8zSnGFOfiC1wqILqjrwJLl2xnC+7skg0cWZyYcT621Ry/kbTo2bR8SMkct9rwhHNyhUv3QSv4BcCUTGN1v8DScGGUVTT3Vj143rCBY74qDpfYlxef1bGsu2V1m9XJysiY4wmX0N7tMRSJ30Y6LyXM4vN77qoTDz3GkUG7n+S6NiuTXka4aGW86By9GdJYQ2llNF6VmpzaVRx5Wv81WkXHMJCovBAvLc3aZ3NT9jSl+G2XyUF8bY/3qAvLY1lLFlIuMmt80YVcwuJsn960Qz+J4RfiDGupvcZPrbTkd9dSC1sSTUwwJjfV9NCZ47Mujq552NtB6JQB5k/MwXhlmjUwYom9kEw6djowyeX8MUKs7jgEEFdih88kExCbvVocvZ1Da3TMA0hgPa2/f7Muwv28cl5AYqjen8aeh6JweSosJDZUS7Eo/NdS6otycmGs5qofWB+qre+3qKsuIfdleCmfguLTP8HjBmuxV+NMgHQlLk22ybXmIzrBOivXOvjkzUz8BujbtXJLKewUO0pKgcpo7WbQboNV0EJLZvGxIgxWlBxKRl4WGgal39e3LI8SFmk3QJbHTgv3RBJG4ldI2S1D6RRTT+RICBKQ+aeA6YyYB7ANx5fz3CnI0hNiIlxuI5ycJ5A2PZLHgsSPL6kvtX5zhO6NaU9+NlgivEFRMtAM9ssjuRHfGY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6411.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(8096899003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hb0aoFdtgty8K0OwfPYTcVTO0ar/yKZp9Fr0SmqRXsf6XIvWYUrsSF3FgN0p?=
 =?us-ascii?Q?HTCX3FcEMxm/mew496oF5Ckbe2KtXCKuAsHEufb9Y2jPpvI8uJt99bDRZp3g?=
 =?us-ascii?Q?0WMvZW0zJifzHYIDs8Zo7L+EgH1P2CYZl/TjIErIL9XgpBOOLUD/vkC+2BOD?=
 =?us-ascii?Q?HN77b0BZGStZJ2RIrm3z0/58XqQQ1bMweExezUimp5s82fQI0njfPSNR7kWh?=
 =?us-ascii?Q?UxqFuoQ9kSpDqJ22/ADYU+9hM48oEqWmdO2gjwd+yeHglyBlxSrt8yJ7rlCU?=
 =?us-ascii?Q?Oom/zdFU1wkQDobMOQ747bU8lFGLS7V23dM6y51ltTfB+R6fpIRDPTL1nHjY?=
 =?us-ascii?Q?b2zJQkgJigUjfVMLzeN/5PwzveB81pVH3VUFoF3d6wDaAeqDsQ8hZxBbkOmA?=
 =?us-ascii?Q?mjh/Y0opAb0D8WV5tR1XCu8Lva1e0UP88npbrxwAp0M1UVgy/LXBfkVqbh8r?=
 =?us-ascii?Q?P9okL82L5pyRmA8F2L2q4RTY0q+rXUUzW9VREjpz5THxsj4iSzDV+vAQ7hyj?=
 =?us-ascii?Q?nmMpDT4Iq/giqsyeUpeEG6Bi3TdJ+AkQTbiKKagL3Ani7yRVvT98SdEH3XD2?=
 =?us-ascii?Q?n1d5qC0nwhUY+G3GmzIfuxLhurMVy/yPmkZejuX8aF4ONg25lKP3XAyVM6Td?=
 =?us-ascii?Q?thXI/YHRM3mkFoZSC9p6AOBNletqsQlIzkyexb8VI1yqKG5DMR0q6Izp8Rl3?=
 =?us-ascii?Q?tbGt/S4gN+wFpltBBo/WeAsjYe4IEarjVzIt+AOrj7MCDaVBxPPMVY4SDOpA?=
 =?us-ascii?Q?vD/Zu8d6j5VmEEqf6OUPBF2scoqKzqLvsSQj0FQB3lUJiqnrPVAgKgqmJD7k?=
 =?us-ascii?Q?N09S3IvTbL4ozN4fgx9EtEVHMEoEzLJm1EbgvpV7q7O03kkVEoFydHyxa5Uh?=
 =?us-ascii?Q?vron9DC6lZdx+JItNZ767gEZQj8HtxrTuvoZM5vtLNLpGqMCrymzefAaY3wn?=
 =?us-ascii?Q?yP/NhBX6ykCn/Iw4GVf58KRliAFZeYl9eAXnSVAc12Bf/crM+4NiDCt6Fccz?=
 =?us-ascii?Q?ICZbMV+l9oWdz2n0Fzkn2eBJtSmZ3CM6Muiaa63O0J5bFVA1yEhTD51tUjUo?=
 =?us-ascii?Q?gAqYCwRd4obLUIFPcJlEk7+MZR2nPelqYfu3AJQN9tddmThD8jBuWjmSsQKs?=
 =?us-ascii?Q?rk4QYKAGfQXqlOavt1DUGuOuQGvwhyBwEYGeGT/WHAAnPdKn4kz1CxATOtE5?=
 =?us-ascii?Q?7/r7ZI5UbbMypv5KJIDySpSD3uChm6a9h3nzHQNq2QyeKLOd7Jt+yKE0UFUu?=
 =?us-ascii?Q?lPSm4N12Ofi4a3++kZc38mKN0C35rhHdChatEPCgv164rw3CGnY6zc6mfKtK?=
 =?us-ascii?Q?4EJlcLOCcoafrInD4lrgBgNBB06ph4P5fW0q8ZhxiEx9UCWB+QhVjmFgq42B?=
 =?us-ascii?Q?VzASTEm5hetSxjaE564X7I6ZbBzRXE+VD0UTwcdP6xryDSGZ7McXzB1xc4z/?=
 =?us-ascii?Q?jZ3QeLI81rKCxQ2QXRSVX8/ADzoTHEa1hKJkDsTUAa7g0+Lo0Dev58kX2hPe?=
 =?us-ascii?Q?h53+1Rj3eDqD3Bt51CUiGENxvE9zGEXo/BkOL97Ra94dJnoFXblVAflxa2NH?=
 =?us-ascii?Q?xfsJiyKLq3uBA2kRYzAst2y/+AVCY67Z/MErCmZOt3DcVpHaejaIGbbJyLK0?=
 =?us-ascii?Q?4MZkIh/EbRrENljriu55KGg3+NEDcviUWwULUWuEXVzzp9VfKFCE5Cqy7b4w?=
 =?us-ascii?Q?yGrx8Hrmsyx9orO6b/P+CQAtH1MUq74SP8TBnkNyhARe+ybZhxp/8X9vbUe2?=
 =?us-ascii?Q?tic6Y92f1A=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_6D2DEF773C664105B92C7FC136EB81DDmetacom_"
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
	MRG0YTCoZjEMmhMGVpWQ0DpLmzGt9P5m+4Hdz9MAFvzOvJgBBohNRBUSLIlS26HjFvjRkNUHql6vZqLCJi7ZBdgb7e8XQOHJiMV4e51oa+DbG+37SQNspu0orL+cCzKPsgKGPUhB1mN3th6hhf1x2dQTOriKuPXsym7/vZhSqQLCNFRsyBHm0I8SfVex4gxAfSfLKafniNCqpAB5JsNF9mb7Cc58IKeMgbFmV548n9qBsPXYkG3J2Z6qYid0llJeWsuz4HNodvWo3yAjVlRD3uq/zVvZRWjuTlau9OSMVRDvGgrdctJzoM4tcT58pVPSV2gr3edOHjzS6+jYMrbfYg==
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6411.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97cd199-4fbb-4a74-ac5b-08de8ad5d319
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 01:20:10.7283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGlEZ4xkWh/8cA6rl2k2LqHXNOs6DVOIT3nShKITBtlP59b+b3AYHcKTKuuoc+l5MXGdI0bg+AhZvmhFSqsOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR15MB6556
X-Authority-Analysis: v=2.4 cv=Na7rFmD4 c=1 sm=1 tr=0 ts=69c489cd cx=c_pps
 a=ijphbjn0GKEIB6My7LrvAw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=rVd7CoWTvkkwlaKvKLkA:9 a=CjuIK1q_8ugA:10 a=261peXrfMfwARPtv:21
 a=_W_S_7VecoQA:10
X-Proofpoint-GUID: qIh5j_12ZJfZ9jTQNqP8lA4NOcB6JNVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAwOCBTYWx0ZWRfXzqppstSNEvIc
 tq/zSMjzQzOfDih1OgQwW9qKY7FbS4TXtTZ2o3/OUyyt+wUplTE/HYo89hIIL2q9x8N9Oz/vWS4
 naJwQpZ6SMW2j7qGSIsg8+NTCapSd1j4YAFX0hjQ9ZcI8PcAixrxpAA735+qiCoL6SFELgR2fr2
 lohA5rw+rLQ6iXqP1Bs0Sv0nDHdoiWs4R8vQfXT8AE2FEjq9yPjch78id9805JHn/Q1n42V3YQM
 Qh1GD2/5Mu08ldVa1Y4SWCL8HXL0QMv3bof4wwgydt17c8g3Q0xGt+q4rO1jubP+6TAL6DuqMbO
 kAvTBRz4ZxJBOU0bsytA6oIHfmgcwgYMhRjVr/WrEzny8tKOFKGoHRS5BWGYbuj1yuT28/J5JAT
 5kDgPy2TA3PXHTC410SgefCeP2LdJwJo5/G+6ITyVVaFEmTiU2Q85WjudjEO27+k8PBDoN7Wq/N
 NE17PmpS5n3dF/+nQ2g==
X-Proofpoint-ORIG-GUID: qIh5j_12ZJfZ9jTQNqP8lA4NOcB6JNVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_07,2026-03-24_01,2025-10-01_01

--_000_6D2DEF773C664105B92C7FC136EB81DDmetacom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

With this being the most nominated-for election in TOF history, I would
strongly encourage candidates to reply to this email with a [brief]
campaign: who are you, what work have you done for the community, why do
you want to be on the TOF, etc.


Hi everyone,

I'm Jagpal Singh Gill (GitHub-Id: jagpalgill) working at Meta Inc, and I'm =
running for a TOF seat in this election.

My contributions to OpenBMC:

I've been an active upstream contributor since 2023 and I currently serve a=
s owner/maintainer for the following repos/features:


  *   phosphor-health-monitor -- Led a full rewrite: health metrics framewo=
rk, hysteresis, threshold configuration, storage/tmpfs monitoring.
  *   phosphor-bmc-code-mgmt -- Major rework of the firmware update stack: =
new async D-Bus update interface, led the effort to develop a common layer =
used by different update service daemons.
  *   phosphor-modbus -- Implemented sensor, inventory, firmware data colle=
ction over serial.
  *   entity-manager -- Owner for Meta platform configurations.
  *   dbus-sensors -- Maintainer for LeakDetector and CableMonitor.

Beyond these, I've contributed to bmcweb (Redfish update service, multipart=
 form handling, Manager Diagnostic Data), phosphor-dbus-interfaces (new int=
erfaces for health metrics, leak detection, firmware update, valves, pumps,=
 cables), and sdbusplus (async fd sender/receiver, async mutex). I actively=
 review contributions from engineers across the OpenBMC community across mu=
ltiple repos.

What I'd focus on:


  *   Ensuring new designs are reviewed thoroughly and are architecturally =
consistent.
  *   Helping the community navigate the growing complexity of liquid cooli=
ng, modular chassis, and next-gen platform requirements.
  *   Making the design proposal and review process more accessible to new =
and existing contributors.

Thanks for your consideration.

Regards
Jagpal Singh Gill



--_000_6D2DEF773C664105B92C7FC136EB81DDmetacom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <4860768B93880F4393DEB16DB5E26753@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html aria-label=3D"message body">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
<blockquote type=3D"cite">With this being the most nominated-for election i=
n TOF history, I would<br>
strongly encourage candidates to reply to this email with a [brief]<br>
campaign: who are you, what work have you done for the community, why do<br=
>
you want to be on the TOF, etc.</blockquote>
<div><br>
</div>
<div><br>
</div>
<div>
<div style=3D"caret-color: rgba(0, 0, 0, 0.847); color: rgba(0, 0, 0, 0.847=
);"><font><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">H=
i everyone,<br>
<br>
I'm Jagpal Singh Gill (GitHub-Id:&nbsp;</span>jagpalgill) working at Meta I=
nc<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">, and I'm=
 running for a TOF seat in this election.</span></font></div>
<div style=3D"caret-color: rgba(0, 0, 0, 0.847); color: rgba(0, 0, 0, 0.847=
);"><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><br>
<b>My contributions to OpenBMC:</b><br>
<br>
I've been an active upstream contributor since 2023 and I currently serve a=
s owner/maintainer for the following repos/features:<br>
<br>
<ul style=3D"margin: 0px; padding-left: 2em;">
<li>phosphor-health-monitor&nbsp;-- Led a full rewrite: health metrics fram=
ework, hysteresis, threshold configuration, storage/tmpfs monitoring.<br>
</li><li>phosphor-bmc-code-mgmt&nbsp;-- Major rework of the firmware update=
 stack: new async D-Bus update interface, led the effort to develop a commo=
n layer used by different update service daemons.<br>
</li><li>phosphor-modbus&nbsp;-- Implemented sensor, inventory, firmware da=
ta collection over serial.<br>
</li><li>entity-manager&nbsp;-- Owner for Meta platform configurations.<br>
</li><li>dbus-sensors&nbsp;-- Maintainer for LeakDetector and CableMonitor.=
<br>
</li></ul>
<br>
Beyond these, I've contributed to&nbsp;bmcweb&nbsp;(Redfish update service,=
 multipart form handling, Manager Diagnostic Data),&nbsp;phosphor-dbus-inte=
rfaces&nbsp;(new interfaces for health metrics, leak detection, firmware up=
date, valves, pumps, cables), and&nbsp;sdbusplus&nbsp;(async fd
 sender/receiver, async mutex). I actively review contributions from engine=
ers across the OpenBMC community across multiple repos.<br>
<br>
<b>What I'd focus on:</b><br>
<br>
<ul style=3D"margin: 0px; padding-left: 2em;">
<li>Ensuring new designs are reviewed thoroughly and are architecturally co=
nsistent.<br>
</li><li>Helping the community navigate the growing complexity of liquid co=
oling, modular chassis, and next-gen platform requirements.<br>
</li><li>Making the design proposal and review process more accessible to n=
ew and existing contributors.<br>
</li></ul>
<br>
Thanks for your consideration.<br>
<br>
</span></div>
<div style=3D"caret-color: rgba(0, 0, 0, 0.847); color: rgba(0, 0, 0, 0.847=
);"><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Regards=
</span></div>
<div style=3D"caret-color: rgba(0, 0, 0, 0.847); color: rgba(0, 0, 0, 0.847=
);"><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><font>J=
agpal Singh Gill</font></span></div>
</div>
<br>
<br>
</body>
</html>

--_000_6D2DEF773C664105B92C7FC136EB81DDmetacom_--

