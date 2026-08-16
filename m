Return-Path: <openbmc+bounces-2405-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A95C5B572
	for <openbmc@archiver.kernel.org>; Mon, 17 Aug 2026 00:34:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hNYjk0K0xz2yFW;
	Mon, 17 Aug 2026 10:34:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786904603;
	cv=none; b=hjY4tjQta3iZJdo+iAV/DZyVdg/XX73aDfIqblLt0b7QNDAWMwFJvUPPnDu49WpMPe/rzQ4PpWvrhLTmKKGqNWIH52juRY20bYce5pFmHX/INZnklRXiDxazOE5srdIB8bqJk27nTezJlhhvfNvDNEtmMukbGD/Iohl+anrRpXTUjNkRiG1QUhH5eS9Of6MMdN2J2IfxYT90i5rWaI0bXeGAwuD3lf12HgM0+6wiV392MyP+/xmZIQLihLOE5nWqf3+02ZYxy865UrqyB+4cLHkwrfzGIvYKL9BlRM5CATr1m9EolafgDSLGp0WEn8djQKpWvq4NGdz2XQSH741A6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786904603; c=relaxed/relaxed;
	bh=o9nKyUiUOncrPcmlLl3SWCUrWwT+bpm5w1sxk82su7E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=l3Sn2YlYO1L/ME4KGoy78n+K5dO2Ujbnc13qW1tfSuJ15MHcYg72Wiko/Z1wXq7odi3ad2sTob6BBQfpgC3lntHot40TUUjICSJd8bRchC4KDGEjNYZW+jjcDVmbAssilMDs2r3ZcTMfc9rmSZ+cGip77pWV7dlrtV5n81gzCx9rEhyuVHwOR2NQq1ueGGy8Xm9FlmQJwKRowIcHhoXe4zic4tsqNgru0RzX7n0orZUO9MTugnPKk8aXmhdulT5OZSxNV793kJbgSvQadU62Ho7KoPuS3NPUwCbcFkljSKC+O0sm2Z3YwawPa2isB9krJruTwX5g08JHvspdmCT3NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bsyoHNBB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=arunpapannagari23@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bsyoHNBB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=arunpapannagari23@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hNPV01By6z2xyk
	for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2026 04:23:19 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so3758688a91.1
        for <openbmc@lists.ozlabs.org>; Sun, 16 Aug 2026 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786904597; x=1787509397; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o9nKyUiUOncrPcmlLl3SWCUrWwT+bpm5w1sxk82su7E=;
        b=bsyoHNBBXeL/wmkeOzy7Y+Avc0RcGOBdZudvY5ZOR5El9onV8eSkNL5p34sk5bdmqW
         HjXJf7qnvc+nQKc8F0aJSYGZlLOAVz8zvRjbEwBzE7XbE/QrUHohydaRC5nLKIbWnD7C
         foSQSniUOnwwzx25/FqCt+GeLEwBPisMT0c0UKqWJSV7yMoOnpsqjpHMuzey1NzzA5Ki
         woIASVmUi5tDC4wCDpLhAI3xlF8BMT+vMz00uCpPoWi6AVNSBBRPLN2XIdwxPcY2VbzQ
         hXVS/cdSPRjMC+ZtPF2kAIHhA6JUUK7o6ApvmE+lGJKkyzl+UpgSFvIujker/MM13tkn
         duRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786904597; x=1787509397;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9nKyUiUOncrPcmlLl3SWCUrWwT+bpm5w1sxk82su7E=;
        b=s2b4LSxXqsRe5v3hZthu/fKJAPzZFAqw0K7FqTkxVkS65AXkXH/1ZTUFy4lhE3CvIl
         Rn08LUtxYK8GKuH6WfI3Vo48r28J/gfoVg6FM+fiKJckueJV6EXBYZQBDqbu+GCoWxSr
         qkbU5OgxSWse6cFGElWTWTWyD6xv075Z8K6FChtpP0XxCtHYaGUrSyk5PvihNCpNCHw6
         MzZ+GAfVDDXruyW8VDBS8+tCIoStKXTJpGHv0iq2kaOPCUXJu+vu2vEW3wCyROD7PLcW
         DbrPCMZN8qRARvG1byn+LBye8Rf5qp3M70Dh/x0bNSDOXSUwJ+UvisDkjLfr/I9zJlNU
         I/sQ==
X-Gm-Message-State: AOJu0YyNuxQtqdddMHdxeubt98x3WB0A5Yb+jyIAgUK8b5qJ4Tj2hBo/
	J7K8wAjSg/ohfhNVvdD9N/zkvfoX67IVU5esCivF0RWaqRfwW7dV/1U=
X-Gm-Gg: AR+sD12HKdYtxdi8ntIcumyCRrPQJtV0iwEA2nflqcG6bQwrtFhRAy1aVIiTrM7OaCT
	XygJleGTojC7KxNZvDe0CjU2yF5yjnOVCdPDiMnib+KbRUqzhIK8GseQCiZ8ERSluwWTlN4ODzJ
	zKqpAOXmd3HR3Da4c70kALD+fkW0a2lNQ5zs0mVlu1R6z3E04hzcMg2ffxnPadR4RxJ1Uxc7rcu
	yiUdOPqWXZbv5wdbIt6atz2Elr+DBP/An7HpcdgSnRLTbDy/FYjEuXLiyvWZvCVcOQO6iRXJ9K4
	hhgGN5CfcX5iw0p5PYhIu5xr6JcJZFoOOwfPqHZ6X1NypfeF+6sVHi8GWeQ5BQKB1ECCwdlVwgr
	LnnrGugJQuXEUFL4eh7x56N1Rn+R5H+JXwoHrDvexDMIobq2K96y2/VMJDe41cnWe3a7IZ8BJTW
	idjv/F0Z4t5k1j8mgBp22qxRl2ljt+JosD5Bk+6xNOlIcMKqUhF8ddRnCtiD6LoW4k7IkaN+La9
	Y4EE6k3Ff7tkieN0A==
X-Received: by 2002:a05:6a21:d86:b0:3bf:a7d5:df38 with SMTP id adf61e73a8af0-3cc71b41dcbmr21417507637.9.1786904596426;
        Sun, 16 Aug 2026 11:23:16 -0700 (PDT)
Received: from smtpclient.apple ([128.77.30.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1414ec03d9esm4967091c88.3.2026.08.16.11.23.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Aug 2026 11:23:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: Firmware Recovery Protocols
From: Arun <arunpapannagari23@gmail.com>
In-Reply-To: <CADCscQkZ9ubmHsY8kDOr=S+u4NGoxT8NAkhDGOFhLQXZPLfLfA@mail.gmail.com>
Date: Sun, 16 Aug 2026 23:53:02 +0530
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1543DDD-B05F-43A8-9998-34E533B0C3A1@gmail.com>
References: <CADCscQkZ9ubmHsY8kDOr=S+u4NGoxT8NAkhDGOFhLQXZPLfLfA@mail.gmail.com>
To: Tom Joseph <rushtotom@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

  Hi all,                                                                =
                                                                         =
                                        =20
                                                                         =
                                                                         =
                                        =20
  Following up on the proposal below, we now have a working =
implementation of the OCP Secure Firmware Recovery path that realizes =
this approach, and I'd like to put it up for review.   =20
                                                                         =
                                                                         =
                                        =20
  This covers Stage 1 of the two-stage flow described below: OCP =
recovery delivers the initial firmware over SMBus to a device parked in =
its recovery ROM; Stage 2 then proceeds over the =20
  existing MCTP/PLDM T5 update stack.                                    =
                                                                         =
                                        =20
                                                                         =
                                                                         =
                                        =20
  Design summary:                                                        =
                                                                         =
                                        =20
                                                                         =
                                                                         =
                                        =20
  - OCP recovery code updater: a Non-PLDM code updater built on the =
existing common/ SoftwareManager/Device framework in =
phosphor-bmc-code-mgmt. The operator-facing interface is=20
   identical to a normal firmware update: a targeted Redfish multipart =
update against the device's FirmwareInventory entry, with the       =20
   recovery image(s) carried in a PLDM (DSP0267) package.                =
                                                                         =
                                         =20
  - Protocol library: a small transport-abstract C++ library =
implementing the OCP Secure Firmware Recovery 1.0 indirect flow over =
I2C/SMBus, unit-tested against a mock transport. A      =20
    standalone CLI (ocp-recovery-tool) drives the same library for =
bring-up and debug.                                                      =
                                                =20
  - Discovery: devices are described by a new entity-manager exposes =
type, OCPRecoveryFirmware, so recovery plugs directly into the standard =
Redfish targeted-update flow.                =20
                                                                         =
                                                                         =
                                        =20
  Testing: recovered eight NVIDIA RTX 6000 Pro (GB202) GPUs end-to-end =
over the Redfish update path, including forcing devices into recovery =
mode, skipping already-healthy devices, and  =20
  rejecting non-applicable packages (UpdateNotApplicable). The =
entity-manager configuration used for this is part of the series.        =
                                                  =20
                                                                         =
                                                                         =
                                        =20
  Changes for review (gerrit topic ocp-fw-recovery: =
https://gerrit.openbmc.org/q/topic:ocp-fw-recovery):                     =
                                                             =20
                                                                         =
                                                                         =
                                        =20
  - phosphor-bmc-code-mgmt, split by area:                               =
                                                                         =
                                        =20
    - libocp/ =E2=80=94 protocol library: =
https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/92450      =
                                                                         =
      =20
    - libocp/tools/ =E2=80=94 bring-up CLI: =
https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/92451      =
                                                                         =
    =20
    - common/ =E2=80=94 multi-component package support: =
https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/92452 and =
a small D-Bus helper:                                            =20
  https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93329    =
                                                                         =
                                        =20
    - ocp-recovery/ =E2=80=94 the updater daemon (incl. README): =
https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/92453      =
                                                        =20
  - entity-manager: OCPRecoveryFirmware schema =
(https://gerrit.openbmc.org/c/openbmc/entity-manager/+/93330) and the =
RTX 6000 Pro configuration used for validation                       =20
  (https://gerrit.openbmc.org/c/openbmc/entity-manager/+/93331)          =
                                                                         =
                                        =20
  - OCP Secure Firmware Recovery 1.0 spec: =
https://www.opencompute.org/documents/ocp-recovery-document-1p0-final-1-pd=
f                                                                    =20
                                                                         =
                                                                         =
                                        =20
  Feedback on the design is welcome, in particular the Non-PLDM-updater =
framing and the entity-manager configuration.                            =
                                   =20
                                                                         =
                                                                         =
                                        =20
  Thanks,                                                                =
                                                                         =
                                        =20
  Arun=20

> On 15 Aug 2025, at 15:25, Tom Joseph <rushtotom@gmail.com> wrote:
>=20
> Hello all,
>=20
> Devices such as GPUs, CPUs, and  NICs support firmware update using
> standard protocols like MCTP and PLDM T5. They also support recovery
> protocols, providing out-of-band mechanisms to detect when a device =
enters
> a fault state where firmware update is not possible and to securely =
restore
> it to a known good condition.
>=20
> The Open Compute Project (OCP) offers a secure firmware protocol [1] =
to
> determine if a device is in recovery mode and to facilitate recovery
> through the transfer of recovery images, typically over SMBus. =
Firmware
> recovery generally follows a two-stage process: OCP recovery is first =
used
> to deliver the Stage 1 (initial) firmware to the device, which then =
enables
> further updates through MCTP/PLDM T5. Stage 2 involves transferring
> complete device firmware using MCTP/PLDM T5, which is already =
supported by
> the OpenBMC stack. There are also similar custom protocols for device
> recovery, some of which support two stage updates while others recover =
with
> a single-stage update.
>=20
> To bring these capabilities into the OpenBMC ecosystem, the proposal =
is to
> leverage the standard Redfish API for code updates and utilize PLDM
> packaging for recovery images. Recovery protocols like OCP would be
> implemented as Non-PLDM code updaters, which handle the specific =
recovery
> protocol and parse PLDM packages to extract the appropriate recovery =
images
> for each device. This approach builds on the current efforts to update
> non-PLDM devices, such as VRs and CPLDs, with PLDM image packaging.
>=20
> I welcome feedback from the community on the approach and invite any
> alternative suggestions.
>=20
> [1]
> =
https://www.opencompute.org/documents/ocp-recovery-document-1p0-final-1-pd=
f
> [2] https://gerrit.openbmc.org/c/openbmc/docs/+/76645
> Regards,
> Tom
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: =
<http://lists.ozlabs.org/pipermail/openbmc/attachments/20250815/ee747a17/a=
ttachment.htm>


