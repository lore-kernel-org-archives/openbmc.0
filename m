Return-Path: <openbmc+bounces-1930-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36265CD4F25
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 23:52:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGnDl6Tqfz2yFP;
	Fri, 15 May 2026 09:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778783211;
	cv=fail; b=h1AuQshNuJZWtuJ24E5yz5N1mSSiXavA+HNqWQNlulcfUhjnwBPjUMo2pFWSNXwZWEnWgg/+54I2HT4BgrW2gGedOVEORggTTG2+4NaVg2zwqufFXwdoHPZ5sYWjvihOrKAxeLR+xJ+emqdimuTT+OZdiCXwm4JF5i/MhFMuGGbdLrNvTfNFcaTMrSS2DQK+QwYkuSUD8V2vIn5fBEtdCmfGjyx3FDiAlAsXtw30dWW3lJ/EbCrdCT4wWpcIV2i+VkITv/kczKTMEj7Aa0Sa9VeVSaIcuDq6i4O2IKIaxqy42uK36P60YITLyy5nPJDxIjhbCrysnFuujlW1wHPhBw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778783211; c=relaxed/relaxed;
	bh=EJvcHkg82HUde+0CCnMMLMxNgsQ5yHXqyzvPKNU50Zo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fV6cnx8cU0DwPbHHq62uPQMn75ltK7e8f6vs0E3Z5vHPB1y2TmTT/wkzFqaP8SfuvON0bGlMfbOUArT9758+BxP+CXVyg0Lh8QnwDyxixulKFEMk1P9eIgjshgwoawkgoasVdJ/Bwzc8SLDdYyl2izlXhuCIK3xFaaDGrgl3nN5EUADwceo65n2Ti58g+qAOe1L5Dkl4uDaSArFfAoEvsp3cEjAASa+qCXuuw480Okmgx7LztI9s3TuyGSt+dltSc5R3iTCAAxQxRG3NmzEqTAPO78BxVdUKQuZAyZvUZYss4iJoCjZDy9Rht8z930AGOndSXExIOaLgTmdO7Sig+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gHW42/sv; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=shiva.shankar.k@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gHW42/sv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=shiva.shankar.k@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGf1M3Jkhz2xJT
	for <openbmc@lists.ozlabs.org>; Fri, 15 May 2026 04:26:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778783208; x=1810319208;
  h=from:to:subject:date:message-id:mime-version;
  bh=ZHYbxcOwVq2i1vCoFL0P9lfjthmQwI9R2FUDD9b50mg=;
  b=gHW42/svwRIFVmPht9ODobNZo9JIFnWUiUHCleLazBJF6QqLN2oIWeNP
   ArO4eMl2+sea8JqoRaFaS9rr9NoFRDWJQsqFyGr9rGxWAyv1j8be/Rw1v
   3JWOFf9BKzti5YyUv5oEAwMKkYyqva8grU1UdPwel4pDhvvk+m8sTJk0F
   gPzh8HMJOPDHhIEuF4N3FPQPCaFAegi4aypbrJpH16oOfnVcYGunbpdb+
   x1xHp+amkSilO0wZ35SE4WddSFyB8u5CS8QapV+kGqhp7fvp8AOXfwzpo
   MEvKLCY1FgjBXzEU6vymH/Mc5CJ2hkO2pHS1ESaySqNASX+xTBk1qq5/y
   A==;
X-CSE-ConnectionGUID: b+PN2VyzSD+XHeEF9FHA6A==
X-CSE-MsgGUID: 7efeDQY/THeW3xHDJHgDeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102407377"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208,217";a="102407377"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:26:43 -0700
X-CSE-ConnectionGUID: yzR1IiF0S/a6hil2ojx2rA==
X-CSE-MsgGUID: Q0dug9djRcSgCnIh+9nm5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208,217";a="238344400"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:26:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 11:26:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 11:26:42 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 11:26:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUTEU0A7ymkKwOuTl5fVfs+VoSAl0DCAFn3/kYwhTDUam1ca9LYGViIqUVEbcyD7GSiFApX3/GjFpKn04j/4dLNYlxFGdKtD5h6/bVOZMMJC2po3qYi7uFVffQ9tOEGfDDMcRxOSALs8Kq0/VE+BGdfDpMpEC1fIrmeUP4ZEl1fiXKMDBL3/sbepXcWZB/Oo/iIOcTrOI25EQjM1WA4cbKHI+QSgno8YsJKN+thLEuOX+uGXSaTXApbRw9AHJ/WqCsYTqCe+fNjb9UerCLf9hh5VosV1UsbsJ3LRFmWdbZNyeugtSPsVdsSufC3NPSExU81a5iLdMZtmTVXcVxYp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJvcHkg82HUde+0CCnMMLMxNgsQ5yHXqyzvPKNU50Zo=;
 b=G456maY8HmP+NcIq9dsjH9ggTkNyYQw3R0iedf2oOYFnxiGw3EvD14O0gVtpBlON4GbXBX0EZV6zJZFabRCFYZ0HgxikX3eLpyeqM2Be1MOacSAYT16a3SaS/1Aaiz5Vqyla8CpmleahqNZbAd/uCvH5KbrghjuNNekRT9NViSUmsHxZX+bw2PnBhAFMSYHpuhdZSsPPlo/R6IRjnkVOKysG7AmzYglRfPkE7eMl2hBE7uRK0XdyHCLjYH1YB7wqjo2r5AfCLs1XEOH1RV3HIRuX4/+F81RdA+32HBcZ5PUZjI33jVtn2Tad4sVROSEA5QuHti1XbMKQEqcvq80tAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.12; Thu, 14 May 2026 18:26:38 +0000
Received: from CY5PR11MB6137.namprd11.prod.outlook.com
 ([fe80::2d37:ceca:fef3:e1f7]) by CY5PR11MB6137.namprd11.prod.outlook.com
 ([fe80::2d37:ceca:fef3:e1f7%7]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 18:26:38 +0000
From: "K, Shiva Shankar" <shiva.shankar.k@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Simultaneous Firmware update and get sensor reading failing 
Thread-Topic: Simultaneous Firmware update and get sensor reading failing 
Thread-Index: AQHc481/cjWhQtzqLUGSPQOwgw5tuA==
Date: Thu, 14 May 2026 18:26:38 +0000
Message-ID: <CY5PR11MB6137C593E2E9DA3BBAF5C24AAD072@CY5PR11MB6137.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6137:EE_|DS0PR11MB6350:EE_
x-ms-office365-filtering-correlation-id: a1855094-9ad8-458d-63d5-08deb1e65670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|18002099003|56012099003|8096899003|3023799003|11063799003|38070700021;
x-microsoft-antispam-message-info: k0vaMHqZiLRe0AvAPAIJmAfHpoICCkVyi8OKBgSGDNuQXhZR5CjyV0IgNYG6g8Ob+pUhCkP5FUzPmY4+ZLSvE+ZaAX1rKkG23PyJBbxM3AQklWYmwWjpohM3UoaFYadpd+AI/52+203YRtoOZAdo1cHEHQ3iRAKPs3bQPe61gaobNloooQzfaeVI2tDyfv/at1KM+IbvRoGfljjwZuB4ECXcrLIiDDSJTTgGkTiKBDZEAQ9T1X4m9Wm5n0aB/vAV0E1ObkyOSWgH6XxcTufoouWYsZck6ljQmNeOEFizcXhoSshS29m7PIw6UCweqPZ1uWdEfNt65HVqDFDKnF0ajt/CBJy6rU0tTVRzZSiH6D7tdKWtk74IFyc7lH1N3EsQ5kvv9GdwegIImp3dH5hW57doPeo95lAHBxiy5Xen6yRuWKRE7NXo+cge82ep4625ZfXQowiLDkR2Y7kUs0v89RShhULPhdWlWVLuzcfyQuiycJadrtlN/vKHcUxZK5s9awWDvD+X9wYjnXvZ5XESQ5q4Pz1Twq9K3M3Mna6/nMDIwe22jUbDyLF9bzQrYt+wKA9NMbHrg9Ax74IwgSacXj72LW0AKHHuzSGgK2bZj3zPXlutswqGIcILNVqesJqUfPE1nggIqlu6nr59MYmiIz0mn5rPuhWpXOx/vo8UolNMlC6M7SWhDA1Ippy5cb73Llgtb3tR7BzHvdVEzLvkrVHtx4aCyflgVMjwn4tdtjUm1X170CHHYB9YuhkcZtBm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6137.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(18002099003)(56012099003)(8096899003)(3023799003)(11063799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WmaPoKROsDw8rUOPxPSLgnLMhZ5++i/pP9RcP3+9hsA0R9MzYSwGH/gGDe0J?=
 =?us-ascii?Q?EdrSIYcy5EJVUFhDW6SV/cgM5ffCwkm34NBSAYpvhn3MrzApMWDQ4jl0DeXd?=
 =?us-ascii?Q?kOWLtEtuatw058gN/aK9UatxFurP9YmCMVz7vuEY+lOEWWVfi8HF4DQAtTyD?=
 =?us-ascii?Q?D7J5yRtt7Tt+WrMouILoQ7rrb9shtz8osRaR+PaYWfaWpVjeXBMqn2JtybSX?=
 =?us-ascii?Q?FVp9GMgWQ6V6qJ4uC2MTq/rwLXx84Pj0/aT9ppDPT4BIfwD1atir8NsJqMlU?=
 =?us-ascii?Q?cL55s/1zT8eGTJUWw9z93+9aKimd/u7kGfgZcHZrnqLNoH1l4akcBleooRck?=
 =?us-ascii?Q?u4/LYMGYALi2pmDc/HFiaMtdB1+7xdy45M1RlPIeZLLknDh206tscj2cP1nh?=
 =?us-ascii?Q?kUw04iqXnFsq4cjeY0xIR19FTItXeWsbn8oMYb+4PfwL4kpnRLBSu9I8Lr9/?=
 =?us-ascii?Q?6qNf+KqJuHgED8brjIofa45xs9A7FIPxHgZTyxX0xmUuNmJWxfmhP96PPbor?=
 =?us-ascii?Q?Plu9jnth02qnZ9BxUu/ujuFAtPJWy+SEVKzmt8xylfcYBK2b24IhbAk8Z4Lx?=
 =?us-ascii?Q?qc9pIOwIfTQBSYJFK54Fc936w9DkeOW6dZuxzjZVOSd3Sdkb9VZcD/gsNM7e?=
 =?us-ascii?Q?etOaChhe91ROH5sCE/qe7UXHw63G+3TyekTbkRJDLWruj9s6vGerdg4XW0Rx?=
 =?us-ascii?Q?jACC2pp8XHwTYUXNDWd5/GQ1oKkhBB0TFdrKAyJmjoUxNAbLJdsUEgu+AalR?=
 =?us-ascii?Q?vbIb1wAn4sXP+6ME9emJn8WG1DCzhzhWADo4PEkBEIaJUOv3OMDPPeOI6y8l?=
 =?us-ascii?Q?uyXHQs1r0MfiHIIIZAp6aQZyfVAXXhwZtKJQrmF9/uASmv6cWPGVj3+Z/DjM?=
 =?us-ascii?Q?56wI+FnsB6S3PvR60w9+aFVRyQK21Pbdo+MiDI3XnWKelrxw2dkeK+nycRSW?=
 =?us-ascii?Q?w3/Hh98e5LGtiQ6pqf0VG0LSvhOr6CMAkFW3hrgZid+I6au526bPKjCp3gnm?=
 =?us-ascii?Q?bRUqAlfVWKxKG7iHyLWPN1x2sFY9yELCXH0VGdXyCScveXRYifLQWY7eyyqr?=
 =?us-ascii?Q?4st+L2wBW5fAEk/om2n9fMO3D+UwM6tFeeGfUyBkCC0ui20OKhKCbPW3fwp7?=
 =?us-ascii?Q?WNPyjkYEOkG1oMir3XwoUFSl406DjLLJaMzYiKVivZeOZFSO/T7iZlXRN8Ps?=
 =?us-ascii?Q?/gZF/NJwQ8f3fwPfuvgkdXebcpNzmBOrX7M0iHeQFplhG8Fa9pMVgq0cLmjZ?=
 =?us-ascii?Q?5iLC3y2oOVT94Kdc6cnDqItQX+Wm6oc2qByFprZeBTrVn9wYkeqcprbg6Y5m?=
 =?us-ascii?Q?avR5cUdTMvBhv9nbLTHRXswCtdzyKPoAeXOqtjiMBINJbE0nCJTolp7fHea/?=
 =?us-ascii?Q?Yc59JdSpUHl9QqJ1v37RRh9k4AmnuhwuMgH5y9eXUodACkeIQ0eTRI2pDdmk?=
 =?us-ascii?Q?vaEtL87LJfP33iHoJ7fYh/qTFyzhbCVP4BsgqTOaIf4bDO7UNkXUuiA2/MIT?=
 =?us-ascii?Q?WF+m+bvxSGMzml71JGGIOVJVqR5b/dxLdA7vGny6/2mOwLEFJUnKaxgh0YBQ?=
 =?us-ascii?Q?41CnD0Mo5c7UaLGDqbXqjKf5c8PC5A68/r49DHmLktJk4svb8BVh+EJPxWQI?=
 =?us-ascii?Q?c4ur9va+lqOTjDsQYhxvH7AxpUlSGJd4HB9vl0lqMkE4+pUrZ76WVwauxy3B?=
 =?us-ascii?Q?Jyx96J4HGvTQ87zdNMnaHWVgNqzqFtmFzqXTLcfIqcHWFOQar7URWChENacV?=
 =?us-ascii?Q?xr0xy6TqYIVMLuAta6ih2NDKBBV1ChMyGnWjejqlhtULnRSydOMp4GvOMfum?=
x-ms-exchange-antispam-messagedata-1: vPSrofdr6VWnP3vU1ACzNS8hg2ihaRGzAIo=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR11MB6137C593E2E9DA3BBAF5C24AAD072CY5PR11MB6137namp_"
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
X-Exchange-RoutingPolicyChecked: j/WaooI0m2p7lcdjy4X+fw4rtAT3yFv3jvkOYooRwUo+pt5Uj5/QDZaFzak85jN+KgCjac8gHJjLvket7o+C6QfOcyeSHi+enkX0zwENdY+6wwpv2euEk9rWFs5qrUJ43e/EeX9f03Kc9sZfQ/DiN0kN3/O5yXO12YJiT3uyNeDLAP/8y9gOeXq0Y2d4+NJlk/3cM8yMydiLKDBZGETbHR4MnDjTAL3isAVnmF1DuYKMil5Y5DI5JXbKdH15STTyT0bRJrlQjAm4Q4zbQw51VJNpwuf6SJP+SdoTdsQk5czSODQsee/BzA85ewTBkDR1AqzQkK/xo707T0mPTXlqtA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6137.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1855094-9ad8-458d-63d5-08deb1e65670
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 18:26:38.3919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBvzKa7EBEoUt3x2PCOaE6JZC9YMhs439K3FIzsnOrTnBn7rDAR2PBQKL1MfdVi+7KY+gSZMsL2wgoODr1y6GDH5FllOcuDeI4qXG/wY280=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
X-OriginatorOrg: intel.com

--_000_CY5PR11MB6137C593E2E9DA3BBAF5C24AAD072CY5PR11MB6137namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I have been working on pldm firmware update and the pldm monitoring and con=
trol.

Problem:

I am performing AMC  firmware update  from bmc and then simultaneously requ=
esting sensor data from AMC using GetSensorReading command. Both the comman=
ds get stuck at BMC's end and neither command is sent to AMC after that.


  1.
May I know whether we can pause get sensor reading?
  2.
What's the ideal time interval between two getsensorreading command?

And let me know if u any other suggestion to get rid of this issue.  It wou=
ld be great to hear from the OpenBMC.

Regards,
Shiva Shankar K.


--_000_CY5PR11MB6137C593E2E9DA3BBAF5C24AAD072CY5PR11MB6137namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Hi Team,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I have been working on pldm firmware update and the pldm monitoring and con=
trol.&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Problem:</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I am performing AMC &nbsp;firmware update &nbsp;from bmc and then simultane=
ously requesting sensor data from AMC using GetSensorReading command. Both =
the commands get stuck at BMC's end and neither command is sent to AMC afte=
r that.&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:3}">
<li style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Roboto=
, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); list-=
style-type: &quot;1) &quot;;">
<div dir=3D"ltr" role=3D"presentation">May I know whether we can pause get =
sensor reading?</div>
</li><li style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, R=
oboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); =
list-style-type: &quot;2) &quot;;">
<div dir=3D"ltr" role=3D"presentation">What's the ideal time interval betwe=
en two getsensorreading command?&nbsp;</div>
<div dir=3D"ltr" role=3D"presentation"><br>
</div>
<div dir=3D"ltr" role=3D"presentation">And let me know if u any other sugge=
stion to get rid of this issue. &nbsp;It would be great to hear from the Op=
enBMC.</div>
</li></ol>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Shiva Shankar K.</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system=
, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" id=
=3D"ms-outlook-mobile-signature" dir=3D"ltr">
</div>
</body>
</html>

--_000_CY5PR11MB6137C593E2E9DA3BBAF5C24AAD072CY5PR11MB6137namp_--

