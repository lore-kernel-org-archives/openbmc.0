Return-Path: <openbmc+bounces-2138-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E2CDB466
	for <openbmc@archiver.kernel.org>; Thu, 25 Jun 2026 08:19:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gmBXj6PBkz2yfN;
	Thu, 25 Jun 2026 18:19:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782375541;
	cv=none; b=dzOUJI69fVLg1xfLRciDM9B00KCaVXO9vYTqGc5v2xTs9NURfSJmEV5Xz+QaeUwOkt7SFKYWGroZdkmQPFyl+adv1qMvCacu1B4/q7r76HhmaJC8A6gWyo8OHqipTUrpl3vZEu1XVak6+3F91CRhT7SGWGnOHR92NsIZVKuTSCMANXUW/AhaD88m0I4tk4lNO1tK52Bg8DW95AOfr1c/hg+yR6pWDwoTeDhEnXUE0p53kU1AUefhDrsWNAImCbHqlSG1U6QC/B76ZGaWdc17++6Z8LTANjNDTRLl3yLeC6Ce+bqUH5SAfBz2JFJv++T/i99OYya6DxYtu26Zyw99gA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782375541; c=relaxed/relaxed;
	bh=r5psEs3fCN6rI3WB+du5DkH+CVBVL2hkqV1LRoPDQ54=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=PJYDxsLaZrjkaplh1fZ7OFrTiFlK0ZmdxpSzb4bfjpii6qdvYrtxPT9R3iI0VeNaXa2f6DEXV4+MwxjIpbQNXUib3PkB6jq+RGfGTGhyiGAKsjZjiSWHi3fTmMcEn4f5zePLypO8qvp3aqY+eh9YTI32ZIET8rZpJnlE3jgeGZSrjnXHneI1po5jbm9sQ/evZBgtbeHli01iQBWubyNiylr5UQ7Xam5Xizjwex5YuiPiW8FeXKLLU50oQ+xR6yvFT/Rs0SJnPmlO5NjfC0hEoM+RLr9RfR3LSccwJod8fp2FJAM0qXxfoh+YEGHEJ6Xpx1zsKBnZQ2h9hqxpRow5vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=b2jeyCqu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=b2jeyCqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gmBXg29z8z2ySg
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 18:18:59 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49241896317so8718105e9.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 01:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782375531; x=1782980331; darn=lists.ozlabs.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5psEs3fCN6rI3WB+du5DkH+CVBVL2hkqV1LRoPDQ54=;
        b=b2jeyCqu5e4Y7SM1yni1ODsCK6+hInG85TgiNy8xtJgAMDMS+LF1WcSut9E5nWKUV/
         Yp+JYqdZvUWGtCerxzU5GzR/fe4JeFQpV52BixXJ7vfLRK7Gs25t748/Jy93Ph9ZyqRD
         jeOoSXEmiDJSKquYoZjPzagrIcQXdw27tqZBYWvoXKjw2LeX9HjTpRU7xQ9pSypApC7m
         F3XPlQ3Vb7RVIYq6LqKNzkfpltCfUlAEc9NsWeCgKV41gWx8ObUt4aUD6hncVjuFYsHi
         5vdjSwvdlvDuuGGrrHc4/zhC7YdYUBpcuhUdAMAkjZQMdt5y/DcvaRJdYGFoHn9ljpnp
         O1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375531; x=1782980331;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5psEs3fCN6rI3WB+du5DkH+CVBVL2hkqV1LRoPDQ54=;
        b=ZH/EajC+8Ki14y9EY5CGWJsbJhF3p3wmsR9XanRrTy8xc53Wf8XkmGznB+QiaR+Nku
         G3kEXXeyaX4nk/xIGVvxEXcVmRU67n1uWnto0GpXvhuwLtsPLbEzZV0RHupothV5tFjX
         NUN3cWehSHlXXr8yATd6qc5NH8k1zjHTje4T9WtYYj6GxXgnGZh3rx++dQFAKV/lv3k6
         yuUAElLDCR+MRSbbncBLG6hUK9uyun2t4MqfXtgzAFWRgiME7WpCoaDA5WOBk72zcYzM
         bhHqFrEG3QUVQka/aW+5PpP35i+98gOJU6gh1QlVgGcVGsJLHSweUQdXovKNeOL74SlS
         aJAQ==
X-Gm-Message-State: AOJu0Yy5Rz4A6+ibyqX22fPu1OFCSea3rpE4ZTg9OjwEcZeRHw6Q/jus
	CvznBhjfNKlx61vQUa2Os/Cej3BP+Qf1Gcdj+O5vwffA41qBefNUtOiHcs0PUkOJxaFov2vru1h
	xOZ1F
X-Gm-Gg: AfdE7ckRJYfKhSPwNbTpP6WB4G8R/CLOhtttqEgVH2/cMYnVbSMJVVXoBzyunjP1a3x
	YRInIY/BKiGCLFckOV4KNxp1SMQXKTGYhLR09ctapJvCtyL4b3ZhX5+KAAzwFycKzvBh7PSp5Is
	QBNZ73FWUNj3h51BQI3S9ZjsFnj4KWoFr6xJXM/7kHVUub7rukPBT8shSuSAm5FAKxMzTnTKvhw
	8l6tddSJibm2he9gYAHFA7pqdcMzsOIe8+9DJYopKf8hh3gYZSTjU5TukHSm6xUI9VhvLzFBFsK
	GYJLkNtstCdRgv8jf4OWbZebMSHzJz3Z4ZQheUzIKpcEHEuMjQwPJiPNPBW9RZxRB/4QhQvXqT+
	ULpgOJeU80FMEhtrM0Mj9a7g1B+E6GfDTyE5wux3/mRA4EV9P0m9bcC0mZDvBZwRD58SUS6Y83H
	o7vUKayZcBtkgJXsVtQLzhcXCV//4D
X-Received: by 2002:a05:600c:8b18:b0:492:37b7:6090 with SMTP id 5b1f17b1804b1-4926683b257mr17068855e9.5.1782375530823;
        Thu, 25 Jun 2026 01:18:50 -0700 (PDT)
Received: from [10.212.124.172] ([2a01:599:844:5d7d:4f6b:517f:39b1:33ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d9csm15229314f8f.12.2026.06.25.01.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:50 -0700 (PDT)
From: tan.siewert@9elements.com
Subject: [PATCH linux dev-6.18 0/3] hwmon: (peci) backport Intel Emerald
 Rapids support
Date: Thu, 25 Jun 2026 10:18:06 +0200
Message-Id: <20260625-peci-er-backport-v1-0-5b2e8740f2ba@9elements.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBAAv9Ls2TWlCaX6FcMBlkVXTWm2QEgIf
 7fqcTKZ2SGzCme4mh2UV8kyxQLVyQA9unhnlKEwOOu89a7GxCTIin1HrzTpjDZYaupmJBcuULK
 kPMr2W97gLXHZzMAr+nMVoP37vPRPpvn7heP4AACfbqyEAAAA
X-Change-ID: 20260625-peci-er-backport-080c757fc289
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782375530; l=722;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=YCQnTKjlYLxOYp7Iy6AWO9ni4a2d5h51u2wePCh/IJ8=;
 b=1M04oAEClJZWhpRUh5YRQefPGHxrLm2h6EggJakew88ds+OR/dVtJX4UkAKd9hfar2mviqbwI
 uXikv/FOb0pDCIPjCEGSYPxUmmchU72LcbyREuyznwB3Y62Y9ZwoeDa
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

This series backports support for the Intel Emerald Rapids series for
PECI, required on the BMC side to monitor CPU and DIMM temperatures.

---
Ivan Mikhaylov (3):
      peci: cpu: add Intel Emerald Rapids support
      hwmon: (peci/dimmtemp) add Intel Emerald Rapids platform support
      hwmon: (peci/cputemp) add Intel Emerald Rapids support

 drivers/hwmon/peci/cputemp.c  | 18 ++++++++++++++++++
 drivers/hwmon/peci/dimmtemp.c | 19 +++++++++++++++++++
 drivers/peci/cpu.c            |  4 ++++
 3 files changed, 41 insertions(+)
---
base-commit: 6c7792586229ebcb09f106b7b686cfd25b9aebf4
change-id: 20260625-peci-er-backport-080c757fc289

Best regards,
--  
Tan Siewert <tan.siewert@9elements.com>


