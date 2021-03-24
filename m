Return-Path: <SRS0=pSEg=IW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF15CC433C1
	for <openbmc@archiver.kernel.org>; Wed, 24 Mar 2021 16:18:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CAFA61878
	for <openbmc@archiver.kernel.org>; Wed, 24 Mar 2021 16:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CAFA61878
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5D1q602gz30Kq
	for <openbmc@archiver.kernel.org>; Thu, 25 Mar 2021 03:18:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=i3t1eqNT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.104;
 helo=mail-41104.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=i3t1eqNT; 
 dkim-atps=neutral
X-Greylist: delayed 603 seconds by postgrey-1.36 at boromir;
 Thu, 25 Mar 2021 03:18:14 AEDT
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5D1L28bjz301j
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 03:18:14 +1100 (AEDT)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4F5Cng31JFz4wwvp
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 16:08:07 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="i3t1eqNT"
Date: Wed, 24 Mar 2021 16:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1616602069;
 bh=VUDGyXRBGyX+SoRK7oloT/1mngBQp2YYygj70Eb6fdk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=i3t1eqNT5hfToPrPRfd7bd+OXCAni0Zj44FJkQQhwmNLfbrXGTIAzYEST4Th7XWT+
 g11BrP0oqW1IWzL70zvrlgLU6PKzb5beWV+qvBdOq0SkOZd41HKCBuza/s+QFFjqzN
 PxsvaRwzsMh4Bvica8nICmcFnTd+LiJBt8RL7tWs=
To: Matt Spinler <mspinler@linux.ibm.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Question of phosphor-sel-logger
Message-ID: <paWNyD0YyWB8JqlKoxpFjZVediObwa3_9OTOgRnRz3IuDGKI9LXWNuDdKD6J0etwd8dH8CFC-QdiryYtIPerypJ0UQ5qaSDoU0hGVqJB5BY=@protonmail.com>
In-Reply-To: <707efde2-b301-fc23-be4c-92d1d96d8432@linux.ibm.com>
References: <TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com>
 <707efde2-b301-fc23-be4c-92d1d96d8432@linux.ibm.com>
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
Cc: Duke Du <Duke.Du@quantatw.com>, Fran Hsu <Fran.Hsu@quantatw.com>,
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 George Hung <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi,

On similar lines, phosphor-sel-logger doesn't add callout to logging entrie=
s.

How are the SEL entries parsed by phosphor-ipmi-hostd without respective se=
nsor, inventory path?

Thanks,


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Wednesday, 24 March 2021 18:50, Matt Spinler <mspinler@linux.ibm.com> wr=
ote:

> On 3/24/2021 6:28 AM, Duke Du (=E6=9D=9C=E7=A5=A5=E5=98=89) wrote:
>
> > Hi all,
> >
> >       I used package phosphor-hwmon and phospor-sel-logger to monitor s=
ensor and create log when sensor reading
> >     cross the threshold. I found after the commit 25b26e162bd109b51aa09=
b16f26f9aa3d9d940fa of phosphor-sel-logger
> >     would catch the signal "ThresholdAsserted" to create sensor threhol=
d log in the journal, but the phosphor-hwmon
> >     would not send the signal "ThresholdAsserted" when sensor reading i=
s abnormal so that phosphor-sel-logger
> >     would not create the sensor threhold log, am I right ?
> >
> >     If I'm right, can you give me some suggestion to fix this side effe=
ct, or what setting I have lost in the
> >     phosphor-hwmon or phosphor-sel-logger ?
> >
>
> Hi,
> That signal isn't defined in phosphor-dbus-interfaces, so phosphor-hwmon
> cannot use it.=C2=A0 When I tried to add it, it was rejected as-is with a
> recommendation to break it up into separate signals for each alarm
> property on each interface.=C2=A0 At that point I gave up and had the cod=
e I
> was working on at the time just look at propertiesChanged signals instead=
.
>
> If you would like to take that up it would entail:
>
> -   Update
>     https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces=
/+/39899
>     as requested
>
> -   Update phosphor-hwmon to emit the new signals
> -   Update phosphor-sel-logger to also listen for these new signals in
>     addition to the=C2=A0 current one, or change the dbus-sensors code to=
 only
>     emit the new signals.
>
>
> >     phosphor-sel-logger commit 25b26e162bd109b51aa09b16f26f9aa3d9d940fa=
 link :
> >     https://github.com/openbmc/phosphor-sel-logger/commit/25b26e162bd10=
9b51aa09b16f26f9aa3d9d940fa
> >
> >     Thanks very much !
> >     Duke
> >


