Return-Path: <openbmc+bounces-2091-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB4CCD98C7
	for <openbmc@archiver.kernel.org>; Thu, 11 Jun 2026 18:59:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbsPv0KRSz3brB;
	Fri, 12 Jun 2026 04:59:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781204354;
	cv=none; b=DYe7CDAZkJ/g8s6JfELWAsa5eiP+J3K2qYgqQixmAX0g6jEEKDsmlXnNrhYRb1bf65LLbl9NxMYeztLCJlKwj1+VWoHhVW6ITjaCevTcLHbPDdm3h1MKMxf8v0kzg16C43y0TpS5ii5lWqMoHb5ZKfiuDCCUVmywM680LmHmsuRstcp9lxRH68qfAYyD8glvrDyu7YSTezeR/2W7wx8YoSRNCAkwg1w2UnOPdVJQXNeyCTGBUn4+zYiEL3+yBbQbsp0vnnITCwwfh7i0r7rCU7ZCYPIX3/Urgf+ym4hXUvh56vUP/NG2KhSM4BCxWIxtUeL1Nl3mh548FWjy9vFBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781204354; c=relaxed/relaxed;
	bh=6ePKOTEBr3Zye33oBfPPCqMMmmGHBNbLgrW8NCTLnyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AMiDyEYzZlDTme6S5WKPOensXleqnG8VeNiwYuiz4DsMAuUPjTXM4fl1wV2eUXUdSIGRBTr60qFhaaHms6w+aKFy10kcEXZr+5H8UaZLQkoKRqxj3KoUoKJGRJBIeVgFVEJBe8qctHHrFf/OsYzE6MnfckbNNXrC5j44ytIDuEgoTXA5PkXnNwp9Qabbvs+nSP9WqOtijJegERk2waIzwob2K9AkbLpmSseeAO1dIJoipFZfnTYeei4AcE3GlVBL4ez7AT8Bx2bmTsuKTsHnMOoC4Cb4fjjNQvwBpD8IHCdx7NljAcsnLp7V4oel+7WcoQP112OL91aykZ+eawn55A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHN8CpDH; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHN8CpDH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbsPs6YvVz3bpP
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2026 04:59:13 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BEC2600AA;
	Thu, 11 Jun 2026 18:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92051F000E9;
	Thu, 11 Jun 2026 18:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781204351;
	bh=6ePKOTEBr3Zye33oBfPPCqMMmmGHBNbLgrW8NCTLnyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KHN8CpDHe+Ej5FzosN8LT+67neziPAUPiC5yusdGcnIyC+ffzU3aMdxgz/I95N+X+
	 TxjukzNkQM3/V8hrrJ46lSf33IZN94ME6oaItqH3LD+07kzzzTW/md6qgFvF/p1/nr
	 1nyoRcQdTOOSPl26AL0hsUq+s5qouSwv2X9r0guvuJAChdFzV6N3CtuqxG8qvhV5rP
	 7n7cgwZikPwdspeWNeSR54KXpUp1HjxCcfeD9xeajctzOyeX2LrCMh027xT0YP9z3c
	 5CPvW3yvIYbJFpKbun6/hwwj9Flj3xDSai/0cmEMxY0BUGXnRyRbWIhHktzJLexAWh
	 MadKP2ABbh1hQ==
From: Mark Brown <broonie@kernel.org>
To: andrew@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com
In-Reply-To: <20260609163919.3321228-1-tmaimon77@gmail.com>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Nuvoton NPCM FIU DTS fixes and binding
 conversion
Message-Id: <178120421867.467928.992304316732142101.b4-ty@b4>
Date: Thu, 11 Jun 2026 19:56:58 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xXx1jucA/9s5kzhCVKi8XcrAGjZlbqnwFgFQ0ueHREg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKwU935LBj9sJj9JbwPjU75Lf4E7AcC6iMIjxw
 GKO/U/RBweJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaisFPQAKCRAk1otyXVSH
 0FsEB/wJ+NDrOPaCKpYs5fpCZe7iE/Ff/1x2rOiJqSWMRu/Uqa5P3lcFSXqUGsIyBiK3/9QhX4M
 oos2AEmxBEBJzOfXD4dc/0SwoyDcXf0VPk44pDXZt5les6kyrKPB6q6Sd94SGDbM0fe1+6NFsvD
 a0sedlR9vjZ0fW0WzXgAuW7D5D6fYCLA8LCSCK6fXGhI6fudlvU1dueMbG6D0zHI2+YEtkfJq/e
 cQjlMeGnV/0FmPCbG1kJctft1AE/b/ArdlvX1RCGVC2yumNwajQQedw8fAsxhKTeg4/08ravZ7x
 VzCkYCwwTRaIMFQ/QSusc3ihpAwCyIgSXSMl+8/ZEMmIQ6BO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 19:39:16 +0300, Tomer Maimon wrote:
> Nuvoton NPCM FIU DTS fixes and binding conversion
> 
> This series fixes the in-tree NPCM7xx FIU controller nodes so their
> resources match what the DTS actually describes, and converts the legacy
> Nuvoton NPCM FIU binding to YAML DT schema.
> 
> Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
> nodes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[3/3] spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema
      https://git.kernel.org/broonie/misc/c/3da90b29241d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


