Return-Path: <openbmc+bounces-2600-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5472C982D9
	for <openbmc@archiver.kernel.org>; Thu, 17 Sep 2026 20:48:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hm7BL1cXFz2y8G;
	Fri, 18 Sep 2026 06:48:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.9 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789678089;
	cv=pass; b=OG/NaYXUhbPVrGeUgSiTZBe2dmfCtsjy7LuFe+P4yhnVuDILoJixepTI+zggNTmhi9EiROPEq8vllLZ/qha2vZuUP3hXVpDWOdVwC7TzQRwht14gB/xdnngW4uoGo4hc7oL16BoQXrRuwFYDqKXDKfJrFNlwcAtjOUVNItgpjzhpHalXAzO9ZFvIckhc9I5l5fzU9gQsBxUWPAiGIkEN8UZD6yogY0wyT9NErS7jjr9hBSGga+h7jxuODGroEjapyVos6pJyEDEqyTMo/vAUp/sarYMUtUJD8oJGj0eq7oYz/9c/pCl1baoepbxOywLckl3hPCSMQk36VhVlawL/iw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789678089; c=relaxed/relaxed;
	bh=pgEEKxNrVbl25TwbQIdLewzzCzkJzgMjHV3Fd61WGgE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tb9kMgbkdb+1SSFUm/z9SIJwAXyiEc7VV+qCMZGHnSGeEtKRKTZZBGJeLY4/DAMtvkNkWxNtz8UdS54dX20h/NzyihGEftdL6ktPNTP2hIHSacnxDf9zTtCLnx8qtkq3RQI5de9G4+wJqnP0rMi3t7FM+gA/I51QDW9Pv5ZrK44Lmad7gOMPEu7YwyErB6N0VDmXMFjqC3sYdw06AvKuVyV7xHHhbzoE6PP89cKSIyqZ6I/DnQtDiL8WyTFn59IIA1tEQPOgcIuRy8tiAyexWgN4ATHrYFbMFcKc4BwFJQ/vJloKhslBL0rmTOHgoZyvxHHAtfdKz0ypCUQmITG1uA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flbk3EFP; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flbk3EFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hm7BH247Cz2xbQ
	for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2026 06:48:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789678088; x=1821214088;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pgEEKxNrVbl25TwbQIdLewzzCzkJzgMjHV3Fd61WGgE=;
  b=flbk3EFPjS1wAHTXjTit+KOtemkVNVNNy7148HISRz4osDgXmxSh9c2g
   zrHNpCqIohMoFqKtgb+USoEOsr3/osY48/a2FoYP3j4hI+XH1eldNH+EW
   4/iDidcB2qulkBsucG2yLJ3gcnVuDvuQX8l+H3pvTYSKufhVsO70bGMil
   23R6S8p3Z5z+RdwjaN9k1wYYNNL5bw7i98Qq4IbEvM+WpbdvwF8fXYR33
   VHyLGsN7h2t0INm0l5oKRCJWS/5IWpUC/NM6UkDAM4bGcGl7DvouVH/fb
   FKypRQE0qSVIzXrpthts/t8NcgFEUXnd40Qxe7isuIhXMsuodGZISlJqd
   g==;
X-CSE-ConnectionGUID: B3dyLF91ROO4nLkI77Fr1g==
X-CSE-MsgGUID: TnzA4TJ+QP+VhNbncbY81g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100805715"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100805715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:48:05 -0700
X-CSE-ConnectionGUID: 2UEUh3xOTAme/w2mgNy1xQ==
X-CSE-MsgGUID: BynSX2oJQgGVayF7HQljRg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:48:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:48:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 13:48:04 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 13:48:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/ZoZZIMG1Evf0SjBb7O6vsNbQmV9nuddWYo1JCfs2zpUS6lDvRvN7VeczWAr4QSoxduCyvXI0ddxlSbuTT0aF7oi4zQHEUOpAs2p51491RxkcVhmmZYoyjcEutETpqwg8gLUbvZntBdcXsryw48Z3F7hdS/PwpkB+eeUtJlj4PE27nlNK3+wzszr729LqnbwGmgfMY5OxaSxvzBb5vcRqsLV87rIKQQ0pU+gWSO96TJocYNM9+GW+bOxyPpx0cBEDGlPUBxWZ+g+Yzpp5Yp8B+6KoChFsB6R/wcbHYbe5fmafA7+f512QsEX3F9A9NX6I3jqDdzuP80/4wWCgKrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgEEKxNrVbl25TwbQIdLewzzCzkJzgMjHV3Fd61WGgE=;
 b=Bwrsroa/wKxW1Ad0v1UnF2wkEyezzofMUwAgvLQ8kmdr+cSELLIp06bmq1+Gjc6XNSkO2ttTou7FDxShGvYnc5JKKq7+SALauor5x4c71c58nuNMpGojeJlXLd3w+WvMFfSX5H0bLJ9CQTcsAOzzZ589SHzqeXW+xgE3bPp/32H2CNA3EyEUcSoyF9R9+6BtiOM6v7NPL9GiLb6/Ogsajoz2FRbKCpfE36F/Ys4pKsJIUv0L928hQTSCTCXrNtnIZQg/a21gtbaNC3wSM5i/as8LWConBVfl6Elo+O+f96VyoESofBzchZgp9pfxEUKfIE4fICTupX2dukRLgfm4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:47:59 +0000
Received: from CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2]) by CH0PR11MB5330.namprd11.prod.outlook.com
 ([fe80::9d32:3dfb:c2f1:40e2%3]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 20:47:59 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/6] peci: Add support for PECI CC 0x83 retry condition
Thread-Topic: [PATCH v1 3/6] peci: Add support for PECI CC 0x83 retry
 condition
Thread-Index: AQHdO6kkoI12wGsC9k6v+VgYUVb5mrbTVE8A
Date: Thu, 17 Sep 2026 20:47:59 +0000
Message-ID: <47a9f001f9c0f9e2be2254289c5ba3f7d64cef05.camel@intel.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
	 <20260903133408.110847-4-changhuang.liang@starfivetech.com>
In-Reply-To: <20260903133408.110847-4-changhuang.liang@starfivetech.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-1.fc44) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5330:EE_|DM6PR11MB4673:EE_
x-ms-office365-filtering-correlation-id: 972d85cb-0668-4de8-bbdd-08df14fcf5b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: qq5JXf1eE6E4d+hLgqo5LvAJJeJ2xMbsGZCKf204ELVqWOcCfDVJbs4dqPme7eg0/u5bFkWPwpH2DeX4WtDgKUXhBPyKHVjIfAcigpoojj6PKpz3wcuPRNEKAgK2k7o9ig3tzCOj5T1Mjtf97fJ8IZXONJ56athuFr8zcV33btqcLsmvYwLoS13Y2AUiwnNNfYhvwpELUqCLldOcsRXv9vJRNKm6XexGFjBVqxxn9wSBRKgkBn10OVsf5NrKWvdtfJWT5Y14PgKUgHFdKSh72/RbU1cRYJG/D/4ogd3G+HGlz7NDuJ2Y66rfrEUECo8HW9NJeuWKviN8pbTqbkKC1W+ekypa5PKjYHrM8BKHYMjnShCr73fhbxO6a0NLNbCqA2JBVSPcKmpFUecKJFzMcx4LIdJcmWVXQEA3jUMQXu1yLSZKyWiWRp/xhB6rgDHTSM4NeDRiMxT7VE2DL/u+JEvQNEWV1Y6dLmlJFhP5VfK3TsOufXXqPII5wtG2NTFNJGN1vTw2vnjjWBZDa9dW0iW1UuX+4wgZogWtk/WtLxOF5gKrCUiIJ80eWvBnBiVy/X7Xaz7K5itATghBFGrMhpl0JsKs9ARAWE+6VO0Eyb0pGXORv2g2j++KqglIEylOcUe0w1ZhZwZ+p9gfkPRz+tDoMIEV0RQtqjD+OKMMHL4YCK9kYsQTjlzQMaYEi3mCqcwm/1BKYk34anY3TpPrbXWS1Y89/Qepnt/dmt3tV4I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5330.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEI0SlUzdlhsU1Q5R1hIRW1vL0tpbGJsMGh6SFIrOVNESFYwa3QwL1NLL21r?=
 =?utf-8?B?TnU2dVJYR25WSmVkT3VKWWt2SFIrcmZpMDY2UmM0QkhtYW0vZC95c0ZQelVv?=
 =?utf-8?B?aThiMVZjYjdFTlo0WVpaUkZOK3JKSzIwdmlnVXdsM0VEbGthNnBYRnRRcm5L?=
 =?utf-8?B?OEltakRhYjJ5dkQwUmtmUmVGV2k2dGhka0hBTitEL05sSkNibnE1ZUpER0Z3?=
 =?utf-8?B?Ti91ZkU5YituMjNKak05YWVKb3JvVi8wZjhLS1ZuU0dieXQ1YkFManYybW1k?=
 =?utf-8?B?ZHJXdENNV3J5bzJCVnFtd1JjUXNaS1YxbW1ScW9JeFhXc0NJLzlaYmRTYmtW?=
 =?utf-8?B?QlE3VEhpQlJuQ05qeTlEUEw2cnVmYkhsYmxNdzI5bHcxWDdFQlRscXFDeWtr?=
 =?utf-8?B?bUc2Y0pYbitUcVpseWxacXkyYXpBWEtvWjVwWTBFRlE4VHBRZEZYVVdHN3VQ?=
 =?utf-8?B?VGFGbnpZQWY0VlUxQ2ZsdHRMbFdNU3J0c29RQmdmaUpkaHZjQ1l0d055aEdX?=
 =?utf-8?B?RFM1dzhGeFZtMG45eUxMQjJnOGZEd2dtWG14OTNrV0RFbHZjTy8vVjh0RjRM?=
 =?utf-8?B?RXVMcmhxVGwyOHpNdnhTaUFtS0FFcUNQRXAyNk8zM3R1K0s5Y3lTUmZCdHdm?=
 =?utf-8?B?aEtUS0VPZWxXRE9CMkZvbFpIbytqN0h1MnVqc3ZsVHJiWW1NbE9Jc2grZ3JG?=
 =?utf-8?B?VUxKYkVkVTlwaDRSajdPcEV3dGVRa0lDTlJDNkFTdng1c2pxTnd4NEd3Yjlw?=
 =?utf-8?B?dXIxUlhaSVlxOTlQZUlFSFIydWJGZzQ4enhCVW5aZ3IwRnZoc2dZRU5ZUUhS?=
 =?utf-8?B?bm1NUU1ZbGVBMXhxb1hpeERnWkNUYkZhQjcyRmtBcXNrYWU1V0FEZmFDMmEw?=
 =?utf-8?B?bktZV1g2eTE3ZUdqb3YvRC9LVk4zS0poZ2o1Vk81MW1keGMzMkw2dDVjK2NX?=
 =?utf-8?B?bURxMCtIbUdZcHl1T05wSkt6WGZzcUpCMS95Yk92TDdDZURQR3JyazFHVk5y?=
 =?utf-8?B?bHRVWVJGaTlna0Eyd1VZUUxnS3E3Sk1HZWFFeXp3NDRMTFZiaXc3dGdINXo5?=
 =?utf-8?B?U2ozUGVGRG1aaDdNTXFMNzluN2YyYTJTeCtQaXUyMWNWNTZMMysvNlF3SnhF?=
 =?utf-8?B?dHlNYXR1UTUyV01kSVQ2TzRIUitxK1pSZEtrUWNtY3lyYjBJTWpLbWtoL0tr?=
 =?utf-8?B?STdNRG9YUnJhaitBUUpGdWR6NlRUbEUxeWFzbERqcnR6WmIzeEpUWjFrYUt3?=
 =?utf-8?B?STg1ZmZlZWw0bzNaWTAvNzg5SkpKcW5ZUFZJS1E0Z1puSmZwaWhmUTNydmYw?=
 =?utf-8?B?R2ZxWXVOcVhtSmtXbGFEdFZ0M0lnMHZsWnFBM3ZLakw1ZnpCTVJOUi9jNFZV?=
 =?utf-8?B?bEhSc2RBdVBmR0FQeHM2bkZKK0JMalZ6bTc1czBaYjZZaUt2WXY2eWViMjky?=
 =?utf-8?B?cjJxb1I3L1hWRjEvQjhlb1hyclY5QzczbGd6L245dVQ3RU5NcUNnRTRmK3dM?=
 =?utf-8?B?TFdFb3U0OG50SE9LSDFOY2RPK1N6VnpJNTVjVWdTMFVCR3JSL0tQSHc4MTZx?=
 =?utf-8?B?dGtMd3h2V01HaEMwdGhyS3NQWmNTTEdLTkZhcGpNL1NOYWZudmsrR0xtclRx?=
 =?utf-8?B?ZlZDUnJnK0F5OUdHUFRxcmpjdm8zTmRoSlBBTmhZUFpuK1BDTXloaTlXK2V2?=
 =?utf-8?B?N25ZeE9PcVlEWGV1VTh2UlNZYUh0MEVkK3l3SDlFY29VOTdSQVZOTWVLUGZh?=
 =?utf-8?B?M254VGVVZEp0OEJRTTlJMHo2YmZVSmdBWlRqSFc2cXQzK3N2MHhrZ3NjVUJn?=
 =?utf-8?B?ZXcyMFBVN2VZRzN3U0ErbW5KYjF0cjB4NXZOQ3NKcnFqL2VZYWJYSlZXOGwz?=
 =?utf-8?B?bm0zNFFmUEhlL3dVYkZSelZKOENYSFdGZ3lrbXk3S2lsMGdBL0U1U2g0c3lD?=
 =?utf-8?B?RmpFYVladjJJY1lZM3cxUy9BbXpEREFwb1dCZmhrZ3NLd2k3c1JEdmN3YnBu?=
 =?utf-8?B?YUp3KzhwRHJTRkNsa3UrMVNTK1VWMk1xaVY2WkhVM1F1Z050MVdLL2lLRCtX?=
 =?utf-8?B?cUZIWHEyRkREQU5EN0VrSHowYm5NSk02ZEdUWnFoVFhXR05KaWpucEtkRWxH?=
 =?utf-8?B?WEVNUDBGVm56ZVUrN0ZRejMwNFNrL0wwT3V1S3RSNVlIM2pIc1grZUwyVnRr?=
 =?utf-8?B?YjRRVzlKeEpNWnJ3ZmV1bkVOeVVnUVBLVnBUSUdWZllUNTNqODcyRXBVZld1?=
 =?utf-8?B?TzJoSkIvb1ZVdDBKY1F3aEw5Y0xYZ09qemVBcDA5SW1GeUZhYkpTZGNsSGdW?=
 =?utf-8?B?YTA3a2VlVld5OFlDZHJ6Z3BTMk0ya2tUcERKaHVJdmNudWFqOERLcUdzbUNP?=
 =?utf-8?Q?jYevnububc/8ElNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB03A84FDF420C46B7CA45E40298796A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-Exchange-RoutingPolicyChecked: zVwKxi91phDWjgj7PrZST/zyTJ8zm7z0YOOD1tIguA7KViJpQUMV4NYo0NofwG8NaALp+0A2hrRp3c7kpSsRMLlDcHoWIl55YHC2qUwK3ZUfft6oCwdt2IA7x93oXV7OQFed8pDvCCh4GlHvPSZ/8Vte+yldbwgJAi+nvfTws/PhwvFNDcRb8lWC1uKI2IzMDVbPktS+dzayua6eIJtkDxsTewN0uCSWrU5BNG380Hlss6Iwta2PB/Rm7XARnlUHX8teSfl4ii/sZHQV4qEScacDg/wnt5eOs5o7IGkdzg/LGpaPXLH8IWpPykMBRC5bh2JI7lIIHdloYGIdfn9Xzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972d85cb-0668-4de8-bbdd-08df14fcf5b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 20:47:59.6302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GF91lU8KzlBmHjvnnQb0FDg1iiOaDnIGIg9VXUR10+ofxEEnRmQTEL1uh5nv75+OztkLyJcj/s+cgy+Gv7cDbXLbUwY0/xucD2OUSa6BgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTAzIGF0IDA2OjM0IC0wNzAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3Rl
Og0KPiBTb21lIFBFQ0kgY2xpZW50IGRldmljZXMgbWF5IHJldHVybiBjb21wbGV0aW9uIGNvZGUg
MHg4MyAoQ01EX1RJTUVPVVQpDQo+IHVuZGVyIGNlcnRhaW4gY29uZGl0aW9ucywgd2hpY2ggaXMg
bm90IGN1cnJlbnRseSBoYW5kbGVkIGJ5IHRoZSBkcml2ZXIuDQoNClRoaXMgY29tcGxldGlvbiBj
b2RlIG1lYW5zIHRoYXQgYSBjb21tYW5kIHJlc3BvbnNlIGlzIGluIHByb2dyZXNzLg0KSXQgd2Fz
bid0IGRlZmluZWQgb24gb2xkZXIgcGxhdGZvcm1zLg0KDQo+IA0KPiBBZGQgUEVDSV9DQ19DTURf
VElNRU9VVCBkZWZpbml0aW9uIGFuZCBtYXAgaXQgdG8gLUVBR0FJTiBzbyB0aGF0IHRoZQ0KDQpU
aGUgZGVmaW5pdGlvbiBuYW1lIHNob3VsZCBiZSBtb3JlIHJlbGF0ZWQgdG8gdGhlIGV4YWN0IEND
IG1lYW5pbmcsIGUuZy4NClBFQ0lfQ0NfUkVTUF9JTl9QUk9HUkVTUz8NCg0KVGhhbmtzDQotSXdv
bmENCg0KPiByZXF1ZXN0IHdpbGwgYmUgcmV0cmllZCBhcHByb3ByaWF0ZWx5LCBzaW1pbGFyIHRv
IG90aGVyIHJldHJ5YWJsZQ0KPiBjb21wbGV0aW9uIGNvZGVzICgweDgwLCAweDgxLCAweDgyKS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdA
c3RhcmZpdmV0ZWNoLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9wZWNpL3JlcXVlc3QuYyB8IDIg
KysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wZWNpL3JlcXVlc3QuYyBiL2RyaXZlcnMvcGVjaS9yZXF1ZXN0LmMNCj4gaW5k
ZXggZGIyY2MzMGE0MmE0Li4yYmY4YjZhMjU1ZDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGVj
aS9yZXF1ZXN0LmMNCj4gKysrIGIvZHJpdmVycy9wZWNpL3JlcXVlc3QuYw0KPiBAQCAtNzEsNiAr
NzEsNyBAQA0KPiDCoCNkZWZpbmUgUEVDSV9DQ19ORUVEX1JFVFJZCQkJMHg4MA0KPiDCoCNkZWZp
bmUgUEVDSV9DQ19PVVRfT0ZfUkVTT1VSQ0UJCQkweDgxDQo+IMKgI2RlZmluZSBQRUNJX0NDX1VO
QVZBSUxfUkVTT1VSQ0UJCTB4ODINCj4gKyNkZWZpbmUgUEVDSV9DQ19DTURfVElNRU9VVAkJCTB4
ODMNCj4gwqAjZGVmaW5lIFBFQ0lfQ0NfSU5WQUxJRF9SRVEJCQkweDkwDQo+IMKgI2RlZmluZSBQ
RUNJX0NDX01DQV9FUlJPUgkJCTB4OTENCj4gwqAjZGVmaW5lIFBFQ0lfQ0NfQ0FUQVNUUk9QSElD
X01DQV9FUlJPUgkJMHg5Mw0KPiBAQCAtMTEyLDYgKzExMyw3IEBAIGludCBwZWNpX3JlcXVlc3Rf
c3RhdHVzKHN0cnVjdCBwZWNpX3JlcXVlc3QgKnJlcSkNCj4gwqAJY2FzZSBQRUNJX0NDX05FRURf
UkVUUlk6DQo+IMKgCWNhc2UgUEVDSV9DQ19PVVRfT0ZfUkVTT1VSQ0U6DQo+IMKgCWNhc2UgUEVD
SV9DQ19VTkFWQUlMX1JFU09VUkNFOg0KPiArCWNhc2UgUEVDSV9DQ19DTURfVElNRU9VVDoNCj4g
wqAJCXJldHVybiAtRUFHQUlOOw0KPiDCoAljYXNlIFBFQ0lfQ0NfSU5WQUxJRF9SRVE6DQo+IMKg
CQlyZXR1cm4gLUVJTlZBTDsNCg==

