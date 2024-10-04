Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F190ACF34DC
	for <openbmc@archiver.kernel.org>; Fri,  4 Oct 2024 01:45:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKWZj5Bnhz3cS3
	for <openbmc@archiver.kernel.org>; Fri,  4 Oct 2024 11:45:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728006313;
	cv=none; b=mb9gJmd+xNCpNtAlHQHBzbzuR+/hFWPJsm+F7IzaLRKx2rWxPykbzhaFK/iP4VTZ9pL7VxuFo0UBcpNvOGCI8fBAB+o5qchbjLzifzOPafAa7uhnN+cEVDkaiEk/3hI2dj/F5tsMtcyZXaE+sC6FXfnWxubJhM2gtxHOlGMwFRaXEh04zeguZ8ie3ROLls/96ki0Twl2DrYbitJoLMV4Hg5QYHEduK05V+6p2gQnBP4o+oeiC8yggQgNGWTAHhDlNgcjVqE9wCk+qkIWZGtzcyKfk+IlposJPguqnDyrNvG/lIxRcf/9MsGtaxd9nKgy30LZxmvWxJ9nQqg6/6XX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728006313; c=relaxed/relaxed;
	bh=dRI2Il62UAfyDHeebNL7M6bB8VH+L673JhKSjWxVXHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBhtlPz4CqFcO5B/pJpfCMzNDgwZKnFfryk+xIG+8eSBas+ZfCsTCrK9BQR5usHGoZrEF/EGTHDHxQN/afYtfivfdcPPPW8Al6oif4Q7+aOP0nJL16ls9SslK/hWK1UXJx/MP/KtknTlPNmavTuCPurTwtdZ6hGtVX6otR4nadlyf353UdVVTFcCHJTWHYL3e2kiZAy5UzmJHrwl5D88cI+v2N7+B4XeFfLIU4AxZtWHaFl0jvvXNYruW4RHm9hCyjn020sfY7iRHUXxfSh4AAv0ccrUqg76OJrPagg1dX1O1vqZOqlt3eDEeZ6bkrzoZPkedGVsi4OkumibjmLAKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rvo2r+8E; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rvo2r+8E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKWZb27Szz2xwH
	for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2024 11:45:10 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5c89bdb9019so1848533a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 03 Oct 2024 18:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728006306; x=1728611106; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRI2Il62UAfyDHeebNL7M6bB8VH+L673JhKSjWxVXHw=;
        b=Rvo2r+8EUS/9lkhFIV6l9n7qUFWqx9dtL8ndAwq400Tb86mF5q1NZfGloaeXPbpjPF
         10Sut2xLjXjVvWDkuYB4ZMjwRVpVV9kUczUeCx8II+MpQdDTe4lA4ymbo7SARR7LRScv
         sw3HSw0zVN0T/hLUvKD4SBkC2pVKffw3qZ+Ye8Y3eiWMk6vuRtGCuS3EDkd65AwisHV1
         42L3hdVDeTF+vf7y3hOU0NR3OzEuANnEjMedZP9DdNLwTJ1guAarP1bebx2KpSaCigQc
         /CB2gOxNjAB3ul4aXCJSPcZAWC8SNDzoJ5wTSQGbAtYoVMqMN4tOe9Hk1/DqGEgNLsqa
         I4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728006306; x=1728611106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRI2Il62UAfyDHeebNL7M6bB8VH+L673JhKSjWxVXHw=;
        b=I5Xal8nqvH4Fu6TZdQHGzYL27zJxfZpCe+HuReeY8aNwfl/WlhAOVh5K76iDOj2kHp
         i2WzkrfSCPbOLsV/FLlSEy6E6ZV2IuRAjHgS73Yen3rQPgf1DNVHyQVVN9g36xMO/kre
         D3f/uT73MFZ4kwgzuaRK3eGDRLC78TCroG2hM0XH3sxWETqDznWeheaJB4W8arEnPt+q
         F8iLw5aIiRuhDB5pYfdqXpNfu+P+ysRn6pRD306tUOpEUqAKJ3DkqIuy2ADlhu0qpHmu
         GoWhGpB+PTQFx/ZlgEHmGlai/pU1qkkNsSqsGtKySdYfKpNkUhCWbCCYn2aRD8zDcMtl
         LLqw==
X-Forwarded-Encrypted: i=1; AJvYcCWWxbwa4aojiADK9LGm9AmMlSn23oPnfDq050GZkJ9tBeA7jvjHC+NBlLqXPTcz5rBM7f8S7OZu@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7n0J3IcUji0lGXYkNLZ0b88qhXWVf8YJu8pXHxQBLf9jwrhPM
	JbLMmY2vBqkyy7Wk7QC6MMaTfZLg/otmV3cKKfOMSyzvo0ne/YiFsh2O0aRS7UhAtI0AwFYmwa9
	RYwaikkMwr8BymCBq/+RWFwW2KA==
X-Google-Smtp-Source: AGHT+IFSm2nBg9gUUpBfHWVXeRjIe0yYzQSwipt/YKlvygbTx8qK062Iy8NDRPf5361rguU97G4YSoWKWU9ShduSQ0c=
X-Received: by 2002:a17:907:e2ea:b0:a8d:5f69:c854 with SMTP id
 a640c23a62f3a-a991bd44726mr89559966b.24.1728006305584; Thu, 03 Oct 2024
 18:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <k5ifxaqtm76aorvxur6kl7j3pnfc7qmvua7mq64pobg3tiabvu@h2ygjs7ieidh>
In-Reply-To: <k5ifxaqtm76aorvxur6kl7j3pnfc7qmvua7mq64pobg3tiabvu@h2ygjs7ieidh>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 09:44:54 +0800
Message-ID: <CACD3sJZEqt0i6nz2gwQOwVADTaJtTc9MTQqAUFcP1kwOWWyQTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] i2c: npcm: read/write operation, checkpatch
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Andi:

Thank you for your support.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=882=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> > Tyrone Ting (5):
> >   i2c: npcm: correct the read/write operation procedure
> >   i2c: npcm: use a software flag to indicate a BER condition
>
> I merged just these two patches to i2c/i2c-host.
>
> Thanks,
> Andi
>
> >   i2c: npcm: Modify timeout evaluation mechanism
> >   i2c: npcm: Modify the client address assignment
> >   i2c: npcm: use i2c frequency table

Have a nice day.

Regards,
Tyrone
