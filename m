Return-Path: <openbmc+bounces-2706-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A752ECA5FEC
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 11:48:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hyLPl2Vqgz30TL;
	Sun, 04 Oct 2026 22:48:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:41::d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791114506;
	cv=pass; b=FUszNtj/ZPQeIcPErGp25xA5o7Lcok5O1GF7p7rnbai5TWOLbyt0U1Kemk8X4mQnSnqPnOHZtwcGGDRJ7WcNt9mTEqLCPYVYWYzpXSeVAroMawCmEhcqo59b+gTRkcwzoR/94x+Sp1g13W4BImcE5lHjOCDTCd8o8plEG3GL3Nj1H2WCMP37/bbhN8mD4RXmwGjPN5Nh5B7I6Z/1WWIR+J7CXonOxuniPNb2RLfyQroO06fgTsY8oUj4i9a73L9KYhoK4iOdw9OEZ/PDWtG8OWqXqFWLoYaz6uAD2Q6Xy3pNAataBubMsiL0z02u1fip5o6zrnZfwsYn7ppLu2zBDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791114506; c=relaxed/relaxed;
	bh=xEcFNNOjf+xrJu4jjq23drU/TN14HXtXueDl9+2Vlg0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kuP0XygNoHdP3POLKawkzQAmXTBW0W5cpMX3wKlmieLxKIxH+L06FqxU1xsmSaJlQK/SDg7nTb9Sj+R9t625a+pvd++i6xZcBLW3VBvGwc61zYW0Ty/E3KABX4fIIig7DW6PbsIhd7SM0gynmyJJYbYcd+GhfiBCTOndqi4NNHSe87J15TqEmWAYGyKqhRQtxHpoLssSds8K32dmvxFuisot5SSJngZ1/C10WGBic7B8XCWZir2uHbIyl5rNFEYFGSb+yg+Re7MJ8WSmFl2cdYWidkqo8zRW/RrTW3n917w5ghozinu5QXO3jW9x0I/kae1EghwP6XfzYsG7vY1YvQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EevZ/ypF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:41::d; helo=mail-yx2-x0d.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EevZ/ypF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:41::d; helo=mail-yx2-x0d.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx2-x0d.google.com (mail-yx2-x0d.google.com [IPv6:2607:f8b0:4864:41::d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hyLPh5GZ0z30St
	for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 22:48:23 +1100 (AEDT)
Received: by mail-yx2-x0d.google.com with SMTP id 00721157ae682-8aecf8568b6so4514707b3.2
        for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 04:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791114501; cv=none;
        d=google.com; s=arc-20260327;
        b=YDCAiGgQqK3KeP8ry86dg2CqHNO1Wjf05hhidW5fMK9mjPelgEBQM0mqywt/jXIp6A
         K0p35IonmU/B4sK84ii9vbwqaBGh9P0DoFmt5t3xcsVM5fv40EHXgigjTcA5gLYvI3zk
         OadlDrZeGvRrF4b+xztxKaG7Ia6mUw+wBNSQ6ZjFiq6VK7+pHaUTOD3yY1c7R6dnrw5J
         KIb2yLv6EqdxygIBhC0Tjt635kp+LW3dL8PKlbyxA5IuPQr7f3n99HXHRHlHNMI0XH4z
         LEzbjHSzmj6jaAcPN8CfrtYlp8HUriglwlaxmgiUHnLx4OhebMTo0u3FBhPva5OyKpFe
         VEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xEcFNNOjf+xrJu4jjq23drU/TN14HXtXueDl9+2Vlg0=;
        fh=JfDTVNIRNLlIKKMLDgp05SE/CuqBu4jmZ4fCG7wAAYo=;
        b=RsQxMZewVMeNP46stiSAToCFP3KjUIomTHDUSoFPKwyvSzzKfIPRHkyWp7rZ9y+T3I
         ffRVmbcvndfsAHcDAiBcOZX5m1UFuVpIyg1ulI+uRVz5y7YvTruDll/UsQstZD++s9h2
         pAZw6hkTTjUYzy64lbMXimQP1a9nmvpUAAAGzjxnz77HHEKE5pmSmKhMsxo6qkOh3qk0
         yd94iZAjXDYuXZuZBolGC1RadHT1IqSxutECU+Geb1s7FmuK+VclRAAl8CPeF92WoKNu
         h5HW3RzbPym976STQIN6sSR7yuG33xXkwjvmdexySj/E+Rkj3xu+y0zLA0SuNHSDnE2q
         EURQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791114501; x=1791719301; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xEcFNNOjf+xrJu4jjq23drU/TN14HXtXueDl9+2Vlg0=;
        b=EevZ/ypF1zplq93sMvXm/NmdQ4GDE6ViEDL3nHuzFuPjhd9jVeXuxX6sQhhFpKYlYT
         vKFVH4XAF+xc4G/B4MsmU0rZ8RMwcf8StwOTfWbc/VTypKYM7LLcRvEvRJbdQ/oEyNOO
         J7/ycmCeA047xaVipDxp5kHMYAhnYsdrwEMHi/O55F7ueH13z0lfvWvxdS/3RrnhsSY+
         BcSCuR+B4uX4y8NT8sN88jYno0GfAEncOY4/3B9eHg2tS7dWOpiHV7lNf89HYBN2q9ER
         atXBPdLjfOjZT7cpCl0A8GKWEWFWsN3kqcjRNKtkgOALw16YrfWo9I6iPhpb5ep5rGY0
         RYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791114501; x=1791719301;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xEcFNNOjf+xrJu4jjq23drU/TN14HXtXueDl9+2Vlg0=;
        b=FNdeH2JSXZjYJmwMdSy8m3WmfnStCWcpo85+aMAACiMJuotDLCtUGqd5oE5Ib183ix
         w40TRVva6vkVfOUfEwbdHpfz2V7nc7pvnP99XtB1+dby8JgUk48VD3VB5MS2Zk3s9z0F
         YBftT8xKnqp1M0rpU0VkcAuzNE4VbSkcUHvUHOj4hEjYjtsGBTZ0Iv9IEr6F8QS/tzO9
         65t3C/RST6iAdVsjUaFm6Ies+PwSxaWL8PhB2RHZW0TjH8HxRJwfHvuUNW1AzWsYywHj
         hcP7zt2rsiYqcYQLwff7X41x0KFpFNSa5n3lutq+Y1I+ufM2f7jKoBxBsJ60ORFF5O6P
         pryQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvMBJ4h21KFz6/KXyyP5MWHG5SEqZTOBkioUYeLoSv7oLBLE8PzwPTdH2bAMmcDgI1pJf5q1IM@lists.ozlabs.org
X-Gm-Message-State: AFq9FYJKieZg+kIYt/lxQTsMCORy2V74YaSNU/EDjyrYrJ0D6zUjJ0SB
	XMZDzrGjSJuIpZi0AGMqWynCfGRZNtZ9p5tewvZPMXUdu+JTTXBYGX6CyDBqidFuv1iJ2BX77yL
	aRhz+3l2TeM95i3UN7K4Xlux2zKFgxv8=
X-Gm-Gg: AYBFou0EsmqOy5ejf+ejZ28oa9G16eeINab/zQaXrkELPbJap/bAM6g/ShQX8U0QCZ/
	IVlerTUx2adpjAKCKt0BP4ema1c1LK+Tn3pSI+vR59z9dVWe5C7dBtyPcfcWjHbWj1bsSTxoxw0
	2O/NvVDt2V/zfh3+NTmhY49AFP5HyOJOgYzaaHO46I/kGSKlhoOaxkpmrfs9Qr1rbGGorhXQW3b
	FsknsE3klIFyEk5zsU3xi7SvlkWadVVageZTFjT0tqrLi29s2LN/02Uy1sKjdqXdVku9N56EHaq
	ZvfRbqoeVbwlXNfzKf2PMaPBpZShWZ0Xz6H1KShOA7PNL3bVrYSj6fiEgeQwOM3QuwGu
X-Received: by 2002:a05:690c:9990:b0:8ae:17ba:df03 with SMTP id
 00721157ae682-8ae3add6500mr24577497b3.64.1791114500851; Sun, 04 Oct 2026
 04:48:20 -0700 (PDT)
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
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sun, 4 Oct 2026 17:18:09 +0530
X-Gm-Features: AclHuK--qH85BIZtoMJyg3lILYRB1sLcVJWp98pczpJ8Wky3hLgnsWW47W5LklQ
Message-ID: <CAMFFDGja4JnRHAUQTLHAStZbYM0GyKWVDAOFENCyrVc3AmV3Hg@mail.gmail.com>
Subject: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through and gpiolib ownership
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"

Hello,
-> I am investigating host power control on the ASRock Rack B650D4U,
which uses AST2600 GPIOP3 (GPIO123) as the host power output.
-> Vendor firmware enables SCU4BC bits 27:26 (the existing THRU1
function) around the host power pulse:
  SCU4BC: 0x02000000 -> 0x0e000000
  changed bits: 27:26
  GPIO123: high -> short low pulse -> high
-> The upstream THRU1 pinctrl group claims GPIOP2/P3, so selecting it
statically prevents x86-power-control from requesting GPIO122/123.
Without THRU1, x86-power-control can pulse GPIO123, but the host power
circuit does not respond.
-> What is the preferred upstream representation for an AST2600 GPIO
pass-through pair that must remain controllable through gpiolib? Would
a generic Aspeed pinctrl/GPIO extension be appropriate, with a
documented DT property identifying the pass-through pair?
-> I am not proposing a board-specific sysfs interface or direct
userspace SCU register access. I would appreciate guidance on the
correct kernel ownership and pinctrl model before preparing an
implementation.
-> The AST2600 datasheet defines GPIOP2 -> GPIOP3 as a hardware
pass-through pair. In pass-through mode the BMC cannot control the
output value. The B650D4U vendor firmware changes SCU4BC[27:26]
dynamically around host power control.
-> Static THRU1 pinctrl claims GPIO122/123 and breaks gpiolib.
Ordinary GPIO mode allows the pulse but does not route it to the host
circuit.
-> What is the preferred upstream representation for dynamically
switching this AST2600 pass-through pair while retaining GPIO
ownership?

Regards,
Prasanth Kumar Padarthi

