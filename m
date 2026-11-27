Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6166606A31E
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 21:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IHNzPMWO
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbmKv2QV9z2xLh;
	Sat, 28 Nov 2026 08:10:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.9 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795813859;
	cv=pass; b=WdLIyuHnUkCCNyRjLO4oL9w1FA05lKn49Hdim4XtvIhvGGqHkw3nHRQXpPqpkAf94+IwNOr4u0ujE+Te5madaZzshh+d1ymXz4uxUN+2QOnwDsn0FE0SVgXFmUs500sYZfQXEp0wlUhLMduquQLWR7x1zjDpg3ScA5jKO6UspgLhTbbhE7SkuBlRiNBz93zx7vyPphusAbR6xj8lnsOGi/FbUevq4W5CVSMhc0vN1GsU24D2a3nSFFvQjYMLvnSrOitKo2bTcZgy796eqI7fJ1jPuD2PMYowwo1OBgF/32dL/hII/L2f9eY2D1eg6HOt6+/Ye97jQTmfYBa1XN+zog==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795813859; c=relaxed/relaxed;
	bh=uOiwXZ75vT9KfeG4Q9NJpoAr1XfEOadNO5jB9sRTKag=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aVgzWE0TPoWBh2xPPspBZU5+TyTwukv4BykDkVXbWvRBbaU1jg91QZIscT4Z2fAW0TLvF7h35RTjvRz+OshldDQQ7wPm3GvE/JofM91mL0au5qpd7qwSb+vav3RgJz/dyh/2VqJY+44GcbC/PK+zC0M8XXKHU+nFksjQZX+zztoj848gJ/gATt9E+T87QAXA+4vnC1hscvYT8qq9BSMLx11KZeWWm95dxdSX0kT94B/Y+WVLk/8/doG5SnBNOCQMs1A7SIz0jENeRqXYnMV6A39sSb32TvjJz5Q//rJ1agBqO4TibiVNu9Iherw3smyKAFlCePsmQ/rVMRolkxYo4g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IHNzPMWO; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IHNzPMWO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbmKr2DCPz2xH7
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 08:10:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795813856; x=1827349856;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=uOiwXZ75vT9KfeG4Q9NJpoAr1XfEOadNO5jB9sRTKag=;
  b=IHNzPMWO6JdyQymp7ZeP2kUZ0rTnayN3xJDj+jSlPuf7zfsCN4Xr/pZH
   eeNEzZjoRTsKktDn8LIvuGr0V+f8WcDL8X0SacEb68B5xMs678921PfsP
   ixlr3fRWAJBaRGd7cjM4tYsDS93TeLKZKTbLF/DJUhq3YaPzvT9ajVYdq
   CSLWvFpPdFj9vCzQPsJ68DKw9ENMa9PGG0oTg9P8JGjykvPpQ/naf/F/q
   ieMAeOBRoFRxLNSe4Hgmn9LtwIHwSGLMCy2kI9EpAv73KsgVJszuKHFyO
   q7bc7Ql93wX9W9Df/+obKALJYZS7g1H1R6C54kmbLdG3Iyq+1RrErZvwN
   g==;
X-CSE-ConnectionGUID: 4S2+7x9/SF+wauqHfTuiuQ==
X-CSE-MsgGUID: GP2maG0RSrKPISki+g7BuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4638321"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4638321"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 13:10:50 -0800
X-CSE-ConnectionGUID: HfY/7UWFQI+kjoW7t8R8zA==
X-CSE-MsgGUID: l48/QhbtTvSZwFZcQW4SZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12815667"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 13:10:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 13:10:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 13:10:49 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 13:10:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kl051qA/RdKPJcfWquaqDPNatngW0LSGqmPC7C5aFh90fcSfqmXPLP346c/7aOEK2cT76ugY3bWzkbcnc+oQj2TGF8rfeNg6z/KsmSOCEW23j5CAuk9LYPtaxarSksvunZxpIeCiG0M+5K4OC6Wl4RZm8Qr5WmarUfcc0rihaLBjlyJxneMQdMWH0sLtj/KTBqzYyfsg+70/GJ6UhAbnG0GT9izrI2f8skP5oxAO+WRkXZJ2wen0AqKxkt08mEPYIZO+LHBKHQnwwBl0x9PUMzIG3bGmUewLxgattaBloQ9Ua0LuNWqv+Qxs8oocZ3YG+xHnv0lybHCz4roxJ4z2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOiwXZ75vT9KfeG4Q9NJpoAr1XfEOadNO5jB9sRTKag=;
 b=XP6TfB6SYObMERxsqmQPw3CyVXKaq6cmoOucGAUqqw8SZNGmWxGyVzVq0Tfngg6q5gAqnmy1FTa7/I14ip154KaYJf3XhGtGFED2FogAXlvLW1crf0E2NtCy3YmgfeA3cDwkGh/I5yT1R+UfveRg9KIFPchtfEoRGTt3vbH9dU3nfaKa9zyS9HXGvQyRwBF31h8/Iy82SuR9aTMHp5i8BYvPDjDYPn0+5K8yEi3KmPhRoIfFKs8pIPqadGp6YILUlWin7UYbWUY5DhLknJb5CveTfl5pEQFPwoa7fwQHq2zl+c2oOtEzZHu9qe5rO4lwFlFclstrHgVZjej0EpMmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5339.namprd11.prod.outlook.com (2603:10b6:408:118::22)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 21:10:46 +0000
Received: from BN9PR11MB5339.namprd11.prod.outlook.com
 ([fe80::73f2:39e7:6309:5486]) by BN9PR11MB5339.namprd11.prod.outlook.com
 ([fe80::73f2:39e7:6309:5486%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 21:10:46 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] PECI changes for v7.5-rc1
Thread-Topic: [GIT PULL] PECI changes for v7.5-rc1
Thread-Index: AQHdfrPFX88w0yd2wE2XOzAjX/T/aw==
Date: Fri, 27 Nov 2026 21:10:46 +0000
Message-ID: <0a8aa8c84e0694d668242c06414782e989fa1056.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.60.2 (3.60.2-3.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5339:EE_|IA1PR11MB6513:EE_
x-ms-office365-filtering-correlation-id: def6d9e8-7282-493c-c720-08df4ccae7c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|10067099003|261026140227099003|56012099006|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|11063799006;
x-microsoft-antispam-message-info: Sb4dFXM+Lf0A0VhsbThcfC2uMNs74XCPNVI9fhSobkoJ1QgxtXO0eXmPiW/F66vUcERkIQyBEJgmfPGmG6vVYpQFyXR9RzyW6+VSsVMsJC7HYlsb6QzlRw/zOf3m6N7wG3TScxJVWHHZqhs4ZFEd+4lcHrRRe55CoPJJcki1h5dCUwQMUKHasFOqUdHZVOyuIHeNgNF7FfMLkKQfOGNt0/s+sYqJ7BpA0Z+Dr5M0Oz2Y36+ASJc8WszWi/wnl0+Sa1YZANPHU0woa9i/1lhUfX9DIXAr1jyqjlq4vcgeUJRdj0ih/8HzQouqVH51emSYEQfD/B3XggzBbn4SBTUxUDGmMeLrTqqlrP4lU2FtQqC3h38vHOYb+jI8JPVVpIa9TLj2Jltx5ew11GHBsWlfXyVV3j4Nbaer59+zxKeg4kjvNVKi1WOFr3BJGn/rBV1FLe7juqL/2mxYItNUJft7hkxx9KrJb3Nqi2so+pRXn+Z9i4tCFmK1b1HKzIUyRM99nQts9cFlkamkg+6bC1SN0h7dy8L+Wf/2YApCF5bzSE2LhRe4odx/carqx3VapPQWrRl/CQncM1xjP+hmG7IpBNSu0Ys6d1QlJdC1hWTa/E7QDNUrTgTBAzOaWjPTMhwlXYkorwgdmK5hexyEKVCCVeb9gjAx5VxXj9Ui8o/5e1UvTEtUTP6o0gI3SplwGGQbIduAQc1jGoaLOppm7iVoB3PwNNHKtevQCwXTnEXm+uQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5339.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(10067099003)(261026140227099003)(56012099006)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk5sVmptMmhreGs5M0YyZDU4bENVSnhVN0lRODJpWTRZRkhxaTllMmdDRG54?=
 =?utf-8?B?K1N5UW9uSTBPclZyZ1BEVjBJOUNCczZsNkZkZzZaR0haWUY1amhZVUVCbTBp?=
 =?utf-8?B?anBsUWFBc3pMejNPT0xHOWNTOHNsWld3UVNOK0YwODd6U2VCTGVBWWVwRlZ1?=
 =?utf-8?B?ZGtLRUs5YjdKTGZTbThmVGFJLzJVUkNjSmRZSEZqRnNDZEZDV1Y0N3lmOVJO?=
 =?utf-8?B?a0NVKytRVXFPMzRXQzNxM2x0K0hjVk5PS0x3QUdJalptK3VrWmtWbjJjSFZ0?=
 =?utf-8?B?MWVNcTRuazJCWjRaYktNMGZYay9OSmFmMlpiZHJXejV1TDg1SDFMU01EMFZp?=
 =?utf-8?B?QkR5TkowNjc0bWhwK0R4eFhlQU84cXlna3pCbWhSMVBEWGhlSE85L2Z2RFFl?=
 =?utf-8?B?OUtVSXlDNlpPd2NKaC8rN3N5Y1BmOVA2SnVSUmYzelpjTTNJY0c1bE1WY2pI?=
 =?utf-8?B?WTdPdXJ1czgyNnpmSzJ5TS9DZjRaNDR1V2VScTFQYTUwa21Ya3BVQjMzOFVZ?=
 =?utf-8?B?RWJKa3FEeUJvZU54alhCa1RWdFp3OWJxOFY0N002c0Nrb3BwdkZmY1ZTK2lr?=
 =?utf-8?B?bVhyakgvUUpTSExtMEdweXNNejcveWxjbWdhQ3JZY2VJQkJSVll0bEVSOExl?=
 =?utf-8?B?b3VteEJGSHNyVk5aRlJEY0cySGgwaVYxaW5jcHNyTVlMb0VNc1dxN0FQTkRn?=
 =?utf-8?B?R2dDZHBpZWZCYWYzSnRWTlQzRE5WRkVydThVdXJ5YVF6R1RJOHlnQkpraGg4?=
 =?utf-8?B?VitQZm0yZ0EyclNrbWNvbzVFVVhlM3Fpb2pJcTRUNHovb0VOQjNQMjNTOHFU?=
 =?utf-8?B?aEVtM1VQams2VDdiakF1cGpYWGl0OHJjRTBacUV4QzVoa0Vka1B4TzlLM3ZQ?=
 =?utf-8?B?dzYrbkVsL1NpNityT2ZvK2RJSjA0dzFweG1nRlQ3UVZZTS8yRFBYa1JQOFVG?=
 =?utf-8?B?cVJLQ1M2STRNQ0RXMU5BYUw0YXlJQlRrcC80OGdFN3RKS2syVHBScVp3Rkt0?=
 =?utf-8?B?ckxLTVlZZzlYM0UxYmkxdk9pZWYvMkl6L1lhMmVFVzVvbEhOSTRmQWNJT3dK?=
 =?utf-8?B?WHNGUE9jTllSa0FWamxkWlAzb2owbnlIWVkxMXBwaUMzWWdjNzk3dEpuMFh3?=
 =?utf-8?B?amxzRjhGcmpxaWpncHpjajRQcnI3c05tY1ErSzU2TTRCTnpVc09hSW1tS1Bz?=
 =?utf-8?B?UzRCYkczMWFCVTRtbU9tYk5GdnFXcG83LzBOMVhxS2U2VVpDZ0d2V0FOMUUx?=
 =?utf-8?B?Z2ZoUGx3aC9zY3ZFanI4UVFQRjdrMGZIK2QwY1hIcjZmY3pkbEtTd3ZLVlh2?=
 =?utf-8?B?S0lUMkJ1cllFSkRGTitEcXZzNjcwTUo4bjN5RXNCRFFjQ09NVGkwY0w5WFRl?=
 =?utf-8?B?b1ltMDhOR0NSMFN1Z3AvTkN0T3JXbldxNW1tSFlNUXZFbFlMOHQ1WnI4NkIy?=
 =?utf-8?B?UHEvZ1lKYnJkQ29nZi9oaEVRRjlpSzlKcVF6YmZhZnlBZnlaRUVqdmNSMGdC?=
 =?utf-8?B?ZE0vZzRsU3lvdUpMbTJtR3JXSEgzU2h3MGxmSFlDSExZRTJYR2R2MDBxV0wr?=
 =?utf-8?B?cUJEUXYydUQwMFQ0T0ZJcENPbXBoWW42amduaXAvVUdqcWF3WWZKeklSTHkx?=
 =?utf-8?B?NkkybXUyMUMyalFZcjRseUhXdHE0cmc5QnBqQkdxWFlDSzYrZkpVMjl2WDBJ?=
 =?utf-8?B?RTlKVWVZeFFjSkJnR25qdG5MNWVhaFQ3RlRTeThibWdId1paTisvSjh6MGdv?=
 =?utf-8?B?Z3lqdW5xZCtmakJ1ZHB4bXBNbTZWUGY0NjcvWk1NS1pSOTZrcEZGcHNFWWxC?=
 =?utf-8?B?bzRHN09JdWlhSjNIU25BYW9jbU9kSXozbjFZMWhCUzJRSWkvSzFmQkpPaXNC?=
 =?utf-8?B?bTAydEtrREVMeG1DSGtQS2NSSDhrMU85T0M1SVZlMFhLUnBSNE9uREtST3BY?=
 =?utf-8?B?MzVHa2NLYmFOT2U4TU9CUDQ0ZWJEck5icUdBbjh3MTdJRGc5SyszTUZtWGdw?=
 =?utf-8?B?VzlmSERkakl0T2R6amwvYVEyNk16cDhWaXVNb0g4V2ZhSnZ4K2taZy8vRFN0?=
 =?utf-8?B?TDBmSm1vNGF3aHNoN3ZyRDZvbWsvc3hyVnlnRWREanlGVHRnNTJkNXBld2JR?=
 =?utf-8?B?TEpYR2puNnhxWUMvclpRaHBpNWFyQTc4aVR2WC9BblovNUtOM25KQkYvaDlK?=
 =?utf-8?B?aWtHUFFCb2NkUitiekRGWnkxMldJQ2NKdFRTRE5ZN0FVNURkVHJMa0U4ZXhx?=
 =?utf-8?B?U3hDK21WZEQ0OG5heU5KZVB3VkJ0aHFmRUczVFh0YlFYcEkrL1hhSGJ5SW5a?=
 =?utf-8?B?RklBZVpMWHZnblZQVXFoY3ZxK2FqYzF6U2tVMDRydlRKNUV2ZjNLTC9oTjlt?=
 =?utf-8?Q?F2/h1tc/ydVAv+YM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48DB52F9A40E034BB1BCD7100D123E99@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IGLEbjseqFbqh293+GziGr9PH5UIG69qm1H0ibsnDFWAVJoKokKEyWDXBTgKM7GSixKoG8xA8vZ2XYbVP8PPjREC624FObqezW8znH62HK10Z+XKk53ZDP9XYz/6um4kTs8DzAZlbD3O1a+vhSEJt2rwJeMrPDbqHzEaSyZuVDMA3yS+p9+Kj80vzAzQWoI/Ydhi1ltTZgT85w6TboLeCLZEYcHBCK7mvbbRgl7Ky0UrwYRiW+8WMEtqlqDH6h3m/dOtx14ozKBH84piqvqKjSER/F+Arj84NyByS1SZTk2DLYZ9Bk6X9X5T+scTejTudiuEiWmnSVlcNHAwNPS26Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5339.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def6d9e8-7282-493c-c720-08df4ccae7c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 21:10:46.5001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVhcy1ZKactCJ1WHYmijU4FTWjuzDJ7f/eBeWta2qLy9TOnKycnkwqX9YBbMdpyydb16JKDgsuBu1G7ss8mef5ZviA2DteU+Jn+iiiItwb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgR3JlZyENCg0KUGxlYXNlIHB1bGwgUEVDSSB1cGRhdGUgZm9yIExpbnV4IHY3LjUuDQoNClRo
YW5rcw0KLUl3b25hDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjZhOWZh
MzRjZTQxODdjYjY5ZDNjNTg4YTRiYmZmYzMxY2U1ZGI4ZjoNCg0KICBMaW51eCA3LjQtcmM0ICgy
MDI2LTExLTIyIDE0OjU3OjQwIC0wODAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoNCg0KICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvaXdpL2xpbnV4LmdpdCB0YWdzL3BlY2ktbmV4dC03LjUtcmMxDQoNCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byA3YzU1ZTg3MzVhODVkZmE0M2ZiMTYyNzY3OGNhN2IyOGQ1Njdi
NmU0Og0KDQogIHBlY2k6IGNwdTogQWRkIEludGVsIEdyYW5pdGUgUmFwaWRzIHN1cHBvcnQgKDIw
MjYtMTEtMjcgMjE6MjE6MTYgKzAxMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClVwZGF0ZSBwZWNpLW5leHQgZm9y
IHY3LjUtcmMxDQoNCi0gQWRkIFN0YXJGaXZlIEpIQjEwMCBjb250cm9sbGVyIGRyaXZlcg0KLSBB
ZGQgc3VwcG9ydCBmb3IgUEVDSSBDQyAweDgzIHJldHJ5IGNvbmRpdGlvbg0KLSBBZGQgSW50ZWwg
R3Jhbml0ZSBSYXBpZHMgc3VwcG9ydA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpDaGFuZ2h1YW5nIExpYW5nICg0KToN
CiAgICAgIGR0LWJpbmRpbmdzOiBwZWNpOiBBZGQgU3RhckZpdmUgSkhCMTAwIFBFQ0kgY29udHJv
bGxlcg0KICAgICAgcGVjaTogY29udHJvbGxlcjogQWRkIFN0YXJGaXZlIEpIQjEwMCBQRUNJIGRy
aXZlcg0KICAgICAgcGVjaTogQWRkIHN1cHBvcnQgZm9yIFBFQ0kgQ0MgMHg4MyByZXRyeSBjb25k
aXRpb24NCiAgICAgIHBlY2k6IGNwdTogQWRkIEludGVsIEdyYW5pdGUgUmFwaWRzIHN1cHBvcnQN
Cg0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZWNpL3N0YXJmaXZlLGpoYjEw
MC1wZWNpLnlhbWwgfCAgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgOCArKysrKysrDQogZHJpdmVycy9wZWNpL2NvbnRyb2xs
ZXIvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNyArKysrKysr
KysrKysrKysNCiBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNp
LXN0YXJmaXZlLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzY3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCiBkcml2ZXJzL3BlY2kvY3B1LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA0ICsrKysNCiBkcml2ZXJzL3BlY2kvcmVxdWVzdC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsrDQogNyBmaWxl
cyBjaGFuZ2VkLCA0NTYgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVjaS9zdGFyZml2ZSxqaGIxMDAtcGVjaS55YW1s
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktc3RhcmZp
dmUuYw0K

