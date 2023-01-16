Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15A2C54EBE
	for <openbmc@archiver.kernel.org>; Mon, 16 Jan 2023 09:54:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwS746KmQz3cBp
	for <openbmc@archiver.kernel.org>; Mon, 16 Jan 2023 20:54:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Om+uG6Aq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Om+uG6Aq;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwS5w5YMZz3c8p
	for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2023 20:53:54 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id 20so15134443pfu.13
        for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2023 01:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6MLvAR+tcutD4rOpDUKRKH1AbZr/fuddzCFzKr0DZWg=;
        b=Om+uG6AqogfhaUCGGdW5W+/6vg1JB9ZpIYfzYvCLB1G1LUFHpqf0Xyhx3NPsH6C6m3
         sAII24VIwWoC1mqafVD8PkT32s8Xmwpg3fjkJd9w5mDhqFx4A4XB1ypbTXe1tlRV99u6
         fx/hEyLjJa8c3tFflShY42qtucCLuyHLcNj43D2E4LSRO/2W6t9gA6bQ/R9gxoUOlszg
         3iuv0V07zuQYj6wBPnWr4QozQM/Yh7gqJGeyQQFwqrktqw1QHjdICQfKE/O7tdImEwCv
         UscB7fq17wVIYqsH69zC3N6B3kLaXxINFZ9NffeK9DCs2sva/dcU+WhKYs9FEl9P5OCQ
         oaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MLvAR+tcutD4rOpDUKRKH1AbZr/fuddzCFzKr0DZWg=;
        b=fyVsZMSbskgzFzQhb5y/gNJGp6uYJMidwYKq6JDU4j5bxHBsXN4643dQg3jnoJ8R1D
         /TGIZjUPaHonr3OTOWjD6mPSddGOjCICu7UGwKOEQXF83MaED6dyoiFw6/MO6g9zAEM8
         ANqWTdoqbHh3H3lu2b1e3oh+3QV1b+J1I55TnIajG8I3hMumtge1lF83kj1qm80mpURB
         r+uXRRcuct4Jdzsx4VXwhmeUqjFourjlVTr664GwA1Zx9CfVpYTD+P3H8J8ktDWdiZyT
         PEWqykhRGVNIhNRAzZ0Nm/CX0NdEmBkirqaq5+HDB6q7HmOXXOMIT3CpbGD+jVpvuTNt
         BkaQ==
X-Gm-Message-State: AFqh2krrQmyERGzW9xjeNq6331AF6mLTsJt2vfY/iGfqZq16ZhhsBeUI
	68uH8v00UBaipYDu18TZpvl75b8mWwSLkH1LLCccOrItcCJu5OPAZ/A=
X-Google-Smtp-Source: AMrXdXuRadeje08hFk/L8UIQpjM9dsz3pZOfLslOZpAykNS8sNrRiA5Qtp0cEFbWfcC7/MIbSIAC/IAdHvHU352NcEo=
X-Received: by 2002:a63:e314:0:b0:478:a97c:a1f7 with SMTP id
 f20-20020a63e314000000b00478a97ca1f7mr4423255pgh.496.1673862831066; Mon, 16
 Jan 2023 01:53:51 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 16 Jan 2023 17:53:40 +0800
Message-ID: <CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
Subject: BMC image generation without private key
To: openbmc <openbmc@lists.ozlabs.org>
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

The OpenBMC build requires a private key to:
1. Generate the public key that is put in the image;
2. Sign the image and generate the whole tarball.

For dev builds, it uses the insecure development key in the tree.
For release builds, it requires the `SIGNING_KEY` env to point to a
secure key to sign the image.

It is considered insecure because it requires the build server to
access the private key.

An alternative is proposed:
* A new `SIGNING_PUBLIC_KEY` env is defined to point to a public key.
* The above key is default to empty, and the behavior is the same as
before, using the insecure development key to generate and sign the
image.
* With a valid `SIGNING_PUBLIC_KEY`:
   * The public key is installed into the BMC image.
   * The generated tarball is not signed, only containing the MANIFEST
and the image.
   * A new `gen-bmc-tar` tool will be introduced to sign the above
tarball, like `gen-bios-tar`.
* If both `SIGNING_PUBLIC_KEY` and `SIGNING_KEY` is set, throw an error.

With the above proposal, the build does not require the private key
anymore and the user could install the public key during build, and
sign the image separately.

Comments are welcome.

-- 
BRs,
Lei YU
