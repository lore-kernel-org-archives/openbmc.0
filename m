Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rklRuJGa"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vCCR0lTRzF3LD
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 14:04:34 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id r9-v6so4978314pgv.6
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 19:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3mzC2Q3OHE8KNGrPu7wprFIxXJAdWkqeiyVeF1JaK+8=;
 b=rklRuJGaaZMtV3QC65BEFYM3hpEWS2vvGs08a03s7i1Fdo2+nkINLU++MRe15DmLV7
 E19ZUBVhN7gMaEZPgYLWIv/Pv+IsVFnqzuxQ2tqsaWyULxHuLkQe/CHwFcAZrCOujuaC
 y4hFSCEabmjAV8q/SEXbeZjBdPsSvkPshRDFJXX+rE5fYwp27yEgb1uOhsu6/SNq7jtK
 7U+axKmzMVayN8ytI3BivG/Y4h0HUqVOk/gydt8rEcJacrEJJuifKczGKEBtRYYIT2ix
 MNf+Im+6QsVE95iKORWmovJxkP6m8CM0YgqNAS3QNNF+O7tFrLpO/KXb7+5emuGWMjuJ
 6Cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3mzC2Q3OHE8KNGrPu7wprFIxXJAdWkqeiyVeF1JaK+8=;
 b=JiTFiAfi+5CRd/Q8x42MsaNMjpjgBay6NK9MfGsy7i5FlZ8OY15zW4CX/0KzyLIwi+
 mOB0fdtWUqULWouHc2CephbuzUOh6L6g6gan4NJ213EcNj/LPbZASTGoMScRv3L0cGpp
 F8ePtaRi9ixZDaBPm3OYETYLp+WNqszYBML9lNJSPepSEVXOaIFIWfJOIy0JAy33YDMD
 rWl88SFJmT0TTystgxUwacGt7EG95plXUOThKxS0v+X6U9fmTfZUzdzpThARZeolRP6O
 UdLDPlPPtlkvloru8gtG8BIa5ehoCMggcvfbnT6gROLLqVRN/t7IS3hTauwCdxfxZTNQ
 gRaw==
X-Gm-Message-State: AGRZ1gLEFe4FIMA1jiKn6qFh3Y3s7iVrseHvhEsZaZoaJ13ubF45GzCt
 yj3u2oTEA8zYtsqC7V4HlZ8WVGTB
X-Google-Smtp-Source: AJdET5eRSjlig4iZjQngva/hTgdIigjSHsjED71ctkNI8dX3v4jpTc12pw9Tqi+ScrDGec7O6Ffyog==
X-Received: by 2002:a63:e156:: with SMTP id h22mr3170500pgk.255.1542078272155; 
 Mon, 12 Nov 2018 19:04:32 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id v191sm22619783pgb.77.2018.11.12.19.04.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Nov 2018 19:04:31 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 13 Nov 2018 13:34:25 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH qemu aspeed-3.1 0/2] aspeed: Guest to exit on shutdown
Date: Tue, 13 Nov 2018 13:34:19 +1030
Message-Id: <20181113030421.6264-1-joel@jms.id.au>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2018 03:04:36 -0000

With this change to qemu and CONFIG_POWER_RESET_SYSCON_POWEROFF=y
enabled in the kernel, the guest will cause qemu to exit when performing
a shutdown. This is useful for detecting the end of a successful CI job.

This is only relevant when passing the device tree to Qemu with the -dtb
option.

It only supports the ast2500 so far.

Joel Stanley (2):
  aspeed: Add syscon-poweroff to system
  aspeed/scu: Implement power off command

 hw/arm/aspeed.c      | 35 +++++++++++++++++++++++++++++++++++
 hw/misc/aspeed_scu.c |  5 +++++
 2 files changed, 40 insertions(+)

-- 
2.19.1
