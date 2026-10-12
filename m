Return-Path: <openbmc+bounces-2787-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4ABCC6B2D
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:34:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5XBC2k34z30TP;
	Fri, 16 Oct 2026 15:33:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2001:4860:4864:20::33" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791768605;
	cv=pass; b=JZxI+aBegJsxcX6Wt5PYQ+RyqdVLpNy7lKbrIKwwJlUcUGo76AKi3jOyqGV0kQGiT+YqP7AUwl+0ZiVePYuvnqwW18M5xacmErBiScJKkG8N/5oevBJHUogKBPG8aEG4djbnWbv4IEoIwiwAyY84Y5pw3dO7ugBKjyw3+I2u+uBMH/yyVm9o7+LpVQxvOo33aqgRpvnC4o+iZ9PdGPwjOHGLIzS0DpFWx+rkekL9A64BNbwLip8RUipz5WzxNsaqX8fqFNE0aubitjwwgD16xFzN4FUZWAGpthS9cyju/6lytGl+AOE2+u6cAJO7a8S6z3VJdk9xmpSTmIfsO///0A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791768605; c=relaxed/relaxed;
	bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rda1qa26HoLuBeEH+AVXxKxcNi3DF4frxo+om+jxrOD6DSZkaGb0ZKIeK+bQQWZwDhRhG3z21VmwiVUDRIYJcaZzeaoIrjIg3tpnt2mqnHmgcneT9M7USCVuQ5MBmC4jQPHOKJQaLSXfMqHrBc2p/Ou+CNnXKXye4NLmpxm9R8l48OLurJ1rPj74W0/zT4FFn8oa+HSfT17i4V/yx7dAkPtzyNhHJ3LpKXJb8Y/I6Gz/E59zoyzXJob0nhqFisJpgQNx9GorYo/mJ3vBHKRggqgr0K1J32Ua33xkddzv+ahqsjtoyHQDzpcTAhkB8OFC7edHuHyF5qVIxzdrtjIZHA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nYxtf/7k; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=jassisinghbrar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nYxtf/7k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=jassisinghbrar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j30JW1Wryz2y2B
	for <openbmc@lists.ozlabs.org>; Mon, 12 Oct 2026 12:30:01 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-475920b9ca2so239431fac.1
        for <openbmc@lists.ozlabs.org>; Sun, 11 Oct 2026 18:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768598; cv=none;
        d=google.com; s=arc-20260327;
        b=qiSJrD9gt3s98cc677bTMgSshqtsVOTrpNz/OphA84BpYqo7rWsHMz/cbE0QiAm4yV
         s3P4JJMmBP82vi8QLNEcQyWo9PKiEC6MMq0vJXgmodArjNqXRg9qYb0EaZ0S3hchNPTd
         Cg8eY7IpKG9L8pX234ViaTyT9iRDwrkkFMl3y8wrvsR3+rHhXIbITyyYGs5QiTq/FIdU
         9/NnI1proyZ0n6PbFKOSgdx5tjwtQvr7lLn03WjMvkUkpU5ixFYdlAdLOkNUgW0iUQE5
         jize30x3f2Xr7kv6epE6OqdP39DrRaUJA3XfNzUqTScIx+cTFjEjOIuTdxHhVJeTmQKn
         g/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        fh=Mb5zcgl3UzSXNVIX4xa8R9i5Lb2nIoAEqCFp4eJfYg8=;
        b=pYIqTWqBPFtcMq8sBzmiGs39M46lPmwVHz+scLYhpAdVSjc+hOCHHcK6ax9h7EzYjB
         i9I9fOhzEkPn20HR6wW7zgMPB3aUcZt2NCf6qhPYCPcrcukOw0wEAwyV7niBl7EptENj
         7myk3ZdnX+a1uKrBqJtwSc8508T8rgESzfg7VlMF6z6GBDau/c4LXZw1pENe3GhfMF83
         pXh7zbSOxPaVW8CWE2H8LkMUQWy02LWuJlIsA5bsEf+qdNMfB44ymckdlumcqXKFAjQK
         joZ61xvK4ajlh60EnsmgHPVheXOY9Z8XiolFsXZl2M5vWWYz75+qRoLnO5VlWawJEiML
         ECpA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768598; x=1792373398; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        b=nYxtf/7kyhMnU2jHkSsXT9TU5GoswA6u3lq+z6T19iLzb4RRUmkIs735AlNd3Hw3WN
         LkSX6wK3VM2vTaMGuP/6ooXujrD9pbUi3I0bvbL3auZvpzTI0mdCvVmEf3T42Psp3ZaU
         Y5cxEwliBRCfwRHBRaZqkbLv2R5vmSNWyqO10Ya8ClthnPAbxURmE5RZ/9HhXX2AVK+s
         S1ddZlU2YGSykvN6dC3pMb6B5fPZqmXjHLy8r1mrNNuFDyYrlbykANOG0s0AhK7WUtw6
         ahbgixUZq2Bz8f5q61O5DAzNODTaD+4VytbCclz/92F+S0wIA7xySSzMHN6qibFUzfai
         Shjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768598; x=1792373398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        b=0ynP+ZStn31jwXZ1ubG4w1iDjZoOSnVeKZ4Qgvt1mfY0KbiXSh6354QGzU84qV4vLw
         0J9OaRSX3yCEvCznu9em/jvgNonCAaCWNQMdby0vEpJamfpp1Pi+yPb0BVm8ry/yyUD8
         nPINixTFYWN2L/cI7sLbAPx/7gLYAq5l3RxklZjwCMhAqriWk6yhdc+/UWIbBxY4r1ri
         5pNQVuRsWslHc7fWVPhRFNwm1toGAFkzwuWpA54E0ZrB4Ej44mogEa/SAGkBdF7ioKD5
         5RPlYB1iJEuN1pb1SB2/fj8LFDLUzW0ndyOWYY6tCfRtmW8WZXxI5Bq6R73Zl3PYto1X
         nVEQ==
X-Forwarded-Encrypted: i=1; AKwUvBysc+4JRgEFt+NRHAhtKQcukSi7UeG8TVqtsO6YAGvieQGEKL2WKbaAAofx7cNlK2RbyKNSGfeo@lists.ozlabs.org
X-Gm-Message-State: AFq9FYLUDhIM8zP3GcgFZpKIqPVqF0D6LLAjvW9VpW5oQPeYoJU1Ymz2
	SyecKiAZ0IB2pLpQRgbCWqOei/xxtcB6nKaxg81jQFnjKDjJUnuBc1WkmWjGrGJTia8Tc4j6Ykp
	/Z+M/WwLsMcB1yTnD1lmakzxpwEYnEWQ=
X-Gm-Gg: AYBFou2zMDSGb7KKKgbX9TSS2wYrGEusNr0FMAsBqiryOQz/Qr+WfU1sZHbsOTfk4Ju
	5qIquXA5sj0vqpMo76fXqD/hji5phhK/mv+0bq2ebafW/TNnaRU5HGa8gqq0JTIJg9ojKzYngph
	9wnNo3AICgMWra5iZitrql0OM0pblyF6dfQxZCV4+2qoudyKyFi9P//RMBwmqsf6xReHdESrZv1
	N0vD93/rsmw7I7syttAj+ONj4/slOG4FSbspkMrU6chJIhYuLC3Q6qcfL7ZV+2dy61L7b24ppIx
	zRPmPHcRkjVr++c47VrYXYhfCPAmWrQVE0J1U2BlJ058dhFQJWmVY6U=
X-Received: by 2002:a05:6871:e0f5:b0:493:186e:c57 with SMTP id
 586e51a60fabf-4a2a850b384mr6586764fac.2.1791768598035; Sun, 11 Oct 2026
 18:29:58 -0700 (PDT)
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
References: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
In-Reply-To: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:29:45 -0500
X-Gm-Features: AclHuK_lsvSSZO0Bi2pRxQKVVy1uDraC5Xay_eyyK_NjHGjAgdxwlmWlZz1xVDU
Message-ID: <CABb+yY3RMpzBjuwKR3GKyw3h7M9aZkoYTRf5ZH44ewtTWVHo-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] mailbox: axiado: fix RX handling and debugfs name
 truncation warning
To: Swark Yang <syang@axiado.com>
Cc: Krishnakumar Kesavan <kkesavan@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 2:17=E2=80=AFAM Swark Yang <syang@axiado.com> wrote:
>
> This series fixes two independent issues in the Axiado AX3005 mailbox
> driver introduced by commit 14af7a96afa3 ("mailbox: add Axiado AX3005
> mailbox driver"):
>
> Patch 1 fixes two RX-path correctness issues found during bring-up.
> The threaded IRQ handler previously consumed only one frame per
> invocation even when additional frames were already queued, and the
> RX polling logic could mistake a FIFO error for completion of an
> incomplete frame. It also corrects IRQ handled accounting and uses a
> stream accessor for the RX FIFO payload.
>
> Patch 2 fixes a -Wformat-truncation warning reported by the kernel
> test robot for the debugfs entry-name buffer.
>
> The two patches are independent and can be applied/reviewed
> separately.
>
> Testing:
>
> Both patches build cleanly with the aarch64 cross-compiler and pass
> checkpatch.pl. The originally reported -Wformat-truncation warning is
> no longer present.
>
> As a runtime regression check, Patch 2 was also verified on AX3005
> hardware, where the debugfs directory correctly exposes chan0-errors
> through chan15-errors.
>
> Patch 1 was regression-tested with live mailbox traffic on AX3005
> using a development kernel carrying the platform devicetree support.
>
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
> Swark Yang (2):
>       mailbox: axiado: fix RX frame draining and error handling
>       mailbox: axiado: fix debugfs name truncation warning
>
>  drivers/mailbox/axiado-mailbox.c | 116 ++++++++++++++++++++++++++++++---=
------
>  1 file changed, 90 insertions(+), 26 deletions(-)
> ---
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> change-id: 20260830-axiado-mailbox-fixes-v1-42b9f4ef43b5
>
> Best regards,
> --
> Swark Yang <syang@axiado.com>
>
Applied to mailbox/for-next

Thanks
Jassi

