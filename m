Return-Path: <openbmc+bounces-2668-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC008C9832A
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 07:34:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hv8zy5bHsz30Wd;
	Tue, 29 Sep 2026 17:33:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790667214;
	cv=pass; b=YFLE11MLnKsXmI1oFehqHx7Jn1GJ9wrRSsFqKV4RK4jOo5GIaLWtkBQGp6k2YEtnhGnlmXn8xzjzhN3kGOV5BdnxC400mkz0MfdqNk/tJCY3qZ43jtAq4mkusAeO0E5PVewFyVXitSNB2R5P8llNx57oi5yxFnhMPnmuVeJ/EPY8KJkeSXf+Itk1npikF3wacf3zqvMC3VvV0dPnVwLBuYFuijqvffsElDvDNPYLlkBbwfEOBjA+bVPNflNGsgQOEdou0YNpM20Ut5MFhKzK2dKgHHPvb2A8UnpZlGX+HOBJCvQAeE84oHU0jXU9hDa15pezWYC8c70Xj3+U4KJ4OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790667214; c=relaxed/relaxed;
	bh=3HmjbnJDL+auNsb8kPW45F6lgd2bzTG6D8rt6SYXKeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DSNyrAaUZuK1GKjPp+Thqc7CnetApQs5+mM8Yz28JT9diYeQD5xDShQc5dEya0kexg9Szw8Ba9Nn7xKva/pSdyNYq9TelUoE8QkcEQe0lDeKtKd+2XyqrJWYHp2djYbvKfxnfBlBJc1HT8TMPd4+4QQ6nFZrbDOatPBhjOF38VYJ4aZvKOQ9SF6A7n6/HMRrY8DDYUSYlQy4jQX1uuDNkHZcq+Ds3y/zPJCH5opGt8CMrE/7ELx8v1OcRDTASKl8Jwu8f7Jy958zwosXecwgLH5IrVS6bu/cfHR6/o5XPCysqUd1x5GYtm4Cxok/zZRFi0w2I7eVkBnivDfhO5YeJg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=ndxqxNW3; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=bounces+srs=sj1uc=hv@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=ndxqxNW3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amdcloud.onmicrosoft.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=bounces+srs=sj1uc=hv@amdcloud.onmicrosoft.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hv8zx6sVPz2xbQ
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 17:33:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdSOyM+z3YeZwwRsQanbF6kpwE/xflDmIyd0OOy8TPZkMkD8p1YjgC+Oo4SQHnUxBNLfaFVyI0Oil6FsgAY3KYYvzIof5ooa+jyVxrznUkzz7FDO3ItZTEm03pM6QpeYCctP5jU75TIRoLNeKs5VK9kTKR1y+bz3w0+orrytEE0p+NdII3EoF1ODhKuEvRQtaCu+nx+qSQbtuMqLSQkah6mBSdwr4OIxgn0YwnEohRoThXwXjm3uOKvq1IcOn4VkeaKBMeoEMSe8AdAp5s3/aNp/VPdY/OBProWKTN6gM4WSUjCAsxbXOQJzJ9YL9jiHqiEDI/BFswVoCuBgu63dPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HmjbnJDL+auNsb8kPW45F6lgd2bzTG6D8rt6SYXKeY=;
 b=T8SQxo4zmR8J4jKH3D9KZCnKGzbKn94Z7GKw0jhgtvtNkDboNIXNguHRgS6oqmNzqKMeLy+SDp5ElO/TFLXjSDaosyFkE8ncHae3017ar4NspzMRITFExfnM7bcoEj4LYzGzjCB+YrISjgMuJa03aWZSUKBxEVRmQo0mvN63b+PnmLaDLWRJuSoweTTQ9k8m6X/QrxpZ5ObB+bnTCkXRKNiPov38oXvqh35lDLv4CLyidverVoqjp0JbIWM6Cf7AiV4qADMqT9oWWDvFCr8RnbvOMuRqG6CYUodkLP7wIDQMiSOPIZ+WGgRlBqv9O7rsHeDPqkVE0sEst/PhxOcjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HmjbnJDL+auNsb8kPW45F6lgd2bzTG6D8rt6SYXKeY=;
 b=ndxqxNW3qgl6fmN2wC3ir8j0BHCvMNpVsefJkMTQ2x35jYexxTCnTjJvTb+AOTKZsTFol5fxqUewWDxB2mg0MG4fsv8gtUPUKz3kwKhHRulT9UROAHziRBmMeN1aFv5vEzZHUnQRGqwpmtL2kj7pdr3ib6oFsqGj2rJpyZX2osgyUT6/4KzkdfBPSB+SXpv7OmOPUzQFbBx8ew3gI7lspF8ZZ4PYmfVBkXmqXs0mqdU41UIxrv8Fn5/1MKO6HuG+Ru19SzyR6HvPqjEmwYxDQIX1RvNO0+EmElGBgtHGLcAzPOuMN0wdxR2gydtP8Of1XwsvKEEUQU6XxALe8pTVCQ==
Received: from BN1PR12CA0019.namprd12.prod.outlook.com (2603:10b6:408:e1::24)
 by PH8PR12MB7328.namprd12.prod.outlook.com (2603:10b6:510:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 07:33:09 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::ab) by BN1PR12CA0019.outlook.office365.com
 (2603:10b6:408:e1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 07:33:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 07:33:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:33:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:33:06 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 02:33:05 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 29 Sep 2026 15:29:46 +0800
Subject: [PATCH linux dev-6.18 2/2] hwmon: (pmbus/isl68137) Add Renesas
 RAA229639 and RAA229640
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260929-openbmc-add-raa229639-and-raa229640-v1-2-de693c0a6ecb@gmail.com>
References: <20260929-openbmc-add-raa229639-and-raa229640-v1-0-de693c0a6ecb@gmail.com>
In-Reply-To: <20260929-openbmc-add-raa229639-and-raa229640-v1-0-de693c0a6ecb@gmail.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, Colin Huang <colin.huang2@amd.com>, Colin Huang
	<u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790667009; l=1735;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=vKksKmdE3bdtuvtAedZQ225WDikndsve8eqVgbxrlfM=;
 b=P+yFgjCcXT0OS00dOUyH/7RRy/nIX9vEs98vrQR+zleyvygZkkIS7bxFEiB1Pu6ntbi7IoRfd
 bCLkXzmy8/AA8Q+6Pj35MpVEl12ZeFIZvYqFmWoxvswtSrQic6QKjZ/
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|PH8PR12MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 544a76da-1fca-4d7c-9783-08df1dfbe7bc
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35950700016|61400799027|48200799018|82310400026|7093399015|376014|13003099007|11063799006|10067099003|56012099006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	D2oABtHON5YGzibrQQ8W/vu6rFAwv1RGI5JOIoqXZ2rXEMjAvUp8/E8U/id/uTvfTB8e/0gGYnZOWQTV0tPQvl8cf91w0zM1FW9s0m46ha8DgYwosZFGwNagh2pneXfLeJbOLdOfNCkY0+G/L91znDXAq/mXhQjQEiCFlFRpr59FyNbtfC2/9lT1SPCRIQqlZKD/rqqEm7OYTSfeZmcU0VBAPPXtpzQfZ8Z6X1tGo5IHd8iutHeuBbgB5cVU8PA4jvBjh9w/Nb/EinIbfEeNOYrBNCiVXK7hBk1fMBrnq/GC4fYsZKPX2K6+Hb6E1KNpHMJicyvWLxdMNrnocxJwv9GJoSevDGGaruFyoRaB8F15CaczHcxmRWROu7ifO/2IT9rSJI2KF/hm6Wr3fs5s0l6jgJkb4OFgGVGdJQcLFs+iJ8Yakko/0QiyLn8cn70AeFdTj9haKD+e84VtZM+9oESRgk9Dusp14yLdYjUoAMYtBMe6bqhCOS+4AaysJAJ/IVtpYPk36q0LvCsj8pa380KIKdd3B21O+lYv5hpgSRRlgxNk7EfNNuw3SNUq5x6+lF5Q/54G/S4mDh2fvGmOqJ3H8W7aW3eFkwMX/4S+ZVccLmt1tmq4GpY2pnd5Bv8lV927ODjKg33NUdXyE84z8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(61400799027)(48200799018)(82310400026)(7093399015)(376014)(13003099007)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8ZelrYZ50hONQK/GcNA8NJHCFE0uw5D67F9u0bfYhJtNu5ARiNbz3izZQyJA81MdnTO8M5A5XLrGNS4OO0h0dlFt5eoaE6g4COtk1AcsUWKlGb8jvxoajqUG2rR0T/Iksv/D/berZ5b24sGAMLx/0jlRHCgX2PzKg4OzD1ElzVg2dnkIF2KQL9470U9dkg7e32pL3Bvfc7NgQcQc3AGBJ6xf+6FD8CRTqdFZgPk9b3S8pH8fDyiZ174Rn+keFDFxaoZp72k+W5kTTYLPpULcpkzqu2vC88UXM8Bq3gX7T+i4NSicKd++A7WL4bQ8d7I7LqNtDOK2FHQCStG+h1Rf8QnGHJuG/9kmG6XbsxkDOqLLgTdsLzCyAcNzFvgiOtssIq3+yDVmyWBZn3VrDLNgOw/XIOtGdYe9clh+tnL/0ZPYLQgTd0Ckm51WFmQrRdpf
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 07:33:07.1404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 544a76da-1fca-4d7c-9783-08df1dfbe7bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7328

Add support for the Renesas RAA229639 and RAA229640 PMBus
voltage regulator devices.

Both devices are supported by the existing raa_dmpvr2_2rail_nontc
driver variant, so no functional changes are required beyond
adding the corresponding device IDs and OF match entries.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Link: https://patch.msgid.link/20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 4d647a045631ba2344ab43f87fc59cfb83e832f1)
---
 drivers/hwmon/pmbus/isl68137.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index ab54184b4878..74a7ddf8aaff 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -66,6 +66,8 @@ enum chips {
 	raa229001,
 	raa229004,
 	raa229621,
+	raa229639,
+	raa229640,
 };
 
 enum variants {
@@ -488,6 +490,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
 	{"raa229621", raa_dmpvr2_2rail},
+	{"raa229639", raa_dmpvr2_2rail_nontc},
+	{"raa229640", raa_dmpvr2_2rail_nontc},
 	{}
 };
 
@@ -538,6 +542,8 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
+	{ .compatible = "renesas,raa229639", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa229640", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ },
 };
 

-- 
2.34.1


