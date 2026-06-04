Return-Path: <openbmc+bounces-2044-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A11CD6E4A
	for <openbmc@archiver.kernel.org>; Thu,  4 Jun 2026 14:16:08 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gWRSK4XM8z2yb9;
	Fri, 05 Jun 2026 00:16:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1134" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780582561;
	cv=pass; b=eX4LKkZkE0P+0r9MCzEqqhmTx0JX8BHHO017LJgWw5tRP2j9PeMPp6mJ6stdJJ00I3JnvuOKBqDFSwvTpSYcMFCJJN9SxCsVjdFwX6z++OyNSXyL6Jbh7SXJfaRlYiKTb7XWAmDpK9ZS0QTH50mtXKZncraPYvB1DY0RhWzksMSDGCoNDCtT2AqRJCU9mmi06Njj9fpcVUpXKZ6nV5atT1Bnb9M5yLBSc3C6YeN/jvhDlLAbG21yOJDCZaH9JfqduoMY1Szz1YRUYvRb+pADmzFP+VU/i5AZaiheQXe1MG6zTa1NXsQJh5r5+0yNaUunvXymxNNum5kri4H3hMuuzg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780582561; c=relaxed/relaxed;
	bh=xni9x4eRXEFDbs1PTV/yf82jqZ6c2v7R7oa2SE4k94w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H52rdnkhDb0jylgU8Pxl4tg18B+fzh/z8xcCRyJ9GIX2oZ+AVQrq9vbP8gFmz23BrVfyaNA18mau0hjD0T5L0isMVstY43k8NV74LU/ZaVSxPZ+Xbi6z+R3XLCc8P/jnvbcZ+ovsGzchOeaRe7UMyoKtb1exhOxvtvaqStum3PVye4zeSc3DJx9fzMzJq7XOmJq6MwBpLN25DhAqZNQScnzg6dGmSpKVy8t1AQgz8G691wdmaVaXeL3q1v72YB/Bho2jCFqgQ5Rt6kdcqYsq45hQ1bwgSazX1eUvylqz2ifuVaKfsZUIcHPS8kvscYoOfG78zflfa9puWuScGDTrWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZMFfq9e9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=yash.pateltx@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZMFfq9e9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=yash.pateltx@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gWRSH2BlYz2xfB
	for <openbmc@lists.ozlabs.org>; Fri, 05 Jun 2026 00:15:58 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7dee6b76a73so7694307b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 04 Jun 2026 07:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780582555; cv=none;
        d=google.com; s=arc-20240605;
        b=icExur1tAlqKAixxKULpd+WvhgYFBvBTbF3QiIN6zBQJnFgZN8rNQWwVfJdnvG/5+B
         t6TLwLD7iAAlSQ9fJjcK/V7+Agt+NZWMQVtJHSX2621NXX0w86NxwMs6D4R+Rm0KeHjg
         Z667QXz5iZUGamknxjuzt7q1guiA8bs2d1V7Zz9Dyp2HoXIed/qBbZBAlvvXHdgDI9zF
         QlFmYd5XMPYUwIfV06ztIgruvSB3TB/M9CrnAK8961eqvTB5IQZER661uq6NBMUKfKmj
         rk/0goqOR9Dq6M5Wzvb1DvnxCRPlNsQ5DyaCDyJjPYNLeyuUIBWhjOr6kfVuRIvn7bRa
         d5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xni9x4eRXEFDbs1PTV/yf82jqZ6c2v7R7oa2SE4k94w=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=jjzZosNFXAu5FTChIrF9bzVPF1464SWSAA/JFCP+Lbw6r4dI4XEa3QPDx0+uzpFGGo
         6Thfvt0mG50A+vCh8y42FLqduIHLECW0QrxQPzZptSO03caA6RLuZp2IbgWgkqGkLJks
         aIYnujdCGovEir5otm0n/b6UZDyYCttdSbAg5rG0+zIKn+gBOiiaoYhDcpKcyCDdble/
         AmUDY3NRp2TY7XrIQGIJQ7q3tT8GPM/lwk6eenx4pnTMjIlu+BunEbRt92o8PW1e9Vma
         upKpvVTx3mqv7/xX/9RJVAqtoMeFw4PQosI5BnXAcBpNRM2u/kPwDVeRiAJcK+sfPuV0
         ihCA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780582555; x=1781187355; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xni9x4eRXEFDbs1PTV/yf82jqZ6c2v7R7oa2SE4k94w=;
        b=ZMFfq9e9uRhC931QX9G76tzaWwOkBOUejtrCouaW32Mo2pPs6fBBooOdfxlh2/p7yI
         rKedFAwqw3+yWz3cqmU2MVOpZkgHzJdzy0UbbcUiI1i4OhBz+8cW+i5yA42kqtGa9r2D
         1woNA3CR/9yMudoOKmnXhhkC+oEJO14A7JLGIMPfE01dv8Qe1xn7zaoSvgkvWKViyYuL
         mq1paKtA5AviXy9nFx+t3d9Yhsbu7/tPHLzSV42BvHIPZILXg9bdvyr6KL9rTb6S9qCI
         LljIaZLMkIYZlDdR045nUPT4gaPVuu8v9jAeWXLXSyqSy3IbFS1pDbRdZ4Tu6sPiu4vl
         GoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582555; x=1781187355;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xni9x4eRXEFDbs1PTV/yf82jqZ6c2v7R7oa2SE4k94w=;
        b=YK/ymdbCNCBdcvJKYO9OT3jJXSyD0aYoDzcoWGwTMiauaI5R8Z1xNm2pj2N6Y9Uf7J
         MJU4ZcYcGkhxe/+8bPA21sx6vlENyaTKNgctbJAPmG0ODLaaYWVufqoAEJsFEPqmdFFT
         xmwKy4Ltof9bheVpbQfsJzEfdOSg0baYxYx488Sw/D0dkS72+f0ZVRUGvzyjXjOZC/7u
         hCBLWsiCyMQOeqsAQVIENIXzygMsk7H0blweVkKvn6fgWbVwxFYnRyHrflMX9KCJ5YO7
         6DMQ62av0Gf8O0P69Wsp4TXokEwKGw/uHTCpwSGUqc+rms501CEC/ppQyc8dQ+V6iBXq
         SF8g==
X-Gm-Message-State: AOJu0Yz9nr3KY2gNvJbx5YtrXoqICV7j1IA46vbetYl0xHYwQCC8YGPQ
	x2h5A5il8rbwQc8xxeXD5l0YXCrbJ9uJ5AnMw0bf3ppXiaTViO3aFQKO/iCN1gWqxYWLzxgqYDx
	OcEyVs7pWr9y/fAuLhuanBYgO+Tx1LOEajxuvlnc=
X-Gm-Gg: Acq92OFU3nyeYYAet0k+LFct8OONOWQbrf2vUrAqvkkqXDizfU9HQ+cSwS9SY3PKLDm
	pKs0UKJVHQaaTfFPs4ZuVyo2bly5veRC0MwvDlf5/+Z9af30LQUC8ki17q7VZY5bHAhlbtEWBpB
	I07LRiXPZB/JbgcpNvapWOOGcQIM2hvcfZ97VTfQReaPJqMllNQlZdIW93j6wfNdnNftmNhYRTr
	C3swxOQXg+uSn1+p0SO1YQmSs98qR+S4vRyG4DRGsDVA6zDLp4XRgMve7aCUS/VuLMnpMClyEym
	ejXXtn2p9skkUvs=
X-Received: by 2002:a05:690c:9515:b0:7ec:58eb:bf8c with SMTP id
 00721157ae682-7ec58ebd890mr10873247b3.36.1780582555081; Thu, 04 Jun 2026
 07:15:55 -0700 (PDT)
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
From: Yash Patel <yash.pateltx@gmail.com>
Date: Thu, 4 Jun 2026 09:15:42 -0500
X-Gm-Features: AVVi8CeD-99q2boKBWXopwgO7VT6TyM2hqBHxpHU320jz0qup38Ydm7mEgyVe68
Message-ID: <CAGwee5_2x89EVnnkXpV3_NXNAPqqjOx1sknC7aegU5Zui+bjVA@mail.gmail.com>
Subject: Proposal: Utilizing Container Registry for Shared BitBake Sstate-Cache
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hello Team,

My name is Yash Patel and I'm a summer intern at IBM working with
Andrew Geissler. My goal is to start storing the sstate for our
bitbake builds into containers and upload them to a container registry
that the openbmc CI process can utilize as well as other openbmc
developers. This will make it much easier to bring new build nodes
online and to reset bad ones. It will also allow openbmc developers to
be able to quickly spin up a container and do bitbakes quickly for a
target machine with the sstate already pre-loaded.

There would be a container per machine type. The default machines
supported would be what we run CI for up at
https://jenkins.openbmc.org/job/ci-openbmc/. Supporting only a single
machine per container will keep the size of the container down and
most use cases are just building a single machine. Also, a lot of the
free opensource container registries have size limits on the
containers.

We are thinking that the
https://jenkins.openbmc.org/job/latest-master/ job will be what
generates and uploads the containers. Currently this job runs once a
day and builds whatever is in master at the time (we could tweak this
schedule if needed). We would then update
https://github.com/openbmc/openbmc-build-scripts/blob/master/build-setup.sh
(script used by openbmc CI) to look for an available container and use
it if available, otherwise just default to the standard flow.

We would generate containers for both x86 and arm as they will have
different sstates.

We've done some research and it appears that github provides a free
container registry for open source projects so this is the direction
we're thinking.

Any thoughts or comments appreciated!
Yash

