Return-Path: <SRS0=4hYz=I3=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62990C433DB
	for <openbmc@archiver.kernel.org>; Mon, 29 Mar 2021 15:37:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA6F61932
	for <openbmc@archiver.kernel.org>; Mon, 29 Mar 2021 15:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CA6F61932
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8Gt35wwpz30FP
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 02:37:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=KFYkkPOl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.132;
 helo=mail-40132.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=KFYkkPOl; 
 dkim-atps=neutral
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Gsd0CNzz2yYk
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 02:37:05 +1100 (AEDT)
Date: Mon, 29 Mar 2021 15:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1617032219;
 bh=7zEGhqszuxcE3bDYYyFejS/smBXkpEFJ+YMWd4gZaxc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=KFYkkPOllbqCgyD/wo2Qi2cZD8PIEtzEFKMHXF9aWHaYtuvIBKtPP2NE0hSzMwLnu
 mB4xpVSXbEjtHmUlnUmNM4uLKCFwKWjgfzZdmbHusbZ4XmKnQBrVpT46XSbcIM63br
 ElVw3hJDBZg9Ofu1gZ2CBgXBPrxKopRGwj6/42N4=
To: Lei Yu <yulei.sh@bytedance.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: IPMI SEL Parsing
Message-ID: <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
In-Reply-To: <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: rgrs <rgrs@protonmail.com>
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Lei,

Thanks, phosphor-sel-logger logs to phosphor-logging after enabling SEL_LOG=
GER_SEND_TO_LOGGING_SERVICE.

The APIs IpmiSelAdd() adds entry to SELs (tested using busctl)
But, "ipmitool sel list" doesn't print correctly. It prints "Undetermined H=
ardware Failure" for these entries.

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Sunday, 28 March 2021 08:21, Lei Yu <yulei.sh@bytedance.com> wrote:

&gt; On Sat, Mar 27, 2021 at 12:08 AM Bills, Jason M
&gt; jason.m.bills@linux.intel.com wrote:
&gt;
&gt; &gt; On 3/26/2021 6:47 AM, Bruce Mitchell wrote:
&gt; &gt;
&gt; &gt; &gt; On 3/26/2021 01:04, rgrs wrote:
&gt; &gt; &gt;
&gt; &gt; &gt; &gt; Hi Matt, Bruce,
&gt; &gt; &gt; &gt; Yes, SELs for sensor events, threshold alarms.
&gt; &gt; &gt; &gt; When a sensor value is beyond the range of thresholds, =
we need to log
&gt; &gt; &gt; &gt; the SEL.
&gt; &gt; &gt; &gt; My understanding of OpenBMC implementation:
&gt; &gt; &gt; &gt; dbus-sensors/phosphor-hwmon logs d-bus errors (logging/=
entry).
&gt; &gt; &gt; &gt; Each entry object has a "callout", that is used by phos=
phor-ipmi-host
&gt; &gt; &gt; &gt; to convert dbus-error logs to IPMI SEL (16 bytes).
&gt; &gt; &gt; &gt; Please note that there are two locations that SEL entri=
es can be logged:
&gt; &gt;
&gt; &gt; 1.  D-Bus
&gt; &gt; 2.  Journal/syslog
&gt; &gt;
&gt; &gt; It looks like you are using D-Bus which I'm not familiar with.
&gt;
&gt; phosphor-sel-logger now supports either, by default it logs to syslog;
&gt; With SEL_LOGGER_SEND_TO_LOGGING_SERVICE enabled, it logs to
&gt; phosphor-logging which is on D-Bus.
&gt;
&gt; You could call the same APIs ("IpmiSelAdd", "IpmiSelAddOem") to create=
 SEL logs.
&gt;
&gt; ----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------------------
&gt;
&gt; BRs,
&gt; Lei YU

</yulei.sh@bytedance.com>
