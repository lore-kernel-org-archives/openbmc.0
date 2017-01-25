Return-Path: <xow@google.com>
Received: from mail-qt0-x22b.google.com (mail-qt0-x22b.google.com
 [IPv6:2607:f8b0:400d:c0d::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v81V31q58zDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 10:29:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VXJ6TdC9"; 
 dkim-atps=neutral
Received: by mail-qt0-x22b.google.com with SMTP id x49so45594138qtc.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 15:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=96JPQHVdidyuUKrE4C+0WOMbVqBEtcFPYKmZoDhEgmc=;
 b=VXJ6TdC9A2CQCiY+7iATRqLl7r5RpkV+4J7aE4xDXMVt3Awlxm08fh9ZVOVAXwehvk
 68s4vunCfBsmC19gVW1WBNvbdz5ZJuWBnjXjHfkl07ddNfs16VVMaafjFxB0RXd8IdDg
 F0XOUMFPbruGLWchZDkfxBHuUuHwIFoDvM91kAEzhYbAF8cAV9VWvNG/mc3yR5ffeFho
 81cDRrrRBrBcCcsS3J/uYNt9hWRfncu2/JC/Bi7mrCCkAvKv49jvmqx8hcKX9wdQiq6u
 muzAy+iIA35SeTwYwTWSqQYJQbgJpQk2LxDMONQjrSBziCW6wMtipWHKcpTD8QYtRTr0
 v5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=96JPQHVdidyuUKrE4C+0WOMbVqBEtcFPYKmZoDhEgmc=;
 b=MmjsQkNUKx08q9b307AajAP1CChSR3D5ykahtVo0oGzkXU0qfJnD4aSlnw7mIRVxwa
 VxHAJhWpCMsjbEKzg4lskqsWFQ9dKzZ4M5vsJGNz2SRUQvEmRTyuhp8Ngsc3TNBCm6/1
 W5nIOGd4aZnLdF7RKjeuNCpqgoOBOrH9/tMn6Sy0TXBF3jpY+nevLB+jF9SdgqvFOHG+
 LoXIGTQMT6lBbTaOg5+BoDlDwCEUxlkh1vzEET5dRi8AIR7fMlxFIlfm4FFnriFUGA2P
 JT73IJossgTJ/NbsUp4/hLyAz0LMklfXMVI3G7GBIPqYuyXjkVxhBqVW0uakkwnp7ULg
 NdDg==
X-Gm-Message-State: AIkVDXKGQJMsq9qP88L6knJiiZ3C9mwKhKVRC5XmNd7gBoRppNP/jjv2+XtqVpn1JaVvSj/Cek+MAYIpiOElMJHx
X-Received: by 10.237.60.49 with SMTP id t46mr38701011qte.140.1485386967591;
 Wed, 25 Jan 2017 15:29:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Wed, 25 Jan 2017 15:29:27 -0800 (PST)
From: Xo Wang <xow@google.com>
Date: Wed, 25 Jan 2017 15:29:27 -0800
Message-ID: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
Subject: How to deal with failing services in the boot targets
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2017 23:29:32 -0000

Hi folks,

I'm seeing vcs-on@0.service failing occasionally. I know the cause of
it (i2c errors) but I'd like to know how to deal with failing services
in the context of OpenBMC boot sequencing.

For example, the service failure isn't reflect by any subsequent
target failures (it reaches obmc-chassis-start@0.target with no
command line errors, only a journal error for vcs-on@0.service
itself), nor did it prevent the boot from proceeding to pdbg host
control.

This is expected behavior given the systemd Unit relationships I used,
but I don't see a clean way to make a unit like vcs-on@.service block
the boot.

I tried making vcs-on@.service [Install]
RequiredBy=obmc-chassis-start@%i.target (and modifying the service
install similarly), but this only prints out a message that
obmc-chassis-start@0.target couldn't be reached due to its failed
dependency. It did not stop the pdbg start IPL.

I also tried RequiredBy=obmc-host-start-pre@%i.target. This turned out
even worse because our targets don't require their precedent targets,
so obmc-host-start@0.target is still reachable even with a failure in
obmc-host-start-pre@0.target. Likewise for
obmc-chassis-start@0.target, which now prints no console error at all.

Finally I could add RequiredBy=start_host@%i.service to
vcs-on@0.service, but this seems fragile compared to using the targets
as synchronization points.

1) How should I make a host boot service be a blocking step in the chain?

2) Will this require a structural change in the OpenBMC targets?
Making targets require their precedent targets comes to mind. This
would make targets useful not only for sequencing but also for
dependency checking.

3) Do other people also want this? To me it seems obvious that failure
to power on should always block starting IPL, but maybe somebody else
has a good reason to use weaker relationships.

thanks
xo
