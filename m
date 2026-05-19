Return-Path: <openbmc+bounces-1973-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D121CD4F5B
	for <openbmc@archiver.kernel.org>; Tue, 19 May 2026 20:26:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmRQ6cg7z2yF7;
	Wed, 20 May 2026 06:26:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779210842;
	cv=none; b=m4XtLkEBKoD03YrrOB+FNHLSas2cKcAwcVyA34l33C3igUm9V55hqSHfr7NhrD8cMplC/H4LQ3UyWyonhqDqjFsCGxYkmbGUORIVJF9O+m77aKDgR7krkd7U/75NyeRirkw9dy7WLThaShBPZ8Y8GbSOW9Yl/yUgXgOiLuIEaJTHhRft/zkxja7VGyxVTDHyZ6YbI8Ryd3bZHz16IsLHM69ATTqx6mvs5/oj041noIzR6Om1fxWg910Fcm2vZev8wsaj0altNxHQ+E9GbgZapk0Q//WzWVvJrd97eAD1p+tqhTGGowx4h5/YDs9Rw7UF4z+HeWxBCE2pI2Zrcp00hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779210842; c=relaxed/relaxed;
	bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFS7gJ0KnHw2J8BHIRgs1EuKEdizgov1CKch0cNfEyH+g7uVza8Swe9Xj5SLYwxSm6dE6q3wUspRrWUiiMGuoGGmNWFR7nrXP2H/gYaSNn0alFlkp5WPBN4aOorUIKULOjNedNaKZpBoTb5FcdDbBH0UhNbI755eXtqAwHPrW4OBdpk7bjYxZuRS9xrhe9Kg2cUWhdqrxp7KeKOetl7m/PmU0O8cdqu8/JM+pukz+DVE9J+i0zsZR/y6pnIN+B+ZWf4l3vqa1OozC8VGtEK7GvtCyxIynQrVudggx+lJ5yeD6pTAJmqsKIQhn6cUQhC+ru95rFlbJ6+RsIv2ZIepaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSlNce/I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSlNce/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKh943052z2xRw
	for <openbmc@lists.ozlabs.org>; Wed, 20 May 2026 03:13:59 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso33233915e9.2
        for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779210831; x=1779815631; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
        b=TSlNce/IyZ/oA+3TPdvCaJhkiz883aS6xIoG2p9ECC2GN1BIO3/yj38A6ZjVRk0xrF
         0To8iddyNWAU/zhiITdy6by86dzfR4Smw/atIasQmsSZ2t7Shli1mD9qcxhYrbTeExRg
         wdcpHftkWRIpfNKIXN6qCJeGC1ZgEC54kxoAIkDXMmKQNDOAbxhQlYXbfDfUs0iETN39
         tWCIPNVtXf8e+XHn0V1DveII2jYJUfAKZhXxUCyXASghY/x7ktRA4P8Tw+NjWHaD3ruX
         TVutuqm5LkGXLcSq7GZrnLwZyQs/E2Ws4Swhpt9uevH68JocS7h6oCseqRtsBLZrnOJk
         keBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210831; x=1779815631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
        b=cJ8PXTy7P9kIvoM3OBi4VaDuPg8YfA5On4UsiFVBjNB6UmWov9aoK1sZgjbgZfuuWN
         sxA+wKBm2179AvqXjTHXXoUpwI/0hbtiC1mUdTF9iUYaWX4HUGhe5MsBbZTP4VPnH4GN
         1DHc3sEHzJy1ryzPJ2fkoMZdroaX+Kov6XI0X7nv7aQ2AjgZkgdlj+qszZj+Mn0VmkE1
         eS3ytuqzWZG65VSPg0BIMk6lseNbQyyyS3vlBlF4/mMbkfoY7hIStcnQSwC1ijSMMHmo
         9gCNarCsAGvtctJJnGDwcTcNWJuKNvKcQkGlpDpd8LmCxxwo5a7KdJvxyGlZEm/HGUe4
         koBA==
X-Forwarded-Encrypted: i=1; AFNElJ/zJ0yqKmAjOwOtcN4hKHu3LRDQGK7F4KPPBrRd6X2xK0v023xloBVZwRIaRyc+317bdSgKzTsk@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybXu3SYNZS/V1r8J08H5REH0VQBqPI9Dz9KOHG0FJLNQ41m1pX
	cxHe/TmDLI9qM6gZG6kq0kGCNoU8kTliVo1AVj6QGYAFqurrYbyYz/Jd
X-Gm-Gg: Acq92OFJspvJz1GDZT0yvJIzo65OQrI2kmdvW/UhdgNQcuDV5B6WaqPy6OuNXfO+QXo
	Ki/JCKRhWnHOYqeIKYyJpcDZCk/UDNM9M4IYu92+ibfPC8OI3CspAzSgkcviopBxCB6qfoEnnNS
	UoNpeJnaAe8w0udn2NiIPSm2WPVL7HsUknWB22aIrcFM6ZBHWuHTb4nc0ZSqoltzOCMfQr3pFsb
	KDuMa6Be3AWtqD8KVmwa8f/RrG70mQSNXjgvhyhN5VpK7cM/Ed2ErMu/TMgFjlbd9ZqakaRlDWz
	4Lm/6dEn7TXnQk7WqhWLhVdux+jjhFRZUBwfj8tEHMpN8xiTnA7P5WaC3U7b/diNpH3uFaz9mVS
	Ur68e0DeFSNJdZVWkx1kVTPkhMvoENCzSg4xZc1M9TAkwTYmAF8keEu4k0Pq1Jkc5f1AkwfOQnE
	4lZrkeXVap3Zi14/lQ8X2JtmOxgKcQEgzFnER/sc8apezQs+vOENfk4FmYHRBlw/nU
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48fe60ed7b7mr287651375e9.10.1779210830786;
        Tue, 19 May 2026 10:13:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e7c22d8b7sm17989013f8f.6.2026.05.19.10.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:13:50 -0700 (PDT)
Date: Tue, 19 May 2026 18:13:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, clg@kaod.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Message-ID: <20260519181348.777f7dc5@pumpkin>
In-Reply-To: <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
	<20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
	<659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 May 2026 12:03:51 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, May 18, 2026 at 05:57:08PM +0800, Chin-Ting Kuo wrote:
> 
> > -			while (k < cols && buf[i][k])
> > +			while (k < cols && buf[i * cols + k])  
> 
> This really needs () to make it clear what's going on; the precedence is
> well defined but not everyone is going to know that off the top of their
> head.

Come on, it's multiply and add - everyone is going to get that right.

-- David

