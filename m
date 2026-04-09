Return-Path: <openbmc+bounces-1800-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FEDF45A12
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:56:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsywn4b7Hz2ynP;
	Sat, 11 Apr 2026 12:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::132d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775713504;
	cv=pass; b=ODEngOraLWDzMOlZaEF22BlhIRmnzt4LZ8zwwcbLFBZzznD+6Bjs3VWImeoZhNIbHdBKLq78BUQXABr+RKzaManLX2hSmVbBIrroMe/AfDr7NRcwaR/5n0dVK1T8hxupQMu1b6GgySJt2/C4WTdBIPUuH94AVpZOM3XzWEjyH8pX3tUYJW2E0E4VOWMPWRsOrg8A7DOazNakvwBtwdFns11wZYzXbInxzf3sou+1daZDh4nBmUT/Dmivwb7y0szNF/kLL2LhrPAm4XL1QdcdA0GDqpfL06TwE+wTIkR2zeTdoshxhpbxxjCcjFfrWwj6ImplBnlponeYLM2XJizuNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775713504; c=relaxed/relaxed;
	bh=AibrwStDJsk1O26yW6Xme0wvcI/eoLurkGarn21izTI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=G6whD/Lg/bxYCiceokXBAoUo3rAqk+DEpyqe4gDVY8ClK/gHPrfqXn4l1jX94bB7hN1sAbVxckILrMgRgyO7cpz9Op+uG0ICdkkaKZaX4pcp2hcuzgWczJASahYULlTbcHLTmO59KxKTkfT30IAmh6NCYj3Q4CplP3bMyj1v2xD0W2MeZ2N/Hqc4o9++B2hdxfZJ4H9c5e2Ri45QL3BlL42sWqkFAxW7B5pyjhfBLPXqbfYaCp3v3KzhzrJSOPs9CFrcN3nB5YFdLyPfyYi1tXnldM/8sQv/lP0XuK5jO+wMNkwOXpoO/w+xmN+531XfLIn2AhRFXTSN570B63PQtA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlVWDI1h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132d; helo=mail-dy1-x132d.google.com; envelope-from=maoapoot@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlVWDI1h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132d; helo=mail-dy1-x132d.google.com; envelope-from=maoapoot@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132d.google.com (mail-dy1-x132d.google.com [IPv6:2607:f8b0:4864:20::132d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frpmZ2lxXz2ySc
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 15:45:01 +1000 (AEST)
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2cc4c693d59so759760eec.1
        for <openbmc@lists.ozlabs.org>; Wed, 08 Apr 2026 22:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775713498; cv=none;
        d=google.com; s=arc-20240605;
        b=DMxyQAfnhhLehYzeo6RE1USIuCcK75Ck7VPbJD9ghIONnjCl+5Wr2V1CwsnCm4P12/
         BP1CwN2xrG27NAXHF+PyA4scoCkrX3QAao0iWzrbko4K0W+5E8f5G7xL3z/Qweht+CEj
         0nIYg0jyo51M1mSmQRxc5koGnlyTOPKUtj/0kCh9eml8hwFxgINe3PGg4f/pusG4tYcB
         5krwUoONWS7w8lMAFreGzg5/dSKhg/3/+lj6DfDa5McfT98uVs2R+okwKLAJuE6pziKq
         y5EHHbZbvymbLMLwTiA4pEBENBT37TxZCTz/E46zGzZqOQ+MafZ08vdo2IcIK1AYRZAB
         sr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AibrwStDJsk1O26yW6Xme0wvcI/eoLurkGarn21izTI=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=M6FuQ4uaZRP2X6wHxc2f8L36rGvF3OnS5jVYV0rUtPrIYmf/PprXC2UNboWoiH/krM
         Zj6xOk6eklMtK+vjphCCRHdGcwMJiG+tNPfU6YITCTXXKUhG056ueSDhd0U/IeyXCjGp
         jtYUC9gfhkotH6YIytKo0S60ZtHgmWx2kuYjlojlETzT1PTBlH8tLPIxW4yOjMEBC+oD
         uJb6n03ZmYARSPUyCuClJsQ+vkPdS2TlU4iduSHst+WeZ1qKkXfJSelDRvU8270KKmT8
         ekN3SxtSWLQMa403MM5bu+XRbBPA2DFDmmf/FCcNKqJbXwoFZP5Lc27/uZtljRA6i756
         q5CQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775713498; x=1776318298; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AibrwStDJsk1O26yW6Xme0wvcI/eoLurkGarn21izTI=;
        b=rlVWDI1hWRHLXnj8inscjcy03b7bZtfm1kWVSKsNOao579PkrmLyBuURCSpUxue+1o
         TT1I2cwjq/wzZASqe7JhRQMYeGRY7qWoWjUZV/hMJU+vHlvuxVm8pZPVG5uUl2rPaDf3
         Z+t+Kbz3ucfftSKAOQ3Dh16RqkTpIp0r64izRcjKqHg2IdNw3VmBPkmbTxmsyluMzXtJ
         DU4pMK01vC5mV3fpY19H3k1b11lLFjgFbQZ2mOCA4G8SSAoV4CLkzXIDIayeD4jXcra8
         AgmA1UHgSLZ93evxaroPZrWUXnie7bZ/Dri61VkOIT7ZHg97kKYCwUok3nT7LOf1bqPp
         WTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775713498; x=1776318298;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AibrwStDJsk1O26yW6Xme0wvcI/eoLurkGarn21izTI=;
        b=Mc6dlVWCElsf6u+BCHRZVRfISnlA6qB9oL7wZvzs971LNXCK/D569NghK7qkTJzMx3
         3gap8Dlo15182XGnjfArbp3t4BnYLvK6vqBYioZ+irp0YQ8+aiRePhjAnyXDSIZmB9tX
         YvWyidviBfG+9fkouly9LT8PafaDMk/GLT7cuVjp5NBr7WHhCu9CYmkAJ0dCgyp71DWa
         /STu8Nbi11lW9P9hxGt+yV/j8I3Ijf3WsqqaljwJp4Y0zuhpTZWf/IT+/hylSA+oyYaK
         fivnKwr1FHBEto81o1ae2ymtTHCJCbqm74zQu3mqXOJidHzoRTn3PNY9AAXrJTRsuW/P
         5IPg==
X-Gm-Message-State: AOJu0Ywj0h20stSH1mie3t7LCiP06hNgG0sYToMVEHEaxucAlVJWAGzI
	bONdRjz/4wwKa7X7tXvRqivrCOys4enJlmSb7QPJFTX+bv0nhJt5GYAHkvs0BXlGgvKueCufp5+
	Q6FYejLkO5wzN5BCGYc5tInABwQpXbQnizSjj
X-Gm-Gg: AeBDiesmgEvkOqX5qlngR1N6mrEOeoAcP30yh8yh065FuI9CLhlBHvR+sknrZKIHIBp
	DaRS56JreAU4TDnNw0ySd/Yugxp1gJOuFspCq8t3xpwaLtkVPxcskuqBuaO1bIfdTKD9mBel9zu
	uvf0MeFYz0Yfb7kNgda0R1XTfDzTsI4owoP8wLJF9kQlDtvHatJA7k2zDzFdAlzQ6ai9JVPp5V2
	WSnrxOS5AMR/uLwPn+GncPkSM925zhJy0fiCe9lWNk9XiUHJaiDr9rmE9BDYHJEzW/zpaH+H3o/
	t40i5UA=
X-Received: by 2002:a05:7300:7253:b0:2d2:129a:1682 with SMTP id
 5a478bee46e88-2d40d906c3emr1481919eec.16.1775713497902; Wed, 08 Apr 2026
 22:44:57 -0700 (PDT)
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
From: apoot mao <maoapoot@gmail.com>
Date: Thu, 9 Apr 2026 13:44:43 +0800
X-Gm-Features: AQROBzCIWs0Aynk8KHoYp0zW_5BOmnN33dn0ExHCiOEp64BStTrAxMPlq2-msec
Message-ID: <CAOnE0XdMCnnkNasTrSM+4kg9VggEYU566mTc=hs2nxCOX+G_Vw@mail.gmail.com>
Subject: Request for CLA Agreement Permission - Gerrit ID: 1002899
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000043f056064f008442"

--00000000000043f056064f008442
Content-Type: text/plain; charset="UTF-8"

  Hello OpenBMC maintainers,
My Gerrit account ID is 1002899, username is MaoApoot, registered email is
maoapoot@gmail.com. I have verified my email, but the Agreements menu is
missing in my settings, so I cannot sign the ICLA. Could you please help me
enable the CLA agreement permission for my account?

Thanks,
MaoApoot

--00000000000043f056064f008442
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 Hello OpenBMC maintainers,=C2=A0<div>My Gerrit acco=
unt ID is 1002899, username is MaoApoot, registered email is <a href=3D"mai=
lto:maoapoot@gmail.com">maoapoot@gmail.com</a>.
I have verified my email, but the Agreements menu is missing in my settings=
, so I cannot sign the ICLA.
Could you please help me enable the CLA agreement permission for my account=
?=C2=A0</div><div><br></div><div>Thanks,=C2=A0</div><div>MaoApoot=C2=A0=C2=
=A0</div></div>

--00000000000043f056064f008442--

