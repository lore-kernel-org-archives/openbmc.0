Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD675606A31B
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2026 22:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=supermicro.com header.i=@supermicro.com header.a=rsa-sha256 header.s=pps1 header.b=sY9ZTna8;
	dkim=pass (2048-bit key, unprotected) header.d=mysupermicro.onmicrosoft.com header.i=@mysupermicro.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-mysupermicro-onmicrosoft-com header.b=Q9yEc+c6
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jLHBG2THsz2xPb;
	Fri, 06 Nov 2026 09:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=66.159.250.47 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793911850;
	cv=pass; b=Wx59jtjh58f+7nD0L3P2drYuxt6n+8wAJXH9TjZh0u2Y4AkmOdBohi/5Q5Vyz5sCVrPkM+1dW3oxB1JQEVAdZaTFISRLBKs19GVmG+T1Jf0b1FbgtR2h18yTwAzUixTsANffWIIPpVnFGtaLECCCh7IK/xn9u5B074h+15CNVh3UEtaXXJ3ef5F0Qjw3KrVlgcz3vG/UXpUA1W+Cvm/nGqFfN77rj+QsgdQ9WFTYuKKXHqb2LWh8PsevjxOCgk5/v7AsPeKH+KuWihrqOR24IPRE5mVAy7WnEcaHMM/krWcblTJcozRZ6jo4nA4RzgBp2bvYQsi/NgId7Jaz2pAVUw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793911850; c=relaxed/relaxed;
	bh=CgdgvNsWDcbe4eHyCdgUkzlzjx4Kjor2cs8nSv7BWVY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zvmj1P+B1mrENb8rVpvVrYek8QNfDcuz+oDKOJMy9pF1IDOCxR/Slfprzyrxl7KInN/mInu6Ozdzg+RZEREAffo+9zJO6wozErYF2tEoCAEXAqGMLh5Oyopyiyv/6NXhz1idQMoRcniN3CTJNqlEGx1SIgkQnq1g+KIxW9lLBk9zwuhr+lSDsD6sqL3fP868/M7rji+EabVRBlRN/yga8ozuL0Sl7z0i1FDBW3TkLNFcoD+WucO1EkCqM/X0vb2ysCTMI66pwE++qA7OWYc6EvZdxdfhGlUjsuSpFaq/z6i7u2z9RLgl3Mz57bfwnwq5/pVkvTMpRHNNYTZhALGk5g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=supermicro.com; dkim=pass (1024-bit key; unprotected) header.d=supermicro.com header.i=@supermicro.com header.a=rsa-sha256 header.s=pps1 header.b=sY9ZTna8; dkim=pass (2048-bit key; unprotected) header.d=mysupermicro.onmicrosoft.com header.i=@mysupermicro.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-mysupermicro-onmicrosoft-com header.b=Q9yEc+c6; dkim-atps=neutral; spf=pass (client-ip=66.159.250.47; helo=mx0b-00293e01.pphosted.com; envelope-from=alex_chen@supermicro.com; receiver=lists.ozlabs.org) smtp.mailfrom=supermicro.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=supermicro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=supermicro.com header.i=@supermicro.com header.a=rsa-sha256 header.s=pps1 header.b=sY9ZTna8;
	dkim=pass (2048-bit key; unprotected) header.d=mysupermicro.onmicrosoft.com header.i=@mysupermicro.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-mysupermicro-onmicrosoft-com header.b=Q9yEc+c6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=supermicro.com (client-ip=66.159.250.47; helo=mx0b-00293e01.pphosted.com; envelope-from=alex_chen@supermicro.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1080 seconds by postgrey-1.37 at boromir; Fri, 06 Nov 2026 07:50:48 AEDT
Received: from mx0b-00293e01.pphosted.com (mx0b-00293e01.pphosted.com [66.159.250.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jLDwm0Ck6z2xJR
	for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 07:50:46 +1100 (AEDT)
Received: from pps.filterd (m0443899.ppops.net [127.0.0.1])
	by mx0b-00293e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JnPLR3542255
	for <openbmc@lists.ozlabs.org>; Thu, 5 Nov 2026 12:32:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=supermicro.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	pps1; bh=CgdgvNsWDcbe4eHyCdgUkzlzjx4Kjor2cs8nSv7BWVY=; b=sY9ZTna
	8Gr8j2riXr1vIshXnDi1shqj6AFvwVTzYAXz/9EeAu6cPXt3GyrmRHkdYKh7yq4e
	AxkFNurGIh0P+d+F4TszXbmFHLkKyWddrg+CBS7eC9dt8YYk/fgkB0fozUTKkGa8
	Ab5vrCygJJiQHFYGQBcqwwRmkEPbt+llIeiI=
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023076.outbound.protection.outlook.com [40.93.201.76])
	by mx0b-00293e01.pphosted.com (PPS) with ESMTPS id 4hp0pw20t6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 12:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J60ICc4SvZ2tw3jzL5xh3CxFBkOrrHY5IpVobebD2x9fJ3tKsqOyusfnYAIdjiQg67+UeMXxkZYP2prmt56QJp7+ay1FF8EJ6jVx6I7uRLJ2RHIYScHFMH1DudQbIg/D1ALN5XLamJLTj8ryVmEJBC/qJXRU9w6AzQo5oGNe0vsqfi0leKkzkDAhjH4AL1xcKpyTrnEheYo2/S24obXlsel1Hkg+4xofFoMnuoQ85fCHJu6iyjslFpxLsXDz1bZj8F7jIUHHy+CfVdBin+1DObsoupoTZeJmW4EYxJT7qhuKOH32yHbZB8CwfZ7b/xnbAm28z7s197KHhQ4UFzYnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgdgvNsWDcbe4eHyCdgUkzlzjx4Kjor2cs8nSv7BWVY=;
 b=BB7n+oN6DFTU8qkC/J0glij5RAZYTUE8B4ave6v5ltBvUHV2CNlK+XwEWN3M8p5ljNTUq2tPV/7OFHUHouiMLyP8wsRuBn7r47k3wLkPeCa6dfW3IXLbGKotexxNIfFQwVkIM1ypCj6hqWlFJu752t66ujBY5SUwr9VUEBfpWtA/quhvbfYWwGaAV9PgAtTh2LbGySaLAm+jkPjC9Dmy48pdkBzhSnpET8yHbsD37dwEl5u5tyC6NTDQul330EjQyoSWgV5e1amdH9i6dgMKf2tcUisfPJvyhFnvJkOS7j/vZ12x0TXalO6aV3hvRd3/QzKDvEMr8ijcF0wJuyKNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=supermicro.com; dmarc=pass action=none
 header.from=supermicro.com; dkim=pass header.d=supermicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysupermicro.onmicrosoft.com; s=selector1-mysupermicro-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgdgvNsWDcbe4eHyCdgUkzlzjx4Kjor2cs8nSv7BWVY=;
 b=Q9yEc+c6a5oq69AMxAPG0+hQLoaEdKNYUyXmzKteTlvUHYDCitLAub4oAgOVv0Eu5j/59cpqb1tKH6GcWNWZyDjxO1KtxkprCwC7l+Qzgzjrr0fSCeqw3W9SrWSd8GeyeJ/0SEqtzy7dzqb7ajuTpB6sP057jUBGpA02xiMI4snZaeBFeJ3YddiDvsxx7kg3gSssk7ceN/KIvdy05OUO/BNdBtZGn4u1Q6S8Cl6aZdD8RtLHhdtUfkbS5MPLWNbpx8BFPIfxbov+cQhr2nhP4b17YhRIuieeCz6CoNgikurmQTEaTaVJDmTfH/5zuKQXmgKXS0xrNkSl63ep2LTDnA==
Received: from LV8PR04MB8960.namprd04.prod.outlook.com (2603:10b6:408:18e::18)
 by DS2PR04MB9702.namprd04.prod.outlook.com (2603:10b6:8:279::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 20:32:33 +0000
Received: from LV8PR04MB8960.namprd04.prod.outlook.com
 ([fe80::f402:8e6c:ff4b:1b5d]) by LV8PR04MB8960.namprd04.prod.outlook.com
 ([fe80::f402:8e6c:ff4b:1b5d%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 20:32:32 +0000
From: "Alex Chen (HW)" <Alex_Chen@supermicro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Review request: two meta-phosphor security default changes
Thread-Topic: Review request: two meta-phosphor security default changes
Thread-Index: AQHdbWSj39DdgE1g8k2YRKFQWIRZqg==
Date: Thu, 5 Nov 2026 20:32:32 +0000
Message-ID:
 <LV8PR04MB8960E578AD0994914BB9BC74E1772@LV8PR04MB8960.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=supermicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR04MB8960:EE_|DS2PR04MB9702:EE_
x-ms-office365-filtering-correlation-id: 1e22e794-1c80-4578-56ec-08df3b7beb99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|38070700021|11063799006|261022075727099003|56012099006|261026140227099003|261026121527099003|8096899003|261009223027099003|261022115727099003|261021121427099003|261022105027099003|261028144727099003|261102123227099003|10067099003;
x-microsoft-antispam-message-info:
 rrgbIGEGjyrjji3b66IZ9c6WfciuLTxw2fkEJUV0QyMDK6cF47a0npRZ2B14XlXygx0dH5I0AcnoERUswPBPAqsFfc4FpRxIl5576ilKwTmQ28TSnS7l4YO++toEkhrermbiaLdfaFBM3Tx/yUsIugJddKE0z/3e43XUV79QWO72+axVpwtHf/JlTpAuNPjeU4Q1drRU8acO0EBbDHnMueNdVUYZ5BqzOm+6QAZhyGjiLXoeDQRwYPmtrNI582fbFtYPGIO5YGSAsjhYRhO5qV3VoSjPs88iu6aKZXm/CLl1dKmCSWp6ozkFLdfpH4R9S+iqsd85YEtHg3tTTq3rd610SmsJZ+WluaGvVgiFDVGYcSyuFUbusxikmQYpGGa+4keJvtySIGeKEqTrodMhozg1Q4KNhGEN+m5npXybk9gCflevUXiteGCNOkhkz6Kw6Ttl2aoXlLeMi71Jo+rLSLsyh8yJC6+NT6nwN2UedHIfuhAkXIeOOQxqi+kcewXwfH7cTkEl5W+hD5kqEh/phH1zXZJNHnzMf/A6sLO9JdR9cEVFjDMaJItsTSIZmWdrpPCHKL1ZeDbTYmcxxIok+uYnuWequdwdmocyzydZnzVOPyYOCYCIM/ii7+TOdtAjLw9Vf4b794FushyGrLIia9NCd3/EAvS5ZCEomNoFffg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR04MB8960.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(38070700021)(11063799006)(261022075727099003)(56012099006)(261026140227099003)(261026121527099003)(8096899003)(261009223027099003)(261022115727099003)(261021121427099003)(261022105027099003)(261028144727099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?O9tOa8HXYXx4ZgRVMxHaVfIgyM1Up3Q9OdqMIKLL+Dwzfi8/ai7VqaW6gX?=
 =?iso-8859-1?Q?VcfqJd3p4S2Ake8zlAZD3K0XFkZHHfLV8mJ5gqCul9HGHOMoWfKVPqREf0?=
 =?iso-8859-1?Q?xF0REImD8Hds9eLh2bH/rv9io1ceCLvfzOyyhepfjZvy7xJ7QvBG5FJTXn?=
 =?iso-8859-1?Q?Ss4MYjPlYPoLUDHdGtl2h6VQMaWkRqe+T5vhVK1hfic5MIDNrJWx7ckorx?=
 =?iso-8859-1?Q?l2i7eUJ42FKon54jvVqB2LZxleqZQUL5C1v7KWnCev1ldxMy1Tc8UKu96g?=
 =?iso-8859-1?Q?VKoJUCV/lsnWomNm4zU+AQeTu0WEnBRStjamLZ0Tt4Qp/NSsT5espMk1kJ?=
 =?iso-8859-1?Q?ZpcX3GIghAej8MoZcaCepslRbX0D0N6LXgtVhoAyGVuOP6d+s34xkdJslR?=
 =?iso-8859-1?Q?GyoLn/YZSiynG4zW6eLofbvbWy2TSkr3CvkCAEGwjIk2PZypaBGes4C/lb?=
 =?iso-8859-1?Q?0vQuS4CwCEPapnfjTr6x6jttbmdadsscckN2k8q1mxpSZ6ZmzWbdjNRc8U?=
 =?iso-8859-1?Q?cJ1UTyMUJf+Vqco34ouXrSOekfSU65pSzVN31llAkdmbyEtGAqRi7if+3a?=
 =?iso-8859-1?Q?De5fSPsqrlOqPCsD58h32dfi0S1Ldns6SlDz/CvEv7l5qerJ4+zaYiCV9f?=
 =?iso-8859-1?Q?mixHnrhKvS5kdRzUyv83lKOumPqG33ZTu85PPnrjx+5urFkghb1egjqGum?=
 =?iso-8859-1?Q?qwVSYEqG0FJoQybWfLYtAQieCxlAGnfpcezM+PI6Mpnenq10ig6QqTQ1Yv?=
 =?iso-8859-1?Q?9ln92S4r7Ohkq2H4odVCfD22ojX+mqOdwssGVJkWrnhrbjiQD5+/HRcE7z?=
 =?iso-8859-1?Q?ZXVRATjhFpUIqVaLvpW5BQG7DRJFXP0FBZJhnUlBBqmAzqC79L+nSbOffM?=
 =?iso-8859-1?Q?rZa0JfUlcHEb17OZfLCTrXNnKVQNqPQRHpU5xaSWyrXInxuoly7SSzKoRh?=
 =?iso-8859-1?Q?Neahb6BAa9I5oB/I0WOPPsIZu1W94KtQY9AFAMmzFrk5jRJ5zz0EAf2oNm?=
 =?iso-8859-1?Q?ojC5i5yGkfEX7x2qhTPHRczsmpWCl1ucB6WlyJAcwiY7JlKYS4fEYZ6ss6?=
 =?iso-8859-1?Q?PpqLzqA3v3t5mNuvnANfonbA3nfmlKM9ufCV8M1CMRIVilCfunYu77yL2F?=
 =?iso-8859-1?Q?sKV1lSEV1j8v07ncmgZ0WyXgrz8f3wj45nofNOgCNVxR2DVi1hIvZOQMS1?=
 =?iso-8859-1?Q?AJ3RnyWozY/jA1VN89DiLUkGWKkKm5gGM9oaoMb1LRTaLcWqKX9B1xXx90?=
 =?iso-8859-1?Q?j7ylhNYYrTKui6msy+I7BSeoAni4a63jZQMUN9dAzTEgbIIDGC7TIuwAcd?=
 =?iso-8859-1?Q?ePeeRI1BrTZcCMjYNslhNdpMhq/sAQhA2Ngk/qOAjCZSQl1JLiPsSXiy1t?=
 =?iso-8859-1?Q?H7zBV8G+0K+G7CUYCVHmF3oWlrwKkYx8+LIRyiBgO7NEcqya7rlvmFI+gk?=
 =?iso-8859-1?Q?3gE45aOUJKN7X6Gfclr95eHT/KD48nUCH7Px6WPRUQvcf+uge9wci/mvby?=
 =?iso-8859-1?Q?3vLfWMUSmwLJ4vL0tydEgEXpDE5fcfY9QWISPMR06slZFgyncPtfqY3TnJ?=
 =?iso-8859-1?Q?yfRjLLACMKjgGFApSMHoc7dV/3Ew5QcAGJpzpTiUT/5NQKfE29beS5AxOQ?=
 =?iso-8859-1?Q?rz63E9hk8ICOpuAW1vSSUAc0fgS3sAFxrAHnB+LNWKVySOx0kpQAWYp5IC?=
 =?iso-8859-1?Q?zH3vaVUeigaWP+Q9OLpqpQoK6k5RMHzjdqNjaCarM01ccqdbV1+cfeGxLW?=
 =?iso-8859-1?Q?Km3w3X767XDws5BcI9x9anqOukOLQFePgEFPFznHdhWRyiUAUoMq8swUgx?=
 =?iso-8859-1?Q?7DIUtBUpUQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV8PR04MB8960E578AD0994914BB9BC74E1772LV8PR04MB8960namp_"
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
X-Exchange-RoutingPolicyChecked:
	x6Ld9irj89GBIOqhaieDA3lfuX3/Y/0fL9TN04SRi8OqEdK3GYm8Pcc2uB13Jf3ExpSIds/2UWYOdbIMyCrvYVbrZGvO7+locTF0+8UCK9IT73V4su6oTBU+FtxDKdMoldJSEA6Q7lDcX9lmA69WC8O7zG1DXvNULNc9NlYec+k9pQr2VKlfeQtRM0zSNG/SunOmZ/rnKmDRplB/VtetBlgTcWyo5sbEplzuIGXtrqRRefjYJ4ophWLnY4KSHxB5sR53ie59WI3hqEov9O5hm8JmGlKxNi6SrXyoX7hOJ95wXTVX+ny8HIu2cIRhFyolchcLv3C7YSMvXWeLIv7eCA==
X-OriginatorOrg: supermicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR04MB8960.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e22e794-1c80-4578-56ec-08df3b7beb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 20:32:32.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e2fe0042-8583-4635-b9ee-d6e047d4b347
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7J5beetcDb8IW3NgPv6SW34lnYIg6QaEOjjLtV3TsWASBimasN/bArAktvvt6hiaBMQHqAvG4uqI1/xxqBRnRW3BEhx34N2o4OUvNFiaYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR04MB9702
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--_000_LV8PR04MB8960E578AD0994914BB9BC74E1772LV8PR04MB8960namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

   Hi all,

   Two changes in review alter security defaults for every machine, and
   Andrew suggested asking for more reviewers.

   95463 restricts the default D-Bus policy (org.openbmc.conf) to root.
   Today that policy lets every local process, whatever its UID, own any
   unowned bus name and send to any service. After the change, non-root
   processes get only what per-service policy files grant them. A QEMU
   boot of romulus logged no D-Bus send denials; other machines may have
   non-root clients of root-only services.
   https://gerrit.openbmc.org/c/openbmc/openbmc/+/95463

   95486 makes the build fail instead of signing images with the in-repo
   OpenBMC.priv, whose private half is public. To build, a machine sets
   its own SIGNING_KEY, sets SIGNING_PUBLIC_KEY if it signs outside the
   build, or opts out with ALLOW_INSECURE_SIGNING =3D "1". Failing the buil=
d
   was suggested in 2020 and not adopted then; Andrew asked for it in this
   review. Five commits under it opt out the CI machines that use the
   default key, one per layer for its owners to review: meta-ibm,
   meta-asrock, meta-nvidia, meta-quanta and meta-nuvoton.
   https://gerrit.openbmc.org/c/openbmc/openbmc/+/95486

   Thanks,
Alex Chen

--_000_LV8PR04MB8960E578AD0994914BB9BC74E1772LV8PR04MB8960namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Hi all,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Two changes in review alter security defaults for every machin=
e, and</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Andrew suggested asking for more reviewers.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;95463 restricts the default D-Bus policy (org.openbmc.conf) to=
 root.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Today that policy lets every local process, whatever its UID, =
own any</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;unowned bus name and send to any service. After the change, no=
n-root</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;processes get only what per-service policy files grant them. A=
 QEMU</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;boot of romulus logged no D-Bus send denials; other machines m=
ay have</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;non-root clients of root-only services.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;https://gerrit.openbmc.org/c/openbmc/openbmc/+/95463</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;95486 makes the build fail instead of signing images with the =
in-repo</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;OpenBMC.priv, whose private half is public. To build, a machin=
e sets</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;its own SIGNING_KEY, sets SIGNING_PUBLIC_KEY if it signs outsi=
de the</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;build, or opts out with ALLOW_INSECURE_SIGNING =3D &quot;1&quo=
t;. Failing the build</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;was suggested in 2020 and not adopted then; Andrew asked for i=
t in this</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;review. Five commits under it opt out the CI machines that use=
 the</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;default key, one per layer for its owners to review: meta-ibm,=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;meta-asrock, meta-nvidia, meta-quanta and meta-nuvoton.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;https://gerrit.openbmc.org/c/openbmc/openbmc/+/95486</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;Thanks,</div>
<div id=3D"Signature" class=3D"elementToProof" data-signature-name=3D"Defau=
lt">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Alex Chen</div>
</div>
</body>
</html>

--_000_LV8PR04MB8960E578AD0994914BB9BC74E1772LV8PR04MB8960namp_--

