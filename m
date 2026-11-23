Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829DC606A32A
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2026 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HVYjCvOl
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jYMGy4FWlz2y96;
	Tue, 24 Nov 2026 10:15:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1135" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795475706;
	cv=pass; b=eG3x4uV8k8uq6a+KG3H0BtWGe5pxEbYXL1Zi8Z+7hA73yA2yM0dnUkg2rXndz9Otoersop2BChkI7pn5DWTlWT9zYHpVhr2mXQyryRqiCow92imYXnTcyBgPt0SkX/jABQy9p1YhJZO8uYcTxKDRlVWhtE4MvRVoDSdb0PVUwWoyt/++v82JR57OATEmB8MrCCvkG6xJNrFklb0WoJVPDq3TpdotRisWtYW6lk28Xm7V5d9aa+PvyuuzAR3wcG6DXO7lTjLBwyo5qQYY0eV5ksgY+aTTFsFvmPhZMhUC0kIpmOQVu75Z28dpBWqHh6Q5ki9aDODA5YsuM2xsPiqbJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795475706; c=relaxed/relaxed;
	bh=e2eePGim2m4vUtlkJCjT+l0OEOUKNlfimP+dcQEuEYM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OAw869xrc0Ar5Xorisou1UJgTi+kv/lRqV6x/2nsu+Kt5nlePHb9QvzOswVKOKT+TBfDySYmpHEyFBQVpimyEXQI6AQ7E+7h39SAHXCjxEiaEiau+KHM/Ak5VpzTiThGCE0yBCzTbwg/bn3AtJVSuxlBGujvfUbwW/4lWdTKlnOKcTFIT98TsRYh1CeST9VphHqEnerVumed2FasuAh5mIX3M7JouxvsrwQkoffV/ESV++9T/OLS6ALmHDhoZh8vjcgLTn+wIJ4ul0lq6ZuFkbKXqm5dO5LS8stoQlHOhI+D8xcZAgTCKI2b1HRyuxfoHDf9PkIeEhqExLk4uE9Vow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HVYjCvOl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HVYjCvOl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jYMGv0M6lz2xfX
	for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2026 10:15:02 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b4d5e645d1so24460217b3.1
        for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2026 15:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795475699; cv=none;
        d=google.com; s=arc-20260327;
        b=YcpedhplveKb6H3qTtax5ljvR8u2U1tJWrh5l2hd1wObcC7E87Gbo86QuVCxEGF0yS
         xFCt38EfvVHgN6M7smJtFUrVkOsd7Y3W4rTKAuS6tVcaUvBDXA+5SjZZOO2e0dO24bW1
         BuYDEXLNnfgTw6+sFN9bZC+A1Np9jYK5gVFyh+S4Gld5IT4tCA6raErBfeNEyb1bMd+t
         cL/LNA/H21HIBpOe9sfuMsPO/teC1rJ6SgcwAxvdOYeW7PoEDubvGe8rcm1xZPobjyuU
         1tdwHvtPzbV2PuOYnxBkaqc5wCt9cxzMTfL94/2/vPZCqzto701ZwRjcL49NjcIClUpo
         vzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=e2eePGim2m4vUtlkJCjT+l0OEOUKNlfimP+dcQEuEYM=;
        fh=gFKNMqGUlAytHKLCQaxrCzbSkChyDJlccgGF8K0xBwE=;
        b=dFOws1waRhHyoVTDz0dih5obno8Al50SMjqLK+aqdXvp0lrXfQT1R7l3VranMlk16t
         LjpGPxXU9d97RDQ6kSmNx7arzG5f9sDsC/XjXPlku25AfiTGldxhBQj/CJDID49Lf/BH
         5skz3UpmD4vN3gQ34Ks2lQ7oSG843DqChB+ohNiF2Qeh4uJk7yIII2s97HD8jBL3Pgvu
         fgb63KWDjnyBrnQsQcJWMsBpgGMvM7YOhDpzud1+rcju/f7bCxInVJCjbcUZErgcaeTu
         VqFtqIZhoODfiOc1h4Cc/z3AgBBck7fJe+BjUFbH5YmfENRMrHVaRqj9dniglv3JC3xz
         yBdA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475699; x=1796080499; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2eePGim2m4vUtlkJCjT+l0OEOUKNlfimP+dcQEuEYM=;
        b=HVYjCvOlvkVqZEN9697yGmVjfsibJd8QoBTggb345FDmadf8e+X3VFwY6pRMVvmt8o
         6sRp+hOJFcb3kh9xKisY4IW8hMqybIp13/4+YisUgm844yKI5T3S1DSdBpA49BlN8rqQ
         fmCkyIud2VDnBjZV+qwH+e6I2+6qIMO7tdBj2h18zvvDsExLnXUeqvoOt/cQ7QzJorrC
         dJeUCFR6sGFMCSt0QzSdUck8/Ob8orXyEnOT5wxZp9perTbo7uR3Ue6/RnbB5E3QaduG
         bWkIl+n7HzEjJ4mFXbDU9gQogN+EVfgLGRdoCqc8TsMdL1ipbIkzQzC7/uwY4rXfc8bR
         qCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475699; x=1796080499;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e2eePGim2m4vUtlkJCjT+l0OEOUKNlfimP+dcQEuEYM=;
        b=nYHniygglC1laF0aK7NTnSjgDQgN+gkN+o67O7XqpVEGt+yZvC9aDw2OCmi/f+O45z
         Xh+L1hVnGMTlCh/7+GIfyTae8FJ6CV5sXM7jcT2bsFer+a4oKlX5gSLXlN1l0/m0+q/6
         d3N5kEG0I5Zbtquh9vxTRaUhTj2tL8mc/BP/tTlVbivwRAL3N+r2+S1nq8Gs1zFyeB+C
         KnlhSNaZotISeKilhje7vnlPu79UgivwqbfCq/kJSwEVqVWt6usCQQ1z6IB/DXZrn5ep
         LHOw0MNTRsMU1sddaXOoBCzXalF6muX7+vBFyRm8AbTAwGjWUhq1nMTc7zn5B5toMcTl
         /82g==
X-Gm-Message-State: APuU4Z8bIGtdcurFQYOjn0Chm9D1hBHmN3ppd9kVYFAY6Fz7LzsTKjgz
	AWchWjvonItmWooVnj7ZKXgiQZYYptKedAQwrGIQDiWOD2jCyq2o2ym+d6QICjwPabgcy7yRC7R
	K0zHrMG3MpF7dA35mUthQ35pNKyXQVqLsSfNz
X-Gm-Gg: AZFdTZfzPxSl34C2u+kxm0GNURM/geGfnryteC6lXNK0fno+ivNhRjRtUNxHmJgAAOj
	q2+VfN2BUE8E/8KMeR/L6LV9eMEK45qTCMqFD0grr8rQxHmok0KXLO4pPiX60a+GjSShhG8ArqV
	WmHZJ8G489BMSgOBqLUlDFl652bwgIgnImE9Tpj9YO9WFPgnb3nY1zyHF5am59YIAP43xnkFW7d
	9bDkV9ltwd7QA/Avp6f7B/XRevP2FHOw1t4acfGbeKpPwsMzdbqsOR2Sxp7y8jimSoURQlVU/ET
	1onuRjHlyft3muBwmyQMrbrWidx8yKgtmOCA2Hkuf+pONUxc9vN8Ecgpf3q55E4rOihXypWTkgq
	4ZYrslyhhyAvFViDsQlFjY/D9y8eZKH/HlNxVGw==
X-Received: by 2002:a05:690e:4503:10b0:67d:a0e0:1c8 with SMTP id
 956f58d0204a3-67df4425b61mr2897575d50.40.1795475698887; Mon, 23 Nov 2026
 15:14:58 -0800 (PST)
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
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Tue, 24 Nov 2026 04:44:48 +0530
X-Gm-Features: Aa3M54qHaRbfebcaFFYOR4pMaiwgOBMZO6tDA8ZLaHpNa-zyONF7hjl316sWIK4
Message-ID: <CAMFFDGhNUzbaK=Jcai7Fq5zj6PdNtG5ZkeBb4M8SoUVbhNV3YQ@mail.gmail.com>
Subject: OpenBMC ICLA status and Gerrit CI access
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

I emailed my signed OpenBMC ICLA to manager@lfprojects.org on October
26 and followed up on November 2 and 10. I=E2=80=99m still waiting for
confirmation that it was processed.

My Gerrit username is prasanthp20. OpenBMC CI skipped changes 96256
and 96257 with =E2=80=9CUser not approved, see admin, no CI.=E2=80=9D

Could someone point me to the right contact to verify my ICLA status
and Gerrit CI access?

Thanks,
Prasanth Kumar Padarthi

