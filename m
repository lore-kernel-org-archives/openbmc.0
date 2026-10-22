Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17EC606A31B
	for <openbmc@archiver.kernel.org>; Thu, 22 Oct 2026 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lpIej4ZG
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j99Sb6J7Tz2xSZ;
	Thu, 22 Oct 2026 13:43:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792637007;
	cv=none; b=F3YD/Y84wGmO/y4BXCHkDpn2EzoZA2dm4fxCHacN3Mw3VdEMlBytWW9maxuabf1Ig5gNHP5XgHEWNW8WfTCuSs/t5yPyhnpPqbFEaF8RGcg+odcXlVxfj620A5ThbGfSgO5/+XjKsvU+zGNeOKuGGXEuvMgcuZclHTHbjXW4lwwv9KmdyO6Sq6YRxc2jsrmPqLqXi9rDQ3GyPz6/um7W+9jbOOlj+Ohg2xcFftFQaeB97i6mzxWaMLhlBBVNRBBIoAiQqSQB4SDhFk5z+YGcBKoCA4HZeG6uWTd0zVZIwVJ/SCU958KXAtf/mY89sy3ykrp5mMesAJtkRVCyJ/bvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792637007; c=relaxed/relaxed;
	bh=xLBRusOCzgaX2ifJa7rH6HLwuWuCZ8NlzSUvqTQo+pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heTpjWBpzf/bj+CIb2UNE3cb+5Oq7hJ0v2lyC3A3jCbOd4RIJR5Bir6Vs11lrBcWHkZU4Awk9gOVBoZ39E5Htz9xj3MOIZLDM/DIcrPc1fwlOwEOr1kKJi0Ix0QoWmTAcXkpmhrBlpSyhkd9WoVr/Ip4sjPqO37JzZtBBcPo4bUdMOfqX/AB6dVpYldlXDaYxKZR2Pa0nzY0c6soqDLkG0UrJAG+axDwa+VHqf2uQErfxjlEN2Wpj00YgtydHmHnZLzSO0IcyUgTHaz7QI8RlEYBvRXyuSh9oYAl+wX8qV9n/ucOY5m+2mXLx51P3gOje+AGF2a5mxt38Xsjw7yolw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lpIej4ZG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1236; helo=mail-dl1-x1236.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lpIej4ZG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1236; helo=mail-dl1-x1236.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1236.google.com (mail-dl1-x1236.google.com [IPv6:2607:f8b0:4864:20::1236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j99SZ2D14z2xJ5
	for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2026 13:43:25 +1100 (AEDT)
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-14394530ec6so1817723c88.1
        for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2026 19:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637003; x=1793241803; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLBRusOCzgaX2ifJa7rH6HLwuWuCZ8NlzSUvqTQo+pk=;
        b=lpIej4ZG+k9cr0GbEApGweAlpj/NicBq+TsirRVNGAQTsO/XXFO9m2idsWC2BrL56m
         7eyAL25vV66brgOKZ1P6UbHuQ2OOxfEbI4Wzru3GRtwHyYLrNfCAAMnQUnH0zMvfOG+C
         6OiM+QMhIzhXkH0Tb8lD26fqKqWudRvfPWKhMuVvhtAzN+zNZ0BQ7AtKYDZ4CvyRe6xq
         OjfZ6d4Pqm06ncPMKYhN/PBMg4Qow/ON5893zAuz9wzc0uwA1gXbFqMHrQP1ECw/jabE
         uCP+XYeEIPJoZdC+E0FFMUQtgm/9NAC02fNj4fGz2pd1xWq3s1iFM/cX7xR/0Rd+HZty
         yBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637003; x=1793241803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLBRusOCzgaX2ifJa7rH6HLwuWuCZ8NlzSUvqTQo+pk=;
        b=hpJhVMGnzR3Kg54CAt9TIedYjhiXQAzgpTzE1/1UZK5lQoaRSFfwfcSorQ5oXh/sdG
         y5pLaXJhDGguUJAGVjhhMV5ZSv/4MUxSeRbxbDvM999akqBYdwIeRu5sI2UnJfZD87BP
         ZGSXJynENp58zvnPn0RM9DNJ1EKa/K05GDwdXxGKmgLtrDtbRe9EO00kQ2kXedfEi3/q
         vjQnkayTKEYaS75tPFRPqSI98v+L5JSRs2JPA64f4fvIHd3TupFIGdxGCFqNy9hl5eEx
         eBmyr6a9n8dHmj4eFDK140QQdYtwwJNqdoyzkHcr6M/dr2Q479dcq+LgadWmMPD/ZAKz
         fmYA==
X-Forwarded-Encrypted: i=1; AKwUvBy15bW03itVXGZ6BPDWlc54pySAVkdKRD6e0c81Jx9g4G3YfKZYHsiV/Q1jVZEsh1ESFCWa9ltu@lists.ozlabs.org
X-Gm-Message-State: AFq9FYLbcbmUjyD+N8BoUC6pawtGzdNDJMHWPUvUBYVm/v9Ao5Ywp0kr
	PG0zT85+zizrcKO/3jLJdjC9QT8Ub4WjP4WFDGcrEq3hZejUrf38rEApYE39yg==
X-Gm-Gg: AYBFou29+y7wsOUsJWN7hKsW80TNna5Qf98eFdKKg4BJv39LUsWnj5MooAopDfXfNkV
	yI0OpSDk5frSNHkgPmxbTQgwkjU8toTSsALJaH55BC6NapxFKW7HwYWXfjYWtQjaG7QSy6ZXsQK
	sgIw/Y8EzifgInAX2BjOEFQzkb+0zl0HK89IwvO3Ih/TYpArOx2bjBo4lTJ2yIRHFOMLCyt+Nz3
	oX9ApsigcqLaaxmNkeZDG1L/FqaeRSBc5PYliaU02cgQg8Uocgj+nqB0J5DLNnCaAgfl71Nutga
	XYjNiVgKMNihXEOeekPwy+W+HBF56VgazQZFd7dUi1XuVG7pXxnbi2Yp+s8UGQPM2PEzgnqwyXA
	ZR1YFt+BbbSmmVBfLxFwe2jE1jES23BMZYQboeSi1UhLvY1rtkTj+kQFW9B0wh6YEXODVK5A5CE
	dRhrp2/CXntyXZ2ye2ElcFAjfG+TU4vqPW3sENw/U0LXcc184pHJ3p2m2uPb7uwrPwbQueUWJVb
	nX3rfsq5u+jRWbz0AdLlzLwpDJvLr9zzsUBmr+bU+Qc6PihbcLDHiDuhx87FQwGvH+JQEB7/fvh
	NjkSp3k9CfmDKlaABA==
X-Received: by 2002:a05:701a:ca01:b0:149:1feb:6da4 with SMTP id a92af1059eb24-190a5e65d52mr5119789c88.32.1792637002767;
        Wed, 21 Oct 2026 19:43:22 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm11077386c88.17.2026.10.21.19.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:43:22 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	tan.siewert@9elements.com,
	billy_tsai@aspeedtech.com,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH v2 0/1] AST2600 global GPIOP passthrough handover experiment
Date: Thu, 22 Oct 2026 08:13:13 +0530
Message-ID: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This RFC v2 explores a different implementation from the October 15
GPIO-request callback. It is not presented as a completed generic fix.

The intended software model remains ordinary GPIO power control with
x86-power-control software button forwarding. No board-specific sysfs ABI,
Devicetree binding, or per-operation userspace SCU switching is introduced.

Changes from v1:
- Move shared-enable handling before pinctrl registration.
- Preserve global THRU selections in per-pin SCU4BC controls first.
- Handle the SCU510[28] source using SCU514 rather than rejecting it outright.
- If handover fails, block affected GPIO/mux requests while attempting to
  retain unrelated pinctrl functionality. Check all group pins before muxing.

Problem and observations
------------------------
On B650D4U, a baseline with SCU4BC=0, SCU510=0, SCU51C=0x1e80 logs
a 200 ms power pulse but times out waiting for power-good after 8 seconds.
The earlier callback candidate clears SCU51C[9], permitting power-on.
The current implementation transfers the global selection to local mux bits
before registering consumers; observed post-daemon state is:

                    Before power request       After power request
  SCU41C                 0x000000c0                 0x000000c0
  SCU4BC                 0x30000000                 0x30000000
  SCU510                 0x00000000                 0x00000000
  SCU51C                 0x00001c80                 0x00001c80

Current implementation journal excerpts (boot-relative seconds):
  182.265233 power-on request event received
  182.267277 control-power-n set to 0
  182.467530 control-power-n released
  182.496345 power OK assert event received
  182.496404 Moving to On

The logged pulse lasts 200.253 ms; power-good arrives 231.112 ms after
the request. The operator confirms physical power-on, including after
complete AC removal. The supplied timestamped trace is not separately
identified as the AC-removal run. P4/P5 local THRU selections remain set;
actual forwarding and signal continuity have not been measured.

Runtime SHA256 matches the earlier A/B tests:
  eb98e896b67c2742db5ea127a40eecc6d23659a69a635ba9e2c5495bb32bd8bb
    /usr/bin/power-control
  47d323408e754c692f9f8764f2369e8bdbe76f56c59b804f52428a6229a7b4d3
    /usr/share/x86-power-control/power-config-host0.json

The locally patched x86-power-control permits omitted optional GPIO
configuration entries. A comparison patch removes the earlier custom sysfs
passthrough switching and 300 us delay, restoring the original GPIO pulse
helper, including its masked-output handling. The configured power pulse is
200 ms; software button forwarding is enabled. This is not a logging-only
change or an unmodified upstream binary. The same executable/configuration
hashes were captured in the baseline and candidate tests. These source
changes are not intended to introduce different GPIO request flags; the
captured hashes identify the tested executables rather than independently
proving their build provenance.

The image build completed successfully. The kernel base is the local
OpenBMC revision 68da063267662da17b990c3384d5beceab1cdc80, whose
Makefile identifies Linux 6.18.24 (VERSION=6, PATCHLEVEL=18, SUBLEVEL=24).
It is not claimed to be the current pinctrl maintainer base, and equivalence
of its Aspeed pinctrl code to an upstream stable release has not been
verified. Runtime release: 6.18.24-68da063-patch-157ea07.

Open questions and validation limits
-----------------------------------
1. Is local/global THRU equivalence valid during the transfer, including
   PWM priority and signal continuity? Only steady-state selections were
   checked; no electrical measurements or mixed-pair functional tests exist.
2. Is mandatory normalization at probe acceptable, including platforms that
   never request GPIOP? Would an ownership-aware request path be preferable?
3. What shared serialization should protect the complete handover against
   other SCU writers, including concurrent driver probes? Would a common
   SCU-level locking mechanism be appropriate, and which writers must
   participate? A pinctrl-private mutex would not serialize independent
   drivers, and regmap_fields alone does not make a multi-register sequence
   atomic. Regmap locking currently covers individual accesses only.
4. How should partial handover and subsequent registration/hog failure be
   handled? Current restricted mode does not guarantee registration if a
   controller hog itself requests a blocked P0-P5 group.

Protected-write/fault paths, PWM coexistence and SCU510[28] behavior have
not been hardware tested. All presented register captures are after daemon
GPIO initialization, not a direct trace of the handover. Exact flashed-image
hashes and standalone raw evidence archive references are not yet attached.
BMC NotReady, missing BootProgress and LPC snoop failures remain separate
port issues; successful power-on is not full platform qualification.

Feedback on this implementation direction and its ownership assumptions
is requested before extending it or treating it as a generic solution.

Previous RFC Message-ID:
20261015035118.9495-1-prasanth.padarthi10@gmail.com

Regards,
Prasanth

Prasanth Kumar Padarthi (1):
  pinctrl: aspeed: Hand over global GPIOP passthrough to local mux
    controls

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 147 ++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 4 deletions(-)

-- 
2.47.3


