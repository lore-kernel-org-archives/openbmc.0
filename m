Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BA3C83F33
	for <openbmc@archiver.kernel.org>; Mon,  4 Sep 2023 09:22:37 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kJ4ZRZEP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfNT75MVBz3cDl
	for <openbmc@archiver.kernel.org>; Mon,  4 Sep 2023 19:22:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kJ4ZRZEP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfNRb6kszz3cSY
	for <openbmc@lists.ozlabs.org>; Mon,  4 Sep 2023 19:21:14 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bcfd3220d3so16585371fa.2
        for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2023 02:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1693819267; x=1694424067; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ha9sUYvRh2ep9qRR294/h7q2b3yRzKcbwcbud+2C53I=;
        b=kJ4ZRZEPpqbRWGWOGQMkVwBl+ioqwfj+ls5UMot//Eac+tELbL6K4SSqeNXeIxB2Sr
         N5T1Lbo+66zHqQABQpKobuxJ8/M0dwAU1PIVVzNi+2qc8qJIidxFH7sV3MMDx3D4rm2V
         CZpc4U+l5CgO6XrErrWhPrYEYGHGBJfe87Oic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693819267; x=1694424067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ha9sUYvRh2ep9qRR294/h7q2b3yRzKcbwcbud+2C53I=;
        b=G4odH+vPbgM8tBzMAAoiGDZmwVjJDme/UAs6UYudh0yEYibD3fpuTNZ1PcIMljXlSw
         vPCJepchfA8YS5XNvws0ZKT1TSOgXpw0tLxYuqnMDCz8+zjK0h5rg/DqtxczxXZn6Vx9
         XiViBQKlFJTMuXngGro+QVkKunxVrDUf/X1uOAl968GXvRhriUoald1fCcGQKQPVJaUv
         j/KnGd+sNtlT7BGtzfc8Ag/nuthAa8ly2p2eYz9siyyvAUf45JKVMJNMboWIw9eCBC+w
         NtSJr37T7ekxOXBImkdRT4kJwuL86lHmGjtoneoUe1LUC0e8a9k9OJeuwvBIjWqQ3txu
         3Cyw==
X-Gm-Message-State: AOJu0YwdVXK8teE3CzdFqZYPH50JHs7Kj6SHTAIgWVaFsmLzQDHOrxh8
	YzFjh5piQ9qLMDFopG4R50l41jYhe9Z7Q+O7qZw=
X-Google-Smtp-Source: AGHT+IGYM/6yoTQkRntxxFpiU9W9SIuwzhMGBT/CNBVH/t8VQtsqnxYlnnsDp/ORvlN98kTedGYaUj42mXSbjyqPzio=
X-Received: by 2002:a2e:b057:0:b0:2bc:beac:53e7 with SMTP id
 d23-20020a2eb057000000b002bcbeac53e7mr6501309ljl.14.1693819266751; Mon, 04
 Sep 2023 02:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <4ec77ebd-7f58-9ec4-6eb7-b77f9b23fe52@gmail.com>
In-Reply-To: <4ec77ebd-7f58-9ec4-6eb7-b77f9b23fe52@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 4 Sep 2023 09:20:58 +0000
Message-ID: <CACPK8Xc3+4QN7oYAvJr0bGddNMwqOSao55ATaaR4ffrpaQxfPw@mail.gmail.com>
Subject: Re: [OpenBMC] DTS file path change in linux upstream
To: PeterYin <peteryin.openbmc@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: potin.lai@quantatw.com, cosmo.chou@quantatw.com, peter.yin@quantatw.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Peter,

On Mon, 4 Sept 2023 at 08:37, PeterYin <peteryin.openbmc@gmail.com> wrote:
>
> Hi Joel,
>
>      We've noticed that the last DTS kernel file path differs from the
> openbmc kernel in dev6.1. Should we proceed to submit the DTS patch
> upstream, or do you have an alternative suggestion?

Yes, I have opened an issue as OpenBMC/yocto is unable to cope with this change:

 https://github.com/openbmc/openbmc/issues/3951

Once we have this bug fixed, we will move to 6.5 as the openbmc kernel
base. I expect 6.6 to become the next Linux LTS, so 6.5 will be a
practice run for 6.6.

The 6.1 tree will remain open for bug fixes, but I do not intend to
accept new machines or driver backports into that tree.

Cheers,

Joel
