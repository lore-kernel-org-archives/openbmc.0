Return-Path: <openbmc+bounces-2048-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C2BCD6E5D
	for <openbmc@archiver.kernel.org>; Fri,  5 Jun 2026 08:31:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gWvmF3l9Dz2yb9;
	Fri, 05 Jun 2026 18:31:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.18 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780643328;
	cv=pass; b=H8K8VguDiwP+uRLYU3LFyJkUaGAPGcxjjPIm7OcK3lDAOhR3mbHIO8PH/HgRfv98T3rK3ubl43HZbp7dAqo5BaBCs9B0LgrPsn1N8yDDTxJX0WYBm2QjonIVslnUfbpELEHRW5/jYm9HTTbPQxp/kLygV0wMs6oqByJpwidunXDg9rhjdHiMRaU6/e2OeC8pQ7cGC4Tm5FXlIjJlWmbF5jHWlWAhEbLpkqRFHaIBM26uBpbV1p98vxcuCJvy5q2jQnlWsUHXWIlb1ByrvDNW1jLTkXm6PmD0biSSHA6ing2re7e4t7wm+AWNU9d0EP/w+gZPIx7Nm5IKXHuvDcqyQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780643328; c=relaxed/relaxed;
	bh=fkEdnvnJU3AYqjX/8YoXilWNWoftNEMTgAxKhQoyy1E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=erlFHzuyIj04XI4BzV0ZBUmyUI1UQD19AtKOQKUz2myWULIsEVFCuZ9XSyc+OHOnV+9UcC+EevLNeO4YPhCf9pe+1x7MELTT4DjJeBo1J2q9M2SMSFPs+cOdfF6ejrAZY6qUbVE4+LUBmzd3aIY9eAwkH1g/HI2cpA+oeQ//GuIeXHAcRmCL74bTw5MhotDZ2Rcyx0PTLZiNCXVLWEUrVvJeUBKzRyDSGYwNQ3CY26ROUPZyR7sFYC5pAgyAYJs7w+zIVc1QmI5DPrLU5FuOqEA2QtQjYnXKttqj0cxcn/+RCQC05kuVTwyfDORF2QkAaQ56pSMmONga0mUdMsplvQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gawSSldI; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=ms.song@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gawSSldI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=ms.song@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gWswr38hRz2xM7
	for <openbmc@lists.ozlabs.org>; Fri, 05 Jun 2026 17:08:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780643325; x=1812179325;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=gO/ZOgq1JX+vGHAQ4zBwKKcnO4x8w4fbn3h+DKSSRLw=;
  b=gawSSldIFGn4dED6kLJBNidAdM+qzope/5RZcOXh4Qn2dmSBXWALZKND
   yYcoVG3cRSekqlK0z/wvBKjKSuLRRZDC8ewJ4bjx102ghCUHEv4oB4GWz
   25PqXKR16p9CHoefjkuywCZe6ulNTK9wOM25P5qeLBvLMRHw4rKqvgPGR
   d2zisUqFYIfg1ZMYdFYy+H8Gr1TDDbFIA72bOnF4946Qxdr2kc2/mf6hz
   6UzEvvM/hcyvN/5gsE82sF2mZ5O8nRV9Zzpgl91FW+v097OH649NWI2tY
   pM2IaDmSbzAVcFrYZfoLhBzQwWpSTR1l8za/WGKMGiLb7pXqm8yZ1Pixk
   Q==;
X-CSE-ConnectionGUID: NUTwZNhVT7q9otr9EGI27w==
X-CSE-MsgGUID: lUSAahd8REuI4q6iX0Nnyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81536118"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208,217";a="81536118"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:08:37 -0700
X-CSE-ConnectionGUID: oQaLbXFMSzKzm/i84GQnXw==
X-CSE-MsgGUID: FlcMm9KGRWKA/I1vrtVBDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208,217";a="243939594"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:08:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 00:08:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 00:08:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 00:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNt8B3l3Qw/PLURNJ2mUYf/Gx+P1m0alYblt6cjCS3nZ1goiUakMg2MsY5a71T8SCXzj7ctJCjaja+0/hdRjO/uF28eHZMB+DR6sOSlj5qf1OlZ1n5bY6fwYywNzMlJ7iCdMKWo4QviGOCq6dvD7ODaDUKKu4yT/SjIROxySUKL7XF+mMNZKO2xrmjCDsG/aIQ+xexAMzv8q2+lpjJqaWgSwiqQGo1UcblAPb1lEiNcm2JUDmKT6ZHZUEE4DNOGYBy9yJVHqi5s6yBdvNQCm64JFjOH91i06yEimQhRxf4AxeaDvtollfoZfqOJvMsvCKLA3YwSnmNm5e3knHDsqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkEdnvnJU3AYqjX/8YoXilWNWoftNEMTgAxKhQoyy1E=;
 b=RdEOgRxZ6UmdnzY0PZCY/Mh9QPXvSvAXS5+l/k22KFnvbAMLTARR2NfjHt87IZpKVY1UXOLwVGEiit6Q8egHRJ8zyQOzuFSqTLl8R0v5FpykGgaXRKPgCjdXfnxoaLW1GRK3nDIvIGiQg8r77koT+Jvh/YBpEm5UKjVPJA9K6m2MWOyfeicHi51MRGreWhzBmVGS55Oua1LcfLmIpJFjUQXUTuE3lWeSLxQqPNhreDq2wayLHB+m8seKjaSVHMme+pLxEBWA/4pVGRWpp4Q9x9Ht4kzCvkkJThpvIhORkx9LsrYskPOx0vPApu2KlckyZ4l6upl0/xieKdDVq/pfvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 07:08:32 +0000
Received: from CO6PR11MB5652.namprd11.prod.outlook.com
 ([fe80::4708:8b9c:437d:3854]) by CO6PR11MB5652.namprd11.prod.outlook.com
 ([fe80::4708:8b9c:437d:3854%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 07:08:32 +0000
From: "Song, MS" <ms.song@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: "Ku, Meng Kean" <meng.kean.ku@intel.com>, "Mohd Nordin, Zailani"
	<zailani.mohd.nordin@intel.com>
Subject: =?Windows-1252?Q?MCTP_over_USB_(DSP0283)_=97_Integration_status_in_OpenBM?=
 =?Windows-1252?Q?C=3F_[GitHub_#4075]?=
Thread-Topic: =?Windows-1252?Q?MCTP_over_USB_(DSP0283)_=97_Integration_status_in_OpenBM?=
 =?Windows-1252?Q?C=3F_[GitHub_#4075]?=
Thread-Index: Adz0ufbwtk5xj86lRBOZXnN2SH6Czg==
Date: Fri, 5 Jun 2026 07:08:31 +0000
Message-ID: <CO6PR11MB5652E85A4037B20DC084DEF8EA112@CO6PR11MB5652.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5652:EE_|MW4PR11MB6691:EE_
x-ms-office365-filtering-correlation-id: 99ff6e28-e6a4-41bc-c3ff-08dec2d14099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|42112799006|366016|11063799006|56012099006|18002099003|13003099007|38070700021|8096899003;
x-microsoft-antispam-message-info: 5eI5tKw1Uzsj0zvbmBzxF72UdqtshUsR3tTx4akcxBsBYY5QEXjXzEyg4r56dEzqNkS6PXsByyvuhayDkfj6rrcmGvACJoyQ2H1+sHMGwNFt+YLn6yWMqNIQbXXe+9WmRxhBanbl9BvKlyzCuH/fgf1zKwTD0IePoIhJGKSqU9nny7MTms/vDxZzDRMc99HAkEy7CNv5E8QT2w9wdh6OyC7DRVvWx5O9P/oNIjEakhFpX2iJA+B0Td6yfj5GRGm42eY7T6h9yRUnLrBPSMSilyjfVQUDkiPmhF7i+ziuZPEReiivLhn4RE6J9Q9PXGkGaBVS3KjPt7zHWDmkK77qTFD04fxPXpbUgaUM9YNgEEJH/vmMgXKxni2kVd5a3t7vGKEWKZ6QO8Ue7ps2w2ydcSLyGOvOlBysfFjyFUzIosxbwnV5bl6zC0cuu5qZXICxCVJvtyWosuuXST4Im212UNf9JQ25+wBvXbq/p4s19Eo0figpuwcInWi/et8HlutObWx3OsN/HuSb3Ff+hA+1Xx5aKFou7OiRlBvHwZVCFJnXDExyhSzQRyd2Uo/BHoRRHAidoGAd5CU0Z7I+Ia9MfCpVVkvM5+KFsTQbL9OwQAL78jDsud8emljXtl8szl8DpRg4abJWztlDmg7ZI9uDPoS9qvqzxc8kTjN6ClEDiK+uRn4gtYQf0UkLRJ8AsNtEeTBjsbNmX7gS5luC3WHGA6gx/iT3fujrTIFJ8XiDVjZms7OH8/nswwQIN9D/9Yvi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5652.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(11063799006)(56012099006)(18002099003)(13003099007)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?qFhvFrnuEwt65xh5c9dlkC342UhxE0+cAedRmlb0k8REKk4FEN8DDwpa?=
 =?Windows-1252?Q?o19ZNIzhWD6VmCxgDiC2hMBeowo8X1a17QzkZqoyXy1i+kirkr303KcZ?=
 =?Windows-1252?Q?/W7Cn06fDJNbNxbOMcX1ric6UtpHG0W+Vqv1kFHmzdA5nhtLX4j440cT?=
 =?Windows-1252?Q?HKy5OTNdhtLOsk1jjMArQqvePG2U5RFLNM9P/ZIAyNjyyOCE5jlbAuhX?=
 =?Windows-1252?Q?1ehm/O0P6Mqm4o6bm/5ya5RYrP5b1IUZsm5FeTYLerY11sMP74t83Z+P?=
 =?Windows-1252?Q?Ei0ZISNqJzqTAa132OY7Tz1NMUhqwjlBTRdI15+TFdyqvydItrWYJdkX?=
 =?Windows-1252?Q?Qoo/hfs2Roi/+dMEuPLzAzdzeN57r7SqCtYTI3eH/agsQoBU4rdKo2ik?=
 =?Windows-1252?Q?ilAKHy/oH0N63hF3208aWTvz5Tc7Qo/LJot6ifNgDSy7PQ8/bytwDIVy?=
 =?Windows-1252?Q?sb9aZ0bjt2pbvkSop4aJSb2kA2SQJzlwy7q55WQHdW5Q0bVkz8l/nia3?=
 =?Windows-1252?Q?Ptmyb0RBpX0H0VCGikDJ8vV4M+Bohj9z3q9x00nrPH6d7WNQ/8P8YaTE?=
 =?Windows-1252?Q?le7XqVMqw+f+WFVfyYy/DKdQmi+kffcBXC8FF3yPER8SGLxTi+BWONsF?=
 =?Windows-1252?Q?+r2zo4QW76gJ8290QqCLvw495Mpa3391aSDbpfB2GneGLhqNygCf80IZ?=
 =?Windows-1252?Q?3cbRKlCbPYK3s7K9kmFphxa90FNF3k63h9yz6zT/6coM7kUbopmW/R/R?=
 =?Windows-1252?Q?vcbP2S6qzDKslb+KNgzFALRp9wNnHNhPvFAXk5HkXpfJwCYaDWFsli+z?=
 =?Windows-1252?Q?+GLPeb6CHFbCKgspf1O7ByxhM+vGbo7aPXxBx5DBPDl+CijxTMc2M1WT?=
 =?Windows-1252?Q?+umr2HOieEuflQln7i8/cxt4KTwBUntZdYdobihkzB2KNUuGRWkoR1AQ?=
 =?Windows-1252?Q?wJxJIbNZROjqO1TyR4Q37dBhL/jhBS0cs9678GoE8OuJnndkOM05wzN9?=
 =?Windows-1252?Q?lLcaq+a1EQYEnRKy6CgergleDCJKtAZdjQEE1MUx8nuV5RnpizZuRK0t?=
 =?Windows-1252?Q?Tq63yJv/ONRGWNQGWqbNfdXBEAs4aN6p0LAjkTeW1N4Bh1xqxH5qE8US?=
 =?Windows-1252?Q?XqgB4bHag76Vfi2EKaJENJK8WStrsRX1EA16mC3n8DuyDj8WbyoPK78Y?=
 =?Windows-1252?Q?tONfB3cP/CC6g5nQVQQkqQGiztTHpEjCsdoVRDHdL16Ii4ApHMPNuupO?=
 =?Windows-1252?Q?f/QxlXt56xBWq+wb1sxg2cSRFo1phxbhocnj8BQ5R7MXxQy8zoWg/SOJ?=
 =?Windows-1252?Q?Q+lEPDs5JFaS/7YO9rETP7ypSCp7decgarkpDVAnGwo5EOzECB9ZVmaf?=
 =?Windows-1252?Q?C7ylcAgBOhzSksIhR4fnVlHu0v3YJmIpkByyfXkDB/iIhugR6GY6wewY?=
 =?Windows-1252?Q?CNx2iyti+247SiThB+Jp7hZeIYyK4/IAK2LO9tWOcBIqCAGss27Mafc5?=
 =?Windows-1252?Q?V/Bhae5uDXK+yq28NQmswFSbzrUZyxJnVulA44XYnIj5YhQK8JYxRSbV?=
 =?Windows-1252?Q?9aV1T4H4ssNm5yjdJ9UccGvZNvao/Om0QtLlRRKgvPC6cP+CCLOiEsjV?=
 =?Windows-1252?Q?sXqvL5vQGEF0LERiq3/Ps84wo+1S8tXufaRyW3PlCYN9kPe/EUKmS2JK?=
 =?Windows-1252?Q?lPht9qQauqTuehUuiq8/Uu8CSwG7y5W9ENazAAJ78UMnaRK7u0xNOyV6?=
 =?Windows-1252?Q?hnyecrcwocLSOXbcJr7nc9CqKA7s+83EP5PFJDNbfM7xndjB9IgJJn7h?=
 =?Windows-1252?Q?SClrRJn1dGEDIK2HA5Sr66HNYJA8Ent77sOH0J5XFhqPV3MB?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5652E85A4037B20DC084DEF8EA112CO6PR11MB5652namp_"
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
X-Exchange-RoutingPolicyChecked: JycL4lAxSsPPdwb83YOAk1CtHWB/sxHistyVPemu0ieeYSC0GiPb34VD0SW5q2Ixs4JpSKwBWuAO199YVDjB+x3cU6imdorbQsuR4d6MA4AE32esEhqpMDwCehIRsvljubpS6M/pQQDhgN67EbE+/3QflWd2v+yzmTFuFa2L12I5zGRKMbO0E7lUxDrK+w3QZTFSmGC81L/dj1L2Meg44BkynKqwwmbljcbsOm1iBE8JHcUmL5FFSZVnw2Saouj4bjvtCsyG4GjgKpUlhc9oMLGcpWe5qzC/QKM860Ap0hr9XqGPAARBe2ujj/G88jZbA1htEPU3Fw6RWTnPx4brzQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5652.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ff6e28-e6a4-41bc-c3ff-08dec2d14099
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 07:08:31.9696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6F6dCS7CnfDicqCbMmqkBKKxvIUM6+7WECo/a5eZ148S3qJJ2mD9i7B7oIm5j1p6jNje34sTjSjt7k+uGvmLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
X-OriginatorOrg: intel.com

--_000_CO6PR11MB5652E85A4037B20DC084DEF8EA112CO6PR11MB5652namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I opened a GitHub issue about MCTP over USB integration status in OpenBMC: =
https://github.com/openbmc/openbmc/issues/4075
Please feel free to discuss there or reply here. Thank you

Best Regards
MS Song

--_000_CO6PR11MB5652E85A4037B20DC084DEF8EA112CO6PR11MB5652namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I opened a GitHub issue about MCTP over USB integrat=
ion status in OpenBMC:
<a href=3D"https://github.com/openbmc/openbmc/issues/4075">https://github.c=
om/openbmc/openbmc/issues/4075</a><o:p></o:p></p>
<p class=3D"MsoNormal">Please feel free to discuss there or reply here. Tha=
nk you<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards<o:p></o:p></p>
<p class=3D"MsoNormal">MS Song<o:p></o:p></p>
</div>
</body>
</html>

--_000_CO6PR11MB5652E85A4037B20DC084DEF8EA112CO6PR11MB5652namp_--

