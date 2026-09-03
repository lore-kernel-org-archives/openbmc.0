Return-Path: <openbmc+bounces-2547-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ECFC61DD3
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 23:48:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbbrC0nYgz2yv4;
	Fri, 04 Sep 2026 09:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::725" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788443425;
	cv=pass; b=nrGRAjJfuOhJUG21sJWt1wuxlFAqZjACVJ9+BvITjkmK3X4M5ADoKI7P4BzjH5/tdszipILOpOfEswkX/qR61mbwFkymKdsvBfIWPmaV0rEGw7alzKRDzx0QISNAEtD3A1aytRSX7scVzXbDpXmMbnhHOuVA/YOOOeuipZKENheFVuYi19onbHS2txE/cSQhz+s3tD4OPGWOYm4JWFT3r1Q17LRk7ihvB+vGEHxsTODOGTIXBgHdzsckLtSp+h1YrqQ9wlTpYw91VhRy9QZ10ChKnoawacfB4ZFpxgFWEo7qp0oyJJogUjvmW/Kq5RsaLsFt1/0qSfG0xhEMkitS8w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788443425; c=relaxed/relaxed;
	bh=rbSQynd2eVRtGbUq+7pHmhfyZe3wjneG+h20hqZ6PDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DtmXIJZOZKTwvFf1RqRg7qhxYO+YEJOs5KJUHbfEJmIJtGwV996KqeushTvnHA14IEEMdD56xtn8JGHvKBGQwNQL0QF/NZgmK/AiKsFyU0iXxOIuCt/4dHmBeVBZzKDxNFvr3tAj1YEx103gdA8fDNKJUYV5qGtZlnT3v6K++9hx6zwDtsuqrQwSR7HPTIAkqn2kcxlvZvZnEfXe28crE7hlbYJlFNUkr3uK2r/vfpzkJnrwGQDmOqKsd/lzI6wF0XDUZh4Xj4D5pho8jYwfmqRj2AGJFW3K02r8M/svpC1g8IcdTF7sB2jtRF6ycQ5pIT7BtcFvxWaZ3ecso3bD3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4440:2::725; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4440:2::725; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=changhuang.liang@starfivetech.com; receiver=lists.ozlabs.org)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on20725.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbLZn1jPtz2xHK
	for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2026 23:50:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKP9L6+00zVK4QN2trqF794W+8+hX0oes5QkH6QmVgFszPAOZ1J+p337Fpvc+i6qdmvOktVMNdRzyjjkgsK5ZxbYknWJv1LM7ie8Yrd0RxALL/180e7jk+Y2hyNE/3vc8iIzxdT0aSTCHboqR53/fzm/slHfrUiLC6GrNQh4QRk7JEZ4nNR3YhwoquM+iG2aLEojO/D419goL+0QrGOrxSoSKHsIQbBvChpJs6pG9S2vDDxvwbP58SJCMu4jrwXgcsPcncS0Eu+iR8ILjEvpR2NbwosenX+s3KMuoAmMKV/Wu6HIuXQs32x5nfP3hv5bjCxGzGokywGo7SWMrXg6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbSQynd2eVRtGbUq+7pHmhfyZe3wjneG+h20hqZ6PDw=;
 b=L0YlkXMS6PfSN5QrJoG8WxngQlKOIZOasJ5EpN06IOMOsDWXa4zEoOfL+c2sRqhPMbOqowVSNR4l605tz6oDIdokWvn8dNDu568kP6AjJ+LeL8cE6vCNWAK2zGgiKCfqTqbsp6Ycdw9r4wN4op7VV9hjMDmD64jhND7aPvhcaoUJ4pk2ON5OU572dFFv9uEBICLXMS5pgABV5bpm+W5Xj0ZvrJCUc+PfLRTJcfegNBLIaJFSJGUJklYhLNqt3GuRLydwIW2q58hYWA4NW7qDgE5/5L+X6IG6n/+NY2Kadg6Fr/5Zo87sWgeWWaUagHmf5mV+Co9DOSALl/eqGUSzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn (10.2.1.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.12; Thu, 3 Sep 2026 13:35:29 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 13:35:29 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 4/6] peci: cpu: Add Intel Granite Rapids support
Date: Thu,  3 Sep 2026 06:34:06 -0700
Message-Id: <20260903133408.110847-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::29) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
X-MS-Office365-Filtering-Correlation-Id: 245b9309-1d46-4a09-8740-08df09c0386d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|52116014|376014|22082099003|38350700014|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	q41QtsaXS544EAb3MZykT6lwBoH4D/kOlvzlTGrFtWy5sCKsl+g3nCBbOLt03KN60fgVhBG7rKjN2RcPO9H7a2ouxuaDP2e1/gfYSpnZEf2yQ5iPImZ7SWjTnppW9leXyd3WDmpATt8lGZMJy5NfQtpCe38eVpA64H2ZaVh5Gc7rWw5LXRZrNEwr6PCEoEpuAvmEPAjzH+aEjS3kxeaR6fn+csFgx34p+pkyqBRo1L6qrkx0Wq//EeVJi4pmEz8xuDfvcRHW0aZ2CFi0jzH5juqOnT5lEORYFUiZjWPxkAze2s5s4n46Jjv4ncHT7ZTSxeLeRd5Mqpvki02PG5hmhcIh4GbRoUGk8gIx2bUM9j3bVf0mb9zhn51hOrQC2CsWve3gH+xqRMMmk1DTZcvWquhA9RQr7GT06N/OHqLahrGazPSecQfEJ5x4GZOxs0iTKj0V8B8LZzoqmKvKCzJ30w7GbC9ft83uwet5gZP0wVgSXt4jhbwxHZ3ngzR76Jg2Rs6MCeJjT93dWuWV+D9Fsob0OgBtD1qvwPPHuzn6T4psk0W/w1lxqJQbSxQBlh2j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(52116014)(376014)(22082099003)(38350700014)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qBBiBANJoEl/ZZMOayFK6ZMTBHUYmQZ9ZeaL1WnolBQL31gLQUrrZ9e7T3e5?=
 =?us-ascii?Q?qvWX5E4hqgSKc+XNw1jroOEKs3csFDHp7RKiGsnKI5Pb54jzLOWLWCg3ql3H?=
 =?us-ascii?Q?e0mFQJKTsJLg6lhAU9yQWsS3sW9HOmc4cXix8OZBwyhQuyjarmGhRDpz7MrM?=
 =?us-ascii?Q?36HSx66Q17XwJxdlSvJ16bwKphXQTvrC3fi4LdxH4zS2EqCEReubfMoH0w91?=
 =?us-ascii?Q?p+yXll0NmHsJRvrL0tvuySnHE6k+zrJTSN/Do8G+VY9lFCIZf7m7OXoqQAwV?=
 =?us-ascii?Q?Qu0T+n311NiAXrf+ZMg2XsWs5Igsw1BU+VdHXUjoGfM7HpfGQJ8/k2GZOLYB?=
 =?us-ascii?Q?t7r0JOIjXBiw9ec94p8SR80Vhf3ClUEF+Cadyq70/J/UgZ1LmowRaFMsFVl4?=
 =?us-ascii?Q?zSde87OUCIGG+vLgxzX1HtAAM3vaIwBJgrHExaAE2BDulanaxOHiAXW4q09h?=
 =?us-ascii?Q?qSJPg65QjyJ7y1pxkD8o5wL4Szo+1k+Fz/IPcBhNpD/6+xqvYJbJiPInx0P1?=
 =?us-ascii?Q?N/NnnvUMYwnNwfFkNY/kVxZM8U2PjDKeP9GwpxstdN6d+rVpLUiAUUbV2zuD?=
 =?us-ascii?Q?WLotfT7edJYczsW0OgLrXSSA64+CVk6IXxwOY5cV3tO7gHmtP2SqBobXef/V?=
 =?us-ascii?Q?FHWjgWenV6adDBh46lVFuItdPxQD1uAphsQ4hxrJDAMNN/qwY4nqgcOW0q/q?=
 =?us-ascii?Q?cVICkqJlM4IPLjxcSySXWnjH2rCOBMp2ScdWyTzSMlTUYautigBtiFJzKbBq?=
 =?us-ascii?Q?PmrO9TpfnJxBglGfSPoZJQh96RLukIsUsBWn6qW2sELaCBqPtF8pLfE7ErsR?=
 =?us-ascii?Q?Oaka5wFc685F7AeW/nQFkf0dlwK4W2hj7xrvQqLUvu5jvcrnfEgA+Iuec7Cs?=
 =?us-ascii?Q?IM5l/0E5EY4BEcF/k9J6T2FQdkbrFnrfSt/WQRcmenL5tNyI1ave8GOXOVc2?=
 =?us-ascii?Q?6AmOd57tFuomO1uNRP7IDS/ont1dsBjpsqBOulGiCBJfGIcJbgLR1rsmTs/L?=
 =?us-ascii?Q?A6j51HZdlgrRwH+wbnTHVOMeg5t3Pft19WRN0WCwo/KBSyhuoQgP8i6vcv66?=
 =?us-ascii?Q?gflR5O3xcbiP0At8snsUC0szWzVw1OHgNEHdl0wZ9O2Rt1StwlGubuBT/MlK?=
 =?us-ascii?Q?aG0hJaPJuUOuRtLfIN+1eVyrl3U6M2Djx9nHDiy+jQ8aYmwv6N4kFojXCqpK?=
 =?us-ascii?Q?W0bTmF7+Ue1OlXGm1hBpop/mYEIDX13NDtKxIJ9tRB50OEFvR9WF8YkCz65u?=
 =?us-ascii?Q?onxeQkDkBRw1GxbEybQ7Woezhm8xorEig4bhCs2oLDvFUKlZt7kaNtPH1ie0?=
 =?us-ascii?Q?Pn+hNxYDr+IPOjgC/tsJNT3CRrDwWbiCYLC++SB+f7lNy4UFnUobmT8vlHq4?=
 =?us-ascii?Q?tkl+Jyw6RQ4KxKXjWl2ysf9ymuTzNQmgWOqRD8zK3o17Rz203LvAa/9/5WDH?=
 =?us-ascii?Q?RKjpn90yn9GL4FeIYeVKkQ/cdg55yF8qFLG5EM1MnJoPZ2ofJeN2W8IltSFS?=
 =?us-ascii?Q?9VlRRQ0aR+svxJwDoQ0voE0yfl+BaS0qHyE8qYMNNiQvjbjWx/+xpzCFLhED?=
 =?us-ascii?Q?I+xpo3hy+hUXkxEtDSyUXJivaWjs1nprQu4LBg+6J027327lUCgA9IL1LdwQ?=
 =?us-ascii?Q?6aJzSSHwy9hR3Wis7LiCP8BdAqw1dK3/TUYOTdIEcaIkS1tw1QbXcmaaYj9v?=
 =?us-ascii?Q?qs8b1bwy3scuFIYIfs4wM98a7Wq/yrClRl2PUiRcDXri+xQ0CgHki0pFsMvp?=
 =?us-ascii?Q?LKBN9h2wsB1HE7hE9VrXSvbVmn5TVSp7d8mpQapixazaGKbwz7qf?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245b9309-1d46-4a09-8740-08df09c0386d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:35:29.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daHcGYwNlKuEw9PWI/yAf0ykiZp1+ajp7XynswnuwiQIuBAVE/tF/AVeto7fUETX/O9VcmDjfveaplmiB3tAI1tnzHDOVwkS9AGeXp71QUFd+Ax8bksfuW7BReWuJnXj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

Add support for detection of Intel Granite Rapids processor based on
CPU model.

Granite Rapids processors with the model set to INTEL_GRANITERAPIDS_X.
The data field for this entry is "gnr".

Tested on JHB100 BMC with Intel Granite Rapids processors.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/peci/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index c9fc06c9ff53..abf004637949 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -325,6 +325,10 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
 		.data  = "emr",
 	},
+	{ /* Granite Rapids */
+		.x86_vfm = INTEL_GRANITERAPIDS_X,
+		.data	= "gnr",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);
-- 
2.25.1


