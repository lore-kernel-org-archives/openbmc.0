Return-Path: <openbmc+bounces-2262-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D363DC43458
	for <openbmc@archiver.kernel.org>; Mon, 13 Jul 2026 01:57:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gz5DC5hryz2yRl;
	Mon, 13 Jul 2026 11:57:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=173.37.86.76 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783907851;
	cv=pass; b=ne+4SAsCNDDm6T17o8OKQD/F9fFqyslYRp7XzLhgkrKkHQbob0JkmM1o1tNaIypmY80EvoHPZIR4UjHm+Pf7kHDjxEqmVQfzBvzOj8afu2Ah9zA4Cu7yl0vEnlTDj4WtdBjaV51Wsgooh87sNYTwyrQcLeTE6VJwrQeIn7ZZgNG0wh1D/eFFgUh0Z4P3VerwogPztoKEhXiUgiQ1dsvlqkDh4UkgzAyAtOlLXtBphhnX6j91y68foiWV2xcoWEOn/IgmBustpFUmmHIf7vkTq3E8uRpMtZ4qEUtFk0hVgRMWJPRNG2tI8kUiLPzENVI9ICKiLBG0bxKiTrQJbQow3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783907851; c=relaxed/relaxed;
	bh=xzRyBs5U5hq9GM9sm6LkeEC3gdklqyswksHxgi+hifI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H8rJ7/Ggi23/WHtPrqtp+WqdrQv4wBk4czvtjdbtTs4KjWDvHFrgikyRsI/wehkBkLz13A1vs6Z9trMZLCdCQZWlN0y3uy799LWWpXLYGGs0lKqVhMU0TWxZAIJ+IZxrvfAsK2/61bnQZ36uTrQeAsc2NteYAhSpjLYhYkKdRIYpQubqNNLgFFi9YeiDAMY399LqB4YT+VWJ9QQAiOfUYCJUsPjvxHuFJDsZrA30Uy0l0mR6GioXl3Aa2MMvOZKtVXyGiunMU+pjsv3S1x7Te+bvpbChmsktL84yYxsqmtQP0f59RsBS586D5jrMoacw5xDtbEdv8/W4CvC1Ia5JUw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=UKpgZdHW; dkim-atps=neutral; spf=pass (client-ip=173.37.86.76; helo=rcdn-iport-5.cisco.com; envelope-from=ttruong@cisco.com; receiver=lists.ozlabs.org) smtp.mailfrom=cisco.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=UKpgZdHW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.76; helo=rcdn-iport-5.cisco.com; envelope-from=ttruong@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gz5D629Dtz2xWY
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2026 11:57:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7730; q=dns/txt;
  s=iport01; t=1783907846; x=1785117446;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=xzRyBs5U5hq9GM9sm6LkeEC3gdklqyswksHxgi+hifI=;
  b=UKpgZdHW/ygeyQJmStg0F4q+xnDjdtcBfnUrBuUcSfmRE/6gWqdvT7hN
   Nti1k+2rUgaHDZc5IDsfub/Z0kkvgBi7fhvurYWXYLAc+IvD6YkE0NF3G
   qnr8VCx+GIcsuIxcC5qEuXPpbH6mtVm2InoWSehxpk/FLTUvrrk8jdDyo
   2IaAMqzdfW9xyVq2wi7xUXRbJhogaEksFZ1dB6LPT7HTeDwGC5gzrLGaO
   PfLbjk0Vy+Cb+j1CiVyCY4Al+ok9rLOiVoWccgegfKAVuZv1mDucbyaDS
   adljvy3PnulDfyIO2DpTZfTR8YHZ31zBYHs8VvcU8lbjWUyvl9W4XZCQJ
   w==;
X-CSE-ConnectionGUID: GoMK0gikQ3C+XrLpzqeoew==
X-CSE-MsgGUID: KfWsBJGSSo+eX2Y7/K2PBQ==
X-IPAS-Result: =?us-ascii?q?A0AVAQCMRFRq/5P/Ja1aHQEBAQEJARIBBQUBZYEaBQELA?=
 =?us-ascii?q?YE8ATBTgQiBI0mEGzyDTAOFK4h5A4tki2CIVQ8BAQENAi4BIgQBAYUFAhaNN?=
 =?us-ascii?q?wImNwYOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZchloBAQEBA?=
 =?us-ascii?q?gEBCwYRSwsFCwIBBgIRBAEBASoCAgIeBwodCAIEDgUIGoR+FgcDDycDAQKgJ?=
 =?us-ascii?q?o9aAYE9AooqeoEygQHdRg2CZIFNAYU+gn0fAQEqgTUDDoJMgSIYARuEYScbg?=
 =?us-ascii?q?UlEgVeCaT4RH1WBGoImBg+DRDqCMASCInoSG4NrjWpSciIDJjMsAVUTFwsHB?=
 =?us-ascii?q?YEjQwOBBiNLBS0dgSMhHRcWHlgbBwUSICpBRSMDFlhBOAtDBYFXAoIITiMfA?=
 =?us-ascii?q?zl/gTB1SnktcgECEB4KbEIkghZZAwttPTcUGwMEgTUFjFcHWxcPggmBOVaCE?=
 =?us-ascii?q?haWRkqLYqMGcQqEHZlfggCGMheEBI0UhwOSUQuYfZITlwUCBAIEBQIQAQEGg?=
 =?us-ascii?q?X4mgVlwFTuCZ1MZD4Zm1xt5PgEHAgcPAoFzkAItgU8BAQ?=
IronPort-PHdr: A9a23:+IH5dBKH/eu+rjhImdmcuVQyDhhOgF28FhQe5pxijKpBbeH6uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:chInxK0Yot9o94HoKfbD5Ztwkn2cJEfYwER7XKvMYLTBsI5bpzJSz
 2EZUGHSMvuCM2v3fdkgYI+38B4H7ZfQxoVhQQE63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EsYjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGI0YTHtUX++VOWkoNx
 eY8MCIUYxeOmLfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWgPuym375fBVTqUmeouw85G27IAlZjeC9b4CNJ4zSLSlTtmWWm
 Xns3UvCORZZOezF+GXC0SiUrNaayEsXX6pXTtVU7MVCh0WewGYWAzUSVECnur++mEq3UckZL
 FYbkhfCtoAo/0CtC924VBqirTvd5lgXWsFbFKsx7wTlJrfo3jt1z1MsF1ZpQNcnr8QxAzct0
 ze0cxnBXFSDbJX9paqhy4qp
IronPort-HdrOrdr: A9a23:Uj0G0ayorFK18AUSwPQDKrPxLOgkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYY72KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eAQ2SS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfZvln6LQ1hSRMK9AXUOQujEoPP2tL+OW3Q7Li9iwjOjyRez5pDHMzXw5HojegIK7aYp8G
 DDnQC83aO+rvG9xCbb0m/Y/75WlNHixtYrPr3MtiESEFrRozftQL4kd6yJvTgzru3qwk0tis
 PwrxApONk2w2/Nf0muyCGdmDXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cghtdhy6
 hGtljp9aa/TCmw2RgV1eK4EC2CpXDE50bKVtRj1kC3ZLFuLIO5a7ZvpH+9Xq1wRx4So7pXYN
 WGRPusl8q+N2nqL0zxjy1I3MGmWGg1E1OtR0gPvdHQ7h1t9UoJlXfxAKck7ys9HFVXcegY2w
 zJX54Y5o1mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki94aIfzY9FrN1CQqZ4h6caid
 DEShdVpGQyc0XhBYmH24BK6AnERCG4US72ws9T6pBlsvmkLYCbfRGrWRQriY+tsv8fCsrUV7
 K6P49XGebqKS/rFZxS1wPzVpFOIT0VUdETuNw8R1WSy/i7Z7HCp6jearLeNbDtGTErVif2BW
 YCRiH6IIFa4kWiShbD8VHssrPWCzrCFL5LYd/nFrIouf0w36V3w3wotWg=
X-Talos-CUID: =?us-ascii?q?9a23=3Am0AczmjO+TdreqKkwNkAWQlwXjJuXXr47y/fIky?=
 =?us-ascii?q?BUk0qeKexUU2J9aRpjJ87?=
X-Talos-MUID: 9a23:jh/UDAvNLukPkAJoXM2npz9dL+1KzJ+VDwMAoc835I6nbxRaAmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jul 2026 01:57:20 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 99BD118000A6D
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2026 01:57:20 +0000 (GMT)
X-CSE-ConnectionGUID: k+9BljfPRluxUEz1Wyoaow==
X-CSE-MsgGUID: aduJug7rSyi7cNvZFVO11g==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208,217";a="64344612"
Received: from mail-southcentralusazon11012032.outbound.protection.outlook.com (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.32])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jul 2026 01:57:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVnct9l6hp8Ptei+7jogxIPA3UIkLNMV0vTmmQM0BLSinysT7L7g/F27OfLEbgLxy3oqRt3eOtSI6ILoq2U5XcDpa00ND25ZnPoQu4mN0GMnPfvqV2F513vWf6EDU+OQmGKhi9yfAWORb0CyqHOXQ1MMwO4xf9ttWfvqkdO1aXqloQZlnw9sDsR02+sqYr3NSRdf0oc8sIu3r/iNPdEFITPm7cTzLCS6kkVHCPjrwoJyeVgA5+UgHEZ+Hx6wM0kvwcxFI6B/Rz3P5AnyVcjka5flYQR4lle+JANnNx3l4JKaru/qu6/D6uNR9V2aZFyrdjr0CifzSeoVeGB67XOeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzRyBs5U5hq9GM9sm6LkeEC3gdklqyswksHxgi+hifI=;
 b=rV2aIp0x1zQadXrn8WqMkQybi31G0FchB5+LretTy30JDnvCVdsHTfk225XkbsTnVwIGHAyCBKlbvbdBqaMFZChXslfTOtvMnKT6HxQ1KdXjTVdfRGMtLHkfnsrvXPCjwWZFgsa1LthuxKKjVEfR6byKTj+tOYDz9jzvKha1HrmrE7/klxEqhLkMGwnny3A/4PfF2a7kQL+FuG9djcqDQM4uhEQoojyuQWb38BNnUtGtKuC/TuvaoWqVhrNEBQRUxT4vKuGTGOeeYkucB+6QSmFKlJFRefaeeNbAv3SdErvMP9jmnx68tft6Dl2con9NuGipQ1s8xrB16vKZF8I4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16)
 by PH8PR11MB7095.namprd11.prod.outlook.com (2603:10b6:510:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 01:57:18 +0000
Received: from LV3PR11MB8556.namprd11.prod.outlook.com
 ([fe80::e9e9:e788:5fba:7c0b]) by LV3PR11MB8556.namprd11.prod.outlook.com
 ([fe80::e9e9:e788:5fba:7c0b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 01:57:18 +0000
From: "Tri Truong (ttruong)" <ttruong@cisco.com>
To: Patrick Williams <patrick@stwcx.xyz>
CC: "sridevra@in.ibm.com" <sridevra@in.ibm.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "gkeishin@gmail.com" <gkeishin@gmail.com>
Subject: Re: [bmc-redfish-validation][FAIL] read-only 172.19.221.49
 2026-07-12-155018
Thread-Topic: [bmc-redfish-validation][FAIL] read-only 172.19.221.49
 2026-07-12-155018
Thread-Index: AQHdElHoxTcL5HMspk2DTdsDAOG3XrZqn+gAgAAQcT4=
Date: Mon, 13 Jul 2026 01:57:17 +0000
Message-ID:
 <LV3PR11MB855616F87AFDA1643775A3C7A1FA2@LV3PR11MB8556.namprd11.prod.outlook.com>
References: <20260712225805.8F2CBCC1282@sjc-ads-692.cisco.com>
 <340B0096-CABB-422F-97D0-19160A16A5B6@stwcx.xyz>
In-Reply-To: <340B0096-CABB-422F-97D0-19160A16A5B6@stwcx.xyz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8556:EE_|PH8PR11MB7095:EE_
x-ms-office365-filtering-correlation-id: d95ecae1-2d04-4154-7ee3-08dee08211a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|38070700021|11063799006|56012099006|8096899003|4143699003;
x-microsoft-antispam-message-info:
 ZKtuZRgx+XxlXBSyxKDeJc2JXtESQ8xV8M9UzDlc/pipvTHnj1i0bI8qIAvxZJtj1ErGWifOemBqsSIsdP+Pv6+LGE0KhjopPUDt+geSrV6NdPdFsofwC8PsZgG6hC4/ECVIEPd2UxyoHkxLa9ux36aR7QsLqqjUFKmUEOnj4H5S4rGio+p72RJlnWgS5xDdYkDGOxjlfAWLJBo77I/eP6FrsImxSBdjC/SOov+QTPrD/zLIPsf2Dr2hqJkuUC0LXG/yp32DwpCxDqM2ykqVdzChDNZMSDOrqV5S9/gxXLjePM6wuCMcwH70ZQ7N29x6GRlyxr2DuEHtiPajP6kxK4q+f3qBscoTPma/8/4mWGV2awp9p/p+XYcU/JsiViXhrtq6YCkQrzJgHdX9QQj5dp/fF8WrD69ONjdGsPjzlBdjzgDLXPdN4/eOrfw2Jg6CBEHtzvpa0gQG904X6DOYqRdK6atSGlhwHd7w8JtrSOOP+da5irw2iQbi9V9gchILDXrP7PyQiDanijFc2abNIgfgPrYkOm2sRBJlvkQsAiXN2HL0ghEb0ctl77uo+K2gd5FtIrynu0fWTnj5/fC8n/lVpSO9X4ktl4bxkEBRB9wcHraDflBnYcahH5IsgcXOCksvVpf6luVOXrwiqi/2o7q67/pG33HlfQ0jRIAqH4WD7Hdh1qfN+KPSAYzdaFGlggX2FUQEkdZQPEOpVzu/6CLislfD28D96wMQuqaNov8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8556.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006)(8096899003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVdHUHB3Zk5xbFFiTGVVYmNZTlRadzc1a0grblU5S0ZhZ0RiZDhJUlp3Zmlv?=
 =?utf-8?B?NnV5SWJoSU0zWE1NTy9wcjR5TzBOSjRKNVVaWGUvdTNqUkdqc2EzdzE4SWxS?=
 =?utf-8?B?cTgrVGZJTithWmJ1eW5sbzNxZEhQZ0FnY0UvVURYc08yOXhxUHhKSWhOVm1G?=
 =?utf-8?B?Yzk3MXRWcUlJQWVQVDNXVFFRVFBnSXJvTmVRT1BvcHJDbzJTN3FqRmNOVTFT?=
 =?utf-8?B?NzkyWFZtN0dodW15cG96R0lsS0ZFd09FWDJKTk5hK25CcmM5cytXTHV0ZC9Y?=
 =?utf-8?B?YlM3cnNTMnFjU3VZa3E0MWJzK1hCNHF5dzV0Y3Z6TkJjT2tCQmxydlUweElZ?=
 =?utf-8?B?Mnd0bVJiYjY0b0l5aFZGN1RRUUxGSCs5NytoWGo0ZldhQkoxVDRha3JDaTdE?=
 =?utf-8?B?US9sTklPYlZnVU1zLzlVNGVtY1Znblg3NFo3dHNjcktjRUFLWDFYSE0yMFQ4?=
 =?utf-8?B?WDZpMEZJWW1JVVNMaG9lUWl4YjU2V2FpZWRNSjNIOHJhUHhORStEUk9KazZG?=
 =?utf-8?B?TXd6cFYxSnVKV0ZBUUFCZkIycm9XNDNjYndjZTlYNXhnekpLRGVhUml0OVlD?=
 =?utf-8?B?K2xBRXdOVVRXb05JMmxNVzhrTGtiL3hlb2QyazJBREdBbHpjVitqQXJQekQ3?=
 =?utf-8?B?U0JQeHVYV0krQWlHQ0FkRmxpWGlpSDlORmxRMDFQY0hKdjliZzJ1bG0rOW1P?=
 =?utf-8?B?eWZNWll3amdGYmpIS1ZtY0E1MGRMSVcxV0ZPcEFrMjhLcDZ5QXVuVi8xbjVw?=
 =?utf-8?B?bFVvSUhHeENaU2xhaWlrUWRjRlQ4UmFPWDl1UWR3NjdSK09meGJCSm9ud1Jk?=
 =?utf-8?B?V0MwUWowdXJmTnlvQzF6YzAwRjJkaU10dzhqVThzS2tyemlKTWl6cXJtSTli?=
 =?utf-8?B?NWlIWlFpeDlaZWc2QUsyYWRWc0RtbWhsYTZtZDRWQ1ozMGcrSkF4KzZzMVNk?=
 =?utf-8?B?cHdSUmduamxrazJPSHZOdVFQS3l0cUNTUDNpMkI3VGpzZWFEQkZFSkZEK3Fy?=
 =?utf-8?B?QmdLWTN4ZXJoWXM1bjE0NWdjWkMraEdVUFZqd0tZN0ZFdTB5Z1paTXVnZWk0?=
 =?utf-8?B?bVk4VG9aOW1BbXJMVGRRM1BybEFWeW5vU0pYaUNqSEpnVUNoTUZnaG9EV0Ux?=
 =?utf-8?B?OVAvb3hHeEY4SkwrakJ2clBLOS9tRmcwelBJRUp2QVdWcUM5RU1DdlRMSDFo?=
 =?utf-8?B?c0J4eEc0aTNDZW9kNENxaDNjVjVzV3ExZXlCZW4zODFLczd1K0xXc0thRGsy?=
 =?utf-8?B?TWpIUnY4Y2NFRHlYTFNTMU5PR0tvU0w1YjcxN1IwRWZOcTlNc3dNUE9ZaUJh?=
 =?utf-8?B?UmNJL2ZrRWkzSTdnV0lmWkdBS0t5ek82T3BNWWsxSkp2YmFZVThPRmZLbjUz?=
 =?utf-8?B?S2ZXTVZaR0cvbUhOOUtXTHY0U2c1WlhQTHNDRnphSCtaSWlMNENhVUFpcm8x?=
 =?utf-8?B?ZitpRTdINnlWT215ZXQrUEZFNlRWZjArUnhzaFFFL3hDdUx3TnptUGNGS1Vl?=
 =?utf-8?B?c0NMdW1sYjkzRlUyM2U1KzNSZFpFTXN3bnBzRTY3NFNuTTdEcjNWWUw4bm91?=
 =?utf-8?B?RnZtMDN1WlRkVkEwNGFIQmlIK2lXdytqWFRqODRaRCs4M0dPcm8vaTNadkZq?=
 =?utf-8?B?NmtYWU4zUGtlNGNCa3FNS0xKdTBEcUxIM3JXMk4zc0kxZ3lqaTkrMENVM1Zw?=
 =?utf-8?B?emltcFdndmRLdFR3a2ZIaktsL0pTNStnMkt6ZThXS1l1REZGZ1NzU0V5TlM1?=
 =?utf-8?B?RHF3aVhLMjQyT0gwaVlOQnM1bUc2N2l1M3BkL0tqM05TalJFMEE3aFhicmJa?=
 =?utf-8?B?VVdLeWZsRDh1eFdBbVo3cFNVOGZxN2g0VjV3MWdLbVJ2Vlcrei9Ya3Z3bE5G?=
 =?utf-8?B?YlVyZW13Sk1uWTN0Rms4TlJIaUJUZnd0aGg0aktZSElDaEk0ZUpnb2hrSHJv?=
 =?utf-8?B?TEttdGNDODJzd2YyTHVDemM3T2ZBSXBQVFpOTzNRRWpZaFZDUVB5RHZXUEJV?=
 =?utf-8?B?K3owN2htU25tV1Vpc2xtc21aNmdrM0NFUENzc05ueld0bDJ6TTUxclFmaUFR?=
 =?utf-8?B?VUYwblFsRjdnUkJWUlZoaHgrSW1Jb2ZHbDZkWVozRGlFWGEyNFBwenV1SkRE?=
 =?utf-8?B?b1NRTzFsckd4TXZMc25GZzc5ZU80M3B0ZmVkWEdJa0tKL0ZZM1AvY0xpWFpX?=
 =?utf-8?B?WWI0V0dpSmFMam80SXhTV2RHQUMwYU41MFk1em9leTNPQzJDSjV2N0VSNUJR?=
 =?utf-8?B?MjVNTU9RY1QrbDQ1dU5Xa2VKOFZESXhyUGcxWXl0SXAzNnBNc2dnbmY2RE1F?=
 =?utf-8?B?N0xIbURXU0xqQ295TWhWeVdJeHE5K0t5OTl5M3VIUUFlMzE5N1pLT1dFRnFI?=
 =?utf-8?Q?WSk2O4MhbHRFJOtOcftsnfWqu6m5xj+GRkqKX?=
Content-Type: multipart/alternative;
	boundary="_000_LV3PR11MB855616F87AFDA1643775A3C7A1FA2LV3PR11MB8556namp_"
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
	G2asLOQp/BAEmuJkyoR8f3WlkDFzz7saLSpMtFf2+TUz8kY45QGrUcCr7heV5LQk9rhKPvn7Wgr3CoabzO6Zk8P3ZLbcdavkfU6UQnW+uwzqJHLRPaptV+g1l7Pp/bICF6oM70Up+CHOZD1dy7Au/8hqsTc2N/VaGZeBtjx4VnfDGu6BEkpq4W+ope0kG5a2VvfmHAAqjqsoQgJjM+NyBs93DzvRzRNRDpjlkmxgHDw58KIC+V9I+b0u1KC42kqSXtSr6csDAxzQAs3LaPVPFkWhqWYYHIEzyeajNjmv9o1F1vWu0BrKGfk5pgNhhHXZUGSFNJTCTCHQ7n00W2hUyg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95ecae1-2d04-4154-7ee3-08dee08211a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 01:57:17.9438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WMLGhljJ5f3ig2lWmtRHQvyAdF2iY/h9m5MabLuadzQ6NOOCFjOc+fv1DTDWnrF+Pai4v7J5Cp1jZO74jmCoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7095
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com

--_000_LV3PR11MB855616F87AFDA1643775A3C7A1FA2LV3PR11MB8556namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QXBvbG9naWVzLCBQYXRyaWNrIGFuZCBldmVyeW9uZS4gVGhhdCB3YXMgdW5pbnRlbnRpb25hbOKA
lEnigJl2ZSBhZGRyZXNzZWQgdGhlIGlzc3VlLg0KDQpUaGFua3MsDQpUcmkNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFBhdHJpY2sgV2lsbGlhbXMgPHBhdHJpY2tA
c3R3Y3gueHl6Pg0KU2VudDogU3VuZGF5LCBKdWx5IDEyLCAyMDI2IDU6NTUgUE0NClRvOiBUcmkg
VHJ1b25nICh0dHJ1b25nKSA8dHRydW9uZ0BjaXNjby5jb20+DQpDYzogc3JpZGV2cmFAaW4uaWJt
LmNvbSA8c3JpZGV2cmFAaW4uaWJtLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPjsgZ2tlaXNoaW5AZ21haWwuY29tIDxna2Vpc2hpbkBnbWFp
bC5jb20+OyBUcmkgVHJ1b25nICh0dHJ1b25nKSA8dHRydW9uZ0BjaXNjby5jb20+DQpTdWJqZWN0
OiBSZTogW2JtYy1yZWRmaXNoLXZhbGlkYXRpb25dW0ZBSUxdIHJlYWQtb25seSAxNzIuMTkuMjIx
LjQ5IDIwMjYtMDctMTItMTU1MDE4DQoNCkxldOKAmXMgbm90IHNlbmQgYXV0b21hdGVkIGZhaWx1
cmUgcmVwb3J0cyB0byB0aGUgbWFpbGluZyBsaXN0IHBsZWFzZS4NCg0K4oCUDQpQYXRyaWNrIFdp
bGxpYW1zDQpwYXRyaWNrQHN0d2N4Lnh5eg0KDQo+IE9uIEp1bCAxMiwgMjAyNiwgYXQgNjo1OeKA
r1BNLCBUcmkgVHJ1b25nIDx0dHJ1b25nQGNpc2NvLmNvbT4gd3JvdGU6DQo+DQo+IO+7v2JtYy1y
ZWRmaXNoLXZhbGlkYXRpb24gcmVsZWFzZSByZWdyZXNzaW9uIHJlcG9ydA0KPiA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+DQo+IEhvc3Q6ICAgICAgICBz
amMtYWRzLTY5Mg0KPiBVc2VyOiAgICAgICAgdHRydW9uZw0KPiBUaW1lIChVVEMpOiAgMjAyNi0w
Ny0xMiAyMjo1ODowNSBVVEMNCj4gT3ZlcmFsbDogICAgIEZBSUwNCj4gUmVzdWx0cyBkaXI6IC9u
b2JhY2t1cC90dHJ1b25nL3JlZ3Jlc3Npb24vcmVkZmlzaC12YWxpZGF0aW9uLXJlc3VsdHMvcmVs
ZWFzZS1yZWFkb25seS0yMDI2LTA3LTEyLTE1NTAxOA0KPg0KPiBQaGFzZSBzdW1tYXJ5Og0KPiAg
YXBpLXN1cmZhY2UgICAgICAgICAgICAgICAgICBGQUlMIChleGl0PTEpDQo+ICBmdWxsLXN0YWNr
LXJlYWQtb25seSAgICAgICAgIEZBSUwgKGV4aXQ9MSkNCj4gIGNoYXNzaXMtQ0IgICAgICAgICAg
ICAgICAgICAgRkFJTCAoZXhpdD0xKQ0KPiAgY2hhc3Npcy1DT01lICAgICAgICAgICAgICAgICBG
QUlMIChleGl0PTEpDQo+ICBjaGFzc2lzLURDU0NNICAgICAgICAgICAgICAgIEZBSUwgKGV4aXQ9
MSkNCj4gIGNoYXNzaXMtUERCICAgICAgICAgICAgICAgICAgRkFJTCAoZXhpdD0xKQ0KPiAgY2hh
c3Npcy1QaW5uYWNsZSAgICAgICAgICAgICBGQUlMIChleGl0PTEpDQo+ICBjaGFzc2lzLVNCICAg
ICAgICAgICAgICAgICAgIEZBSUwgKGV4aXQ9MSkNCj4NCj4NCg0K

--_000_LV3PR11MB855616F87AFDA1643775A3C7A1FA2LV3PR11MB8556namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpBcG9sb2dpZXMsIFBhdHJpY2sgYW5kIGV2ZXJ5
b25lLiBUaGF0IHdhcyB1bmludGVudGlvbmFs4oCUSeKAmXZlIGFkZHJlc3NlZCB0aGUgaXNzdWUu
PC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZv
bnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNl
LCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6
IHJnYigwLCAwLCAwKTsiPg0KVGhhbmtzLDwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJv
b2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3Nf
TVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClRyaSZuYnNwOzwvZGl2Pg0KPGRpdiBjbGFz
cz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVk
ZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2
Pg0KPGRpdiBpZD0iYXBwZW5kb25zZW5kIj48L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxheTppbmxp
bmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPg0KPGRpdiBpZD0iZGl2UnBseUZ3ZE1z
ZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIHN0eWxlPSJmb250
LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBQYXRyaWNrIFdpbGxpYW1z
ICZsdDtwYXRyaWNrQHN0d2N4Lnh5eiZndDs8YnI+DQo8Yj5TZW50OjwvYj4gU3VuZGF5LCBKdWx5
IDEyLCAyMDI2IDU6NTUgUE08YnI+DQo8Yj5Ubzo8L2I+IFRyaSBUcnVvbmcgKHR0cnVvbmcpICZs
dDt0dHJ1b25nQGNpc2NvLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IHNyaWRldnJhQGluLmlibS5j
b20gJmx0O3NyaWRldnJhQGluLmlibS5jb20mZ3Q7OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcg
Jmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs7IGdrZWlzaGluQGdtYWlsLmNvbSAmbHQ7
Z2tlaXNoaW5AZ21haWwuY29tJmd0OzsgVHJpIFRydW9uZyAodHRydW9uZykgJmx0O3R0cnVvbmdA
Y2lzY28uY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW2JtYy1yZWRmaXNoLXZhbGlk
YXRpb25dW0ZBSUxdIHJlYWQtb25seSAxNzIuMTkuMjIxLjQ5IDIwMjYtMDctMTItMTU1MDE4PC9m
b250Pg0KPGRpdj4mbmJzcDs8L2Rpdj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iQm9keUZyYWdtZW50
Ij48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4NCjxkaXYgY2xh
c3M9IlBsYWluVGV4dCI+TGV04oCZcyBub3Qgc2VuZCBhdXRvbWF0ZWQgZmFpbHVyZSByZXBvcnRz
IHRvIHRoZSBtYWlsaW5nIGxpc3QgcGxlYXNlLg0KPGJyPg0KPGJyPg0K4oCUPGJyPg0KUGF0cmlj
ayBXaWxsaWFtczxicj4NCnBhdHJpY2tAc3R3Y3gueHl6PGJyPg0KPGJyPg0KJmd0OyBPbiBKdWwg
MTIsIDIwMjYsIGF0IDY6NTnigK9QTSwgVHJpIFRydW9uZyAmbHQ7dHRydW9uZ0BjaXNjby5jb20m
Z3Q7IHdyb3RlOjxicj4NCiZndDsgPGJyPg0KJmd0OyDvu79ibWMtcmVkZmlzaC12YWxpZGF0aW9u
IHJlbGVhc2UgcmVncmVzc2lvbiByZXBvcnQ8YnI+DQomZ3Q7ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+DQomZ3Q7IDxicj4NCiZndDsgSG9zdDombmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc2pjLWFkcy02OTI8YnI+DQom
Z3Q7IFVzZXI6Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHR0cnVv
bmc8YnI+DQomZ3Q7IFRpbWUgKFVUQyk6Jm5ic3A7IDIwMjYtMDctMTIgMjI6NTg6MDUgVVRDPGJy
Pg0KJmd0OyBPdmVyYWxsOiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBGQUlMPGJyPg0KJmd0OyBS
ZXN1bHRzIGRpcjogL25vYmFja3VwL3R0cnVvbmcvcmVncmVzc2lvbi9yZWRmaXNoLXZhbGlkYXRp
b24tcmVzdWx0cy9yZWxlYXNlLXJlYWRvbmx5LTIwMjYtMDctMTItMTU1MDE4PGJyPg0KJmd0OyA8
YnI+DQomZ3Q7IFBoYXNlIHN1bW1hcnk6PGJyPg0KJmd0OyZuYnNwOyBhcGktc3VyZmFjZSZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBGQUlMIChleGl0PTEpPGJy
Pg0KJmd0OyZuYnNwOyBmdWxsLXN0YWNrLXJlYWQtb25seSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBGQUlMIChleGl0PTEpPGJyPg0KJmd0OyZuYnNwOyBj
aGFzc2lzLUNCJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IEZBSUwgKGV4aXQ9MSk8YnI+DQomZ3Q7Jm5ic3A7IGNoYXNzaXMtQ09NZSZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBGQUlMIChleGl0PTEpPGJyPg0KJmd0OyZuYnNw
OyBjaGFzc2lzLURDU0NNJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEZBSUwgKGV4
aXQ9MSk8YnI+DQomZ3Q7Jm5ic3A7IGNoYXNzaXMtUERCJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEZBSUwgKGV4aXQ9MSk8YnI+DQomZ3Q7Jm5ic3A7IGNoYXNz
aXMtUGlubmFjbGUmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgRkFJTCAoZXhpdD0xKTxicj4NCiZndDsmbmJzcDsg
Y2hhc3Npcy1TQiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBGQUlMIChleGl0PTEpPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCjxicj4NCjwvZGl2
Pg0KPC9zcGFuPjwvZm9udD48L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_LV3PR11MB855616F87AFDA1643775A3C7A1FA2LV3PR11MB8556namp_--

