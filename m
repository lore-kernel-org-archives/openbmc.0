Return-Path: <openbmc+bounces-2026-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ECACD6E57
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:52:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSL05SSwz2yrt;
	Wed, 03 Jun 2026 09:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441574;
	cv=pass; b=knP8JczXJt444nxct8eIzbsuKcEMofCW4mi6FELy8MDQgI2+tkC2Rc/Uoz8/gTVy92y3vhV8QtWj0S9FB0n8pX36qqXEDIsJ+J+7I+yf5jTqdgVNZtaPLpMu6An2I+MsjMw4ZwFc05h1Y1I54ixtn7h8LqxFvh/zW4SnMwPZC090ESxGjHV6S0GNp5Rgx82zvWitl0plhCmW2Bw9yJBFo5bG7n2xcuioHeVUm9kEpYbwG94BbiKXILlv+tvxyuwo4VP4AzZ0G4+DRRRX6ERhE2JCepjC+VSoFeMvLkotf/kQrza93HtNZ3SolEU9nK4T0DamO8DzrYkaLd2VdmmmsA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441574; c=relaxed/relaxed;
	bh=lwSMZdceV8VvHlS48xYli6PjbMHYogSzjkrpDTtp5lY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PKTBAbg3d3/pwGK5Racrfrnt3OUlmqr5Etu2xbEKkhNSdAfYUmWYuelhdfy61X+24pYJqAh15N4EYVdjbOT1m0c6YJEF8VPfZdA3oVr0ojrbYz5cyYfvT2U2VLP9iQBCmEH7VE9o2X3ek2L1lQY6OuX4X+Y60dq7C10X9HJ++fMAeGQV98Ji836hclarLUFI/7aOgnvya9b+q9eQxroRpbbGKVZClrzG60JFCfDjRLFHbH/20YZYn1ivutWTuVIusKLobox3Vl4S2+pY/Rh6NOYJbgcTS+Oyt5EnmhslU044U86Kl/nH0fJ+QqRSNKR7fTc44jC5TKfODKd5qlfouA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VaF+hWcm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VaF+hWcm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVRK15wBCz2yMn
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 09:06:13 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51765531803so113391cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 16:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441572; cv=none;
        d=google.com; s=arc-20240605;
        b=XdU3aQQhHyOjjYgG7m+4GRIwkApbOhfEYD7L6xQTU6RMFCzQKqCs1tnd3xaCBz01j5
         MYmN46libP0xXEqaVtYPetsk7vGHkj0nIIyD7S9knaN2eBi2QyykX/PFuzymKFiRSDmY
         dSEzh6RDyzmCQJAWAGQmxuoz5dRvk2fP4W49FLKXj6ysi5AhSWjikiOHQOfzBRe0aufp
         RAcJumB3tjofQX+QsBA7G8lo2oazc7OTU86jSili5sDJk4xtvkG/Z611ItmuGRopckg4
         USItz0+y7cyHfHQVPt5AY80iUvyDZFhBiq42jVbeWRv9ykjFF8BEGH5RySo5Y8UeRDGO
         TKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lwSMZdceV8VvHlS48xYli6PjbMHYogSzjkrpDTtp5lY=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=UCQ7A1zuZwXQjlxfVSC4BnFJKaT835fAH33cjPQWOr13OuFLT+X8Rqk+jg3fBvC0oj
         SCZOt5qOtsxdhPTHNsKPlmwNnNR8WJ4l0+EtsfNGdm4plCPYi5lDRFTczLBrT1Lw8lQK
         xhe1szzOTe0Y5pXG0m9XTie5XvzsF3FLLmubzLnOaRyuJbv4dDHxHc9MppGBdTbLkyTK
         OdcgV8ReWZL+gtmWHuDg8LaMvoTJsCKhfY3PDOXQ/VwIzYli8/XQpx2bWF0HN9dqgfHS
         9BfYd/wsMC0ORBe9igjnBYOtN82gHNZeolp4RIalh8If3bVdj33A9nybUAmmr8Fvw4PM
         xHgA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441572; x=1781046372; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lwSMZdceV8VvHlS48xYli6PjbMHYogSzjkrpDTtp5lY=;
        b=VaF+hWcmlXgl9Qs676MQruYoulyeZow7rr9i2CEufStX0csRaPphcdg2BO8j6nE+Gi
         TM3hAPP5tXnkRavTrlqDpmxnc9YhljA9vN697kMJqAiLUR/nuF2uVWXCg4iE9qKgCo7F
         U3GUWFhvin0B49IFpe4f0GHrJb4RHyf4Vi4XmPsS1OVnONG4ewoctcQLcAz/ED26DARJ
         EGAq4J+zWfnlcPB9qDTCCJrOhswW5bmDAGO48ay201UTMbg9LX7e39nhKWGuBgn7MBJv
         4SMYhoKe8ZGbJmlgr6WwGCL/FU2tvxR1V7rFwgJ9UfOQde6U3nq/oKLCbuoxfMc/4ime
         Pr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441572; x=1781046372;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwSMZdceV8VvHlS48xYli6PjbMHYogSzjkrpDTtp5lY=;
        b=sVOPsw9BhHWeUPjENqX6VcjiltqtuKDLcY3kJjCHDvSO3B9u7suSLIY0ckovwywHlf
         xDwXO67MMJD/jNFL7koQPLThqwXIKIJgu7V7NTlUsAmlDjONhG/liJbGq6uat2Rb4PJC
         0WAw16Jzn9mx70hesNPBimQNsst91ePbykhZDaeWOftC6NDxG4FWMbC0BCTmKa/so7Uq
         szgdOUArKE1XL+MmNMFjzNaqLuZXUflEy/IhPgYPcZzL7E/nRRZo4KKkVUj6K6IWfWZF
         sdNrzN+eMAOJhg1bK9lzd6ucqB7DAyCr0+QvB69Dka2eTA+1bZYEkxDxi5URMrQXTYxO
         uZGA==
X-Gm-Message-State: AOJu0YwUNE8IHvfQgPoSG8EZd3W0hU++lOa2XwIdfPI5+ZokYzoaimwg
	5l/X8aRQTWKDMdqdD1534JoVfucLoSkD0Grf97cdRUKG2dCwRTH/5kCLtCOzhpUkZPlXXV5nyGi
	EkLjrTM2d0S2xUQY9XBZY9Uy9p3aeCBOkmHzbpKSn3UBlNRjtWdYESlFMs3U=
X-Gm-Gg: Acq92OEBKXe+/u2NqMyJRmvcizsFPVxkWZOYMOhVh+n7jDcektS7zbmEiF3o2ewLFGY
	iMKFIBBXyGDgeqyRydV4Q5FUrm7wWKrlCIrGY7d/lPHYozppgaCLZeCUdExwoWQta5j0JlsnZ5r
	bNNQ92c83eMgPYtFHOQ3M10r07bHbzhmmxco5XktgZOLHDwmySULsl87Zvr2t7DM58px57h/86z
	HTx7aaiVHHZc9ZvtkUmF6+0uKkj28NUHYUGxqiQIyun01CAPS6PQRJtmGh1/s5bQxWnCatcdpRN
	ONpOAflS/y6KA65hPNQ2BdYtUALB5cpvCV+PS5hlIL4PcPq1CwMI4PGyLnwrVj4=
X-Received: by 2002:ac8:548c:0:b0:516:4f62:85e7 with SMTP id
 d75a77b69052e-5177bad0edcmr262241cf.18.1780441571311; Tue, 02 Jun 2026
 16:06:11 -0700 (PDT)
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
From: Bhargava Naidu Gulla <bhargavagulla@google.com>
Date: Tue, 2 Jun 2026 16:06:00 -0700
X-Gm-Features: AVHnY4KVhkXh4ziXDnfVp2LOQGsKaFxnRrZUP7LyS55pO33gBDyPQgO37fUgYAc
Message-ID: <CAEPZvmNu--4-Fm0Kq1SVkkNByOB3SDR3MxRQ9Y1w4j28gUBAcg@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels: Silent Log
 Task Dropping due to Timer Overlaps in HostNotifier
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000067ea1a06534d5b47"

--00000000000067ea1a06534d5b47
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report a race condition and state corruption vulnerability
inside the Host Notifier state machine of the openpower-pels extension.

Overview of the Vulnerability:
Rapid, concurrent, or noisy host state transitions can corrupt in-flight
task tracking for Platform Event Log (PEL) notifications. This results in
event log notifications being silently dropped, preventing critical system
error logs from being delivered to the host operating system.

Affected File and Location:
File: extensions/openpower-pels/host_notifier.cpp
Line: 234

Root Cause:
The `hostStateChange(true)` method arms the `_hostUpTimer` but does not
disable or cancel already active timers (such as `_retryTimer` or
`_hostFullTimer`).

When the first timer expires, it invokes `doNewLogNotify()`, which launches
an asynchronous PLDM file transmission task and sets the tracking variable:
  _inProgressPEL = pelID;

Because `doNewLogNotify()` lacks a command-in-progress guard check
(`_inProgressPEL != 0`), if the concurrent overlapping second timer expires
before the first PLDM command's asynchronous response is received, it
blindly executes `doNewLogNotify()` again. This second execution sends
another PLDM command and overwrites `_inProgressPEL` with a new ID. The
tracking for the first PEL is permanently dropped, and subsequent status
responses are mismatched.

Proof of Concept:
1. Force the HostNotifier into a retry state where the `_retryTimer` is
currently armed due to a full or blocked state.
2. Rapidly trigger a D-Bus host state property change, invoking
`hostStateChange(true)`. This arms `_hostUpTimer` in parallel.
3. The `_retryTimer` expires first, starting a PLDM send task for PEL ID A
and setting `_inProgressPEL = A`.
4. The `_hostUpTimer` expires next before the D-Bus/PLDM response for PEL A
returns, and fires `doNewLogNotify()` again, sending a task for PEL ID B
and overwriting `_inProgressPEL = B`.
5. Observe that tracking for PEL ID A is dropped from the queue and
permanently orphaned.

Proposed Patch:
Add an active command guard check at the beginning of
`HostNotifier::doNewLogNotify()`:

if (_inProgressPEL != 0 || _hostIface->cmdInProgress())
{
    return;
}

Legal Name for Attribution: Bhargava Naidu Gulla

--00000000000067ea1a06534d5b47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report a =
race condition and state corruption vulnerability inside the Host Notifier =
state machine of the openpower-pels extension.<br><br>Overview of the Vulne=
rability:<br>Rapid, concurrent, or noisy host state transitions can corrupt=
 in-flight task tracking for Platform Event Log (PEL) notifications. This r=
esults in event log notifications being silently dropped, preventing critic=
al system error logs from being delivered to the host operating system.<br>=
<br>Affected File and Location:<br>File: extensions/openpower-pels/host_not=
ifier.cpp<br>Line: 234<br><br>Root Cause:<br>The `hostStateChange(true)` me=
thod arms the `_hostUpTimer` but does not disable or cancel already active =
timers (such as `_retryTimer` or `_hostFullTimer`). <br><br>When the first =
timer expires, it invokes `doNewLogNotify()`, which launches an asynchronou=
s PLDM file transmission task and sets the tracking variable:<br>=C2=A0 _in=
ProgressPEL =3D pelID;<br><br>Because `doNewLogNotify()` lacks a command-in=
-progress guard check (`_inProgressPEL !=3D 0`), if the concurrent overlapp=
ing second timer expires before the first PLDM command&#39;s asynchronous r=
esponse is received, it blindly executes `doNewLogNotify()` again. This sec=
ond execution sends another PLDM command and overwrites `_inProgressPEL` wi=
th a new ID. The tracking for the first PEL is permanently dropped, and sub=
sequent status responses are mismatched.<br><br>Proof of Concept:<br>1. For=
ce the HostNotifier into a retry state where the `_retryTimer` is currently=
 armed due to a full or blocked state.<br>2. Rapidly trigger a D-Bus host s=
tate property change, invoking `hostStateChange(true)`. This arms `_hostUpT=
imer` in parallel.<br>3. The `_retryTimer` expires first, starting a PLDM s=
end task for PEL ID A and setting `_inProgressPEL =3D A`.<br>4. The `_hostU=
pTimer` expires next before the D-Bus/PLDM response for PEL A returns, and =
fires `doNewLogNotify()` again, sending a task for PEL ID B and overwriting=
 `_inProgressPEL =3D B`.<br>5. Observe that tracking for PEL ID A is droppe=
d from the queue and permanently orphaned.<br><br>Proposed Patch:<br>Add an=
 active command guard check at the beginning of `HostNotifier::doNewLogNoti=
fy()`:<br><br>if (_inProgressPEL !=3D 0 || _hostIface-&gt;cmdInProgress())<=
br>{<br>=C2=A0 =C2=A0 return;<br>}<br><br>Legal Name for Attribution: Bharg=
ava Naidu Gulla<br></div>

--00000000000067ea1a06534d5b47--

