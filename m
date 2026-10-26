Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7FF606A32E
	for <openbmc@archiver.kernel.org>; Mon, 26 Oct 2026 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VkVC69Gh
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jCrTQ2kxpz2xLt;
	Mon, 26 Oct 2026 22:08:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::112b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793012906;
	cv=pass; b=nNFdKUF19VdnLDhT5mHUe/+HQk4LdjTLYco8P3L7E0esSPpE4CPC0vfw6Mn1JpogMOk8C3FmchT1u2R3FrsWjDkoJcAmkA12QZQtd/ik9c5LwjndEa9D9qafk9oS/C9m90Y0JZ8xWKNRQ3ugqb/kKtI++2L6PmN8jy9HVdaDCx0dC4WVw7Xrf7dsbZHWU7tZwR+/rcYRfcZ2ddzs8Bzy6woJ5qRK3oOKvEkWbjih7Vx//h4Lf4sav+51Gk1I0MVRvVffW4EWApW2l0CpjzxiOzGOZBajkJRRc2CQsafDO9w1pH7MgtGBUsevqBeNFWAit4Dl/LBJadHMu7mIjGMUqg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793012906; c=relaxed/relaxed;
	bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZexmsiYq1MQv2dC1ouOARS8VNXVBIT6xWHcUWoeIJJtfpQSFP4KxDYBis8wxCoyXTiLax4sV56eyDWARJZsK7YNf38L/WsSkjt5nzk+GYhe9IMwPORLmYoqFCn136WjX/GdP2gz0aCugBB5QwSPbC3aRj2hmylOTtlOprhO0Ind3uzLeyAB7Kp/NLt6qcfCQ/18vsvlh0h/VIa5gYcOnLFHUOlAtstb2KQhsY060bqL77DkGw+Xxgpqm4qmeHTJcuWG9nGijYHr3T5Fsvf/EEk5FABIMv4FpuQBX7LjV+u50fZqrL0YypuKqukL1jGIH6+twKqEF6K585to5pavyA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VkVC69Gh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VkVC69Gh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jCrTP0Sltz2x99
	for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2026 22:08:25 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b0e21048f8so24598067b3.0
        for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2026 04:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793012903; cv=none;
        d=google.com; s=arc-20260327;
        b=JAAdeFr3YgCUaeFSch6HKbm3KSW6MYUjqd2Iw49fnFxI/Qse3zg6NG/5RSnPkyH2yr
         nQhq+n/4XPEN6MME6MkVPB7dKpK9QpFqXzyLZISWtOJEukCJwaJXxkE7vuEcllmJKvFp
         TN9XuzAkZIpr4O5tWm/d7vZhPN/Xk0p0zH2A6AKCJF5AaFxZrJncRbuXxJzqdJQxjsp/
         4xjjgGSpT168OxbNxz1gT1gUoFgFp7Hlnkiol5hSBS2e6PmRIdfy2u7M21++72wFGrre
         +JZCgQHc46yuWzFwfR/0I5ZKvQBEFCj+yyWhOtd3IXnL7tJGPhQvtRH1t4ShIOqqC3vJ
         CLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        fh=osMhEtlgtiVEZl7Mbjkij6oVJCWr1oJFbDw3roUjDPk=;
        b=LLop1diTR/fn+u+sMT2qkEFOOOXy1p5SVY2d/fiq2fZHEWQayrMTzNMGcXWPKVIhHV
         fUNerbHTz57tXgs0caglAFIpD6rBgbDfJh1sphDzCQ5W628auzbkfKPtxVS/TNtofcTq
         pHeVvmuqyQR73Qo6b6Oam8XS8GFYAL6I9v+jOeH2HQDTKWtyfHmjl97REyAqQwM6DMou
         Mgh8/PMr65s0pSbRJMXtwHzVvtO9Ww+lx2X9X0tnzURgo7/tlnwsssrx+EK/GUdVrI7J
         lL3MiL6kNtQHXrCnZPhiqqQ0MgDtuwtVPMA6AoKbFdJgUIvtEWTMpOVwWiW7/vD7L8RD
         6zGw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012903; x=1793617703; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=VkVC69GhGnQSUuuaJRML6uzfxXefuC7GQedx95rb/h51Gp3nTW2zbJ609g6rLhu56T
         6VKLO8IcliZNW2I0b0kQUgfwnhadRsWrCee2z2AakblfJfYxbcHpdOuU2fLzOYjXEiEi
         kWowYLbcqZD0HENKKZvgBxgcCZuWG7IjIC2JVMq1jRf8+CV2ZW7P+PaHNLblqN+awF7K
         /mfeG3gN62GEcuG+5G4LqRcihaUoaNODamq159rS2yvkk8nBLyc8LwbviTbXnz1cf9b9
         XKY2eReIam6PtBdtIarFJZnCLwlYWqYSy/geiG41UNz3I9YM5uFU6iilcxcQKxz6r/Fe
         FQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012903; x=1793617703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD0Lls83Il+mQLYthxWqSv/YIy5kSUrF6JCqhkv/8Wo=;
        b=bhKAgCMrL2vh73PhuIozW9vKMppFQnT1lWmhekk7o689NRSkWYmxq3wC1OpMIthl0Q
         gGXutIibO8EKtSv0c1gv7UMxmt4p4FQBAOiEPVJP09sauYVhOXLtK4308lnnkmaGv4sX
         pFLFRt9sQ175Pv2ErQqkFzNTNktx09B8dygx0bsbZtJfWfr+FhsBjWKip4tHhejRk+f5
         XwG/bpybf0x69pY8jN5tCgRvC5galiDcKBKWtWejk/JB7/gT8tOh/mvcOakthrXcOq7H
         VdfhNpj/TfwjTJbBrULScYjsRmmist2dqVV8kZQmkbxX90r0yMEqdSoo2NewPdwApMDO
         fPUQ==
X-Gm-Message-State: AFq9FYLgBGV4pWhswcuKcqWr3m5X1btkG7XYztTe0ITpa3rg26+KcwBf
	zCLyDW7es3OFIKHrH9T7sU6E0KLQDNnJHKfZlpBhvLdTYyJteFWULWQm2tmmCgk+FakximYH9Az
	56s6/TUXNPwisLsFJpxzdCZRoGs9qzjY=
X-Gm-Gg: AYBFou00lwzzHKNzUun+5EC7idHmBStKH1g88A4Oo+bG3Qc8CsbgBKDWJEihgzPOnFD
	bFbe4MBJH5Qoy/QmEd9Y9ri49SRgy0pcppfEPdyf5YfqK7QgwR85LTFJ+5oxQcRLgsqDrYnWg5q
	pkITErHy4TErssW6/HfTXqc+0ojVDgbMmK+/plx3asFhaExKwXcIglV1NLkp93RA0cl/KpxnCy9
	dXn2xGjCD9YCS9IUB6aTvkEw5gfhVPiOX5bAe+5yIDD7adZ1ZJCGG034ZWKsEZAC4igodshr6uC
	b4riyaPjjfDNhfudTHngnTVInLYdYsFiobxmcIKRYtBlXucCBUSv0aEWWvqkK9DFrIgAJNJJNR4
	7XIFTKsdlactViJC/YsoCFF/1mTPKrfxHFz0d/Q==
X-Received: by 2002:a05:690c:c50e:b0:8aa:148:7706 with SMTP id
 00721157ae682-8b1669caf65mr45460507b3.8.1793012902608; Mon, 26 Oct 2026
 04:08:22 -0700 (PDT)
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
References: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
In-Reply-To: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 26 Oct 2026 16:38:11 +0530
X-Gm-Features: AclHuK8Cpr6C86Ogdt3iNPcZespgzJH98h_TGBqL0O48_bvZRHN6DW3ckIu6Ds0
Message-ID: <CAMFFDGgygzu3OdFkq6+ztZOzaFMMTdYFqtkvmOtHNovQvabXQA@mail.gmail.com>
Subject: Re: [OpenBMC] Guidance on Getting Started with OpenBMC and Choosing a
 Development Board
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
	andrew@codeconstruct.com.au, changhuang.liang@starfivetech.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Mukesh Rathor <mrathor@linux.microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Alexandra Winter <wintera@linux.ibm.com>, Julian Braha <julianbraha@gmail.com>, 
	Karthikeyan KS <karthiproffesional@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kavya,

Thanks for sharing your platform details and starting a separate thread.

I am also Working On OpenBMC through ASRock Rack B650D4U enablement.
My work is still in progress, and I have not worked on the Gigabyte
MZ32-AR0 or evaluated development boards within your budget, so I
cannot recommend a specific platform confidently.

For the vendor-restricted shell, I would suggest contacting Gigabyte
support about supported debugging access and recovery procedures.

My practical recovery experience is limited to the ASRock Rack B650D4U
that I am currently working on. I use a CH341A external SPI flash
programmer for BMC firmware recovery.

I have not worked on the Gigabyte MZ32-AR0, so I cannot confirm its
recovery procedure or programmer compatibility. Please verify the
flash device, required voltage, and board-specific recovery
instructions before attempting external programming.

On Mon, Oct 26, 2026 at 4:07=E2=80=AFPM KAVYA M M <kavyamadarsh@gmail.com> =
wrote:
>
> Hello OpenBMC Team,
>
> I am new to OpenBMC development and would appreciate your guidance on get=
ting started with developing and validating an OpenBMC image for a server p=
latform.
>
> I have a few general questions:
>
> 1. What hardware documentation is normally required to develop a reliable=
 OpenBMC image for a new motherboard? Are the user manual and BMC reference=
 schematic sufficient, or are the complete motherboard schematic and board-=
specific signal mappings essential?
> 2. If the original BMC firmware is available only as a binary and the mot=
herboard schematic is unavailable, what is the recommended approach for ide=
ntifying the hardware configuration and developing the initial image?
> 3. Which existing OpenBMC reference platforms are suitable for beginners =
who want to learn the Yocto/BitBake build system, device trees, machine con=
figuration, sensor integration, and required services?
> 4. Which hardware platforms provide good support for testing sensor monit=
oring, fan PWM/tachometer control, Redfish, GPIO, host power control, and p=
ower sequencing?
> 5. Which functions can be tested in QEMU, and what hardware documentation=
 and recovery facilities are necessary before proceeding with physical-boar=
d testing?
>
> Request for Guidance on Restricted BMC SSH Access
>
> I would also like to understand how to access the underlying Linux shell =
on a BMC when SSH access is restricted by the vendor firmware.
>
> For example, some BMCs provide SSH access but expose only a restricted in=
terface, such as SMASH-CLP, instead of a standard Linux shell. In such case=
s, what is the recommended and authorized method for accessing the underlyi=
ng Linux environment for debugging, inspecting system configuration, and un=
derstanding the running services?
>
> Are there standard OpenBMC debugging methods or configuration options for=
 enabling SSH shell access during development? If access is restricted by t=
he vendor firmware, what documentation or permissions would be required to =
investigate this further?
>
> My current hardware
>
> I currently have access to a Gigabyte MZ32-AR0-00 motherboard with an ASP=
EED AST2500 BMC.
>
> I am considering using this board for my OpenBMC development. However, I =
do not have access to the complete motherboard schematic, and some board-sp=
ecific hardware mappings are difficult to confirm from the available docume=
ntation and original vendor firmware.
>
> I would appreciate your advice on whether this is a suitable platform for=
 learning and developing OpenBMC, or whether a different, better-documented=
 development platform would be a more practical starting point.
>
> Request for development-board recommendations
>
> My budget for purchasing a BMC development board is approximately =E2=82=
=B95,000=E2=80=93=E2=82=B910,000.
>
> Could you recommend a specific development board or server motherboard th=
at is affordable, well documented, and preferably has an existing upstream =
OpenBMC machine configuration?
>
> Ideally, I would like a platform that supports learning and testing:
>
> - OpenBMC image building using Yocto/BitBake.
> - Hardware sensor monitoring and integration.
> - Fan PWM/tachometer control and cooling failsafe behavior.
> - Redfish and other BMC management interfaces.
> - GPIO, host power control, and power sequencing.
> - QEMU-based software testing followed by physical-board validation.
>
> My preference is for a platform with an existing reference implementation=
, accessible hardware documentation, and a reliable firmware recovery metho=
d. Used development boards or server motherboards would also be suitable if=
 they are available within my budget.
>
> My goal is to choose the most practical platform, build and validate an i=
nitial OpenBMC image, and gradually learn the hardware integration process =
before attempting to flash a physical BMC.
>
> I would be grateful for any recommendations on suitable hardware, existin=
g reference platforms, documentation, or practical guidance from developers=
 experienced in OpenBMC platform development.
>
> Thank you for your time and support.
>
> Best regards,
> Kavya M M

