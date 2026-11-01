Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D300606A324
	for <openbmc@archiver.kernel.org>; Sun,  1 Nov 2026 22:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=Kol6ouT8
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jHqqH6v0gz30Tm;
	Mon, 02 Nov 2026 09:52:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793541698;
	cv=pass; b=LckBpo/vn9OR8AMKhCwVru++gusG2QH6VctsLxni445hGBo3WkIsoUtbkw34G22PTjz7phbOj2GT9gENSeccSuWDBvtlmxK2cc2l0netTUjKg8DmZO7Sh9Id3gr8o/h5EfhaMwRjMMUWb6wNIo5CDF7AibaMWej/GymFoMh34KeW8TTzMw/PTMSLAxSY4eYqxM690+LmE65uYSJ7t0ff0z+ug3CXDvEuLZ74gVbOCkuuHJO27T18iRvDiXF1xCjLxlDm362sm1ZudW2Pt238QILFYotB4uGzv28vXls33RbvlC8nzhF7hdHzPHs5ot8mnQMSXsjbY0u6S1RWq7M/gw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793541698; c=relaxed/relaxed;
	bh=xcb2gp1L6+TXzpJ5rLnNwKnJKKmroImNZjSpB/0Kn3E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c51VvdItY3cpARuYIaAey64kh5zjTMB++WBFdmv8eBnCMa2viZ3VxcxagyoBcjWVVM9hrZdfo02cBvGdLuTEeVvd+meWGNxE2lPHZHNnif5Klls+zTkXgfJdJJsAtMgpHHu1GYuLnIZAhn0FHNHAb3/ZOEQ8fC0rtL/P/PVtsTOycTdlNlHTcnOuWRfAGtxewtkBLJoy2H+G1/qramuWeOxksHe5GIUOhSRY9nh9nkg1fbIIg3ic117Dfv4mJrVkr+rqlSMr6WJYjum2iib99Lh+zMm8a9dYkHvOyNQ628PicAL+1nWW7ZibFYT64cKa8SmLPQADAGS5LOr8w4FNcw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=Kol6ouT8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=akavi@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=Kol6ouT8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=akavi@axiado.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jHc2P47bYz2xnQ
	for <openbmc@lists.ozlabs.org>; Mon, 02 Nov 2026 01:01:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNDVNKk1bZFEN1eaaYnxIoWUFGs30mlzoTL19N6ZdC70vJMxvB4kY9Cox/TN1PxvD2beQTlGCx820FYbYHsmZK2wh3zLFpAwulKs/QwcvhpNrDKmBVj65361wVXyNcYVAcjV/Da1clCHjP/Kz8WIovhaCakIGXoBRRhHaC4JWvienCZ9p8g26i/THdHXd9MUeBpr8eeA0Pz/F6HrWh0GkuAZOUWGY8MYdWSYbKzH+M3jDtk/sHQK5jz4xXSJpt3ZafqK32qUXJhBuckxJZAfC4MgoF7PGhoapgZ1XYI689nq/z81DU4nc/l7hgJU1Ft3al5VtQktoGhiP+GGAbtiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcb2gp1L6+TXzpJ5rLnNwKnJKKmroImNZjSpB/0Kn3E=;
 b=SPWekhJ6nPBVMPEQ0mchOBF0AAqs9RhmHn0eMVTrOb7jgznHgRtJL4AGI3auUJ14BxqmFyaq8UUGLi8A463xAQ14GFGtpPipaf+NOCvADsjW6vv6OmeY/R6dc0efGGC7zaw5ocGopuXySf2l0HT2WMfcCDauWbxSzXER1J+jXm07U2QT7tIvYsdfcyMqbLa/AFhT9UA1qVEENkMceY9SVjgXlnbfhBKRny8PkTZQ9mci/Mk19xiIzutu48yxI4K+DLLOEYNiYDIrYw3OZv9V0c5NWTUN4Y6Gh3lV0JW+IBrmi6NwZ7SZavQHcEWAtvz4LOvfO4mOXLXW3ndU36inHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcb2gp1L6+TXzpJ5rLnNwKnJKKmroImNZjSpB/0Kn3E=;
 b=Kol6ouT89/XxaxBBOlbliXbGBZz/yo0xe8qD2A6r/qXpmjnd81eKZysDNOv0zWjFDWZQYhk08qawqNV8/zzV+KXNjJW+yy91TRJzoZH92etjQplhNY19tITJN0Y0aTrUhxTwsm1V3sCoBCTfLjbcIDecCaZ4zD6/Jr0haqI/IRvGojEyh7eZTq+dJL6TgwKPlU3bf/uRgBX2f77BcIuiDKKe09MH3mocTsRHxmLaTctl7Eo3qr6clTpQsbptAvVpHkYoOyjSeIEmvkVcbv+gOp7W4SFdI2oUfqgQR9YpDj5MhV0R7Oq+cNhwgZZymOItPkgJSlaewYwsf7Rb9qNeTQ==
Received: from BN0PR04CA0035.namprd04.prod.outlook.com (2603:10b6:408:e8::10)
 by SN4PR18MB997220.namprd18.prod.outlook.com (2603:10b6:806:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sun, 1 Nov
 2026 14:01:07 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::3d) by BN0PR04CA0035.outlook.office365.com
 (2603:10b6:408:e8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Sun, 1
 Nov 2026 14:01:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Sun, 1 Nov 2026 14:01:07 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 9B7584186B53;
	Sun,  1 Nov 2026 06:01:06 -0800 (PST)
From: Akhila Kavi <akavi@axiado.com>
Subject: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the Axiado
 AX3005 IRoT
Date: Sun, 01 Nov 2026 06:00:56 -0800
Message-Id: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlG52oC/yXMQQrCMBCF4auUWTuQxNqFVxEXSTrVEUzCZCqB0
 rsb7eItfh58G1QSpgrXYQOhD1fOqYc9DRCfPj0Iee4NzrjJ9uE7akEVn2rJosiSFX07G3PBxZC
 ZbAxhHh10oAgt3P74DRIpJmoK9+Opa3hR1J8N+/4FQ03ctYgAAAA=
X-Change-ID: 20261026-mctp-transport-irot-ax3005-f0e061cbbd42
To: Sammai Chakravarthy <schakravarthy@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Jeremy Kerr <jk@codeconstruct.com.au>, 
 Matt Johnston <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Akhila Kavi <akavi@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415; i=akavi@axiado.com;
 h=from:subject:message-id; bh=312u2GbQi0XnrgSrP5KavoMB6UwiJosOVhQi4i33WzA=;
 b=owEB7QES/pANAwAKAaZBpzlrM+NgAcsmYgBq50YevSNkvGDan8ttrrtus+AgGq7P3iG/Td0T2
 tcTdb6JbuqJAbMEAAEKAB0WIQQZuAZ2jpLwmauYGXqmQac5azPjYAUCaudGHgAKCRCmQac5azPj
 YGa+DACEaAOU2PNH/YXxMkU4x+tl0xXCcrFVc5sqkOGJDr2JY39A1q1uwSVKpvfvHeH7WaXUW9P
 ic1OSNuxl8XCeZSR6S/Dy4hSzlxB6RI+Iv8qKp0af7t22JxVjabwVur3X8TELm9jIDHbSkGbi7T
 w28th2GiekXCqn5gd2golkp+fbY1s97iihebo+Ary8r9Ph7t1qDc1CYeUzlEd+mCOj2MLf7fMJ+
 F9HcjGycduCXC6ZTiUNfxMoqA7/2kb5zWyF/8kLHn4sw37eBtin2cL3Y/Bb8rmSjsnO2uYEftpq
 xznwEbihCjL51azxrF1pw037LcDZhovzcgO9O9CTeswsRlG7DjZrBok2JXomc1KSeHJCjI+4kdJ
 DDAaXk9g71gKykkrwKtAV4GMXIaiemEw016xpHyNwpCKowqgYubRFoitjGWrglRPvDQc6CsCIiB
 wt7hNT+CmbNHlrT1ehk9tc0/A2u+5WyEJ6Pe3vmdx19cCK3nui2uKfLUkGDPmFxn51r+g=
X-Developer-Key: i=akavi@axiado.com; a=openpgp;
 fpr=19B806768E92F099AB98197AA641A7396B33E360
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|SN4PR18MB997220:EE_
X-MS-Office365-Filtering-Correlation-Id: 75332947-4cc9-447a-734f-08df38209374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700016|23010399003|376014|7416014|1800799024|3023799007|10067099003|18002099003|921020|56012099006|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	NKcCKIstLuuZhegPuOdJAKI7z5ndvaRySbx7Xh3LNd6ujSx3r6LwOLWXMURgUhoPWeiIRTqreHr/fHEa4mlO01pUbbbV0eDISn2LWiIoeIVnpXL9jj6lJwZlbKS/HeoFL8ZxmFYAEsiLDN4gX/CIGzol56w58k6zWTqDCeyICxZkYfR2N44B8y6grZHCpxzE8TIa8IDRzEETf1ysP3meOXdfNQkjBtN5k8wmuq33Ce5b/u/lmnbcwy5Z6y7iFMqzS+ca6lmAFQ2UpEGWA19Blhqud+UcKJzDBSV7MpPnS/vheTeVY6Zs+q3ScXEDtVMRRNQZaWQaf5U6KhMbO34MlHDelnWRkVxRO71iVUhKvOIcfwpLVht7ZEz4r+PEVLUPodw1/n/kGSNdOl3tQX5JbvpM47LN/+7fwIakD7pMVJ71FDILHWkEi64YY/lZYi9pE+A0YCjXRt5x0eZnN0MSGDEiuk687l+4VBOBbLG4rCdpoOja1WVzlAc/5WDF4OzwAcMvxXyxcLExqsVYTc623b8RUZYa7K2dNoWkezd8AluCH1vGhLUGsjsqzNOOgVrhSMBLd3Kad6JHFgwvgeWgpPyDpXV+eEwqkEQCrv8L1gr0i4i/SGifGGr3j2uaGjl/VupyOJh1W2fC+VWLk57UZ/Q5x+1GoWHyvq8V+GMyruQhI9IOcwQduFTFtyt7LOE21/wo4r/3raYLSxQP5VzT/fcJSheYHUzJQ753Aawd1tEByy2HvdIwmRnbz2vPFoX7
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700016)(23010399003)(376014)(7416014)(1800799024)(3023799007)(10067099003)(18002099003)(921020)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	spYJwSuwmTy3kr/xhe8SI5CfLsSTUdGzzuqnz6hC4KfNAN4ZVJLG4FE96gpG/JkV96TvehIRy8eAQXiIdXz/t+i8wjg6KImQK735q58J5BMwK3aBnlxBiz3hBOnkoIyoMb/zUK61VhIupb18KhsykDwSuK+8BtnDVodt+lWbtOFpdiXsJ7iquBVvNg4akAM3x2IZ617imfRUfvbBuokk+sDsOy9/BfMwbHfydl7SbOT1vR4z5mfrIzS9cZOSC2/E4IWF1gXB7vmbR7AJrwqVLOm1FNXD5PlDUUEPYi6XjVb/dHYjZo+B5nuKf1lFrS1Djm8JDPUhg9r33S/PL3dA+EIz5QfclY28xIOTk1vDP+9nJohty9/rKlHJNh8ZozXsSCQ9nmnOZME/pPFNbV2iEyOibUakH94/aQJBQI51gDpuIf+KeuO/s5jJqS+9OsVH
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2026 14:01:07.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75332947-4cc9-447a-734f-08df38209374
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR18MB997220
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
co-processor next to the application processor. Security protocols such
as SPDM and PLDM run between the two over MCTP. This series adds a
transport for that link, so the host side uses ordinary AF_MCTP
sockets.

The link is built from two channels of the AX3005 mailbox controller,
which is already supported (drivers/mailbox/axiado-mailbox.c, in the
base of this series), and a no-map reserved-memory carve-out. The
mailbox carries small doorbell and ACK messages. The packets
themselves go through two windows in the carve-out, one per direction,
which the IRoT firmware allocates and reports at probe time. Each
direction has one packet in flight, and every packet is acknowledged
with a counter.

Patch 1 adds the devicetree binding and a MAINTAINERS entry.
Patch 2 adds the driver.

This is v1; there are no earlier revisions.

To: Sammai Chakravarthy <schakravarthy@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
To: Karthikeyan Mitran <kmitran@axiado.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org

Signed-off-by: Akhila Kavi <akavi@axiado.com>
---
Akhila Kavi (2):
      dt-bindings: net: Add Axiado AX3005 IRoT MCTP transport
      net: mctp: Add Axiado AX3005 IRoT MCTP transport driver

 .../bindings/net/axiado,ax3005-mctp-irot.yaml      |   60 ++
 MAINTAINERS                                        |    9 +
 drivers/net/mctp/Kconfig                           |   17 +
 drivers/net/mctp/Makefile                          |    1 +
 drivers/net/mctp/axiado-mctp-irot.c                | 1089 ++++++++++++++++++++
 5 files changed, 1176 insertions(+)
---
base-commit: aeb76c8f39892c095cf9abcdc90e11627d131935
change-id: 20261026-mctp-transport-irot-ax3005-f0e061cbbd42

Best regards,
--  
Akhila Kavi <akavi@axiado.com>


