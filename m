Return-Path: <openbmc+bounces-2235-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A3FC43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 11:21:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwFyy0LwMz2yft;
	Wed, 08 Jul 2026 21:21:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783509237;
	cv=none; b=Uq63yvQAXSe+CwPsdQvg809D8f1bVpwapvMHVsHVk4dqD8ZKtIpZW/GNAjeLemI7JBAjQbOhzprwdgw0QK8LWizUlA+pRb2nfPhP4LMoUVjHkJUfppJIkRSTYhJMAL2DSFzpjdcDvMtqqxWR+BvwUQ7BeuCND1tfo6uoev0nrK3jnuf8A1NRKm0xYOxay5+II2wfaWkYj52nak73HC/Vn2RGwk7x+RA/o2niUFfhz4SpRhSP/ZEaSMtoHSs36vacg37VG8RiildyadQpQCckIiH5BzK1aZQ8uciyxvKZJW2bYsaW70IEMfxiBfCbDQX2dyWARkW4jHnce9k5LzzfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783509237; c=relaxed/relaxed;
	bh=em41dlu4oQdZqWDduU5M4moJ/CYl/v0sl+4/AYrbgEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTRj1z8HfnZtUyNYvyN/U5oWtNJVF71foxkrkZ/BMLcoX5quuPxuXW1EYcZMkPEOibev0cf4AFHgJwZEns3qGuU6ojri/8HFHtgSLEDyK/F29sm3UWVXDcTvTPER47izNM52vMZVqmiuZhnjTq4nYfPXDo5b2mWfoYW7yRUJxmA/yHOwDhHirzJ4j4GIACVQj9gdjyPYLrrjSrHCyvylVBQmvoFqY6e5kTo6+T0Dqw65+Gi/WHO3xHqG+cHDztY0VsDK0La3DwDdKOP+iweZJ35avyn70pN51Pr5dTcB1gfeE6Ug6RmlwsFjJXeLshPlWevBNEZ8qAfi8hfGvhqKiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hVJcK4Lb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hVJcK4Lb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwFpX3X8hz2xWY
	for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 21:13:56 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-846970f0acaso600179b3a.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 04:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509233; x=1784114033; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=em41dlu4oQdZqWDduU5M4moJ/CYl/v0sl+4/AYrbgEs=;
        b=hVJcK4Lbf4yt2frW1IFf0bmcTuBl9W70vPlgyPlC6vYy9H5A39Ex9CSb0BS/f0FqSV
         XZ4+WbWgjofJ5SaQZSIQF1rdRIFFDKBfEqmomWUSQ5hl/iwlLfrQxNbz6yYq1nnSRlRe
         Vij8LiNqsPhtC8ENZTRw4W9JIxI2we4Qi4W5PFFyy0+KUV1lriyHIQ3a4xqTPnurK2mQ
         hSlVnYCvtMk9iBRx2R3IcbxtLyB+vDFn5hFCHDe8d/vLYgWYByc31opHWV0BBkSlEL4M
         ejBvvw+hScuSBAUEXU7luGMIYfp15QvGextPEdIwoX1K7hF6yc0Q502md/PM/9mERH96
         qt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509233; x=1784114033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=em41dlu4oQdZqWDduU5M4moJ/CYl/v0sl+4/AYrbgEs=;
        b=nsvcgrob3wmo3yehNcXhgdr1QH6XKLnWwfQ6CKbQ5dk/hDe/0rBzgN97ZORBfPW6gU
         12LQdlFF0jkn3LHbJH73WWSYEQRXyQYvtdthQxXbiWIHjChivI1d5XVl5g4YcyBZU07k
         KFDjQ62wUOw54t4ikA7v1h9hC8KcDIxIKJ/SHNt8KUyf1E9mj837hBg97pTBkT2V71JS
         RRquwM/koY3ClFG4ZtyWPFwtWqYBmzMnyGKVNBgsi1GWpQQKEA+7Vlx0Pyvd1sZuCsax
         jKt6KEfvMACx5Hodq0E0TTM62R9iH2Jko+k8Jx3my/M11HjI1zMdhX+s1OKk6efu2gWM
         U9Sg==
X-Forwarded-Encrypted: i=1; AHgh+RokBdsuxLyOi1CASDjOVV/QKKxxK/vLGm1SLIvsyEZKFhOK3y4AWR3ZlqI93bP8s0eO4f+QtfR5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLuByZ/N9oRPZPw04LTLo5lYMKXPNaf9ePYl1zCblLZzBlY3hA
	gEgf9h3Hs4Ni+aVcmAIrRpXssKyf93Uf9q2hJHvItD40FhjlXqxd/rdy
X-Gm-Gg: AfdE7cm9r3+2Zx3jueiKpyOPI9dM+VOeEU1uvk3GGj1OVzZiEJvnH2ez6CYda9H9B/+
	KWjC+h72NA09nil8xmXV+xq0koKK+Tg5WulJt3llIlVdiBjMBC1WD83nqnDNqLfNv9qpA+M2CNo
	Rvps1u0xX4BeC9rNUgdhFIln+I/4B0B7yOvxyuHaICGUtKBSbAwhizB1WBG8TrsCGFSeGKO7O95
	tYJ1GpXetP6CdgoZlsmdKddCLO40G2Z/HGP75UkLwkclK7JE6yTJxJP/FhtlDaHexwmdUYpY+V4
	7hAnvwHXItOP+XoevtgjjJ/ig1Iqt7LLzOjDA32Q9Cv4hBZ6s8W2mV4usc/SRVRk9kcv+zf7GZA
	8VBUYLlUPIOkF6kRbQwYX5r7Jlmo4Jsg+tb4GdRN2tG68DqM1+mslDgy4ibd2ZnxxubBwM01CAG
	Hzp/1Wg8GDnK9b
X-Received: by 2002:a05:6a00:66ce:b0:848:4f04:87ed with SMTP id d2e1a72fcca58-8484f0498a3mr214402b3a.34.1783509233351;
        Wed, 08 Jul 2026 04:13:53 -0700 (PDT)
Received: from lgs.. ([118.193.33.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4edb4sm6912317b3a.33.2026.07.08.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:13:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] i2c: fsi: put OF node on disabled port skip
Date: Wed,  8 Jul 2026 19:13:44 +0800
Message-ID: <20260708111344.749796-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit

fsi_i2c_find_port_of_node() returns a device node with a reference held
by the caller.

The port skip path added for unavailable nodes also handles the case
where no node was found. That case does not hold a reference. However, if
a port node exists but is disabled, fsi_i2c_find_port_of_node() has
returned a referenced node and the skip path leaks that reference.

Drop the node reference before continuing. of_node_put() is safe for a
NULL node, so the no-node case remains unchanged.

Fixes: 58031a26bf2b ("i2c: fsi: Prevent adding adapters for ports without dts nodes")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-fsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index b2dc5ae1d0e4..9ba6b1c59082 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -704,8 +704,10 @@ static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 
 	for (port_no = 0; port_no < ports; port_no++) {
 		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
-		if (!of_device_is_available(np))
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
 			continue;
+		}
 
 		port = kzalloc_obj(*port);
 		if (!port) {
-- 
2.43.0


