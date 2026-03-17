Return-Path: <openbmc+bounces-1546-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C91AFB5EAC
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 03:50:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZdJT2DMnz2ynT;
	Tue, 17 Mar 2026 14:50:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::636" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773719401;
	cv=pass; b=hMgdfn72lK9sxn4e3Ky2ysQMsJeoxpt7b9q9waQgb7kqQDgH9svDQLGcC2e0OFak8MVwBUf0TITJ5Tmy+XtQCFtLsoWX5SK/vEMRT1DewkyBYK9unrZ6iWWttMImsZmB3f7rdvIf7ko+kpTwdZkBUp/m67BPgeKGCKqTOYZb5aBns5D06BNCS6SXdg0fl8sFnaGKtdGJQg99bFDoTCqcc0A6GWrdalGEKYvNMH5AUq3XVZuqRnzVyc29m/aWfmt5JIZAM9qlX+zDOTD4Mg/PqnqNQjRpKe8qua5sLOuoW++4HF2GL/Kj24ZkKVqeNE/NjYRpUHjui8P4MJo33t2vqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773719401; c=relaxed/relaxed;
	bh=RTSWYK/mTdi5Hy8h+33rtgp84yWt0mT1B/t6Xz6lJ8c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=k4yoNnOOnsvxO6DH3KKEPuRRB6dwOISIzaS1xaxYn0YgSNieF5PUVZJmmOB8ks8ilIdkFlIZwdNBHkYMvLk4yJIqSV8JlQTNdYG1GJwA122v+v7RJl2aaPEqqjrqVtYgWdcN8zLuTLPc+/NhEINHlRsUvWDMMdZPF3hE/fFsM8FgOgthJbeQSdyY4onEC7bvkucRVcXKKtP30Nt0xii9Ox6mEK4i0sjxCVyqRMYyNUzS4c6DyV+oyiSMKpUgkhE6gNb0XEJ2JNfJy5hft+0Lgod8maGJYl7jqYpRwfT3Tj16ykIKaxw+O+xgj1NcPXniIrteZGbKLjsob4GUlrhwTg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net; dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a5kuERni; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org) smtp.mailfrom=tanous.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a5kuERni;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZdJR2Cblz2yWy
	for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2026 14:49:57 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ad4d639db3so25344645ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 16 Mar 2026 20:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773719395; cv=none;
        d=google.com; s=arc-20240605;
        b=k/backarPjLuVrWcETPL43CXNvMsCEUPLmHigMgUFSrCkrwuUqx2q6N5ZoJDqZt5XN
         AtTKshDAGCFBQxcqian4xFBwa7gb+Pk8uczosvZR+S8HGeh/IvMsXBylxW+hi8hIDWsP
         j5fPITu8lCUbHLGLuG7egHunABSwO6F33tIGxgj+yJqfzsGM7slBZDslUKRIcHHCbYTm
         JTg1Sx8HM2ZEE+c2cuXa5NM7Ju2SVlkXwZrOUM3TKD4lm4BmHApHMQ+TUikGKBOj7uiY
         pOSo94sX3NLxNg1DzDZFUgclyoNTQ/lnpLFPK2tKpRcUQg3r5JLdye0CqguPkUlEdboi
         VI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RTSWYK/mTdi5Hy8h+33rtgp84yWt0mT1B/t6Xz6lJ8c=;
        fh=aZHsIjtL9eoj6fdbN7sv0+road0mHYR+UXGGFldblc8=;
        b=P8VHxQrVUYH781aFXr6fLEOdvBdz1Xd8eABp+/TN3aBy0RrHSjcO50cbFL0XtZ5WPi
         0mwjuL/iwqONbQQdtK1bdkJXf4bAi918FNEaVsWSikTPw9UyIsApVuWx6mgupWZs3cQk
         8w+PVDYZDS6+5sStGDLZpXDDJDS056LAfhOPOpe0OhuNmjKP8U7+f+jFG13dHcFm+Vuh
         JEHNm40dmbRlLh1lcp/f39KM5zmGLbeZM+MpHqz62vlfJc/+BfRaraWN39jbDrj/YW5K
         UCI+P2pLmrmy0Z6hRDV4v64WkwXxg1FDV+A8LKZAW9Xw5r3yL3wrlqEj1hies+1uU/0w
         OD3g==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1773719395; x=1774324195; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RTSWYK/mTdi5Hy8h+33rtgp84yWt0mT1B/t6Xz6lJ8c=;
        b=a5kuERniZBwYgsWBm3nKxLFI96jWbdWvGdLM3HYbzTGG3syP1cfXHw1XzkDzxqjPGh
         +N1g/3cL7PlerPKL5PXy/X5XNBkIa42tAoee8aSMjfvA3XjxlccH/6B52xaHhgfsIJqf
         M2zqE7HCbglV57/83iHe5CjBW1opY1aB3uyIv9MSpSxlCQfhOHd6LVNtPLZLq02KhW0l
         StGPGFPMJhPC856QcQY2unPK5cju6WdzqMiTpqsX+8PeCqQYNCo2cTrp296PbRJ7TZWV
         5HgxtiW8qnrr1X2R94INN8ljK12J0uUZUONPA+J7DpfZ3kZoLVCWYxjaxN0nEPCFE+AY
         Wqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773719395; x=1774324195;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTSWYK/mTdi5Hy8h+33rtgp84yWt0mT1B/t6Xz6lJ8c=;
        b=K2D7IQO5Jh0XtWdI3nx6XThO5MBaT6SLMZ9zikq+qRO3SjvF+2wjQxHhKF8VmKddYX
         zR7xuQ4rLRMp7VUKIgkCNtjoaHDVyoKJDwO0+ZRKl/K7IQARy1qFdWu1KggNa6xpUGFX
         5+BxtQxZypY41+SIDvB/J2y5kZaMXq4l/4uT3IVow8gZestpcHGwomah3dIKC6Kjzzig
         Fg6TzjdSJIr1xi3fRsNnt6gecdPYEAEuxCWxRblXatsw6LCKPEmRzC5rAaJFoc5t/bVH
         MjjlvD8YR3fMg1XL2FVQljUTykRJbcxmH+UiGjSxfrP3QmQTjCA2hilCvcI7+1CkQGLA
         0VSg==
X-Gm-Message-State: AOJu0Yyy7eXzSGP/dfBBNidIAe3lFIOqfxUlLD0jZySnnHUw4p+I66Gc
	Oi5Mrb5E0iPIShaXnWvDdueE0tJqqxtprfrXsNy/yGGFF6VcRICeoQfiYhHpD9fZluJwRQ/cCOz
	2XSCccKDheKEeEMVggg5NSXoUXRhZmRHig+Fu/GfNh1afESXG4BsK728=
X-Gm-Gg: ATEYQzxm1RQ3laFOy/FUTO0wgsiNilAkoOzB1Af7gsmAPjfQ0ITz0teXfLYb1eHU7zm
	nPAsAh3VULF1H/wHTUzEkNdlm/ypztCEPIrgSHWZjizqyqldp0IvO3rxZUtuIs3Gfjra+w3x/14
	5dmZni2b4WlzBukmIuzWr7El1Phf41ayYk8Wa5pcaWXo1fDwi9ebgW1SXSpw/lW8ZfGaaiJfvqu
	65hsqH/wwZaexFxk5XmvO4G4/bLEUVl95jbNMU+IURhkbRBwIcuiEFQkIYnjP83Hfi+J3GE5Vms
	TGT4PDqJ1jBeJR2fLOVRTUCNOnzHEDZmej+Spw==
X-Received: by 2002:a17:903:fa4:b0:2ae:bf32:20c8 with SMTP id
 d9443c01a7336-2aecaa1528fmr142693445ad.31.1773719395142; Mon, 16 Mar 2026
 20:49:55 -0700 (PDT)
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
From: Ed Tanous <ed@tanous.net>
Date: Mon, 16 Mar 2026 20:49:44 -0700
X-Gm-Features: AaiRm53-esXCbkO1du4u4F5jdLZrEfLDZBxHfGAS2NEqw5zHKQTmQWgIoIsjGEE
Message-ID: <CACWQX80Os9DAYt=Y0w7FMjmNY4ZkCoOP9yU2O5sMfSyBOxKEww@mail.gmail.com>
Subject: CI enforcement of cppcheck
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

cppcheck has been enabled for several years, and despite that no
single repo fully passes to the point where it was able to make the
check enforcing.  In a gerrit change[1], I am proposing removing it
from our build scripts.

If you have input, please comment on the Gerrit review.

[1] https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/88217

