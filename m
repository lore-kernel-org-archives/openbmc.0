Return-Path: <openbmc+bounces-2031-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482AACD6E5D
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 23:53:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVSL56KcRz2yS4;
	Wed, 03 Jun 2026 09:52:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::833" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780441423;
	cv=pass; b=DR/xJP6vC3hAygTRlYjf7MqBS5200sEJYAIM+9uMogl9aM84eVbVvQi591BshkvPPYRMpquDCdSBcxpEnlcHq4SHDbQDI1uTQFw3be1ZapWFerSmaBewFZ5Zzt7oMsa9KGfYJEnHVg4iMfXcTLRsRKOozy5RmpDW2PKMIpZZ6++ITxLL8C3Hb1QHSfRc3gBO32em5UbbhL18IYZQboh+sMlmm6AXKWWIoXv7UvxL5zaE3qxyuyifbAa/PkXQK+9O/zlvwDwe0md2mV4gMfpOnAFhq7m0VR1WQH1rwsHLoQ/GTMGPlZO0Rvt7Fb59cynlVcRSh82o4cBXTIzN4yqZEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780441423; c=relaxed/relaxed;
	bh=ZGO8j2pKHoxMARzagOp1IjbnNGYIgj+GUgUC4UIJ2qs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hPFAbNFvvbtgT26NN5SJF3XYf/wQa6nWfVIsu3/yeHbUEM5hAI3E0269KG4A2rG2WjyuifmEGFJaAKLOQ5udOTI9IeFdT27p7jM3znS2NsxJTphkvr/y4+MsKVpoUp0zCTLzwZVQDHyXQ43OT6ZVcWogbGSbtOF1yJxWU4dhQJPruK9xzu+vZyifx2pXhjqDqVC8ycDq2nqkI+ujk9t46UPXWheCb/i9hIyh1faB1G9455qmX+CUIJlEeQNNRDwRknvDrGsMARUer2jYfWcI+U+gRZq+FZoTJp3rJOBU6Vcteq6Hl585FPn1bgP4r6eFOwWwxCLPOZnAHMkIqTpS3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gJV6Uy9S; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gJV6Uy9S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=bhargavagulla@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVRG64N6kz2yMn
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 09:03:42 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51765531803so112331cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 16:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780441420; cv=none;
        d=google.com; s=arc-20240605;
        b=GHaLcvxvs7ga0SEbz3mIaGS0a9BC3SgFUGGP7BVs9IWm27Q9eTw1ogZlp3/M9yYbG1
         Wvp7am8VMv1NXHvMhhYX8rX3Q1kIc132piqO5jqiSatONgrfDaXrggJ9nyPqijX2JmAz
         BwloVVJL506MwznWO+ZtL2nSa+i7L8K0ZnCISRsfJgQt2GyMyVoSA3GTlb7W174Lo/qh
         B/jbALENgekTWxnCI67Y+ad+JjUwaRxr6zH/tSapECOzEhVfTh7vbq1l8trAuC06pXHF
         5gcYe+JXkYwVuRuLBxHHrxZjpewNsLXT6iD5lMN9CfggehzsyHAo/ul0BgSJAGZEK1wO
         J9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZGO8j2pKHoxMARzagOp1IjbnNGYIgj+GUgUC4UIJ2qs=;
        fh=B5hptedw+6RyGR/i2ArH91xOt8ZhRewMTnM2T7RVmak=;
        b=WUupVcFMe6WSPhZpm3ZAJnQbpgsbEAo+06s1IQpLqZXfoYLKr92rlPVcc8QlaagZXF
         AePioyaB8iOnjCDB31yIi3tP/VNptUBj5RMgSglTXDrtZX3+qgMXD+NvOLznxnn1MseI
         ZqFu6qLEoAjlovPOXEnBqg1VcqKfQmVCj9rVRpBkXFS9I7HHzzfNSxRdp8k0B/rD8AyK
         68R1tkyBV4hSrxcIyIFW/3fFlZjQraNA+AnjbHkr7Xc7DOo4G0N4z507vN5miHNQ1b12
         xDFAVj5h4pTHRISAEHUmwtUjCDx9vf1zPwYPeIAgAJIueWUJETaq6HmLv9HgbWqI1ksv
         u1Jg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780441420; x=1781046220; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZGO8j2pKHoxMARzagOp1IjbnNGYIgj+GUgUC4UIJ2qs=;
        b=gJV6Uy9SBeIVLsYgvh4Kr/g0Bkj7AEP7OY9NEO+L0VUvX7LtMaY1pUzSBKSwjnjAFG
         YccApDjnj8LXwCCImKuVyscr+KqXO8zrLD/smtuQSBp27aWIkCNXMh322+7QRt8USpo0
         B9ReuDjkNNFL2sRTCwoyJ7Ca0dtDJ+Ove1+Og0YlcIclFEkASjZboqqTsklRRZANDFxZ
         z3LFFLG3dw22q8Tavo0FA9aYduN9Hbc4luuxIust5/bSvqmRrh2URi+gBHOuzOiMaL00
         OMFaSXMsVrEInhdgQc2HyVwIfKSmzhF6OsnxavakbMIOt0mQX8b+2wUCl/npEv8YrAHv
         5b2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441420; x=1781046220;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGO8j2pKHoxMARzagOp1IjbnNGYIgj+GUgUC4UIJ2qs=;
        b=IQHZTOsCaiK46Y0H/Mb+eCn9xixjMh4ygtTTo4MLT84NTdRpy+UweQCH++J5gVcONB
         YXsZpcAtkHv+YighJVyY9CVxs1IgEZXRMDCD2oVTgH28xCIByAjPVGvpxtqo4tKPCpmY
         6USkmOehBnjzLojd2mmJplhZbEIDVXVvx/Syg7Khg+Xnu03+YRK54PVrxHBNL7eZzHz1
         sPWo/xCltHkgk8lV8Zm+PKXqovqipU5EPU18/eFgeCsgn+QrLOkT8sUDI2lDtT9HumKD
         DJmv5EoM3tfhkYOcfy7XzqhLjaxjLzAmfMjUthQ8HFMt8/SObQU6s0CJJuznHuYdzkbN
         89Fg==
X-Gm-Message-State: AOJu0YxgVX6WIyolZeiRfiqwG1yK5FvLXavBviJRrpgG7WHyxQsUYNIQ
	oLArEeTTMAEdbaFKiKt6vFPmgQDcy1veJMSPFtnkXDOUS4qwerDEjiN02dgbSHaWeIR1S8ojSMh
	8rZVaTUnJxT75vKkwT07Pq7xTYLownIUFfghGq022CHYhamVntwylSF81
X-Gm-Gg: Acq92OHmxHsCE140ULHXB9ItK8b1AiYJlH02550kF/P+NAzx6v1+a+x58InMxWoyq7E
	zCTKjP1aKxlnkrj5xcTPrGg0ifXqK8eoMrfvMa5WDlLuMQ5L4rhUBTaCMnK8TiW0W4A7eyicq4Z
	NQld0iuIZBe8EzvsGdSRefsP7C0P8XVsA0aXQYBp0KTx2Fy8J+vv1zQVL5shswxyo3vW1ssjeWS
	CvPAMbpo5hwcaIao1xzYae2dR4AWpW5ABkseB6eCTgIqCraMVLmMw726mi87T7R4buBXSnMCVlF
	+yPUwmG94keq8vfyCumIilOUH/L8OVLIL+fEtLK3nNqcUqtKZBl9
X-Received: by 2002:a05:622a:553:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-5177b851dfbmr593481cf.0.1780441419755; Tue, 02 Jun 2026
 16:03:39 -0700 (PDT)
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
Date: Tue, 2 Jun 2026 16:03:28 -0700
X-Gm-Features: AVHnY4IAJOHlmemrKN9FIL1Eoxt-QvOlY7ETBnfe_KULIKjrVZUqUL9I5EuE9S8
Message-ID: <CAEPZvmP6tQPb0OL36PXHOkCZ225o_LBUuAxu8U2Q1K8Kq7Ta=w@mail.gmail.com>
Subject: [Vulnerability Report] phosphor-logging / openpower-pels: Local File
 Descriptor Leak in getPEL leading to DoS
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000606dd506534d527d"

--000000000000606dd506534d527d
Content-Type: text/plain; charset="UTF-8"

Hi OpenBMC Security Team,

I would like to report a resource exhaustion vulnerability inside the D-Bus
interfaces of the Platform Event Log (PEL) Manager component in
phosphor-logging.

Overview of the Vulnerability:
A local unprivileged client can trigger a persistent file descriptor leak
inside the `phosphor-log-manager` daemon. By making rapid, consecutive
requests, the client can exhaust the operating system's file descriptor
limits for the process, resulting in a system-wide Denial of Service (DoS)
that prevents the daemon from logging new events or handling management
traffic.

Affected File and Location:
File: extensions/openpower-pels/manager.cpp
Line: 468

Root Cause:
The `getPEL` D-Bus method opens a file descriptor and schedules an
asynchronous file closure task using `sdeventplus::source::Defer` stored in
a single member `std::unique_ptr`:
  _fdCloserEventSource = std::make_unique<sdeventplus::source::Defer>(...);

Because D-Bus permits clients to batch multiple calls within a single
execution cycle, a client can invoke the `getPEL` method multiple times
sequentially before the `sdeventplus` event loop has a chance to run and
dispatch the scheduled callbacks.

Each subsequent `getPEL` call re-assigns the `_fdCloserEventSource`
unique_ptr. When a `sdeventplus::source::Defer` object is destructed or
replaced before its callback fires, it automatically cancels the event. As
a result, the file close callback is permanently dropped, leaking the
previously opened file descriptor.

Proof of Concept:
1. Connect a client to the system D-Bus and target the
`org.open_power.Logging.PEL` service.
2. In a tight loop inside a script, rapidly invoke the `getPEL` method
multiple times on valid logs:
   busctl call org.open_power.Logging.PEL /xyz/openbmc_project/logging
org.open_power.Logging.PEL getPEL u <valid_pel_id>
3. Check the open file handles for the `phosphor-log-manager` daemon:
   ls -l /proc/<daemon_pid>/fd
4. The number of open file descriptors steadily increases and remains open
indefinitely, demonstrating the leak.

Proposed Patch:
Queue the asynchronous event cleanup sources inside a dynamic container
(such as a vector or list) rather than relying on a single, overwritable
unique_ptr:

std::vector<std::unique_ptr<sdeventplus::source::Defer>> _pendingFDClosers;
// ... inside getPEL close scheduling:
_pendingFDClosers.push_back(std::make_unique<sdeventplus::source::Defer>(...));

// Ensure to clean up completed tasks periodically or upon callback
execution.

Legal Name for Attribution: Bhargava Naidu Gulla

--000000000000606dd506534d527d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi OpenBMC Security Team,<br><br>I would like to report a =
resource exhaustion vulnerability inside the D-Bus interfaces of the Platfo=
rm Event Log (PEL) Manager component in phosphor-logging.<br><br>Overview o=
f the Vulnerability:<br>A local unprivileged client can trigger a persisten=
t file descriptor leak inside the `phosphor-log-manager` daemon. By making =
rapid, consecutive requests, the client can exhaust the operating system&#3=
9;s file descriptor limits for the process, resulting in a system-wide Deni=
al of Service (DoS) that prevents the daemon from logging new events or han=
dling management traffic.<br><br>Affected File and Location:<br>File: exten=
sions/openpower-pels/manager.cpp<br>Line: 468<br><br>Root Cause:<br>The `ge=
tPEL` D-Bus method opens a file descriptor and schedules an asynchronous fi=
le closure task using `sdeventplus::source::Defer` stored in a single membe=
r `std::unique_ptr`:<br>=C2=A0 _fdCloserEventSource =3D std::make_unique&lt=
;sdeventplus::source::Defer&gt;(...);<br><br>Because D-Bus permits clients =
to batch multiple calls within a single execution cycle, a client can invok=
e the `getPEL` method multiple times sequentially before the `sdeventplus` =
event loop has a chance to run and dispatch the scheduled callbacks. <br><b=
r>Each subsequent `getPEL` call re-assigns the `_fdCloserEventSource` uniqu=
e_ptr. When a `sdeventplus::source::Defer` object is destructed or replaced=
 before its callback fires, it automatically cancels the event. As a result=
, the file close callback is permanently dropped, leaking the previously op=
ened file descriptor.<br><br>Proof of Concept:<br>1. Connect a client to th=
e system D-Bus and target the `org.open_power.Logging.PEL` service.<br>2. I=
n a tight loop inside a script, rapidly invoke the `getPEL` method multiple=
 times on valid logs:<br>=C2=A0 =C2=A0busctl call org.open_power.Logging.PE=
L /xyz/openbmc_project/logging org.open_power.Logging.PEL getPEL u &lt;vali=
d_pel_id&gt;<br>3. Check the open file handles for the `phosphor-log-manage=
r` daemon:<br>=C2=A0 =C2=A0ls -l /proc/&lt;daemon_pid&gt;/fd<br>4. The numb=
er of open file descriptors steadily increases and remains open indefinitel=
y, demonstrating the leak.<br><br>Proposed Patch:<br>Queue the asynchronous=
 event cleanup sources inside a dynamic container (such as a vector or list=
) rather than relying on a single, overwritable unique_ptr:<br><br>std::vec=
tor&lt;std::unique_ptr&lt;sdeventplus::source::Defer&gt;&gt; _pendingFDClos=
ers;<br>// ... inside getPEL close scheduling:<br>_pendingFDClosers.push_ba=
ck(std::make_unique&lt;sdeventplus::source::Defer&gt;(...));<br><br>// Ensu=
re to clean up completed tasks periodically or upon callback execution.<br>=
<br>Legal Name for Attribution: Bhargava Naidu Gulla<br></div>

--000000000000606dd506534d527d--

