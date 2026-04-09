Return-Path: <openbmc+bounces-1785-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4659BE9DE6C
	for <openbmc@archiver.kernel.org>; Thu,  9 Apr 2026 08:50:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4frttb2bvmz2yhD;
	Thu, 09 Apr 2026 18:50:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2001:4860:4864:20::2c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775724630;
	cv=pass; b=TjnscaR9AXl+LOa0XCRyNbQNNdp3C4JE/QQ94Swv2jqpnGCgfJx+KbqhrqmDSJgpyW2flcbcegF6VxkfQVtZzoOyRdHKrBnZH7/zijWEpP67kh9li7GGRPCYVY+Q6AQ4rY7j96iBPs3mfCk4G6/WZeV/p6K5smkALFEk1BluZKhBxww+b9VWQfBrvwubRup+0jAydEWioPpMF1vxvykLWwkFP6YdCHFRayOqrwQkTBvRC4VAQsa+Tzv6rHtzaL11FcuuoNyLTmyUqGq9CNmgU+G46j4uItoPZijdptjyw8HktLmQjZz402NsXGB6GiK2TZhmpWWgkBU0IVC3k+IBAg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775724630; c=relaxed/relaxed;
	bh=U9/pSunuRw3HKBnj6SH8ZGUTz+AUANxWAhCouT/frN4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bXSOTKA3HELbkotVobYKGAfR9sK1z2D5t0T96giuxaeOw1oSzpN4Wus6phvcetfv/CfXjpj3bDQmhMkGia08ybSmxlUqoDGGepiJuD4dLZIIRgX/w5osWzhH8Pv4IpLy2tl3rkUhxLlMwjmD5L125SpMJzolBUeYU9KBtl46k3+kRqSe5PoRZulozwRmWKmAknvlF6YToVj1DDoQDDcMjdrYyAKb1QyvkvRdMgJzLdhgTxLlM6HMzwrmlAXun5BlUBpom8eC727+SstgDvSX7a3oCQIvfWclLCHStMpMMQBTzOiV1lN1Wr9AUgYy1ZcmrEbpL/gTTVhqM87Ufb6whw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZ8cpfVp; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZ8cpfVp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frttY6pljz2xlh
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 18:50:29 +1000 (AEST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-4042905015cso405395fac.0
        for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 01:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775724625; cv=none;
        d=google.com; s=arc-20240605;
        b=iFUBPIuTjSW0ec2G1DGOQ++AjS5l0zfCYjcn/qUcmX5aLFSMeahoE0PDUi9NVFrXGf
         Y+u8f2ff5IqjcQZwbTSJVHtcYEWFeoBX6ae3XDTX1uECCSzS2aa3snAJLWVMy8fZxDOc
         /HtRqCMASyT2PFea07kX8K6pzzJst/0wpbXiMPITYb7sod6lW0jZCXKQntcqQk468Ub8
         1QSC70uwcl3iETxuSsVjqdEjOrHSk22w1rcLlhSZrvcjYzefqt5vWXNXJgX/Ruwdm1QJ
         ZoZy+D2ud0wB0ll7FCZdeOznxDZH+3HQAglJ7tNz4wQbfxwZjGVIalj0jlkUr/WiKzjr
         +mXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=U9/pSunuRw3HKBnj6SH8ZGUTz+AUANxWAhCouT/frN4=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=WngoIH3ObFuYvL77Bs2Knb9rzDKE13UQRUfdQ7uF1+uPfs81muaRJ7YHFs06gi2t2k
         klz9TRKJzHSzts0fXw8hX5CcrJKES/SOb+440wVXG0duDQq1r7LRl/oWRKSYxOFIWjCc
         ksac4HnN82EOUD6XFW0j3Nk+DvC2jQbl9tMcYpzx2aO2oT/x3nQtC4VY/RUDJpAaFyqQ
         VqyFFu1qyctWTJRlEco2KEpxGztQ2iFmKaXt+/PoIftCPU12S4S57ulWElcLsG2U21w2
         dabxVunD/dwFynS/9JFBID/LP8e+cHuFksywSSmslmaTnlrUyG27hNeicf8jxFWWtTKG
         +uGg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775724625; x=1776329425; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U9/pSunuRw3HKBnj6SH8ZGUTz+AUANxWAhCouT/frN4=;
        b=nZ8cpfVp/wooC0WBeowsK1uqQWkJmc1szVUHbDXFt+vl0F0T9zUYKujh1HhxMKtI9x
         6YRnvWyAWMPowytBUP1FFVgDmr6xHZaKQ+kdb1k+lUAdUECpjsaSre7ISQ4eQu98BKnj
         HZwnEwxBLEymw+QxY228cKHWXwb2V0feK5hLPt+KohDku/N2QDIG4J2L011uvBmQXHOr
         x8pBr0gyJtyLJBV6pbwRC7YSJRSzmPUT++jAP4tWBqSFn6bxzKe2AViDZ8EUas4Qj3zY
         NiqrCH2YfXyqYcnLhf82/6by/eEM8+Me/h42TJxfCcng47qld6JMFUhZKFMGiA8LUsBO
         Jt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724625; x=1776329425;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9/pSunuRw3HKBnj6SH8ZGUTz+AUANxWAhCouT/frN4=;
        b=lvHDQXNseYAJcQ1MMOQbjBDRHYYiGsRfHEFhjw29TbLaoAdrNlClcAhMhANzK5u4XB
         Vkpb/RV8Hvgj8TEX3vfK6f7URAu7tqBMHZqbOoqitRf10aNuftYCs7KQhDl5nQjp4+YV
         hWNZCCVnLsv2QxIWyLPKMYR8zp0x0jZzXzzw4mQrQExm9/lvTekRgEGeVtpiHP88A+ud
         WHmxsOs4aJnQ1qS8FzraFoMH8FRpBZyUw3ilQAZQQF1/oEb8y+386REdIn7hDJ7B/MQl
         TaZudTA+g+wxQNMS9aGeu0Vpv8dlU+EwdjsYQDswWrXD9iooNFKj6juJriR9HXGUdrkk
         OleA==
X-Gm-Message-State: AOJu0YxCrwW3CXoLZkBuZ3nkfCC0b71oX10+UjY+X9uoWUSeu0VE/tP3
	z3u7qemMp23/uQFDudWF6HpG4AYUV/p7abcJN3mBL0rmbQBmQJpKskjiTQpCMlY3nKnJkGhzIhT
	dblAh3OC9oIur4zmpERZjlYe4GbAK2NISGTwu
X-Gm-Gg: AeBDieuxSBmgDGl7A2Kl1xqxarIIXL9iwKsmIpQ6ORdk+8ump+9aOudAHOiPrUyrI5n
	uZSy4Ls965MUshqGKvJiFoR8X3MoI9XR/oH8tFZeYu5YWfd2781R81Od2fXLftEZ+mAAihhH674
	Hj2q7eaQlJEZ4gj/lV4J8x3lixrUbj0we0NxiPZBe+chqvp7sBVDSWFyjCToO0SYW3BsaHgGnn5
	oR9vdI2ljOrmsDwD1o0IRm8NkuyVmKNRdsNM+TPI+tcaYETXyYjcSy+RsMm2ZAGgGmA5+G6nVLC
	zXTDju5y6A==
X-Received: by 2002:a05:6871:5291:b0:417:6699:73f9 with SMTP id
 586e51a60fabf-423bd844085mr1534657fac.6.1775724625338; Thu, 09 Apr 2026
 01:50:25 -0700 (PDT)
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
From: Eric Yang <eric.yang.wiwynn@gmail.com>
Date: Thu, 9 Apr 2026 16:50:13 +0800
X-Gm-Features: AQROBzCjruidxdY4XDu6RZWYMYg4YpUr8STwbK6aNQ9K5hW5qqHBT4sVIN8bxiw
Message-ID: <CAFme=rmRF03V1RLm4v6071ET-vVzrPjz_oVKCfWoO5G0CMzJUQ@mail.gmail.com>
Subject: [DISCUSSION] Drive-level power control support in phosphor-state-manager
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been looking into how OpenBMC currently handles component-level
power control for storage drives, and would appreciate some input on
possible directions.

On storage servers or compute servers with NVMe/SSD drive bays, there
is a practical need to monitor drive power state and perform controlled
power cycling or reset of individual drives.

The State.Drive interface added in change 43155 [1] defines
RequestedDriveTransition and CurrentDriveState, but I could not find
any upstream consumer for the transition/state properties. Please
correct me if I'm missing an existing implementation.

If a platform wanted to support drive power control through
phosphor-state-manager today, the options would be:
- Map drives as additional chassis/host instances, which carries
  incorrect semantics and breaks the Redfish model.
- Write a platform-specific daemon outside of the state-manager
  framework.

phosphor-state-manager already has a well-established per-instance
daemon pattern with systemd target orchestration. Following this
pattern for drives seems like a natural fit.

I'd appreciate any thoughts on the following:
- Is there interest in drive power control as a first-class feature
  in phosphor-state-manager?
- Should it follow the existing host/chassis daemon pattern, or
  should it be designed as a more generic component state manager
  that could cover other device types in the future?
- Drive instances may benefit from string identifiers (e.g. nvme0)
  instead of numeric IDs to align with Redfish DriveId. Any concerns
  with this approach?
- Should a drive's power state optionally be tied to a specific
  host's power state (e.g. power off drives when the associated
  host shuts down), or should drive power be fully independent?

[1] https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/43155

Best Regards,
Eric Yang

