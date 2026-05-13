Return-Path: <openbmc+bounces-1922-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44FECD37AC
	for <openbmc@archiver.kernel.org>; Wed, 13 May 2026 23:43:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gG94Z2vT7z2yFd;
	Thu, 14 May 2026 09:42:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778689914;
	cv=none; b=DqJBEDVDvHjHZvaPmI3k8MFfLr4xQZ9VuBvUqByS0bzA5Ao290tAZ4tpElLhHAVP9HoxlGDMXEqk1figKd7ZBx65hBSlC1zq12vcCB8yu6YqZcXMpoVAtNFdOP2dnI0g1Bfeg4g/dY/81xWnZy7YSkOSN3MGAfaGhYX9VrWQBCmdpD3xsfF1Wl/S2/fXas1BOS4ZlCJs48DJGLRycA7Gw+A/aQu/A2Cht9p1aKF+slCysxYJLSlfm7eb1qU1FkcaxgS9OXKJwjdwwk/JVWkQdYBKVuHAz4SnkO9jlIAPtpcFq4e/BCOXrpDnreqfpd1k64L9eBKUggW+4W/hZ3QmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778689914; c=relaxed/relaxed;
	bh=f9hnG+Q/MrYGKRftwGvdBxXRGFmAraFgEeSCELv07SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLfNqlvGVHRb/EPfc3hC2LO9BKIJm25BchnLLxoHU/HEkZURdxwVNKvC6k0AXkOb67fbQEswWCh1jRuY32jdSY++YhCrdu7muAKF/Odd9PIKX7oJbGZeE50XLPdEC2Fxr5063eiVRQ0ACitiCp9XOeKUuzv36iRecCXu0cDyGruHYT3+aI4R652q0/VYXYioQeovDmgMarNvm8lwVxqaC4T2XH8v1keakz020eRDEk+bUmDMfn0KWOysSfZvqEkoHNI8fKS9az7zdv4MKhqFOHwW2iTDid+CU4EKbC/8HxckABUDWPf/9l0rg7guKP9RCXBIRLYHDjXhitkRilNn3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RMMMyfhF; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RMMMyfhF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dawid.glazik@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gFzWF0Vpwz2xSb
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 02:31:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778689913; x=1810225913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CDfuH2SmmN+K4WcmOTWBN1VqRl4QabbTNxYayYalR8c=;
  b=RMMMyfhFc5zMJ9cXC+VlFQrWt/0YUTaLqmoWbGTU96oFVR5WTZWEutZ6
   22H8CmlnWt3bCcOaFbszewNg861K5ulsK227zv1SCF1fCzDPo0Xm04rZt
   bwOTh8kpjQ1R8peWctHsklm0XfwfMiKeHKV6GK1KxQoH6c8Pmhb0Z8Q9p
   ZegEG+vWevlM6cpX/xS++lbi2c/NfpC5TJdiN4EC2OHAGwX1R+3vUa3Uu
   TJbKXllRgZuWc8OY2PNpPyWrftzsdWKGvoVHoY9JxYzewZi9VxVllcMUi
   yIjC33MdSBrINsSDGMqq9oXteGZ7S1DZYbHHHBhqPA/bVxxlhPVllKMpH
   Q==;
X-CSE-ConnectionGUID: HNKxKYsAQU+n2Q9S4nip+g==
X-CSE-MsgGUID: xKYyZ8FiRXi8fwM2xkoD9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79655178"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79655178"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:52 -0700
X-CSE-ConnectionGUID: pbfABDA/SdaKXE24h4IzlA==
X-CSE-MsgGUID: NT1MfOhRTvSUpnig0kOlrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="242478512"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:31:51 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH linux dev-6.18 2/3] dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
Date: Wed, 13 May 2026 19:30:05 +0200
Message-ID: <41d66492e1a1d42f6888459288311094c8b7bc51.1778692820.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778692820.git.dawid.glazik@linux.intel.com>
References: <cover.1778692820.git.dawid.glazik@linux.intel.com>
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
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add aspeed,ast2600-i3c-global to the syscon binding compatible
lists to document the AST2600 I3C global register syscon node.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..50c07038122f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -49,6 +49,7 @@ select:
           - apm,xgene-mcb
           - apm,xgene-rb
           - apm,xgene-scu
+          - aspeed,ast2600-i3c-global
           - atmel,sama5d2-sfrbu
           - atmel,sama5d3-nfc-io
           - atmel,sama5d3-sfrbu
@@ -161,6 +162,7 @@ properties:
               - apm,xgene-mcb
               - apm,xgene-rb
               - apm,xgene-scu
+              - aspeed,ast2600-i3c-global
               - atmel,sama5d2-sfrbu
               - atmel,sama5d3-nfc-io
               - atmel,sama5d3-sfrbu
-- 
2.43.0


