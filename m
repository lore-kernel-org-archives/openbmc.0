Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A074606A322
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2026 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FatVs09a
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jSwBP5YBDz2yDs;
	Tue, 17 Nov 2026 04:40:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a36" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794850845;
	cv=pass; b=hLcoB772T8PG3h1u3L9yFkedn/A1QJJtJoP+0UBvLTTk2WRDY0zPJdMGor8idc/6kIpgg292014A6lhdkOdj3I6Cb4Z0Q4UCVZFCSBuKQUE8zte1akt5kN1mu4eZlU9Oe1kKhuqO3DD3IYyd4SO4vdFWGpv0CtauPXLr+wGQ3AIS8jFZwFiAGV5RejUda9h9YuIN98TXE9T2xxn9i5Ppst+uiXXqWA/MMzkeg/ORdlTqM3+twJh6GP9NcNHn2uTmqnbflR/kZMJn2rC5jxMwCYLfu0ZtL7F7c1EZz376ECYYMgbMTNCqQPweeUm+15hGluZlguMBXvhAlhqWXmM4Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794850845; c=relaxed/relaxed;
	bh=AXQJsC6poB7Et6LHkBLd07umQeRnVX12W2WDzXPnRuU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CL4EmthseCQqYjlVJ5AvjaUPCA5Jl9a6F+iIzFTZYVGK3o1YzdNLfueWw1prvZclqAnqNoWSItqP3hAPdFzmZpaXzIGSfU5HG8NPvHukEeX/52+7kW7OCccPGtJZC7EsT1h8t9loozZNVQb4d1+frEMXS9HmKDrajf1O1+uo10NuMC8041jvuChUli5YhiWd4ojoWo/WnHpkY5kANucZ4dwCjrzBqg5FJaxEk9VJIwiakq0oqVmKLnfSx5vIVO15wm6X1vi3jCTguKjmWF9gzCkqhHRtWpNi/JIq9FHY05JosWyOZFhpKbMjbByXCBk4gRN64v+DJBv7GXBtJuGA1Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FatVs09a; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com; envelope-from=rathidhruv04@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FatVs09a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com; envelope-from=rathidhruv04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jSwBN1zPQz2y7p
	for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2026 04:40:44 +1100 (AEDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso1052227e0c.1
        for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2026 09:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850841; cv=none;
        d=google.com; s=arc-20260327;
        b=PMZ+zkvwz/rCpAuIt/gD2Di3wGTWaKxJuL26DVF42hmQRzFunBPEkfP+uot6KkEAJg
         FmBN4JyziyKIyKr0sok7WSqhfNVQIFeWiVtsMEGkxpVMJDREiARGaRdqLhorlNT/7+Od
         bQ9sUqWZaF/l3Q6sRiAWUtghIgyra1xmBv4fJyAPUZTFdxmv5KfFjK8FlbR5JWeLiowX
         4u/BQcwqXHF2yzjhQYcdXRJCge8Ex464Wkkep9RMnPgsAaDKk86tGCk6k9f4R6xmGGkN
         xa6JxypI47bqbEDll1R1bVjLInBbqb+DJ9K0Q0eSh5SHT/LIFCj3n+O88P9kNpyu1J6q
         +kMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AXQJsC6poB7Et6LHkBLd07umQeRnVX12W2WDzXPnRuU=;
        fh=9hQXtlexHnYme9SkoOp2BOP+KRM64NqDhmpxZmz13Gk=;
        b=GAQ9bs9kxZ67hblg91uDqZgqfiuB5wIk1CtnF+OvafdBfq3yuFf7gv+WAMp7nGxKdZ
         v72Oiav93btmow0xx1PdLJtXHxPAchvzEXcIg6yIA+4Ze2FkOSfqUaNIaJP58e9d24Ef
         vVK60chHPVCuUzumsD7CCVkeZjxWXRaGgc89JvZcXXIHTFeBputkITSlJA5kaxCROdYv
         RZFSlSJIWRCXxo5SzgPWFhnu2WIQLvmL4+riOTlRnEcfI8hLGbr03qHf38FsRBn86qPJ
         e48MX9VhCHXpYBdxtZOHDh3/mEKIsq1Pxglfj2DqPKeI/g29uHSRL7NqQ4aqsap8ZYYa
         dCJQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850841; x=1795455641; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXQJsC6poB7Et6LHkBLd07umQeRnVX12W2WDzXPnRuU=;
        b=FatVs09a4uzuUrooK4KHqZO0Z8YTq21D1N66uRzRfvnE6Fuyt1uledsM8dXrOexqt3
         K4gQLo/yMBxFQgiSJGx+lIzH1snREv+3wutGrqs5G6EKgPPKasUj2xZFLzucoSMk6VTt
         U31vgPH1FH9cU3NiwU77AM9XvZlRmxAbURgLLfAhNgMa8MQ6QUFwO6SNPB1QHSbkqUiJ
         cgnz6rKOoIeEfNM8BEj0z4DawNQEnrUdS/kkb6oi6bVkPhtaALqra8x0s3M6s5wO/3fQ
         8b8Aj0LwsM2t5yLazK74RKWad2H64uaq/23Hqe1oZajLTJi0RdIWyfc+vK78bW7EQK4b
         /xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850841; x=1795455641;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AXQJsC6poB7Et6LHkBLd07umQeRnVX12W2WDzXPnRuU=;
        b=gRjx2Y9ie+iLLcZmzMO8bmhdlcFy/kj6xnyDia9eCQOYw7dcPBu0eUI+kvf1t7+ttn
         wkmteRtbT3OZw0+S+N6Bwgp5vxYGs26a6sa9z3Jz8sBJ8t2YIlcR4P+v+/fCZ4cEnB1m
         O+L00xjNmfm3HIaeWZLn9qJNhKF998CviZB4mojmkNov6UU3XPpduKJpuu36JTNdR/lY
         sUGMVrRP68J6qKVYNGHoFmVrHUORPF3bUuvKEZ3mZ7Z74Gr8qORfM1dZGmkc+yG3aBFJ
         UFVsIdKkTenuSBKZGSsCut5TSG4WcTJZQ8k6lMLwMB6PWyKpBY0hFX5OReCwe76Xe0AX
         AIeQ==
X-Gm-Message-State: APuU4Z/rxm2ERSHCJYJMcristGY+V8jo6+DavIZIDmP0ONKIcW2GoozU
	COJcqjI7qP2CzspztU7deouZpwicPx6YiX+C9GwFEWrl6qA9WZk0OU8Yg9Pg2+j0JhZ79JCaFbu
	d0ddqoUrU98aaADyDUoHoVqujSFuicV8=
X-Gm-Gg: AYBFou1l6sM2hyOOjFMN0zq/ag0jQ1q+2toDdXD1f6+NUF4DRBiA4hmcBzHm7G2xJbI
	tASj9bNj0c6ZazB2puJx58sRY2v6ISCaN3ByDyWCLfwAFjxJG+/GTKwLO+Pib9yJs+orZxuU9GF
	RgZcqcxYEfrTv9KUHU/7/i78eyN47JLOXOycwCpqO/RjvFKEP7fHKPh3tW4kXRFGuQ8SJAjjmnK
	kNLSqIDEEa+PQhOjqZaeGr08kOh+X3T7sY5t1msSQgyavwaitn4+F6XZ6V3rcBYQeSvBiU+AOoC
	6n4EMYNTCQHPSEcmhmP3wnFUsIjiJ48yO3KFSjKiGQijDd4werVK66YfZWpSvPQbBgkegLqRke2
	b9Ahm0TgzKkisImr8aXJ2d2whyAlfBB03iNXRwCHGi2X/KnKjwp1p87hF
X-Received: by 2002:a05:6122:4b8a:b0:5ec:e7e:27d6 with SMTP id
 71dfb90a1353d-5ee34a45862mr4001107e0c.4.1794850841430; Mon, 16 Nov 2026
 09:40:41 -0800 (PST)
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
From: DHRUV RATHI <rathidhruv04@gmail.com>
Date: Mon, 16 Nov 2026 23:10:27 +0530
X-Gm-Features: AclHuK_h-wjGDGn3DFuA9ZZngrQd1aXoN9VXM52UaEnNh_pqsMBtoQzBsxxq9_4
Message-ID: <CAEJ+YNr3hhL--BmUaeD3O7VWyeQgdPmNgT81rf2Aho_87Yd9SA@mail.gmail.com>
Subject: bmcweb: review request for UpdateService ForceUpdate (92596)
To: gunnar@gmills.xyz, paligill@gmail.com
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d410fa06606846a6"
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000d410fa06606846a6
Content-Type: text/plain; charset="UTF-8"

Hi Gunnar,

Could you review this bmcweb change?

  UpdateService: support ForceUpdate in multipart push
  https://gerrit.openbmc.org/c/openbmc/bmcweb/+/92596

It adds the standard ForceUpdate parameter (UpdateService v1.11) to the
multipart push. It has been open since July, CI passes, and it has +1 from
Joel, Jagpal and Deepak with no open comments.

Jagpal has asked for your +1 on this change before any of the other changes
in topic startupdate-forceupdate are merged. Those are reviewed and ready:

  https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/69992
  https://gerrit.openbmc.org/c/openbmc/pldm/+/92595
  https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/92608

Merge order would be PDI, then the backends, then bmcweb.

Thanks,
Dhruv

--000000000000d410fa06606846a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Gunnar,<br><br>Could you review this bmcweb change?<br>=
<br>=C2=A0 UpdateService: support ForceUpdate in multipart push<br>=C2=A0 <=
a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/92596">https://gerr=
it.openbmc.org/c/openbmc/bmcweb/+/92596</a><br><br>It adds the standard For=
ceUpdate parameter (UpdateService v1.11) to the multipart push. It has been=
 open since July, CI passes, and it has +1 from Joel, Jagpal and Deepak wit=
h no open comments.<br><br>Jagpal has asked for your +1 on this change befo=
re any of the other changes in topic startupdate-forceupdate are merged. Th=
ose are reviewed and ready:<br><br>=C2=A0 <a href=3D"https://gerrit.openbmc=
.org/c/openbmc/phosphor-dbus-interfaces/+/69992">https://gerrit.openbmc.org=
/c/openbmc/phosphor-dbus-interfaces/+/69992</a><br>=C2=A0 <a href=3D"https:=
//gerrit.openbmc.org/c/openbmc/pldm/+/92595">https://gerrit.openbmc.org/c/o=
penbmc/pldm/+/92595</a><br>=C2=A0 <a href=3D"https://gerrit.openbmc.org/c/o=
penbmc/phosphor-bmc-code-mgmt/+/92608">https://gerrit.openbmc.org/c/openbmc=
/phosphor-bmc-code-mgmt/+/92608</a><br><br>Merge order would be PDI, then t=
he backends, then bmcweb.<br><br>Thanks,<br>Dhruv</div>

--000000000000d410fa06606846a6--

