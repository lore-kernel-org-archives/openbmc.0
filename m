Return-Path: <openbmc+bounces-2731-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1105CA5FED
	for <openbmc@archiver.kernel.org>; Tue,  6 Oct 2026 22:23:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hzrPN2BSqz30St;
	Wed, 07 Oct 2026 09:23:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791286251;
	cv=none; b=KlAJuJFUbqlHZNh+cIi4TdwOVt33hlcmDu9tCX19n8C1TPTc52AQb19kyY3V/w9IHvx0Ggh+mOxSOmQhq0hqf188cU1Rutq12y7z281qKjl3I4sxpVsCp1CiGiP83wqpI+qwYg/kuriZeIP6FtUQORwBM4Fa6AYQLpVfxgUxQhZupfa7STF+phqOk75g+zFf//B4d+1EfbvQLBetsPcGXsPVUY9HRrHNduJCTxhYNVrwqBXVOMhVmBoKeK1X+LsGf09+2hd01+A15X9GDx/zLOuRIleAAXLSunLmXKKrQ5v51ZtwtVQe1/Zh0DfeypPYI0a38HXdZBzMfTrqbBN2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791286251; c=relaxed/relaxed;
	bh=vg1j7SopETdWwc1YtCRYqvPEQKWX9jYE07ROn15rM34=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=jCbzj7YKbLJU6A8nPzkB/mIQDUtUncCxZqjedx2p++ieYFT/cOWbtoIfehFilzcym95to88nWMxE9FPw/XoeuiZQHPXFo/KrNhoqpeb303vUwfawvVe4LEfp3KmBZ55HSuQMq4tlBlhI2gKCaHXzeNr+eMfM+cimZy8EyUeV4aYvXrov4eqvNvbp68gvpgE5E2kTRb5wnWUkZOE1S45lL6ogbrU7j9hFDg5n47BM45eCc0yHjsLc7FwYrh5maQD29nOWyhPbOKurBqlSudSsf5BozX8WhIAdtQMSAa0aT58io0jyL1pd5QZEUdi7Fhuh2Vlspprb7LNW8TCTmSQ6iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mRg0Mwjo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=aryakpadman@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mRg0Mwjo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=aryakpadman@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hzYwT6Zv5z2yjw
	for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2026 22:30:48 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2dd76b1361dso18161495ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2026 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791286246; x=1791891046; darn=lists.ozlabs.org;
        h=to:cc:date:message-id:subject:mime-version:content-type:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vg1j7SopETdWwc1YtCRYqvPEQKWX9jYE07ROn15rM34=;
        b=mRg0Mwjo0ekkHGE2MLvX1EO/tJaSGwx1+lHNWRCn429gmZalRcY+glFY04UbUIORIe
         0+xmOHVIWdZ3VtsHeOr4N0acVDCP3ViUnJHl/asV9O3liq37e6qZX8FGBthuZb1ju9oj
         ZbA2WAriRl+4CkP54aImeFcyrB2oMxY4RYfs9RxXvw+0AeNPHKjClrVX6iF5TF5lAjrS
         7D/MYrFozHGtb6Ky4xaoD3UnkdbcUbEVcjKpzZJWrCMLsVcrjxe1VtV2WvmGUdcyeFo6
         gKkaltv+OWW+6C3TP91auH0eu3h+dMAnHN497vouLE4M1WsxdQATQkFi7/xoIv1+SN57
         pfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286246; x=1791891046;
        h=to:cc:date:message-id:subject:mime-version:content-type:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vg1j7SopETdWwc1YtCRYqvPEQKWX9jYE07ROn15rM34=;
        b=MB65gy4rrdTtM/x8juB9UuG3jtiG2eEUKecPBi89F1rRrfXyRu9b/OS8dpSBMSUUYo
         fP73UAi+vp2vY6KdMnydbRbjVv7M9V6tuFVGLAXQQm+kL+3gaLd0hyAmEGV8vtcSEcz7
         Z13g3pZqFatsUOIRQRBX5iUGm07LWKO2b8eZoFv97b0ViMbTmieWUCI7B8bk+/Wjokm3
         QPc+bXubXjsT0NzcH/URZ8/p3WlDP5qhuI68nBVM55I1OnKVwctTD5Qc4PQR2z3nURak
         Kd9zl4MBpZ0m22raFrb/YVz/KJUDEaCWULatvaS0pOBTJI/SYFEmMRbU4hmCtuA0X1xW
         pX1Q==
X-Gm-Message-State: AFq9FYK3fy5MmK90xXNXmOk8LuMiQ8Wh2OUVpXorJ6HtvDlHJf901Qg0
	sxW0PbD4fpVyUxmeD/whpIFWqEGL+R8N0VIpzRdt6HVT7OVezZ8u13sk29dPp+co
X-Gm-Gg: AYBFou1jnYJQTv+ILV+cIOPkGc8+MlloDl85YiirDZ5E8TBzlpQ9oc5RBDxqOwDHtGD
	rx4nMKuK+ZurLtlxFRrpRJ8z+jAFeYobcME5d7tRbMCkDENlVxabJ7fhundC4W7YJINr/5vUKLr
	Of8u7L8vztLkDLKnK0MClHKGuZLFq0T3OwkweQMAlr1Ihe83ga3vzisMTVKPvYs5v+4wH0M+ohY
	7gPYv5v3II6eHSDjEa2MYyIrRMK/aYYD+r/khthOFnB0LQo+rHnCaWFHyvs096cjWE+fWUP7olM
	zdXrF+ocR23896/t7+380hpwT8yoa38nTYIHcbxITuyRhCdQGq3DrS2jpbnu8aET7ViO7yFLhMY
	VhBv9k61T7v2zTQKD6/To2niUD6dHB+OqamCTqn7pIKMgMIXsBFacINLPs16SInGp+ITbJrvyCx
	ctCTcnmVUv2ZRxAvNpLfuw36U1nUA9P7rIBH8avTrCO+bge76e0LFe12tosy+WVqu1sESz1aIcM
	Obdrtand0xfhHzv/cU=
X-Received: by 2002:a17:902:d4c2:b0:2dd:c100:4249 with SMTP id d9443c01a7336-2e51051de7emr103802785ad.45.1791286245443;
        Tue, 06 Oct 2026 04:30:45 -0700 (PDT)
Received: from smtpclient.apple ([129.41.8.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5eb9254sm20050835ad.36.2026.10.06.04.30.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:30:45 -0700 (PDT)
From: Arya Padman <aryakpadman@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F9033F9F-D544-4A0C-A743-DA53D6C3E58C"
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
Subject: phosphor-settingsd : Upcoming change won't no longer emit IA signals
 during startup
Message-Id: <B995B82B-2B9F-4935-89D5-AD5B0B6C6BCB@gmail.com>
Date: Tue, 6 Oct 2026 17:00:29 +0530
Cc: rameshi1@in.ibm.com,
 spinler@us.ibm.com,
 patrick@stwcx.xyz,
 rajivs12@in.ibm.com
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_F9033F9F-D544-4A0C-A743-DA53D6C3E58C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Team,

As per the OpenBMC guidelines, applications are expected to request =
their D-Bus well-known name only after restoring any persisted D-Bus =
objects. The current phosphor-settingsd implementation does not follow =
this sequence.

I'm proposing the following change to request the D-Bus name after the =
manager object initialization: =
https://gerrit.openbmc.org/c/openbmc/phosphor-settingsd/+/88601

With this change, settingsd will no longer emit InterfacesAdded (IA) or =
PropertiesChanged (PC) signals during startup. Runtime behaviour remains =
unchanged, and these signals will continue to be emitted normally for =
runtime changes.

=46rom my review of the OpenBMC repositories, phosphor-logging was the =
only component I found relying on IA signals from settingsd. That =
dependency has been addressed by changing it to monitor NameOwnerChanged =
instead:
https://gerrit.openbmc.org/c/openbmc/phosphor-logging/+/95058

Please write back if any of your components depend on IA signals from =
settingsd during startup.

For consumers that need to detect when settingsd becomes available, the =
recommended approach is to subscribe to NameOwnerChanged, filtered for =
the settingsd well-known name at the D-Bus daemon level (arg0=3D). This =
is also the approach used in the phosphor-logging change above.

If there are no additional dependencies or concerns, I'd like to proceed =
with merging the phosphor-settingsd change in about two weeks.

Please reach out if you have any questions or concerns.

Thanks,

Arya K Padman
OpenBMC Developer
Discord: aryakp

--Apple-Mail=_F9033F9F-D544-4A0C-A743-DA53D6C3E58C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dus-ascii"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><font face=3D"Arial" style=3D"font-size: =
13px;"></font><font face=3D"Arial" style=3D"font-size: 13px;"><span =
id=3D"x-apple-selection:start"></span>Hi Team,<br></font><div><div =
style=3D"font-size: 13px;"><font face=3D"Arial"><br>As per the OpenBMC =
guidelines, applications are expected to request their D-Bus well-known =
name only after restoring any persisted D-Bus objects. The current =
phosphor-settingsd implementation does not follow this =
sequence.</font></div><div style=3D"font-size: 13px;"><font =
face=3D"Arial"><br>I'm proposing the following change to request the =
D-Bus name after the manager object initialization:&nbsp;</font><a =
href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-settingsd/+/88601">h=
ttps://gerrit.openbmc.org/c/openbmc/phosphor-settingsd/+/88601</a></div><d=
iv style=3D"font-size: 13px;"><br><font face=3D"Arial">With this change, =
settingsd will no longer emit InterfacesAdded (IA) or PropertiesChanged =
(PC) signals during startup. Runtime behaviour remains unchanged, and =
these signals will continue to be emitted normally for runtime =
changes.</font></div><div style=3D"font-size: 13px;"><font =
face=3D"Arial"><br>=46rom my review of the OpenBMC repositories, =
phosphor-logging was the only component I found relying on IA signals =
from settingsd. That dependency has been addressed by changing it to =
monitor NameOwnerChanged instead:</font><br><font face=3D"Arial"><a =
href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-logging/+/95058">htt=
ps://gerrit.openbmc.org/c/openbmc/phosphor-logging/+/95058</a></font></div=
><div style=3D"font-size: 13px;"><font =
face=3D"Arial"><br></font></div><div style=3D"font-size: 13px;"><font =
face=3D"Arial">Please write back if any of your components depend on IA =
signals from settingsd during startup.</font></div><div =
style=3D"font-size: 13px;"><font face=3D"Arial"><br></font></div><div =
style=3D"font-size: 13px;"><font face=3D"Arial">For consumers that need =
to detect when settingsd becomes available, the recommended approach is =
to subscribe to NameOwnerChanged, filtered for the settingsd well-known =
name at the D-Bus daemon level (arg0=3D). This is also the approach used =
in the phosphor-logging change above.</font></div><div style=3D"font-size:=
 13px;"><font face=3D"Arial"><br>If there are no additional dependencies =
or concerns, I'd like to proceed with merging the phosphor-settingsd =
change in about two weeks.</font></div><div style=3D"font-size: =
13px;"><font face=3D"Arial"><br>Please reach out if you have any =
questions or concerns.</font></div><div style=3D"font-size: 13px;"><font =
face=3D"Arial"><br></font></div><div style=3D"font-size: 13px;"><font =
face=3D"Arial">Thanks,</font></div><div style=3D"font-size: 13px;"><font =
face=3D"Arial"><br>Arya K Padman</font></div><div style=3D"font-size: =
13px;"><font face=3D"Arial">OpenBMC Developer</font><br><font =
face=3D"Arial">Discord: aryakp<span =
id=3D"x-apple-selection:end"></span></font></div></div><div></div></body><=
/html>=

--Apple-Mail=_F9033F9F-D544-4A0C-A743-DA53D6C3E58C--

