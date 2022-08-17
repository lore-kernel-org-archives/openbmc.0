Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C026C25B08
	for <openbmc@archiver.kernel.org>; Wed, 17 Aug 2022 17:58:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7G2y5Qcmz3bmc
	for <openbmc@archiver.kernel.org>; Thu, 18 Aug 2022 03:58:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dLoPFsXX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=nicholas.rivers1984@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dLoPFsXX;
	dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7G2C2kwfz3bcc
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 03:57:38 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id bx38so14244851ljb.10
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 10:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=Pzj5WRIROPxsBdkogRlER6/uVd+RdzYz5+dlcFRh8c0=;
        b=dLoPFsXX+CAli6WpF7zTKqMs8O03rK37OUIBiBQTpshDNar1vTzN99ggMf+IgHuwL2
         Tes01cilLeiRI9YxN+SIlrbBkAlyisof25sP3ZBiA93d6+CLh25wCR8uUnCwf4sMow6g
         WBvjav0SIoos09A0VDc6MmJkbG2PjqtcxrFomDMUlG34SOudLV/eJyJx/N18YAXtQE7C
         FXNE4BZpVFD9qNZQv+FsB2igloCG+ocGbOSG5aXgx6ntZ+6g5Ha70A5N0I45OfkGzKXC
         kPqBd86baPdFzMoRgr/1B0KDtd2kP0xMtWuTem797WH9NyHpeBaUDExywZ/BHFoVm0xA
         F7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=Pzj5WRIROPxsBdkogRlER6/uVd+RdzYz5+dlcFRh8c0=;
        b=YdhbSULLqT++ybIQbN1jPnJaG0akHTBcfuJKggW4ffuvtizwHtCnd+BdGfyk+Ie+3T
         I+yZlSIxrpUM9UdY6k+6EWkvh1CV+d3YunT1k/FjN++SLw9FU+STznYErfmme/Eqwtvs
         m+x5e6lgzcvc0DQZoktShvXvpX75u66PXbXUy+imcI330FAsUY09FZ601AGrbRA+Z8sX
         dRRp+2GVnvm5CH4pz5SEzXXpLWBepNeRRPFtX2CnrZXbvScoaAi2JVBZmowaHdw4fmKK
         dNVbO8UBWMwgZOR1kknz+0SwdA+0yILJVTZwUR8VxtJqV1AorkElDSaWAmvErcGlLh/6
         Tb9Q==
X-Gm-Message-State: ACgBeo2+8RWlWMKOFyL8NMSWaTSBegT7lb2XyTTomBQHbB5Ym5oSaUFH
	aB3VhT3T3v/styYEmhF8jpytqfjP1KBsAUn+WhlXyzN8lbjdCQ==
X-Google-Smtp-Source: AA6agR6DEeRiNnDR+9LuVYC7cMqzNb59n8JEenfXNE0zGUe4RYax0G1BCT7P29EH18htSzPNGH5qRwdp3mREuwX18Xc=
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id
 m15-20020a2e934f000000b0024f0ea16232mr8629596ljh.135.1660759053928; Wed, 17
 Aug 2022 10:57:33 -0700 (PDT)
MIME-Version: 1.0
From: Nick Rivers <nicholas.rivers1984@gmail.com>
Date: Wed, 17 Aug 2022 10:57:23 -0700
Message-ID: <CAHzptbK3Aq=O9Frf9rRKJp2czqB=wg3D0d1yAq1ps85KGV=sZA@mail.gmail.com>
Subject: Why do Discord accounts that have sat idle for a while get removed
 from Discord: https://discord.gg/69Km47zH98?
To: openbmc@lists.ozlabs.org
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Why do Discord accounts that have sat idle for a while get removed from
Discord: https://discord.gg/69Km47zH98 ?

This doesn't seem in alignment with other community forums.
