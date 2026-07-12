Return-Path: <openbmc+bounces-2260-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65B5C43458
	for <openbmc@archiver.kernel.org>; Sun, 12 Jul 2026 22:59:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gz1GZ4TwLz2xm3;
	Mon, 13 Jul 2026 08:59:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=173.37.86.79
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783897158;
	cv=none; b=U62vRuaRdA2Y1CRRWX+883th6P6OFf4bKEYuZJVjguVPXHZCp5aAk+yR8zJVU4N98jme5fChDHDWI+gQP850kM2Tu6rNFrda/Hbg7/rq/qPkAhkB5XJuWq45eoVPgePcL0LlGYGjQrMNrgVKE4T9HX2r6yLoz5Uo1Fu1ynt7VKWtxzkLGWEGHzjkVQ84AdlGFx2WXjCplJ9RBVtd+yGExDJ9a9Gu9EEk88FxqWSIIO/i5od6vDg81ceKdg1HYQrlVZfTxxFJWRhNAGyMMfF8yKRxwNw+CXR0sS5sMzij1iRS7y6MhyGDXI+UEH/ibPIC5br3aff0U+KzaEB2WLRc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783897158; c=relaxed/relaxed;
	bh=FL5uranyaI920vd4dJjqAMcASp1UNIU7Mja+qK8luLI=;
	h=Date:To:Subject:MIME-Version:Content-Type:Message-Id:From; b=HSyiPHCvPNnsG6ZhQU4VXoG5X96Gu82FhguGfUiOoUFqxYQQvArMcDKhp+C9HtUyUijWkFo6eQCA2cm7OWxb5Z6oylLmas3Dv5vTNWWMrJjODvQZt0U7amYJMTfEG46RfUO/mqlFKruO2VwGLUOFeAhCgFYFw9jKkoDzhfrQTCjzONLmaM3Qxj6uG971YbPMsi//oQSTmHeW3ngSMPTkC0AD38GROkM+T3YlygUbU0GLDriZeT5nHN0YreW4whRBIFL0VenCiNrj+BrWA584FLj7h8H8Cap2FGaJ6MMxP2pi2Lsm/4BsHsisqbvMpcasi568zGqb2zugKOtNuG5ueg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=iNBSDYYu; dkim-atps=neutral; spf=pass (client-ip=173.37.86.79; helo=rcdn-iport-8.cisco.com; envelope-from=ttruong@cisco.com; receiver=lists.ozlabs.org) smtp.mailfrom=cisco.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=iNBSDYYu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.79; helo=rcdn-iport-8.cisco.com; envelope-from=ttruong@cisco.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 13 Jul 2026 08:59:15 AEST
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gz1GW4kxWz2xWY
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2026 08:59:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=548; q=dns/txt;
  s=iport01; t=1783897156; x=1785106756;
  h=date:to:subject:mime-version:content-transfer-encoding:
   message-id:from;
  bh=FL5uranyaI920vd4dJjqAMcASp1UNIU7Mja+qK8luLI=;
  b=iNBSDYYuGNAh071dEpK6hY25BVBHYg1RhImbYfPo7ebpeEPLFPLfmWdm
   DN2+RZIlx0TQDMt+hgXhxRT2K/KEFoytQuH5NBPjyysO0zbQ6WhDVUB41
   FP7bcmCqYyvMGLC7ynCbZpnk0rCxuLke/LCpJh6SpI21XhkdjO0xFAIvT
   nDpHX0M6mN+Un5km652ud99/J3lBbdolV4MGjN8BWIx+TRWUISgP4pwZ2
   y+GsdE5gj5piAagCFhN0UCR55pHais2J+Y2zXn4EtoB/qj5pQSyjTLNCn
   06Npuzgqf+y7lpZvceX48wdbXkKnJIVg/aApxKGqEnopfPUX7D5p+37Z7
   w==;
X-CSE-ConnectionGUID: yK/zBo/oRyqx6XlRL8xMNg==
X-CSE-MsgGUID: LHusarbXROmcjjYyGukNww==
X-IPAS-Result: =?us-ascii?q?A0BUAwDPGlRq/47/Ja1aglmEKkKUcqA/gX4PAQEBD1EEA?=
 =?us-ascii?q?QGSVAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZchxsEd?=
 =?us-ascii?q?zACHjKGCAIBvHl4gTSBAd5FgXKBTYhcAYV2ATt1g0wnG4FJRIFHA4NFH1WEC?=
 =?us-ascii?q?4NIgjAEgy6RcIFKeCwBVRMXCwcFgTMzAyAKLxQZAhQvDxoyHXAMJxIsFzRYG?=
 =?us-ascii?q?wcFgR2BBFWBBIR3Ix8DOX+BMHVKeS1zEh4KgVKCFlkDC209NwYOG5VgpG9ro?=
 =?us-ascii?q?Q+EJ4RznGhNg3ETlBeSUQuYfSOpIIFoPIFZTSMVgyNSGQ/fMCRzAQcCBw8Cg?=
 =?us-ascii?q?XOQAi2BTwEB?=
IronPort-Data: A9a23:bYITBqlodjffhtfWSKKsQJ/o5gzoJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbXm2Bb/aINGCmeI0lO4209E9Qv5KHm9RqSlA+qng2EFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLs/Lb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZw7vfRdBiZJz
 +0BOG49aiqn1/KT5r3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMieBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYD/7C7pm9AusrmXjaSBfrl29rqss6G+Vxwt0uFToGIeNIoXVGpwEzy50o
 Eri33niCwsQBOa4zDGH8EO9qfLMuzzkDdd6+LqQs6QCbEeo7mMQBRwNVVq9ifa8g0+6HdlYL
 iQ84TAvoaUs7kWDT9+7Xhe95nWDu3Y0XMJdFec/4ymJy7HI+ECeFGwNRCUHb8Yp3PLaXhQw3
 VOP2tesDjt1vfjNFDSW96yfqnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:laI3qayFvXGIRnnr0y4LKrPwAL1zdoMgy1knxilNoHtuA66lfq
 GV7ZcmPHDP5Qr5NEtQ/exoW5PhfZqjz+8R3WDAB9uftWDd0QPCRr2KhrGN/9SPIULDH6JmtJ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AzH4jvmj5yK0+UFg14kZgU0YUojJuY16a3l3XZEi?=
 =?us-ascii?q?CGH95Fo2Rc3vA6IZCnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AtooENg/jvwKiGAJGpmpCoh6Qf+NI/r+nEko9q7I?=
 =?us-ascii?q?DsMuGBD1fJjS7kyviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="500177199"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jul 2026 22:58:06 +0000
Received: from sjc-ads-692.cisco.com (sjc-ads-692.cisco.com [171.70.56.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id E550318000344;
	Sun, 12 Jul 2026 22:58:05 +0000 (GMT)
Received: by sjc-ads-692.cisco.com (Postfix, from userid 6024)
	id 8F2CBCC1282; Sun, 12 Jul 2026 15:58:05 -0700 (PDT)
Date: Sun, 12 Jul 2026 15:58:05 -0700
Organization: Cisco System, San Jose, CA
To: sridevra@in.ibm.com, openbmc@lists.ozlabs.org, gkeishin@gmail.com,
 ttruong@cisco.com
Subject: [bmc-redfish-validation][FAIL] read-only 172.19.221.49
 2026-07-12-155018
User-Agent: Heirloom mailx 12.5 7/5/10
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20260712225805.8F2CBCC1282@sjc-ads-692.cisco.com>
From: Tri Truong <ttruong@cisco.com>
X-Outbound-Client-TLS: VERIFIED;sjc-ads-692.cisco.com [171.70.56.134];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.56.134, sjc-ads-692.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com

bmc-redfish-validation release regression report
==============================================

Host:        sjc-ads-692
User:        ttruong
Time (UTC):  2026-07-12 22:58:05 UTC
Overall:     FAIL
Results dir: /nobackup/ttruong/regression/redfish-validation-results/release-readonly-2026-07-12-155018

Phase summary:
  api-surface                  FAIL (exit=1)
  full-stack-read-only         FAIL (exit=1)
  chassis-CB                   FAIL (exit=1)
  chassis-COMe                 FAIL (exit=1)
  chassis-DCSCM                FAIL (exit=1)
  chassis-PDB                  FAIL (exit=1)
  chassis-Pinnacle             FAIL (exit=1)
  chassis-SB                   FAIL (exit=1)


